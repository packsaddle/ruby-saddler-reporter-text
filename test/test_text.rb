require_relative 'helper'

module Saddler
  module Reporter
    class TestText < Test::Unit::TestCase
      test 'version' do
        assert do
          !::Saddler::Reporter::Text::VERSION.nil?
        end
      end

      sub_test_case '.parse' do
        too_long = File.read('./test/fixtures/too_long.xml')
        reporter = Text.new(StringIO.new)
        parsed = [
          {
            file: 'lib/example/travis_ci.rb',
            line: 7,
            column: 120,
            severity: 'info',
            message: 'Line is too long. [164/120]',
            source: 'com.puppycrawl.tools.checkstyle.Metrics/LineLength'
          }
        ]
        test 'too long' do
          assert do
            reporter.parse_messages(too_long) == parsed
          end
        end
      end
    end
  end
end
