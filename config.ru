require 'sinatra/base'
require 'sinatra/reloader'
require 'sass/plugin/rack'
require 'sinatra/json'
require 'json'
require './app'

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

SampleWeb::App.run!
