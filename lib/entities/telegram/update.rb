module Entities
  module Telegram
    class Update < Entity
      attribute :update_id, Types::Strict::Integer
      attribute :message, Message
    end
  end
end
