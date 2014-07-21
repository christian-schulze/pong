module Pong
  class Ball
    attr_reader :x, :y, :radius
    attr_accessor :velocity_x, :velocity_y

    def initialize(target:, x:, y:, radius:, velocity_x:, velocity_y:)
      @target     = target
      @x          = x
      @y          = y
      @radius     = radius
      @velocity_x = velocity_x
      @velocity_y = velocity_y
    end

    def render
      @target.draw(Ray::Polygon.circle([x, y], radius, Ray::Color.red))
    end

    def move_x
      @x += velocity_x
    end

    def move_y
      @y += velocity_y
    end

    def reverse_x
      @velocity_x = -velocity_x
    end

    def reverse_y
      @velocity_y = -velocity_y
    end

    private

    # def move
    #   @x, @velocity_x = move_dimension(x, velocity_x, view.w)
    #   @y, @velocity_y = move_dimension(y, velocity_y, view.h)
    # end
    #
    # def move_dimension(position, velocity, limit)
    #   position += velocity
    #
    #   if position < radius
    #     position = radius
    #     velocity = -velocity
    #   elsif position > limit - radius
    #     position = (limit - radius) - (position - (limit - radius))
    #     velocity = -velocity
    #   end
    #
    #   return position, velocity
    # end
    #
    # def view
    #   @target.view
    # end
  end
end
