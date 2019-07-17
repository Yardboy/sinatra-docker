module SampleWeb
  Dir.glob('app/required/*.rb').each { |file| load file }

  class App < Sinatra::Base
    set :root, '.'
    set :bind, '0.0.0.0'
    set :port, 3000

    get '/' do
      @config = SampleWeb::SampleNames.new.config
      builder = SampleWeb::Builder.new(@config)
      @card = builder.build_card
      haml :index
    end

    post '/' do
      @config = config_for(params)
      builder = SampleWeb::Builder.new(@config)
      @card = builder.build_card
      haml :index
    end

    private

    def config_for(params)
      if params[:config_definitions][0..8] == '{"title":'
        SampleWeb::Config.new.from_json(params[:config_definitions])
      else
        SampleWeb::Config.new(
          title: params[:config_title] || 'Bingo Card',
          size: 16,
          definitions: params[:config_definitions] || ''
        )
      end
    end
  end
end