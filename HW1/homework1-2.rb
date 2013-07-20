

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
	raise NoSuchStrategyError unless m1[1] =~ /R|P|S|r|p|s/  && m2[1] =~ /R|P|S|r|p|s/
	
	if m1[1].downcase == "r" && m2[1].downcase == "s"
		return m1

	elsif m1[1].downcase == "p" && m2[1].downcase == "r"
		return m1
	
	elsif m1[1].downcase == "s" && m2[1].downcase == "p"
		return m1
		
	elsif m1[1].downcase == m2[1].downcase
		return m1
	
	else
		return m2
	end
end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	rps_result(game[0], game[1])
end

def rps_tournament_winner(tournament)
	if tournament[0][0].class == String
		return rps_game_winner(tournament)
	else
		return rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
	end
end

rps_game_winner( [["Armando", "P"], ["Dave", "S"]] )

rps_tournament_winner([
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
	]
])
