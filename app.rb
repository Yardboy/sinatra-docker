module BingoBuilder
  Dir.glob('app/required/*.rb').each { |file| load file }

  class App < Sinatra::Base
    set :root, '.'
    set :bind, '0.0.0.0'
    set :port, 3000

    configure do
      mime_type :pdf, 'application/pdf'
    end

    get '/' do
      @config = BingoBuilder::SampleNames.new.config
      builder = BingoBuilder::Builder.new(@config)
      @card = builder.build_card
      haml :index
    end

    post '/' do
      @config = BingoBuilder::Config.config_from_json(params)
      builder = BingoBuilder::Builder.new(@config)
      @card = builder.build_card
      haml :index
    end

    get '/cardset.pdf' do
      content_type :pdf
      headers('Content-Disposition' => 'attachment;filename="cardset.pdf"')

      @config = BingoBuilder::Config.config_from_json(params)
      builder = BingoBuilder::Builder.new(@config)
      @cards = Array.new(10) { builder.build_card }
      render_pdf :cardset
    end

    private

    def render_pdf(template)
      html = haml(template, layout: :pdflayout)
      kit = PDFKit.new(html)
      kit.stylesheets << './public/stylesheets/application.css'
      kit.to_pdf
    end
  end
end
