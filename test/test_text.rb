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
        reporter = Text.new(StringIO.new)
        test 'too long' do
          too_long = File.read('./test/fixtures/too_long.xml')
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
          assert do
            reporter.parse_messages(too_long) == parsed
          end
        end

        test 'no error' do
          no_error = File.read('./test/fixtures/no_error.xml')
          parsed = []
          assert do
            reporter.parse_messages(no_error) == parsed
          end
        end
      end

      sub_test_case '.report' do
        output = StringIO.new
        reporter = Text.new(output)
        test 'too long' do
          too_long = File.read('./test/fixtures/too_long.xml')
          expected = "lib/example/travis_ci.rb:7:120 INFO: Line is too long. [164/120]\n"
          reporter.report(too_long)
          output.rewind
          assert do
            output.read == expected
          end
        end

        test 'no error' do
          no_error = File.read('./test/fixtures/no_error.xml')
          reporter.report(no_error)
          output.rewind
          assert do
            output.read == ''
          end
        end
      end
    end
  end
end
