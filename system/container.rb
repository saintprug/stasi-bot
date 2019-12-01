require 'dry/system/container'
require_relative '../lib/entity'

class Container < Dry::System::Container
  configure do |config|
    config.auto_register = 'lib'
  end

  load_paths! 'lib'
end

require_relative 'import'
