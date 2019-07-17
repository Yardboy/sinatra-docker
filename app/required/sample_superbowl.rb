# rubocop:disable all
module BingoBuilder
  class SampleSuperbowl
    # returns the sample standard config
    #
    # @return [BingoBuilder::Config]
    def config
      BingoBuilder::Config.new(title: 'Superbowl Bingo 2019', size: 16, definitions: definitions_text)
    end

    private

    # returns the string definition
    #
    # @return [String]
    def definitions_text
      <<~HEREDOC
        FREE {1,1,3,3}
        Judged Casserole
        Rams Throw A Pick
        Patriots Throw A Pick
        Missed 2pt Conversion
        Announcer Draws on Screen
        Balara Super Bowl 3+ Times
        Coach Cursing
        Sack
        Tasted all Casseroles
        Painted Face
        Brought a Casserole
        Kick-off
        Official Review
        Shot of Cheer-Leaders
        Fumble{0,2)
        >Fumble
        >Patriots Fumble
        >Rams Fumble
        Shot of Team Wwner
        Rams Timeout
        Victory Dance
        Punt
        Scoring Play{0,2}
        >Touchdown
        >Field Goal
        >Safety
        >Passing Touchdown
        >Defensive Score
        >Rushing Touchdown
        Cheering Fans
        Facemask
        Penalty{0,2}
        >Holding
        >Penalty
        >False start
        >Offsides
        >Intentional Grounding
        >Pass Interference
        >Delay of Game
        Incomplete Pass
        Missed Field Goal
        Shot of Blimp
        Player With a Ponytail
        Shot from Blimp
        Shot of Player Family
        Foam Finger
        Tasted the Winning Casserole
        Child{0,1}
        >Didn't Bring a Child
        >Brought a Child
        Played Poker
        Non-Rams, Non-Patriots Jersey
        Patriots Timeout
        Rams Catch A Pick
        Balara Super Bowl 1st Timer
        Missed Extra Point
        Shot of the Troops
        Coach's Challenge
        Injury Timeout
        4th Down Play
        Patriots Catch A Pick
        Your Taxes are Already Done
        2pt Conversion
        One Handed Catch
        Rock Paper Scissors {0,2}
        >Lost Rock Paper Scissors Round
        >Won Rock Paper Scissors Round
        Coin Toss {0,1}
        >Coin Toss Heads
        >Coin Toss Tails
        First Score{0,1}
        >Patriots Score 1st
        >Rams Score 1st
        Commercial{2,8}
        >Amazon Commercial
        >Colgate Commercial
        >Pringles Commercial
        >Dog in a Commercial
        >Cat in a Commercial
        >M&M's Commercial
        >Olay Commercial
        >Hyundai Commercial
        >Beer Commercial
        >Michael Buble
        >Movie Trailer
        >TV Show Commercial
        >Doritos Commercial
        >Soft Drink Commercial
        >Movie Star
        >Insurance Commercial
        >Car Commercial
      HEREDOC
    end
  end
end
