module SampleWeb
  class Builder
    attr_reader :game, :grid, :items

    def initialize(config)
      @game = SampleWeb::Game.new(config)
    end

    # builds a bingo card
    #
    # @return [SampleWeb::Card]
    def build_card
      @items = game.reset_items
      @card = SampleWeb::Card.new(@game.title, @game.size)
      add_mandatory_items
      add_discretionary_items
      @card
    end

    # adds any mandatory items from the bingo game
    #
    def add_mandatory_items
      @items.select { |item| item.rule.min.positive? }.each do |item|
        item.rule.min.times { add_item_to_card(item) }
      end
    end

    # adds additional items from the bingo game until card is full
    #
    def add_discretionary_items
      while (item = next_discretionary_item) && !@card.full?
        add_item_to_card(item)
      end
    end

    # gets the next random discretionary item from remaining items
    #
    def next_discretionary_item
      @items.select { |item| item.rule.max.positive? }.sample(1).first
    end

    # adds an item to a bingo card
    #
    # @param [SampleWeb::Item]
    def add_item_to_card(item)
      @card.add(get_item_text(item), item.rule.col, item.rule.row) if item.rule.max.positive?
    end

    # gets the item text and removes it from further consideration
    # - if it's an ungrouped item, use the item text and remove the item
    # - if it's a group, sample the children and remove selected child
    #
    # @param [SampleWeb::Item]
    # @return [String]
    def get_item_text(item)
      text = if item.children.empty?
               item.text
             else
               item.children.delete_at(rand(item.children.length))
             end
      item.rule.min -= 1
      item.rule.max -= 1
      text
    end
  end
end
