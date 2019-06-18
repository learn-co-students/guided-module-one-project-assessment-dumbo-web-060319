
  puts "Bah gawd welcome to WRASSLIN!!!!™"

  def tty_welcome
    TTY::Prompt.new.select("What do you want to do first, new blood?") do |menu|
      menu.choice 'Meet the locker room' => -> do tty_locker_room end 
      menu.choice "LET'S SUIT UP"
      menu.choice "Ummm you do know wrestling is fake right?"
    end
  end 
  
  def tty_locker_room
    TTY::Prompt.new.select("Yoooooo idk what else to say rn") do |menu| 
    puts Wrestler.pluck:name
    menu.choice "Let's go back" => -> do tty_welcome end 
    end 
  end 
  
  # # if 3
  # #   puts "OMG REALLY!?!??!"
  # #   puts "lol bye"
  # #   puts "Bah gawd welcome to WRASSLIN!!!!™"
  # #   prompt.select('What do you want to do first new blood?') do |menu|
  # #     menu.choice 'Meet the locker room', 1 
  # #     menu.choice "I'M READY TO SUIT UP BRÖTHER", 2
  # #     menu.choice "Ummm you do know wrestling is fake right?", 3
  # #   end
  # # end 
  
  
  #   new_wrestler = prompt.ask("What do you call yourself?\n", default: ENV['USER'])
  #   Wrestler.create(name: new_wrestler)
  
  
  # prompt.select("#{new_wrestler}? You really think you can be the champ with a jabroni name like that?") do |menu|
  #   menu.choice 'OOOHHHH YEEEEAAAAAA' => => 
  #   menu.choice 'Maybe not. Let me change it', 2
  # end
  
  
  # update_wrestler = prompt.ask("Okay, you got one last chance kid.", default: ENV['USER'])
  #   Wrestler.last.update(name: update_wrestler)
  
  
  # puts "Sorry, but YOUUUUU'RRRREEEE FIIIIRRREEEDDDDD"  
  # Wrestler.last.delete
  # puts "You have been removed from the roster. Trust me, you didn't want to work here anyway. Wrestlers don't even get healthcare through their employer!"