require "json"
require "tty-prompt"


module Counter
  include Cart 
  
  def get_rejected
    
    excuses = ["Oh, sorry. My sister's friend's fish died, and yes, it was tragic.", "That sounds really fun! But sorry, I'm going to be busy not doing that.", "Oh what a shame, I actually have plans to teach my ferret to yodel. Some other time maybe (not)?","The voices in my head are telling me to say no. Sorry!"]
    puts puts "ಠ_ಠ #{excuses.sample}".light_blue
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
    
    pay = PROMPT.yes?("Your total comes to $#{@@cart_total}, please! Did you want to go ahead and pay?".yellow)
      if !pay 
        system 'clear' 
        puts "No worries, come back once you're ready! (Please don't leave the store without paying...)".yellow
        look_around
      else 
        system 'clear'
      end
  end
  


  def counter_interaction
      counter_decision = PROMPT.select("How can I help?\n".yellow) do |menu|
      menu.choice "I'd like to pay for these", 1
      menu.choice "Errr actually, on second thought. I might have a second look around.", 2
      if @@cart.empty? == true 
        menu.choice "I changed my mind and I'm just gonna head out.", 3
      else 
        menu.choice "I changed my mind, and I'm going to head out. Can I just leave all these records with you?", 4
      end 
      menu.choice "Actually... I wanted to see if you were busy later....want to grab a drink?", 5
    end
    system "clear"

    case counter_decision 
    when 1
      if @@cart.empty? 
        puts "(╭ರ_•́) [The girl gives you a very weird stare..]\n".italic
        puts "Ummm..you realise don't...have...anything yet?? Go check out our vinyl! \nJust come back when you're done. I'd give you a hand but I'm not a very good employee. Soz!\n".yellow
        look_around
      else 
        puts "Awesome! I'll just tally that up for you...".yellow
        order_summary(@@cart_total)
        puts "[You grimace at the total, and hand over your well-worn credit card]\n".italic.light_blue
        progressbar = ProgressBar.create
        10.times { progressbar.increment; sleep 0.1 }
        puts "\nd(^o^)b¸¸♬ Thanks for shopping at AJ's Records! Come back anytime.".yellow
        exit
      end
    when 2
      system 'clear'
      puts "d(^o^)b¸¸♬\n"
      puts "No worries! Come over here when you're ready.".yellow
      look_around
    when 3
        system 'clear'
        puts "d(^o^)b¸¸♬\n"
        puts "All right, see ya!".yellow
        exit
    when 4
        puts "Of coooooourse. Nothing I would enjoy more. So wonderful. I love my job. I love sorting. EVERYTHING. IS. GREAT.\n (╯°□°）╯︵ ┻━┻\n".yellow
        puts "[...You back away slowly and exit the store]\n".italic
        exit
    when 5
      get_rejected
    
  end

end
  def go_to_counter 
    puts ["[An all too bubbly 5ft 4 blonde girl greets you with a massive smile.]\n".italic, "[The blonde's gaze at the counter is fixated on group of rebellious looking youths poking around the store. After a moment she notices you are there.]\n".italic, "[The small blonde girl is humming along to the Beatles song that's playing over the speakers]\n".italic].sample
    counter_interaction
  end
  
end
