# rubocop:disable all
module SampleWeb
  class Config
    attr_accessor :title, :size, :definitions

    def initialize(config = {})
      set_config(config)
    end

    # returns the definition config as string of JSON
    # add spaces after commas between array elements to avoid bad wrapping
    #
    # @return [String]
    def to_json
      JSON.generate(to_hash).gsub('","', '", "')
    end

    # sets the definition's config from a string of JSON
    #
    # @param [String]
    def from_json(json_text)
      # raise json_text.inspect
      set_config(JSON.parse(json_text.gsub("\r\n", '')))
      self
    end

    private

    # sets the definition's config from a hash
    #
    # @param [Hash]
    def set_config(config = {})
      @title = config[:title] || config['title'] || 'Bingo Card'
      @size = config[:size] || config['size'] || 16
      @definitions = config[:definitions] || config['definitions'] || ''
      @definitions = @definitions.join("\r\n") if @definitions.is_a?(Array)
    end

    # returns the definition config as a hash
    #
    # @return [Hash]
    def to_hash
      {
        title: title,
        size: size,
        definitions: definitions.split("\r\n")
      }
    end
  end
end
# rubocop:enable all
