require 'bundler/setup'
Bundler.require(:default, :development)

require_relative '../system/container'

Container.finalize!
