module Cart
  @@cart = []
  @@cart_total = 0

  def display_cart
    # If the cart is empty, display a message and return the user to the menu
    if @@cart.empty?
      puts "What a sad little empty cart. :(".light_red
      look_around
    else # Display all items in cart according to this aesthetic
      puts "***************************************\n"
      for vinyl in @@cart
        puts "#{vinyl["Catno"]}: ".magenta + "#{vinyl["Artist"]} - #{vinyl["Album"]} (#{vinyl["Year"]}) " + "$#{vinyl["Price"]}".yellow
      end
      puts "***************************************\n"
    end
    remove = PROMPT.yes?("Should I put anything back?".green)
    if remove
      remove_items_from_cart
    else
      system "clear"
      look_around
    end
  end

  def add_items_to_cart
    puts "Typing the record's " + "CATALOGUE # ".light_magenta + "should do it."
    done = false
    while !done # Loop until user does not want to add any more items to cart
      product_selection = gets.chomp
      # Catalogue numbers are between 1 and 498. If the user inputs something outside of that range,
      # Display an error and a hint message so they can get the input correct on the next iteration.
      unless (1..498).include?(product_selection.to_i)
        puts "[Invalid cat number, let's try that again.]".italic
        puts "HINT: Catalogue numbers are between 1 & 498\n".yellow
        next # Skip to next iteration
      end
      # Search through all records in STOCK to get the details of the record with the catalogue number typed by the user.
      for item in STOCK
        if item["Catno"] == product_selection
          @@cart << item # Add it to the user's cart & let them know what they added.
          puts "[You stash #{item["Artist"]}'s - #{item["Album"]} in your cart.]\n".light_blue.italic
        end
      end
      if PROMPT.yes?("Anything else?".green) == false # Continue the loop.
        done = true # Loop will end.
        system "clear"
      end
    end
    display_menu
  end

  def remove_items_from_cart
    finished = false
    puts "[Type the ".italic + "catalogue number ".magenta.italic + "to remove the item from your cart.]".italic
    while !finished # Loop until a valid input matching a catalogue number in cart has been entered.
      product_selection = gets.chomp
      # If the input is equal to a catalogue number that is in the cart, delete it.
      if item = @@cart.detect { |item| item["Catno"] == product_selection }
        @@cart.delete(item)
        system "clear"
        puts "[You put #{item["Artist"]}'s - #{item["Album"]} back on the shelf.]".light_blue.italic
      else
        # Display an error to the user, letting them know their input was invalid. Prints a hint about where to find catalogue numbers by referring to their colour on screen. The hint is also highlighted in the same colour.
        system "clear"
        puts "INVALID CAT NO\n".red + "Hmm... my eyeballs must be playing up. Let me peak at those catalogue numbers again. They're probably the ones written in " + "magenta..".magenta
        puts
      end
      display_cart
    end
    system "clear"
    display_menu
  end

  def total_cost_of_cart
    @@cart_total = @@cart.sum { |item| item["Price"] }.round(2) # Round cart total to 2 decimal places
  end
end
