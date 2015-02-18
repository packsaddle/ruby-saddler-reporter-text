require 'minitest_helper'

class TestSaddler::Reporter::Text < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Saddler::Reporter::Text::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
