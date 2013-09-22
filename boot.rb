require 'rubygems'

# Set rack environment
ENV['RACK_ENV'] ||= "development"

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
Bundler.require(:default, ENV['RACK_ENV'])

Mongoid.load!('./config/mongoid.yml')

Dir[File.join(File.dirname(__FILE__), "controllers/*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "modules/*.rb")].each {|f| require f}