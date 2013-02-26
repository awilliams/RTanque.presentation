class GameWindow < Gosu::Window
  def update
    super
    coord[:x] = self.mouse_x
    coord[:y] = self.mouse_y
  end

  def draw
    @image.draw(coord[:x], coord[:y], 0)
    text = "#{rand_tweeter[:name]} #{mouse_to_s}"
    @name.draw(text, 0, 0, 1)
  end
end