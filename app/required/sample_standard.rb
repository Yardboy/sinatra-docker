# rubocop:disable all
module BingoBuilder
  class SampleStandard
    # returns the sample standard config
    #
    # @return [BingoBuilder::Config]
    def config
      BingoBuilder::Config.new(title: 'Standard Bingo Card', size: 36, definitions: definitions_text)
    end

    private

    # returns data array as a string joined by line-feeds
    #
    # @return [String]
    def definitions_text
      @data = nil
      create_data
      @data.join("\n")
    end

    # creates the data elements of the definition
    #
    def create_data
      @data = [free_space]
      counter = 0
      groups.each do |group|
        @data << group
        15.times { @data << ">#{counter += 1}" }
      end
    end

    # returns the free space item definion
    #
    # @return [String]
    def free_space
      'FREE {1,1,3,3}'
    end

    # returns the five groups for a standard card
    #
    # @return [Array<String>]
    def groups
      [
        'B {5,5,1,0}',
        'I {5,5,2,0}',
        'N {4,4,3,0}',
        'G {5,5,4,0}',
        'O {5,5,5,0}'
      ]
    end
  end
end
