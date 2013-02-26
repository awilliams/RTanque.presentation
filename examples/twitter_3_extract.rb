class GameWindow < Gosu::Window
  def update
    super
    coord[:x] -= 4 if button_down? Gosu::KbLeft
    coord[:x] += 4 if button_down? Gosu::KbRight
    coord[:y] -= 4 if button_down? Gosu::KbUp
    coord[:y] += 4 if button_down? Gosu::KbDown
  end

  def draw
    @image.draw(coord[:x], coord[:y], 0)
    text = "#{rand_tweeter[:name]} #{kb_state}"
    @name.draw(text, 0, 0, 1)
  end
end