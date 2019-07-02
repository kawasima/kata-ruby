module Ex03
  class DoubleRollsFrame < Frame
    def initialize(first, second)
      super()
      @first = first
      @second = second
    end

    def roll_stream
      [[@first,@second].lazy, (next_frame || EmptyFrame.new).roll_stream ].lazy.flat_map(&:lazy)
    end

    def score
      knocked_pins = @first.num_of_knocked_out_pins + @second.num_of_knocked_out_pins

      if (knocked_pins == 10)
        knocked_pins += (next_frame || EmptyFrame.new)
                          .roll_stream
                          .take(1)
                          .map{|f| f.num_of_knocked_out_pins}
                          .sum
      end

      knocked_pins
    end

    def to_formatted_string
      @first.print_chars << " " << @second.print_chars
    end
  end
end
