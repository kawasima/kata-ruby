module Ex03
  class EmptyFrame < Frame
    def initialize
    end

    def roll_stream
      [].lazy
    end
  end
end
