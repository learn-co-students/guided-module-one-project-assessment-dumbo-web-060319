require 'pry'

def game_logo
  system "artii 'BAH  GAWED' | lolcat"
  system "artii 'WELCOME  TO' | lolcat"
  system "artii 'WRASSLIN' | lolcat"
end 


def tty_main_menu
  game_logo
  TTY::Prompt.new.select("Meet your favorite wrestler, pick your dream match, or get in the ring yourself!") do |menu|
    menu.choice "I wanna meet the locker room! $50 bucks an autograph." => -> do tty_locker_room end 
    menu.choice "I'm not really the *active* type. Let me put a match together" => -> do tty_select_wrestler_one end
    menu.choice "LET'S SUIT UP!" => -> do tty_create_wrestler end
    menu.choice "Ummm you do know wrestling is fake right?" => -> do tty_start_over end
    menu.choice "No but really I don't want to do this please don't make me." => -> do 
      system("pkill mpg123")
      exit 
    end
  end
end 


def tty_select_wrestler_one
system("clear")
TTY::Prompt.new.select("Who will you be?") do |menu|
  Wrestler.all.each do |wrestler|
    menu.choice "#{wrestler.name}" => -> do
      $w1 = wrestler
      tty_select_wrestler_two
      end
    end
  end
end 

def tty_select_wrestler_two
  system("clear")
  puts "IS THAT? IT CAN'T BE...THAT'S #{$w1.name.upcase}!"
  TTY::Prompt.new.select("WHO'S GOT THE GUTS, THE FORTITUDE TO GO UP AGAINST #{$w1.name.upcase}") do |menu|
    Wrestler.all.each do |wrestler|
      menu.choice "#{wrestler.name}" => -> do
        $w2 = wrestler
        tty_create_match
      end
    end
  end
end 

def tty_create_match
  $new_match = Match.create(wrestler_one: $w1, wrestler_two: $w2)
  tty_choose_show
end

def tty_choose_show
  system("clear")
  puts "#{$w2.name.upcase} HAS RISEN FROM THE ASHES. MY LORD, #{$w2.name.upcase} IS HERE!!"
    TTY::Prompt.new.select("And where will this clashing of titans take place?") do |menu|
      Show.all.each do |show|
        menu.choice "#{show.name}" => -> do
          $show = show
          tty_assign_show_a_match
        end
      end
    end
end 

def tty_assign_show_a_match
  system("clear")
  Match.last.update(show: $show)
  puts "THIS SUNDAY AT #{$show.name.upcase}, #{$w1.name.upcase} WILL BE WALKING THROUGH HELLFIRE AND BRIMSTONE TO TAKE ON #{$w2.name.upcase}"
  puts ""
  puts "FOLKS, THIS WILL BE A SLOBBER KNOCKER."
  TTY::Prompt.new.select("Looks like you have to wait 'til Sunday for the PPV. Want to keep hanging or head out?") do |menu| 
    menu.choice "Let's hang!" => -> do tty_main_menu end 
    menu.choice "I have to pay to see a match that *I* booked?? This business, I tell ya..." => -> do 
      system("pkill mpg123")
      exit 
      end
    end
end 

  
def tty_locker_room
  system("clear")
  TTY::Prompt.new.select("Ready to go back?") do |menu| 
  puts Wrestler.pluck:name
  menu.choice "Yea!" => -> do tty_main_menu end 
  end 
