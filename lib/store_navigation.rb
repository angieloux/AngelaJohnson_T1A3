# require gems
require "colorize"
require "tty-prompt"
require "ruby-progressbar"
require "artii"
require "tty-box"
require "rainbow"
require 'require_all'

require_all './'
include VinylSection
include Cart
include Counter

module StoreNavigation
  @@prompt = TTY::Prompt.new
  @@store_name = Artii::Base.new    
  @@store_name = TTY::Box.frame @@store_name.asciify("AJ RECORDS *")
  
  def self.choose_store_section(choice) 
    system "clear"
    puts "\n・・・～～～～～ᕕ( ᐛ )ᕗ" # imitate the visitor walking
    progressbar = ProgressBar.create
    10.times { progressbar.increment; sleep 0.01 }
    case choice
    when 1
      display_menu
    when 2
      display_cart
    when 3
      go_to_counter
    when 4
      exit
    end
  end

  def self.look_around
    # puts @@store_name
    input = @@prompt.select("Where should I go?") do |menu|
      menu.choice "Cruise over to the " + "VINYL".light_magenta, 1
      menu.choice "Review whats in your " + "CART".blue, 2
      menu.choice "Head over to the " + "COUNTER".red, 3
      menu.choice "Turn around and leave, I'm scared".magenta, 4
    end
    choose_store_section(input)
  end

  puts @@store_name
  puts "You arrive at a swanky looking retro record store.\n".blue +
      "The aisles are lined with hundreds of records, CDs, games, comic books....\n".white +
      "The walls are covered in posters and memorabilia.\n".white + 
      "There are literally 2 MILLION pop vinyl figurines staring directly at you.\n".white +
      "Oh my god is that Baby Yoda?".italic + " You're so overstimulated your eyeballs almost explode.\n".white
    
      answer = @@prompt.yes?("The pop vinyl are super creepy. But what the heck, I do need more records.. should I go in?".green)
      if !answer
        system "clear"
        puts "You realise you have absolutely no understanding of how to talk to humans anymore since COVID. You turn around and leave.".red
        exit
      else
        system 'clear'
        look_around
      end
      end