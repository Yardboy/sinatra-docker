require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/cookies'
require 'sass/plugin/rack'
require 'sinatra/json'
require 'json'
require 'pdfkit'
require './app'

Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

BingoBuilder::App.run!
