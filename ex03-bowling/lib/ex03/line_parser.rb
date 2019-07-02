module Ex03
  class LineParser
    def parse_roll(pins, remain)
      if pins == "X"
        StrikeRoll.new
      elsif pins == "/"
        SpareRoll.new 10-remain
      elsif pins == "-"
        NumberedRoll.new 0
      elsif /^\d+$/ =~ pins
        NumberedRoll.new pins.to_i
      else
        raise "Wrong roll: #{pins}"
      end
    end

    def read_from_string(line)
      roll_queue = line.split(/\s+/)
      frames = []

      while(!roll_queue.empty?)
        pins = roll_queue.shift
        first = parse_roll(pins, 0)
        frame = nil

        if (first.is_a? StrikeRoll)
          frame = SingleRollFrame.new first
        else
          second = parse_roll(roll_queue.shift, first.num_of_knocked_out_pins)
          frame = DoubleRollsFrame.new(first, second)
        end

        if !frames.empty?
          frames.last.next_frame = frame
        end

        frames.push frame
        break if frames.size == 9
      end

      if roll_queue.size == 3
        first = parse_roll(roll_queue.shift, 0)
        frame = TripleRollsFrame.new(first,
                                     parse_roll(roll_queue.shift, first.num_of_knocked_out_pins),
                                     parse_roll(roll_queue.shift, 0))
        frames.last.next_frame = frame
        frames.push frame
      elsif roll_queue.size == 2
        first = parse_roll(roll_queue.shift, 0)
        frame = DoubleRollsFrame.new(first,
                                     parse_roll(roll_queue.shift, first.num_of_knocked_out_pins))
        frames.last.next_frame = frame
        frames.push frame
      else
        raise "The last frame must contain 2 or 3 rolls"
      end

      Line.new frames
    end
  end
end
