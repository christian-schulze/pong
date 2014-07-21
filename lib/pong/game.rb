require 'ray'

require_relative './scenes/title'
require_relative './scenes/game'
require_relative './scenes/game_over'

module Pong
  class Game < Ray::Game
    def initialize
      super 'Pong'

      Scenes::Title.bind(self)
      Scenes::Game.bind(self)
      Scenes::GameOver.bind(self)

      push_scene(:title)
    end

    def register
      add_hook(:quit, method(:exit!))

      on(:key_press, key(:q))   { exit! }
      on(:key_press, key(:escape)) { exit! }
    end
  end
end
