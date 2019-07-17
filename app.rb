module SampleWeb
  class App < Sinatra::Base
    set :root, '.'
    set :bind, '0.0.0.0'
    set :port, 3000

    get '/' do
      haml :index
    end
  end
end
