# adds ../api to the load path for simpler `require` below
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'api'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

#Boot
require 'rubygems'
require 'bundler/setup'

Bundler.require :default, ENV['RACK_ENV']

#DB and ActiveRecord
require 'active_record'
require 'yaml'
require 'logger'

dbconfig = YAML::load(File.open(File.expand_path('../database.yml', __FILE__)))
#TODO: abstract db into env
ActiveRecord::Base.establish_connection(dbconfig["development"])
ActiveRecord::Base.logger = Logger.new(STDERR)

class User < ActiveRecord::Base
end

# require all them api files
Dir[File.expand_path('../../api/*.rb', __FILE__)].each do |f|
  require f
end

require 'api'
require 'toying_app'

