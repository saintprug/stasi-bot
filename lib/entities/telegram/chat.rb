module Entities
  module Telegram
    class Chat < Entity
      transform_keys(&:to_sym)

      attribute :id, Types::Strict::Integer
      attribute :first_name, Types::Strict::String
      attribute :username, Types::Strict::String
    end
  end
end
