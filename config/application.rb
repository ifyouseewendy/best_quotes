require 'rulers'

$LOAD_PATH << File.join( File.dirname(__FILE__), '..', 'app', 'controllers' )
require 'quotes_controller'

module BestQuotes
  class Application < Rulers::Application
    def call(env)
      env['ROOT_DIR'] = Config.root
      super
    end

    class Config
      class << self
        def root
          File.expand_path( File.join( File.dirname(__FILE__), '..') )
        end
      end
    end
  end
end
