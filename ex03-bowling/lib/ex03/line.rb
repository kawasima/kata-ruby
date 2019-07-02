module Ex03
  class Line
    def initialize(frames)
      @frames = frames
    end

    def score
      @frames.sum do |f|
        f.score
      end
    end

    def print(writer)
      writer.puts @frames
        .map{|f| f.to_formatted_string }
        .join(" ")
    end
  end
end
