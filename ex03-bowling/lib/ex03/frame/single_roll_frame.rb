module Ex03
  class SingleRollFrame < Frame
    def initialize(roll)
      super()
      @roll = roll
    end

    def roll_stream
      [[@roll].lazy, (next_frame || EmptyFrame.new).roll_stream ].lazy.flat_map(&:lazy)
    end

    def score
      10 + (next_frame || EmptyFrame.new)
             .roll_stream
             .take(2)
             .map{|r| r.num_of_knocked_out_pins }
             .sum
      end

    def to_formatted_string
      @roll.print_chars
    end
  end
end
