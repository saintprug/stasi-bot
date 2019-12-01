require_relative './update'

module Entities
  module Telegram
    class Response < Entity
      attribute :result, Types::Array.of(Update)
    end
  end
end
