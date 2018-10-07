valid_lines = [ 'OOXOXX', 'OXOOXX', 'OOXXOX' ,'OXOXOX', 'XOOXOX',
                'OXXOOX', 'XOXOOX', 'OXOXXO', 'XOOXXO', 'OXXOXO',
                'XOXOXO', 'XXOOXO', 'XOXXOO', 'XXOXOO' ]

potential_games = valid_lines.repeated_permutation(6).to_a


def check_validity ( game_string )
  valid_lines = [ 'OOXOXX', 'OXOOXX', 'OOXXOX' ,'OXOXOX', 'XOOXOX',
                  'OXXOOX', 'XOXOOX', 'OXOXXO', 'XOOXXO', 'OXXOXO',
                  'XOXOXO', 'XXOOXO', 'XOXXOO', 'XXOXOO' ]
  vertical_lines =[]

  col1 = game_string[0] + game_string[6] + game_string[12] + game_string[18] + game_string[24] + game_string[30]
  col2 = game_string[1] + game_string[7] + game_string[13] + game_string[19] + game_string[25] + game_string[31]
  col3 = game_string[2] + game_string[8] + game_string[14] + game_string[20] + game_string[26] + game_string[32]
  col4 = game_string[3] + game_string[9] + game_string[15] + game_string[21] + game_string[27] + game_string[33]
  col5 = game_string[4] + game_string[10] + game_string[16] + game_string[22] + game_string[28] + game_string[34]
  col6 = game_string[5] + game_string[11] + game_string[17] + game_string[23] + game_string[29] + game_string[35]
  vertical_lines.push(col1)
  vertical_lines.push(col2)
  vertical_lines.push(col3)
  vertical_lines.push(col4)
  vertical_lines.push(col5)
  vertical_lines.push(col6)

  return (vertical_lines - valid_lines).empty?

end

def find_valid_games ( all_games )
  results = []
  all_games.map { |game| if (check_validity(game.join))
    results.push(game)
  end
  }
  return results
end

output_file = File.open("all_valid_games.txt", "w")
output_file.print find_valid_games(potential_games)
output_file.close
