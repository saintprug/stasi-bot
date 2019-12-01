module Utils
  module Telegram
    class Client
      include Import[
        :logger
      ]

      def get(options = {})
        call(options.merge(method: :get))
      end

      def post(options = {})
        call(options.merge(method: :post))
      end

      def call(method:, path:, payload: nil)
        response = connection.public_send(method, path, payload, nil)
        JSON.parse(response.body)
      end

      private

      def connection
        @connection ||= Faraday.new(url: "https://api.telegram.org/#{ENV.fetch('TELEGRAM_API_TOKEN')}") do |f|
          f.use(Util::Http::Middleware::Logger, logger: logger)
          f.headers = { 'Content-Type': 'application/json' }
          f.adapter(Faraday.default_adapter)
        end
      end
    end
  end
end
