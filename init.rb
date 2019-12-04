require_relative 'server'
require_relative './core/global_helpers'

include GlobalHelpers

Server.new.start
