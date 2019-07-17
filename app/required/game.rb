module BingoBuilder
  Item = Struct.new(:text, :rule, :children)
  Rule = Struct.new(:min, :max, :col, :row)

  class Game
    class EmptyConfigError < StandardError; end
    class NoGroupDefinedError < StandardError; end

    attr_reader :items

    def initialize(config)
      raise NoGroupDefinedError if group_item?(config.definitions)

      @config = config
      reset_items
    end

    def title
      @config.title
    end

    def size
      @config.size
    end

    # clears items and re-runs the parser
    def reset_items
      @items = []
      parse_config
      @items
    end

    private

    # parses the config text into items
    def parse_config
      @config.definitions.split("\n").each do |text|
        if group_item?(text)
          raise NoGroupDefinedError if @items.empty?
          @items.last.children << text.delete('>').strip
        else
          @items << parse_item(text)
        end
      end
      perform_validations
    end

    # runs various validation methods on the items data
    #
    def perform_validations
      remove_max_zero_items
      validate_ungrouped_minimums
    end

    # removes any items with rule of max=0
    #
    def remove_max_zero_items
      @items = @items.reject { |item| item.rule.max.zero? }
    end

    # resets any ungrouped items with min/max > 1
    #
    def validate_ungrouped_minimums
      @items.each do |item|
        if item.children.empty?
          item.rule.min = 1 if item.rule.min > 1
          item.rule.max = 1 if item.rule.max > 1
        end
      end
    end

    # parses a line of item text into an Item object
    #
    # @param [String]
    # @return [Item]
    def parse_item(text)
      text, rule = text.split('{')
      Item.new(text.strip, parse_rule(rule), [])
    end

    # parses a string of rule text into a Rule object
    #
    # @param [String]
    # @return [Rule]
    def parse_rule(text)
      text = String(text).delete('}').strip
      text = text == '' ? default_rule : text
      min, max, col, row = text.split(',')
      Rule.new(min.to_i, max.to_i, col.to_i, row.to_i)
    end

    # determines if text is a group item
    #
    # @param [String]
    # @return [Boolean]
    def group_item?(text)
      text[0] == '>'
    end

    # returns the default rule
    #
    # @return [String]
    def default_rule
      '0,1'
    end

    # determines if text is blank
    #
    # @param [String]
    # @return [Boolean]
    def blank?(text)
      text.nil? || text == ''
    end
  end
end
