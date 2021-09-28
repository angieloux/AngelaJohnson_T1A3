require "json"
require_relative "department"
require "tty-prompt"
require "tabulo"

class VinylDepartment < Department
  def initialize
    file = File.read("vinyl.json")
    @stock = JSON.parse(file)
    @prompt = TTY::Prompt.new
    @cat_no = 0
  end

  def display_records
    @cat_no += 1
    puts "Catalogue number: #{@cat_no}\n" +
           "ALBUM: #{@record["Album"]}\n" +
           "ARTIST: #{@record["Artist"]}\n" +
           "YEAR: #{@record["Year"]}\n" +
           "PRICE $#{@record["Price"]}\n" +
           "=========================="
  end

  def filter_products(filter_choice)
    system "clear"
    case filter_choice
    when 1
      puts "What genre are you looking for?"
      genre = gets.capitalize.chomp
      for @record in @stock
        if @record["Genre"] == genre || @record["Subgenre"].include?(genre)
          display_records
        end
      end
    when 2
      puts "What artist are you looking for?"
      artist = gets.capitalize.chomp
      for @record in @stock
        if @record["Artist"].include?(artist)
            display_records
        end
      end
    when 3
      puts "What album are you looking for? (keywords are ok!)"
      title = gets.capitalize.chomp
      for @record in @stock
        if @record["Album"].include?(title)
            display_records
        else
          puts "Seems like there's nothing by that name. I guess I can try again"
        end
      end
    when 4
      puts "Whats the max you're willing to pay for a record?"
      price = gets.to_i
      for @record in @stock
        if @record["Price"] <= price
            display_records
        end
      end
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
    filter_products(input)
    # for album in @stock
    #     # prints all values with key album in array of hashes
    #     puts album["Album"]
    # end

  end
end
