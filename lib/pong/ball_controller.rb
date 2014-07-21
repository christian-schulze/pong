module Pong
  class BallController
    MAX_SPEED = 5

    attr_reader :scene, :ball, :player

    def initialize(scene:, ball:, player:)
      @scene  = scene
      @ball   = ball
      @player = player
    end

    def update
      move_x
      move_y
    end

    def render
      ball.render
    end

    def out_of_bounds?
      ball.y > scene.h + ball.radius
    end

    def self.random_velocity
      sign  = (rand(2) == 1) ? 1 : -1
      speed = rand(MAX_SPEED) + 1
      speed * sign
    end

    private

    def move_x
      ball.move_x
      ball.reverse_x if scene.collision_x?(ball.x, ball.radius)
    end

    def move_y
      ball.move_y
      if ball.velocity_y > 0 && player.collision?(ball.x, ball.y, ball.radius)
        ball.reverse_y
      elsif ball.velocity_y < 0 && scene.collision_y?(ball.y, ball.radius)
        ball.reverse_y
      end
    end
  end
end
