require 'sinatra'
require 'rack-flash'

require_relative 'controllers/application'
require_relative 'controllers/signup'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'

require_relative 'helpers/datamapper'
require_relative 'helpers/helpers'

use Rack::Flash
use Rack::MethodOverride

enable :sessions
set :session_secret, 'shhhh'

