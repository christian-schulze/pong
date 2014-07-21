module Pong
  class Player
    STEP_SIZE = 10

    attr_reader :x, :y, :width

    def initialize(target:, x:, y:, width:)
      @target = target
      @x      = x
      @y      = y
      @width  = width
    end

    def move_left
      @x += -STEP_SIZE if @x >= 0
    end

    def move_right
      @x += STEP_SIZE if @x <= (view.w - width)
    end

    def render
      @target.draw(Ray::Polygon.rectangle([x, y, width, 5], Ray::Color.red))
    end

    def collision?(pos_x, pos_y, offset)
      pos_x >= x && pos_x <= (x + width) && pos_y > (y - offset)
    end

    private

    def view
      @target.view
    end
  end
end
