require 'minitest/autorun'
require '../lib/output'

class OutputTest < Minitest::Test
  def test_produces_a_sentence
    result = Output.sentence(eval(File.read('tests/mock_data/gettysburg_parsed.rb')))

    refute(result.empty?)
    assert_match(/[a-z][.!?]/, result[-2..-1])
    assert_match(/[A-Z]/, result[0])
    puts result
  end
end
