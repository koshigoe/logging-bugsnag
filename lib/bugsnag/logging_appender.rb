require 'logging/appender'
require 'bugsnag'

module Logging
  module Appenders
    class Bugsnag < ::Logging::Appender
      def initialize( name, opts = {} )
        super(name, opts)
      end

      def close( *args )
        super(false)
      end

      private

      def write(event)
        message =
          if event.instance_of?(::Logging::LogEvent)
            layout.format(event)
          else
            event.to_s
          end
        return if message.empty?

        exception = RuntimeError.new(message)

        severity =
          case Logging::LNAMES[event.level]
          when 'DEBUG', 'INFO'
            'info'
          when 'WARN'
            'warning'
          when 'ERROR', 'FATAL'
            'error'
          end

        ::Bugsnag.notify(exception, { severity: severity })

        self
      end
    end
  end
end