end 
  
  def tty_start_over
    system("clear")
    puts "OMG REALLY!?!??!"
    puts ""
    TTY::Prompt.new.select("YOU DON'T SAY!!?!?") do |menu| 
      menu.choice "Yikes. SOMEONE's a little passive aggressive. Let's try this again." => -> do tty_main_menu end 
    end
  end  

  def tty_create_wrestler
    system("clear")
    $custom_wrestler = TTY::Prompt.new.ask("What do they call you?", default: ENV[''])
    Wrestler.create(name: $custom_wrestler)
    puts ""
    TTY::Prompt.new.select("#{$custom_wrestler}? You really think you can be the champ with a jabroni name like that?") do |menu|
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
      menu.choice "LET ME FIIIIGHT" => -> do tty_custom_wrestler_to_match end
      menu.choice "Actually I changed my mind. Can I please change my jabroni name?" => -> do tty_update_wrestler end 
      menu.choice "You know what? I'm tired of putting my body on the line for you. You haven't paid me in months but you're driving around in that Camaro. You don't even provide healthcare! TAKE THIS JOB AND SHOVE IT!!!" => -> do tty_fire_wrestler end
    end 
  end 

  def tty_custom_wrestler_to_match
    system("clear")
    puts "IS THAT? IT CAN'T BE...THAT'S #{$custom_wrestler.upcase}!"
    TTY::Prompt.new.select("WHO'S GOT THE GUTS, THE FORTITUDE TO GO UP AGAINST #{$custom_wrestler.upcase}") do |menu|
      Wrestler.all.each do |wrestler|
        menu.choice "#{wrestler.name}" => -> do
          $custom_opponent = wrestler
          tty_create_custom_match
        end
      end
    end
  end 
  
def tty_create_custom_match
  $custom_wrestler_object = Wrestler.last 
  $custom_match = Match.create(wrestler_one: $custom_wrestler_object, wrestler_two: $custom_opponent)
  tty_custom_choose_show
end
    
def tty_custom_choose_show
  system("clear")

  puts "#{$custom_opponent.name.upcase} HAS RISEN FROM THE ASHES. MY LORD, #{$custom_opponent.name.upcase} IS HERE!!" 
    TTY::Prompt.new.select("And where will this clashing of titans take place?") do |menu|
      Show.all.each do |show|
        menu.choice "#{show.name}" => -> do
          $show = show
          tty_custom_assign_show_a_match
        end
      end
    end
end 

def tty_custom_assign_show_a_match
  system("clear")
  Match.last.update(show: $show)
  puts "THIS SUNDAY AT #{$show.name.upcase}, #{$custom_wrestler.upcase} WILL BE WALKING THROUGH HELLFIRE AND BRIMSTONE TO TAKE ON #{$custom_opponent.name.upcase}!!"
  puts ""
  puts "FOLKS, THIS WILL BE A SLOBBER KNOCKER."
  TTY::Prompt.new.select("Looks like you have to wait 'til Sunday for the PPV. Want to keep hanging or head out?") do |menu| 
    menu.choice "Let's hang!" => -> do tty_main_menu end 
    menu.choice "I have to pay to see a match that *I* booked?? This business, I tell ya..." => -> do exit end
    end
end 

  def tty_fire_wrestler
    system("clear")
    TTY::Prompt.new.select("You can't quit.....YOUUU'RRRREEEE FIIIRRREEDDDDDD") do |menu|
      menu.choice "You have been removed from the roster. You're better off tbh this guy is nuts." => -> do tty_main_menu end 
      Wrestler.last.delete
    end 
  end 


 



##*@*#*#*#*# D E A D  C O D E *#*#*#**#**#*#*#*#

# all_wrestlers = Wrestler.all.map {|wrestler| wrestler}
#   $w1 = TTY::Prompt.new.select("Who will you be?", all_wrestlers)
#   $w2 = TTY::Prompt.new.select("OH MY GOD IT'S #{$w1}!!! Who are you squaring up against?", all_wrestlers) 
  
#   puts "#{$w1} vs. #{$w2}! This one will be a slobberknocker folks!"
#   new_match = Match.create(wrestler_one: $wrestler_one, wrestler_two: $wrestler_two)

# def tty_select_wrestler_one
#   TTY::Prompt.new.select("Who will you be?") do |menu|
#     Wrestler.all.each do |wrestler|
#       $w1 = menu.choice "#{wrestler.name}", value: 1 => -> do tty_select_wrestler_two end
#       end
#     end
#   end


# def tty_assign_show
#   all_shows = Show.all.map {|show| show.name}
#   assign_show = TTY::Prompt.new.select("What show you wanna wrassle on?", all_shows)
#   match_on_show = Match.last.update(show_id: assign_show)
#   binding.pry
#   puts "#{$w1} vs. #{$w2} at #{assign_show}!!"
# end 

 ##*@*#*#*#*# D E A D  C O D E *#*#*#**#**#*#*#*#
