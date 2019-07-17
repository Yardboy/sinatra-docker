# rubocop:disable all
module BingoBuilder
  class SampleNames
    # returns the sample standard config
    #
    # @return [BingoBuilder::Config]
    def config
      BingoBuilder::Config.new(title: 'Popular Names Bingo', size: 16, definitions: definitions_text)
    end

    private

    # returns the string definition
    #
    # @return [String]
    def definitions_text
      <<~HEREDOC
        FREE {1,1,3,3}
        Male Names{12,12}
        >James
        >John
        >Robert
        >Michael
        >William
        >David
        >Richard
        >Charles
        >Joseph
        >Thomas
        >Christopher
        >Daniel
        >Paul
        >Mark
        >Donald
        >George
        >Kenneth
        >Steven
        >Edward
        >Brian
        >Ronald
        >Anthony
        >Kevin
        >Jason
        >Matthew
        >Gary
        >Timothy
        >Jose
        >Larry
        >Frank
        Female Names{12,12}
        >Mary
        >Patricia
        >Linda
        >Barbara
        >Elizabeth
        >Jennifer
        >Maria
        >Susan
        >Margaret
        >Dorothy
        >Lisa
        >Nancy
        >Karen
        >Betty
        >Helen
        >Sandra
        >Donna
        >Carol
        >Ruth
        >Sharon
        >Michelle
        >Laura
        >Sarah
        >Kimberly
        >Deborah
        >Jessica
        >Shirley
        >Cynthia
        >Angela
        >Melissa
      HEREDOC
    end
  end
end
