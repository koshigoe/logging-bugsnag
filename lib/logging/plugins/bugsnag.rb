module Logging
  module Plugins
    module Bugsnag
      extend self

      VERSION = '0.1.0'.freeze unless defined?(VERSION)

      def initialize_bugsnag
        require File.expand_path('../../appenders/bugsnag', __FILE__)
      end
    end
  end
end
