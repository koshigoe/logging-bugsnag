module Logging
  module Appenders

    # Accessor / Factory for the Bugsnag appender.
    def self.bugsnag( *args )
      return ::Logging::Appenders::Bugsnag if args.empty?
      ::Logging::Appenders::Bugsnag.new(*args)
    end

    require 'bugsnag/logging_appender.rb'
  end
end
