require 'sinatra/base'
require 'battleships'

class BattleshipsWeb < Sinatra::Base
  set :views, Proc.new { File.join(root, "..", "views") }

  enable :sessions


  get '/' do
    # 'Hello BattleshipsWeb!'
    erb :index
  end

  get '/game/new' do
    @name = session[:name]
    erb :new_game
  end

  post '/game/start' do
    session[:name] = params[:name]
    @name = session[:name]

    if @name == ""
      redirect to '/game/new'
    else
      @@game = Game.new(Player, Board)
      @@game.player_1.place_ship Ship.submarine, "A1"
      @@game.player_1.place_ship Ship.destroyer, "I10"
      @@game.player_1.place_ship Ship.cruiser, "H1", :vertically
      @@game.player_1.place_ship Ship.battleship, "E3", :vertically
      @@game.player_1.place_ship Ship.aircraft_carrier, "A9"
      @board = @@game.own_board_view @@game.player_1
      erb :game_start
      # @@board = @@game.own_board_view @@game.player_1
      # @board = @@board
      # erb :game_start
    end
  end

  get '/game/start' do
    @@board = @@game.own_board_view @@game.player_1
    @board = @board
    erb :game_start
    game.player_1.place_ship Ship.battleship
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
