require "json"
require_relative "department"
require "tty-prompt"
# require 'activesupport'

class CounterDepartment < Department
  # attr_reader :record
  def initialize
    # file = File.read("vinyl.json")
    # @stock = JSON.parse(file)
    @prompt = TTY::Prompt.new
    # @record = record

  end
  #   # VIEW CART ***********
  #   when 5
  #     display_cart
  #     display_menu

  #   # LOOK AROUND THE STORE **********
  #   when 6
  #     look_around
  #   end
  # end

  def get_rejected
  excuses = ["Oh, sorry. My sister's friend's fish died, and yes, it was tragic.", "That sounds really fun! But sorry, I'm going to be busy not doing that.", "Oh what a shame, I actually have plans to teach my ferret to yodel. Some other time maybe (not)?","The voices in my head are telling me to say no. Sorry!"]
  puts excuses.sample.light_magenta
  counter_interaction
  
  end

  def order_summary
  end

  def counter_interaction
      counter_decision = @prompt.select("How can I help?\n".light_magenta) do |menu|
      menu.choice "I'd like to pay for these", 1
      menu.choice "Errr actually, on second thought. I might have a second look around.", 2
      menu.choice "You know what, I changed my mind on all these items, and I'm the worst, so can you put everything back for me.", 3
      menu.choice "Actually... I wanted to see if you were busy later....want to grab a drink?", 4
    end
    system "clear"

    case counter_decision 
    when 1
      puts "Awesome! I'll just tally that up for you...".light_magenta
      order_summary
      puts "Your total comes to " + "$#{@total}. ".red + "How would you like to pay?\n".light_magenta
    when 2
      puts "No worries! Come over here when you're ready.".light_magenta
      look_around
    when 3
      puts "You swear you see the sides of her previously shining smile crinkle ever so slightly...\n"
      puts "No worries at all! I love my job! I'm so happy! Everything is JUST. FINE. Have a great day!".light_magenta
      exit
    when 4
      get_rejected
    end
  end
  def go_to_counter 
    puts "An all too bubbly 5ft 4 blonde girl greets you with a massive smile."
    counter_interaction
  end
 
  #   filter_records(input)

  # end
end
