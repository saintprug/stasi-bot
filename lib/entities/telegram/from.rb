module Entities
  module Telegram
    class From < Entity
      attribute :id, Types::Strict::Integer
      attribute :is_bot, Types::Strict::Bool
      attribute :first_name, Types::Strict::String
      attribute :username, Types::Strict::String
    end
  end
end
