require_relative './types'

class Entity < Dry::Struct
  transform_keys(&:to_sym)
end
