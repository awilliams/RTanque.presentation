#!/usr/bin/env ruby
require 'gosu'
require_relative 'twitter_helper'

class Tweeter
  RESIZE_FACTOR = 0.3
  def initialize(window, name, image_source)
    @window = window
    @name = name
    @image = Gosu::Image.new(@window, image_source, true)
    @position = [@window.width / 2.0, @window.height / 2.0]
    @direction = rand(360)
    @speed = rand * 2
  end

  def update_position
    if self.out_of_bounds?
      @direction += 180
      @direction %= 360
      @speed = rand + 1.0
    end
    @position[0] += Gosu.offset_x(@direction, @speed)
    @position[1] += Gosu.offset_y(@direction, @speed)
  end

  def out_of_bounds?
    @x_range ||= (5..(@window.width - (@image.width * RESIZE_FACTOR)) - 5)
    @y_range ||= (5..(@window.height - (@image.height * RESIZE_FACTOR)) - 5)
    !(@x_range.include?(@position[0]) && @y_range.include?(@position[1]))
  end

  def draw
    @image.draw(@position[0], @position[1], 0, RESIZE_FACTOR, RESIZE_FACTOR)
  end

  def tick
    self.update_position
  end
end

class GameWindow < Gosu::Window
  include TwitterHelper
  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = "all y'all"
    @tweeters = tweeter_pics.map do |path|
      Tweeter.new(self, File.basename(path, '.*'), path)
    end
  end

  def update
    super
    @tweeters.each(&:tick)
  end

  def draw
    @tweeters.each(&:draw)
  end
end
GameWindow.new.show