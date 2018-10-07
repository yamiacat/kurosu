game_file = File.open("all_valid_games.txt", "r")
all_games_blob = game_file.read
all_games = Kernel.eval(all_games_blob)

random_games = all_games.shuffle

ten_games = random_games.take(10)

random_game = random_games.take(1)

def redact_game (game, number_exposed)
  output_game = ["······", "······", "······", "······", "······", "······"]
  i = 0
  until i == number_exposed
    x = rand(6)
    y = rand(6)
    # character = game[0][x][y]
    output_game[x][y] = game[0][x][y]
    i += 1
  end
  return output_game
end

def render_game (game)
  return game.join("\n") + "\n"
end

# def render_games (games, starting_revealed)
#   processed_games = []
#   for game in games do
#     processed_games.push(redact_game(game, starting_revealed))
#   end
#   return processed_games
# end


print render_game(redact_game(random_game, 10))
# print render_games(ten_games, 8)
