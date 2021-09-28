require 'json'
require_relative 'department'
require 'tty-prompt'

class VinylDepartment < Department
    
    def initialize
    file = File.read('vinyl.json')
    @stock = JSON.parse(file)
    @prompt = TTY::Prompt.new
    end

    def display_menu
        for album in @stock
            # prints all values with key album in array of hashes
            puts album["Album"] 
        end
        input = @prompt.select("You dig and dig through hundreds of records before snapping back into reality. Let's filter it down a little bit")  do |menu|
        menu.choice "By Genre".light_magenta, 1
        menu.choice "By Artist".blue, 2
        menu.choice "View cart".light_green
        menu.choice "< - Go Back".yellow, 3
        end
        filter_products(input)

        # not working yet, TBC
        def filter_products(filter_choice)
            case filter_choice
            when 1
                puts "what genre are you looking for?"
                genre = gets.downcase
                for album in @stock
                    if album["Genre"] == "Rock"
                        puts album["Album"]
                    end
                end
                
            end
        end
        
        
    end

end

