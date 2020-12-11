require 'minitest/autorun'
require '../lib/data_model'

class DataModelTest < Minitest::Test
  def test_tokenizes_basic_input
    result = DataModel.tokenize('One two?')

    assert_equal(['one', 'two', '?'], result)
  end

  def test_tokenizes_two_delimiters
    result = DataModel.tokenize('One? two?')

    assert_equal(['one', '?', 'two', '?'], result)
  end

  def test_tokenizes_commas
    result = DataModel.tokenize('One, two?')

    assert_equal(['one', ',', 'two', '?'], result)
  end

  def test_collects_data_from_every_word_with_follower
    result = DataModel.prepare('one two')

    assert_equal({ 'one' => ['two'] }, result)
  end

  def test_prepare_long_string
    input = DataModel.prepare(File.read('tests/mock_data/gettysburg.txt'))
    result = eval(File.read('tests/mock_data/gettysburg_parsed.rb'))

    assert_equal(input, result)
  end

  def test_collects_multiple_matches
    result = DataModel.prepare('one two one three')

    assert_equal({ 'one' => %w[two three], 'two' => ['one'] }, result)
  end
end
