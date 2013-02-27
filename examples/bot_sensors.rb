class Bot < RTanque::Bot::Brain
  def tick!
    sensors.ticks # Integer
    sensors.health # Integer
    sensors.position # RTanque::Point
    sensors.heading # RTanque::Heading
    sensors.speed # Integer
    sensors.radar_heading # RTanque::Heading
    sensors.turret_heading # RTanque::Heading
    sensors.gun_energy # Integer
    sensors.radar.each do |scanned_bot|
      scanned_bot.name
      scanned_bot.distance
      scanned_bot.heading
    end
  end
end
