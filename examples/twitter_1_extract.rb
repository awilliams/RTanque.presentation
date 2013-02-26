class GameWindow < Gosu::Window
  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = rand_tweeter[:name]
    @image = Gosu::Image.new(
      self, rand_tweeter[:pic], true
    )
  end

  def update
    super # game logic here
  end

  def draw
    @image.draw(coord[:x], coord[:y], 0)
  end
end
GameWindow.new.show