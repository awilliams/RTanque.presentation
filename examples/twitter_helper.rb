module TwitterHelper
  WIDTH  = 790 
  HEIGHT = 500

  def update
    self.close if self.button_down?(Gosu::KbRight) && self.button_down?(Gosu::KbLeft)
  end

  def tweeter_pics
    @tweeter_pics ||= Dir.glob(File.expand_path('../../twitter_images/*', __FILE__))
  end

  def rand_tweeter
    @rand_tweeter_pic ||= self.tweeter_pics.sample
    @rand_tweeter_name ||= File.basename(@rand_tweeter_pic, '.*')
    @rand_tweeter ||= {name: @rand_tweeter_name, :pic => @rand_tweeter_pic}
  end

  def coord
    @coordinates ||= {
      x: (self.width / 2.0) - (@image.width / 2.0),
      y: (self.height / 2.0) - (@image.height / 2.0)
    }
  end

  def kb_state
    [].tap do |s|
      s << 'LEFT' if button_down? Gosu::KbLeft
      s << 'RIGHT' if button_down? Gosu::KbRight
      s << 'UP' if button_down? Gosu::KbUp
      s << 'DOWN' if button_down? Gosu::KbDown
    end.join('+')
  end

  def mouse_to_s
    "#{self.mouse_x.to_i}x#{self.mouse_y.to_i}"
  end
end
