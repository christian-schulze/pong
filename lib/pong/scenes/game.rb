require_relative '../human_player'
require_relative '../ball'
require_relative '../ball_controller'

module Pong
  module Scenes
    class Game < Ray::Scene
      scene_name :game

      attr_reader :entities

      def setup
        @entities = {}

        entities[:player]          = build_human_player()
        entities[:ball_controller] = build_ball_controller()
      end

      def clean_up
        @entities = {}
      end

      def register
        always do
          entities.values.each(&:update)
          handle_end_of_game
        end
      end

      def render(window)
        entities.values.each(&:render)
      end

      def collision_x?(position, offset)
        collision?(position, offset, view.w)
      end

      def collision_y?(position, offset)
        collision?(position, offset, view.h)
      end

      def handle_end_of_game
        if entities[:ball_controller].out_of_bounds?
          exit!
          push_scene(:game_over)
        end
      end

      def h
        view.h
      end

      private

      def collision?(position, offset, limit)
        if position < offset
          true
        elsif position > limit - offset
          true
        else
          false
        end
      end

      def build_human_player
        HumanPlayer.new(
          target: window,
          x:      view.w.div(2) - 25,
          y:      view.h - 5,
          width:  50,
          options: {
            left_key:  :left,
            right_key: :right
          }
        )
      end

      def build_ball
        Ball.new(
          target:     window,
          x:          view.w.div(2),
          y:          view.h.div(2),
          radius:     10,
          velocity_x: BallController.random_velocity,
          velocity_y: BallController.random_velocity
        )
      end

      def build_ball_controller
        BallController.new(
          scene: self,
          ball: build_ball(),
          player: entities[:player]
        )
      end

      def view
        window.view
      end
    end
  end
end
