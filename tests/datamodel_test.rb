require 'minitest/autorun'
require '../lib/datamodel'

class DataModelTest < Minitest::Test
  def test_collects_data_from_every_word_with_follower
    result = DataModel.prepare('one two')

    assert_equal({ 'one' => ['two'] }, result)
  end
end
