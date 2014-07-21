require_relative './player'

module Pong
  class HumanPlayer < Player
    include Ray::Helper

    def initialize(target:, x:, y:, width:, options: {})
      super(target: target, x: x, y: y, width: width)

      @left_key  = options.fetch(:left_key, :left)
      @right_key = options.fetch(:right_key, :right)
    end

    def update
      if holding?(key(@left_key))
        move_left
      elsif holding?(key(@right_key))
        move_right
      end
    end

    private

    def window
      @target
    end
  end
end
