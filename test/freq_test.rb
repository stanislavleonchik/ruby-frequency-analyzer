require "test_helper"

class FreqTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Freq::VERSION
  end

  def test_it_does_something_useful
    ta = TextAnalyzer.new('/text_files/test', [], true)
    p = ta.analyze
    assert_equal ta.analyze, p
  end
end
