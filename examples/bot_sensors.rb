class Bot < RTanque::Bot::Brain
  # RTanque::Bot::Sensors =
  #  Struct.new(
  #    :ticks, :health, :speed, 
  #    :position, :heading, :radar, :turret
  #  )
  def tick!
    sensors.ticks # Integer
    sensors.health # Integer
    sensors.position # RTanque::Point
    sensors.heading # RTanque::Heading
    sensors.speed # Integer
    sensors.radar.heading # RTanque::Heading
    sensors.turret.heading # RTanque::Heading
    sensors.radar.each do |scanned_bot|
      # RTanque::Bot::Radar::Reflection
      # Reflection(:heading, :distance, :name)
    end
  end
end
