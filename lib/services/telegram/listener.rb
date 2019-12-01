module Services
  module Telegram
    class Listener
      include Import[
        client: 'utils.telegram.client'
      ]

      def start
        offset = nil

        loop do
          updates = fetch_updates(offset: offset)

          if updates.count > 0
            offset = updates.last.update_id.next
          end
        end
      end

      def fetch_updates(offset: nil)
        response = client.get(
          path: 'getUpdates',
          payload: { offset: offset}
        )

        Entities::Telegram::Response.new(response).result
      end
    end
  end
end
