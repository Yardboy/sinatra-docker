module SampleWeb
  class InvalidColumnError < StandardError; end
  class InvalidRowError < StandardError; end

  class Card
    attr_reader :cells, :title, :size

    def initialize(title, size)
      @cells = [nil] * 25
      @title = title
      @size = size
    end

    # adds text to a cell
    # - selects randomly from available cells
    # - if column or row is non-zero, restricts options to match
    #
    # @param [String, Integer, Integer]
    def add(text, col = 0, row = 0)
      raise InvalidColumnError unless (0..5).cover?(col)
      raise InvalidRowError unless (0..5).cover?(row)
      cell = available_cells(col, row).sample
      @cells[cell] = text if cell
    end

    # determines if card is full
    #
    # @return [Boolean]
    def full?
      available_cells(0, 0).empty?
    end

    # returns the cells of the card arranged in a 5x5 array of arrays
    #
    # @return [Array<Array>]
    def grid
      @cells.each_slice(5).to_a
    end

    private

    # returns the element indices for a column
    #
    # @param [Integer]
    # @return [Array<Integer>]
    def column_elements(col)
      Array.new(5) { |i| (i * 5) + col - 1 }
    end

    # returns the element indices for a row
    #
    # @param [Integer]
    # @return [Array<Integer>]
    def row_elements(row)
      Array.new(5) { |i| i + ((row - 1) * 5) }
    end

    # returns the element indices for available (empty) cells
    # - if column or row is non-zero, restricts to match
    #
    # @param [Integer, Integer]
    # @return [Array<Integer>]
    def available_cells(col = 0, row = 0)
      cells = @cells.each_index.select { |i| @cells[i].nil? }
      cells &= column_elements(col) if col.positive?
      cells &= row_elements(row) if row.positive?
      cells
    end
  end
end
