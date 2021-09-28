# require gems
require "colorize"
require "tty-prompt"
require "ruby-progressbar"
require "artii"

# require relative files:
require_relative "department"
require_relative "vinyl"

# create Department instance
department = Department.new
@prompt = TTY::Prompt.new
@vinyl_department = VinylDepartment.new
store_name = Artii::Base.new

puts store_name.asciify("AJ's Records!")
puts "You arrive at a swanky looking retro record store. " +
       "The aisles are lined with hundreds of records, CDs, games, comic books.... " +
       "the walls are covered in posters and memorabilia, there are a million pop vinyl and other toys staring directly at you. " +
       "Oh my god is that Baby Yoda? You're so overstimulated your eyeballs almost explode. \n"

def choose_department(choice)
  system "clear"
  puts "\n・・・～～～～～ᕕ( ᐛ )ᕗ" # imitate the visitor walking
  progressbar = ProgressBar.create
  10.times { progressbar.increment; sleep 0.20 }
  case choice
  when 1
    @vinyl_department.display_menu
  when 2
    @listening_station_department.display_menu
  when 3
    @games_department.display_menu
  when 4
    @toys_department.display_menu
  when 5
    @counter_department.display_menu
  when 6
    exit
  end
end

def look_around
  input = @prompt.select("Where do you want to go?") do |menu|
    menu.choice "Cruise over to the " + "VINYL".light_magenta, 1
    menu.choice "Have a boogie over at the " + "LISTENING STATION".blue, 2
    menu.choice "Check out the " + "GAMES".light_green, 3
    menu.choice "Spend too much money on " + "memorabilia & TOYS!".yellow, 4
    menu.choice "Head over to the " + "COUNTER".red, 5
    menu.choice "Turn around and leave, I'm scared".magenta, 6
  end
  choose_department(input)
end

answer = @prompt.yes?("Do you want to go in?")
if !answer
  system "clear"
  puts "You realise you have absolutely no understanding of how to talk to humans anymore since COVID. You turn around and leave."
  exit
else
  look_around
end
