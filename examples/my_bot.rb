class MyBot < RTanque::Bot::Brain
  include RTanque::Bot::BrainHelper
  NAME = 'my_bot'

  def tick!
    ## main logic goes here
    # use self.sensors to detect things
    # use self.command to control tank
  end
end