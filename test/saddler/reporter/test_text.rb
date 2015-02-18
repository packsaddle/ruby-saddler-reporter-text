require './test/minitest_helper'

class Saddler::Reporter::TestText < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Saddler::Reporter::Text::VERSION
  end
end
