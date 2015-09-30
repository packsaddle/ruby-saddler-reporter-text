module Saddler
  module Reporter
    class Text
      VERSION = '0.2.1'
      def initialize(output)
        @output = output
      end

      def report(messages, _options = {})
        parsed_messages = parse_messages(messages)
        parsed_messages.each do |msg|
          severity = msg[:severity] && msg[:severity].upcase
          line = msg[:line]
          path = msg[:file]
          column = msg[:column]
          message = msg[:message]
          @output.puts "#{path}:#{line}:#{column} #{severity}: #{message}"
        end
      end

      def parse_messages(messages)
        # TODO: split to class or gem
        require 'rexml/document'
        parsed = []
        document = REXML::Document.new messages
        document.elements.each('/checkstyle/file') do |file_element|
          file_name = file_element.attribute('name') && file_element.attribute('name').value
          file_element.elements.each('error') do |error_element|
            line = error_element.attribute('line') && error_element.attribute('line').value.to_i
            column = error_element.attribute('column') && error_element.attribute('column').value.to_i
            severity = error_element.attribute('severity') && error_element.attribute('severity').value
            message = error_element.attribute('message') && error_element.attribute('message').value
            source = error_element.attribute('source') && error_element.attribute('source').value
            parsed << {
              file: file_name,
              line: line,
              column: column,
              severity: severity,
              message: message,
              source: source
            }
          end
        end
        parsed
      end
    end
  end
end
