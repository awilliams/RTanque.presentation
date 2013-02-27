class Bot < RTanque::Bot::Brain
  def tick!
    command.speed = 1
    command.heading = Math::PI
    command.radar_heading = Math::PI
    command.turret_heading = Math::PI
    command.fire(3)
  end
end
