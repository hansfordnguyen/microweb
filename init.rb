APP_ROOT = File.dirname(__FILE__)

$:.unshift( File.join(APP_ROOT, 'core') )
$:.unshift( File.join(APP_ROOT, 'config') )
$:.unshift( File.join(APP_ROOT, 'controllers') )
$:.unshift( File.join(APP_ROOT, 'models') )
$:.unshift( File.join(APP_ROOT, 'views') )
$:.unshift( File.join(APP_ROOT, 'database') )

require "#{APP_ROOT}/server"
require "#{APP_ROOT}/core/global_helpers"

include GlobalHelpers

application = Server.new.start
