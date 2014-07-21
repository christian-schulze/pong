module Pong
  module Scenes
    class Title < Ray::Scene
      scene_name :title

      def initialize
        super
      end

      def register
        on(:key_press) { push_scene(:game) }
      end

      def render(window)
        @text = text('Press any key to play...', size: 20, at: [window.view.w.div(2) - 100, window.view.h.div(2) - 50])
        window.draw(@text)
      end
    end
  end
end
