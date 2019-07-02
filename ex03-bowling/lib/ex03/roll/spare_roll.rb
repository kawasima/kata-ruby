module Ex03
  class SpareRoll < NumberedRoll
    def initialize(num_of_knocked_out_pins)
      super(num_of_knocked_out_pins)
    end

    def printable_chars
      "/"
    end
  end
end
