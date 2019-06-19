
  puts "Bah gawd welcome to WRASSLIN!!!!™"
  puts ""

  def tty_welcome
    TTY::Prompt.new.select("What do you want to do first, new blood?") do |menu|
      menu.choice "Meet the locker room" => -> do tty_locker_room end 
      menu.choice "LET'S SUIT UP" => -> do tty_create_wrestler end
      menu.choice "Ummm you do know wrestling is fake right?" => -> do tty_start_over end
    end
  end 
  
  def tty_locker_room
    system("clear")
    TTY::Prompt.new.select("Ready to go back?") do |menu| 
    puts Wrestler.pluck:name
    menu.choice "Yea!" => -> do tty_welcome end 
    end 
  end 
  
  def tty_start_over

    puts "OMG REALLY!?!??!"
    puts ""
    puts "Let's try this again"
    puts ""
    tty_welcome
  end 
  
  def tty_create_wrestler
    system("clear")
    new_wrestler = TTY::Prompt.new.ask("What do they call you?", default: ENV[''])
    Wrestler.create(name: new_wrestler)
    puts ""
    TTY::Prompt.new.select("#{new_wrestler}? You really think you can be the champ with a jabroni name like that?") do |menu|
      menu.choice "OOOHHHH YEEEEAAAAAA" => -> do tty_okay_now_what end 
      menu.choice "Maybe not. Let me change it" => -> do tty_update_wrestler end
    end
  end 
  
  def tty_update_wrestler
    system("clear")
    update_wrestler = TTY::Prompt.new.ask("Okay, what do they call you?", default: ENV[''])
      Wrestler.last.update(name: update_wrestler)
    tty_okay_now_what
  end
  
  def tty_okay_now_what
    system("clear")
    TTY::Prompt.new.select("Alright hot shot, now what?") do |menu|
      menu.choice "Meet the locker room" => -> do tty_locker_room end
      menu.choice "Actually I changed my mind. Can I please change my jabroni name?" => -> do tty_update_wrestler end 
      menu.choice "You know what? I'm tired of putting my body on the line for you. You haven't paid me in months but you're driving around in that Camaro. You don't even provide healthcare! TAKE THIS JOB AND SHOVE IT!!!" => -> do tty_fire_wrestler end
    end 
  end 

  def tty_fire_wrestler
    system("clear")
    TTY::Prompt.new.select("You can't quit.....YOUUU'RRRREEEE FIIIRRREEDDDDDD") do |menu|
      menu.choice "You have been removed from the roster. Trust me, you didn't want to work here anyway. Wrestlers don't even get healthcare through their employer!" => -> do tty_welcome end 
      Wrestler.last.delete
    end 
  end 
