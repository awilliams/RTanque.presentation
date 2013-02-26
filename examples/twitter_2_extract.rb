class GameWindow < Gosu::Window
  def initialize
    super(WIDTH, HEIGHT, false)
    self.caption = rand_tweeter[:name]
    @image = Gosu::Image.new(
      self, rand_tweeter[:pic], true
    )
    @name = Gosu::Font.new(
      self, Gosu::default_font_name, 64
    )
  end

  def draw
    @image.draw(coord[:x], coord[:y], 0)
    @name.draw(rand_tweeter[:name], 0, 0, 1)
  end
end