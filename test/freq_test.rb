require "test_helper"

class FreqTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Freq::VERSION
    test1 = TextAnalyzer.new('../test_1',%w[Is,eyes,little,me,world,the,if,kiss,town,free],false )
    test1.analyze
    puts test1.get_word_counts
  end

  def test_it_does_something_useful
    ta = TextAnalyzer.new('/text_files/test', [], true)
    p = ta.analyze
    assert_equal ta.analyze, p
  end
end
