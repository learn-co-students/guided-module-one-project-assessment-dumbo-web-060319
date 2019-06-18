require_relative '../config/environment'

prompt = TTY::Prompt.new

puts "Bah gawd welcome to ™"

new_wrestler = prompt.ask('What is your name?', default: ENV['USER'])
Wrestler.create(name: new_wrestler)
puts "Welcome, #{new_wrestler}!"




# def create_a_wrestler(new_wrestler)
#   wrestler = Wrestler.new
#   wrestler.name = new_wrestler
#   wrestler.save
#   end 

