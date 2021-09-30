# require gems
require "colorize"
require "tty-prompt"
require "ruby-progressbar"
require "artii"

# require relative files:
require_relative "store" # parent class
require_relative "vinyl_section"
require_relative "counter_section"

# create instance of all Store Sections
@@store = Store.new
@@counter_section = CounterSection.new ## WARNINGS: will need to debug why the instance variables change to nil after being initialized once and called upon again
@@vinyl_section = VinylSection.new

# create tty-prompt and artii instances
@prompt = TTY::Prompt.new
store_name = Artii::Base.new
@store_name = store_name.asciify("AJ's Records!")
system 'clear'

def choose_store_section(choice) 
  system "clear"
  puts "\n・・・～～～～～ᕕ( ᐛ )ᕗ" # imitate the visitor walking
  progressbar = ProgressBar.create
  10.times { progressbar.increment; sleep 0.01 }
  case choice
  when 1
    @@vinyl_section.display_menu
  when 2
    @@store.display_cart
  when 3
    @@counter_section.go_to_counter
  when 4
    exit
  end
  
end

def look_around
  puts @store_name
  input = @prompt.select("Where do you want to go?") do |menu|
    menu.choice "Cruise over to the " + "VINYL".light_magenta, 1
    menu.choice "Review whats in your " + "CART".blue, 2
    menu.choice "Head over to the " + "COUNTER".red, 3
    menu.choice "Turn around and leave, I'm scared".magenta, 4
  end
  choose_store_section(input)
end

puts @store_name
puts "You arrive at a swanky looking retro record store. " +
       "The aisles are lined with hundreds of records, CDs, games, comic books.... " +
       "the walls are covered in posters and memorabilia, there are a million pop vinyl and other toys staring directly at you. " +
       "Oh my god is that Baby Yoda? You're so overstimulated your eyeballs almost explode. \n"

answer = @prompt.yes?("\nDo you want to go in?")
if !answer
  system "clear"
  puts "You realise you have absolutely no understanding of how to talk to humans anymore since COVID. You turn around and leave.".red
  exit
else
  system 'clear'
  look_around
end