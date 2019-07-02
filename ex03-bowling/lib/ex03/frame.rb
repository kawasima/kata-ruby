module Ex03
  class Frame
    def initialize
      @next_frame = nil
    end

    def score
    end

    def roll_stream
    end

    def next_frame
      @next_frame
    end

    def next_frame=(frame)
      @next_frame = frame
    end

    def to_formatted_string
      "?"
    end
  end
end
