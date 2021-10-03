# require gems
require "colorize"
require "tty-prompt"
require "ruby-progressbar"
require "artii"
require "tty-box"
require "require_all"
require "json"
require "terminal-table"

require_all "./lib"

FILE = File.read("./data/vinyl.json") # the store's stock on hand (498 records)
STOCK = JSON.parse(FILE)
PROMPT = TTY::Prompt.new

include VinylSection
include Cart
include Counter

module StoreNavigation
  @@store_name = Artii::Base.new
  @@store_name = TTY::Box.frame @@store_name.asciify("AJ RECORDS *")

  # enact consequences of the visitors selection in look_around
  def self.choose_store_section(choice)
    system "clear"
    puts "\n・・・～～～～～ᕕ( ᐛ )ᕗ" # imitate the visitor walking
    progressbar = ProgressBar.create
    10.times { progressbar.increment; sleep 0.01 }
    case choice
    when 1
      display_menu #vinyl section
    when 2
      display_cart #cart
    when 3
      go_to_counter #counter/checkout
    when 4
      exit
    when 5
      system "clear"
      puts "For me? Yay. So wonderful. So generous of you. I love my job.\nI love sorting. " + 
      "What a gift you have given me.\nEVERYTHING. IS. GREAT.\n (╯°□°）╯︵ ┻━┻\n".yellow
      puts "[...You back away slowly and exit the store]".italic
      exit
    end
  end

  # visitor decides where to explore in the store
  def self.look_around
    input = PROMPT.select("Where should I go?") do |menu|
      menu.choice "Cruise over to the " + "VINYL".light_magenta, 1
      menu.choice "Review what's in your " + "CART".light_blue, 2
      menu.choice "Head over to the " + "COUNTER".yellow, 3
      # visitor can't just run out with vinyl in their cart, they have to return it first
      if total_cost_of_cart == 0
        menu.choice "Turn around and leave. (EXIT)".magenta, 4
      else
        menu.choice "Drop your records to the girl at the counter and leave (EXIT)".magenta, 5
      end
    end
    choose_store_section(input)
  end

  # welcome the visitor to the store, ask if they want to come in
  puts @@store_name.yellow
  puts "You arrive at a swanky looking retro record store.\n".yellow +
         "The aisles are lined with hundreds of records, CDs, games, comic books....\n".white +
         "The walls are covered in posters and memorabilia.\n".white +
         "There are literally 2 MILLION pop vinyl figurines staring directly at you.\n".white +
         "Oh my god is that Baby Yoda?".italic.green + " You're so overstimulated your eyeballs almost explode.\n".white

  answer = PROMPT.yes?("The pop vinyl are super creepy. But I do need more records.. should I go in?".magenta)
  if !answer
    system "clear"
    puts "You realise you have absolutely no understanding of how to talk to humans anymore since COVID. You turn around and leave.".red
    exit
  else
    system "clear"
    look_around
  end
end
