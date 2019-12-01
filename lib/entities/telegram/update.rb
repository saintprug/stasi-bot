module Entities
  module Telegram
    class Update < Entity
      transform_keys(&:to_sym)

      attribute :update_id, Types::Strict::Integer
      attribute :message, Message
    end
  end
end
