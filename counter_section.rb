require "json"
require_relative "store"
require "tty-prompt"

class CounterSection < Store
  
  def get_rejected
    
    excuses = ["Oh, sorry. My sister's friend's fish died, and yes, it was tragic.", "That sounds really fun! But sorry, I'm going to be busy not doing that.", "Oh what a shame, I actually have plans to teach my ferret to yodel. Some other time maybe (not)?","The voices in my head are telling me to say no. Sorry!"]
    puts puts "ಠ_ಠ\n" + "\n#{excuses.sample.light_magenta}"
    counter_interaction
  end

  def order_summary(total)
    total_cost_of_cart
    headings = ["Catno", "Album", "Artist", "Year", "Price"]
    rows = []
    @@cart.each do |hash|
      rows << ["#{hash["Catno"]}", "#{hash["Album"]}", "#{hash["Artist"]}", "#{hash["Year"]}", "$#{hash["Price"]}"]
      end
    
      tax_invoice = Terminal::Table.new :title => "AJ's Records: Purchase Summary", :headings => headings, :rows => rows, :style => {:all_separators => true}
    puts "#{tax_invoice} \n"
    
    pay = @prompt.yes?("Your total comes to $#{@@cart_total}, please! Did you want to go ahead and pay?".light_magenta)
      if !pay 
        system 'clear' 
        puts "No worries, come back once you're ready! (Please don't leave the store without paying...)"
        look_around
      else 
        system 'clear'
      end
  end

  def counter_interaction
      counter_decision = @prompt.select("How can I help?\n".light_magenta) do |menu|
      menu.choice "I'd like to pay for these", 1
      menu.choice "Errr actually, on second thought. I might have a second look around.", 2
      menu.choice "You know what, I changed my mind & I'm just gonna head out. I'm also the worst, so can you put everything back for me?", 3
      menu.choice "Actually... I wanted to see if you were busy later....want to grab a drink?", 4
    end
    system "clear"

    case counter_decision 
    when 1
      if @@cart.empty? 
        puts "(╭ರ_•́)"
        puts "[The girl gives you a very weird stare..]\n"
        puts "\nUmmm.. you realise don't... have..anything yet?? Go check out our vinyl! We've got loads of cool albums in stock.\nJust come back when you're done. I'd give you a hand but I'm not a very good employee. Soz!\n".light_magenta
        look_around
      else 
        puts "Awesome! I'll just tally that up for you...".light_magenta
        order_summary(@@cart_total.to_i)
        puts "You grimace at the total, and hand over your well-worn credit card.\n".yellow 
        progressbar = ProgressBar.create
        10.times { progressbar.increment; sleep 0.1 }
        puts "Thanks for shopping at AJ records! Come back anytime.".light_magenta
      end
    when 2
      system 'clear'
      puts "d(^o^)b¸¸♬\n"
      puts "No worries! Come over here when you're ready.".light_magenta
      look_around
    when 3
      puts "[You swear you see the sides of her previously shining smile crinkle ever so slightly...]\n"
      puts "\nNo worries at all! I love my job! I'm so happy! Everything is JUST. FINE. Have a great day!\n".light_magenta
      puts "(╯°□°）╯︵ ┻━┻\n"
      exit
    when 4
      get_rejected
    end
  end

  def go_to_counter 
    puts "******************************"
    puts ["[An all too bubbly 5ft 4 blonde girl greets you with a massive smile.]\n", "[The blonde at the counter's gaze is fixed on the group of rebellious looking youths poking around the store. After a moment she notices you are there]\n", "[The small blonde girl is humming along to the Beatles song that's playing over the speakers]\n"].sample
    counter_interaction
  end
  
end
