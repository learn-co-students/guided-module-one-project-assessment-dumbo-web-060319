require_relative '../config/environment'
require_relative './user_interface_tty'

def sound
  pid = fork{ exec 'mpg123','-q', "audio/Stone Cold Steve Austin Theme in Synthesia.mp3"}
end



sound 
tty_main_menu
