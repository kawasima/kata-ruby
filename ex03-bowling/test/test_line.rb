require 'test/unit'
require 'ex03'

module Ex03
  class LineTest < Test::Unit::TestCase
    def setup
      @line_parser = LineParser.new
    end

    def test_all_strike
      line = @line_parser.read_from_string("X X X X X X X X X X X X")
      assert_equal(300, line.score)
    end

    def test_all_spare
      line = @line_parser.read_from_string("5 / 5 / 5 / 5 / 5 / 5 / 5 / 5 / 5 / 5 / 5")
      assert_equal(150, line.score)
    end

    def test_all_gutter
      line = @line_parser.read_from_string("- - - - - - - - - - - - - - - - - - - -")
      assert_equal(0, line.score)
    end

  end
end
