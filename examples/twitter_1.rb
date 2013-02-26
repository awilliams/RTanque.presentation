#!/usr/bin/env ruby
require 'gosu'
require_relative 'twitter_helper'

class GameWindow < Gosu::Window
  include TwitterHelper
  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = rand_tweeter[:name]
    @image = Gosu::Image.new(self,
        rand_tweeter[:pic], true)
  end

  def update
    super
  end

  def draw
    @image.draw(coord[:x], coord[:y], 0)
  end
end
GameWindow.new.show