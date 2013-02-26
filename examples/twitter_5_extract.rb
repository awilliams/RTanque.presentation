class Tweeter
  def initialize(window, name, image_source); end
  def tick; end
  def draw; end
end
class GameWindow < Gosu::Window
  def initialize
    @twters = [Tweeter.new(self, name, src)]
  end

  def update
    @twters.each(&:tick)
  end

  def draw
    @twters.each(&:draw)
  end
end