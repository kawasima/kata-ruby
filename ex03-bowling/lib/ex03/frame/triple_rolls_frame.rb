module Ex03
  class TripleRollsFrame < Frame
    def initialize(first, second, third)
      super()
      @first = first
      @second = second
      @third = third
    end

    def roll_stream
      [[@first,@second,@third].lazy, (next_frame || EmptyFrame.new).roll_stream ].lazy.flat_map(&:lazy)
    end

    def score
      if (@first.is_a? StrikeRoll)
        10 + @second.num_of_knocked_out_pins + @third.num_of_knocked_out_pins
      elsif (@second.is_a? SpareRoll)
        10 + @third.num_of_knocked_out_pins
      else
        raise "First roll must be 'strike' or second roll must be 'spare'"
      end
    end

    def to_formatted_string
      @first.print_chars << " " << @second.print_chars << " " << @thrid.print_chars
    end
  end
end
