module Util
  module Http
    module Middleware
      class Logger < Faraday::Response::Middleware
        attr_reader :logger

        def initialize(app, logger:)
          super(app)
          @logger = logger
        end

        def call(env)
          logger.info('started', path: env.url.path.gsub(/bot.+\//, ''), method: env.method)
          debug_body(env)
          super
        end

        private

        def on_complete(env)
          case env.status
          when 200
            logger.info('succeed', status: env.status)
            debug_body(env)
          when 400..599
            logger.error("failed with '#{env.body}'", status: env.status)
          end
        end

        def debug_body(env)
          logger.debug(env.body) if env.body && !env.body.empty?
        end
      end
    end
  end
end
