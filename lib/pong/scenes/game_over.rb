module Pong
  module Scenes
    class GameOver < Ray::Scene
      scene_name :game_over

      def initialize
        super
      end

      def register
        on(:key_press) { exit! }
      end

      def render(window)
        @text = text('Game Over!', size: 30, at: [window.view.w.div(2) - 75, window.view.h.div(2) - 50])
        @sub = text('press any key to continue', size: 15, at: [window.view.w.div(2) - 78, window.view.h.div(2)])
        window.draw(@text)
        window.draw(@sub)
      end
    end
  end
end
