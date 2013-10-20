# In a game of rock-paper-scissors, each player chooses to play Rock (R), Paper (P), or Scissors ( S).
# The rules are: Rock breaks Scissors, Scissors cuts Paper, but Paper covers Rock.
# In a round of rock-paper-scissors, each player's name and strategy is encoded as an array of two elements
class RockPaperScissors
  @@WINNER=['RS', 'SP', 'PR', 'RR', 'SS', 'PP']

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError;
  end

  def self.winner(player1, player2)
    est1=player1[1].to_s.upcase
    est2=player2[1].to_s.upcase
    if 'RSP'.index(est1) and 'RSP'.index(est2)
      @@WINNER.index(est1+est2) ? player1 : player2
    else
      raise NoSuchStrategyError.new("Strategy must be one of R,P,S")
    end
  end

=begin

    A rock-paper-scissors tournament is encoded as an array of games - that is, each element can be considered its own tournament.
      end
   [
       [
           [ ["Armando", "P"], ["Dave", "S"] ],
           [ ["Richard", "R"],  ["Michael", "S"] ],
       ],
       [
           [ ["Allen", "S"], ["Omer", "P"] ],
           [ ["David E.", "R"], ["Richard X.", "P"] ]
       ]
   ]
  @@WINNER=['RS', 'SP', 'PR', 'RR', 'SS', 'PP']
  In the tournament above Armando will always play P and Dave will always play S. This tournament plays out as follows:
 Under this scenario, Dave would beat Armando (S>P) and Richard would beat Michael (R>S),
so Dave and Richard would play (Richard wins since R>S); similarly,
Allen would beat Omer, Richard X. would beat David E., and Allen and Richard X.
would play (Allen wins since S>P); and finally Richard would beat Allen since R>S.
That is, pairwise play continues until there is only a single winner.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               Write a method `RockPaperScissors.tournament_winner' that takes a tournament encoded as an array and returns the winner (for the above example, it should return ['Richard', 'R']). You can assume that the array is well formed (that is, there are 2^n players, and each one participates in exactly one match per round).
=end
  def self.tournament_winner(tournament)


    if(tournament.to_a.flatten.length==4)
      winner(tournament[0],tournament[1])
    else
      play1=tournament_winner(tournament[0])
      play2=tournament_winner(tournament[1])
      winner(play1,play2)
    end

  end


end

