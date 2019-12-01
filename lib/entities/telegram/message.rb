module Entities
  module Telegram
    class Message < Entity
      transform_keys(&:to_sym)

      attribute :message_id, Types::Strict::Integer
      attribute :from, From
      attribute :chat, Chat
      attribute :date, Types::Strict::Integer
      attribute :text, Types::Strict::String
    end
  end
end
