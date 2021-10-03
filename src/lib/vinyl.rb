module VinylSection
  include Cart

  def decide_whether_to_add_to_cart
    if PROMPT.yes?("Should I add anything?".green)
      add_items_to_cart
    else
      system "clear"
      display_menu
    end
  end

  def display_filtered_records(record)
    puts "CATALOGUE #: #{record["Catno"]}\n" +
           "ALBUM: #{record["Album"]}\n" +
           "ARTIST: #{record["Artist"]}\n" +
           "YEAR: #{record["Year"]}\n" +
           "GENRE: #{record["Genre"]}\n" +
           "SUBGENRE: #{record["Subgenre"]}\n" +
           "PRICE $#{record["Price"]}\n" +
           "=========================="
  end

  def search_by_keyword(tag, tag_2 = nil) # Set tag_2 to nil for Artist and Album searches.
    found = false
    while !found # Loop the sequence until a record is found matching the user's criteria
      puts "What #{tag.downcase} are you looking for?"
      # Match the input to the same format of the json so it can be compared
      keyword = gets.split.map(&:capitalize).join(" ").chomp
      system "clear"
      # If user hits enter, display an error that tells them what is wrong
      # The program will skip to next iteration so they can try again.
      if keyword == ""
        puts "[No results. Woops, guess I should actually search for something..]".italic.red
        next
      end

      # Loop through each record (hash) in STOCK (array)
      for record in STOCK
        # When searching by Genre, BOTH Genre (tag) and Subgenre (tag_2) keys in the array will be searched for matches.
        # When searching by Artist or Album, tag_2 = nil and only their respective keys will be searched for matches.
        if (tag_2 == nil && (record[tag] == keyword || record[tag].include?(keyword))) || (tag_2 != nil && record[tag_2].include?(keyword))
          # Print each matching record out on screen according to the format of display_filtered_records(record)
          display_filtered_records(record)
          found = true  # Change found to true, so the loop ends.
        end
      end
      # If nothing has been found, the program helps the user by presenting an error and some hints about what to search.
      if !found
        puts "[No results found... maybe I should try and simplify my search?)]\n".italic.magenta + "HINT: 'beach' will return The Beach Boys\n'rock' will return Psychedelic Rock, Hard Rock, Rockabilly etc,\n'bob' will return Bob Dylan, Bob Marley etc."
        display_menu # Allow them to search by something else.
      else
        decide_whether_to_add_to_cart
      end
    end
  end

  def search_by_price
    found = false
    while !found # Loop the sequence until a record is found matching the user's criteria
      puts "Whats the max you're willing to pay for a record?"
      price = gets.to_i #
      system "clear"
      # There are no records < $40 in stock. So, if user input a value < 40, the program will
      # print an error & helper message to inform them of how to rectify it on the next loop iteration.
      if (..40).include?(price)
        puts "[What was I thinking, I haven't seen a single record here for less than ".italic + "40 bucks.\n".magenta.italic + "Guess I've gotta stretch the purse strings... :'( ]".italic
        # Go to next iteration, try input again.
      end
      # Loop through each record (hash) in STOCK (array)
      for record in STOCK
        if record["Price"] <= price
          # Print each record to the screen in the format of display_filtered_records(record)
          display_filtered_records(record)
          # Change to found so loop ends once all matching records have been printed.
          found = true
        end
      end
    end
    decide_whether_to_add_to_cart
  end

  # enact consequences of users choice in display_menu
  def filter_records(filter_choice)
    system("clear")
    case filter_choice
    when 1
      search_by_keyword("Genre", "Subgenre")
    when 2
      search_by_keyword("Artist")
    when 3
      search_by_keyword("Album")
    when 4
      search_by_price
    when 5
      #if user changes their mind, go back to the main store navigation menu
      look_around
    end
  end

  # display a menu of filter options to the user
  def display_menu
    input = PROMPT.select("There are literally hundreds of records staring at you in the face. You ponder what to do:".light_cyan) do |menu|
      menu.choice "Look for a specific GENRE", 1
      menu.choice "Look for a specific ARTIST", 2
      menu.choice "Look for a specific ALBUM", 3
      menu.choice "Search by maximum PRICE", 4
      menu.choice "Go back", 5
    end
    filter_records(input)
  end
end
