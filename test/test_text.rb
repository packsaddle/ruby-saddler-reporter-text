require_relative 'helper'

module Saddler
  module Reporter
    class TestText < Test::Unit::TestCase
      test 'version' do
        assert do
          !::Saddler::Reporter::Text::VERSION.nil?
        end
      end
    end
  end
end
