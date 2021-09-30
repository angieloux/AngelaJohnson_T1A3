require "json"
require_relative "department"
require "tty-prompt"

class VinylDepartment < Department
  attr_reader :record
  
  def initialize
    super 
    file = File.read("vinyl.json")
    @stock = JSON.parse(file)
    @record = record
  end

  def display_records_in_cart
    for vinyl in @@cart 
        puts "#{vinyl["Catno"]}: ".magenta + "#{vinyl["Artist"]} - #{vinyl["Album"]} (#{vinyl["Year"]}) " + "$#{vinyl["Price"]}".yellow
    end
  end

  def display_filtered_records
    puts "CATALOGUE #: #{@record["Catno"]}\n" +
    "ALBUM: #{@record["Album"]}\n" +
    "ARTIST: #{@record["Artist"]}\n" +
    "YEAR: #{@record["Year"]}\n" +
    "GENRE: #{@record["Genre"]}\n" +
    "SUBGENRE: #{@record["Subgenre"]}\n" +
    "PRICE $#{@record["Price"]}\n" +
    "=========================="
  end

  def filter_records(filter_choice)
    system("clear")
    case filter_choice
    # BY GENRE **********
    when 1
      puts "What genre are you looking for?"
      genre = gets.split.map(&:capitalize).join(' ').chomp # match the data to the format of the json
      system 'clear'
      for @record in @stock
        if @record["Genre"] == genre || @record["Subgenre"].include?(genre)
          display_filtered_records
        end
      end
      add_items_to_cart
        
          
    # BY ARTIST **********
    when 2
      puts "What artist are you looking for?"
      artist = gets.split.map(&:capitalize).join(' ').chomp # match the data to the format of the json
      system 'clear'
      p artist
      for @record in @stock
        if @record["Artist"].include?(artist)
            display_filtered_records
        end
        
      end
      add_items_to_cart

    # BY ALBUM **********
    when 3
      puts "What album are you looking for? (keywords are ok!)"
      title = gets.split.map(&:capitalize).join(' ').chomp # match the data to the format of the json
      system 'clear'
      for @record in @stock
        if @record["Album"].include?(title)
          display_filtered_records
        end
      end
      add_items_to_cart

    # BY PRICE **********
    when 4
      puts "Whats the max you're willing to pay for a record?"
      price = gets.to_i
      system 'clear'
      for @record in @stock
        if @record["Price"] <= price
            display_filtered_records
        end
      end
      add_items_to_cart

    # VIEW CART ***********
    when 5
      display_cart
      display_menu

    # LOOK AROUND THE STORE **********
    when 6
      look_around
    end
  end

  def display_menu
    input = @prompt.select("There are literally hundreds of records staring at you in the face. You ponder what to do:".red) do |menu|
      menu.choice "Look for a specific GENRE", 1
      menu.choice "Look for a specific ARTIST", 2
      menu.choice "Look for a specific ALBUM", 3
      menu.choice "Look for a specific PRICE", 4
      menu.choice "View your cart", 5
      menu.choice "Go back", 6
    end
    filter_records(input)

  end
end
