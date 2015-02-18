module Saddler
  module Reporter
    class Text
      VERSION = '0.1.0'
      # Your code goes here...
      def initialize(output)
        @output = output
      end

      def report(messages, options)
        @output.puts messages
      end
    end
  end
end
