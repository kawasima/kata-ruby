module Ex03
  class NumberedRoll < Roll
    def initialize(num_of_knocked_out_pins)
      @num_of_knocked_out_pins = num_of_knocked_out_pins
    end

    def num_of_knocked_out_pins
      @num_of_knocked_out_pins
    end

    def printable_chars
      @num_of_knocked_out_pins > 0 ? @num_of_knocked_out_pins.to_s : "-"
    end
  end
end
