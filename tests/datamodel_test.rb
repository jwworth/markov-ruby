require 'minitest/autorun'
require '../lib/datamodel'

class DataModelTest < Minitest::Test
  def test_tokenizing
    result = DataModel.tokenize('One two?')

    assert_equal(['one', 'two', '?'], result)
  end

  def test_collects_data_from_every_word_with_follower
    result = DataModel.prepare('one two')

    assert_equal({ 'one' => ['two'] }, result)
  end

  def test_matches
    result = DataModel.prepare('one two one three')

    assert_equal({ 'one' => %w[two three], 'two' => ['one'] }, result)
  end
end
