require_relative './update'

module Entities
  module Telegram
    class Response < Entity
      transform_keys(&:to_sym)

      attribute :result, Types::Array.of(Update)
    end
  end
end
