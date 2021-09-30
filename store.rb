require "terminal-table"
# require_relative "vinyl_section"

class Store 
    #all Departments will have this data. 
    attr_reader :stock
    attr_accessor :cart, :cart_total

    def initialize 
        @stock = stock
        @headings = []
        @prompt = TTY::Prompt.new
        @@cart = [] 
        @@cart_total = cart_total
    end

    # def display_menu
    #     # visitors will have to filter their search specifically in each department (i.e. VinylDepartment will be by Genre/Artist, GamesDepartment will be by Console/Title etc)
    #     raise "The department should have this method"
    # end

    def display_cart
        if @@cart.empty? 
            puts "You dope. You don't have anything yet.... ".red
            look_around
        else 
            system 'clear'
            puts "***************************************\n"
            for vinyl in @@cart 
              puts "#{vinyl["Catno"]}: ".magenta + "#{vinyl["Artist"]} - #{vinyl["Album"]} (#{vinyl["Year"]}) " + "$#{vinyl["Price"]}".yellow
            end
            puts "***************************************\n"
          end
        # display_records_in_cart
        remove = @prompt.yes?("Records...nom nom nom. Do I need to change anything?".green)
            if remove 
                remove_items_from_cart
            else 
                system 'clear'
                look_around
            end
    end

    def add_items_to_cart
        add_more = true
            while add_more
                add_more = @prompt.yes?("Should I add anything?".green)
                    if !add_more
                        system 'clear'
                        break
                    end
                puts "Typing the record's " + "CATALOGUE # ".light_magenta + "should do it."
                product_selection = gets.chomp
                for item in @stock
                    if item["Catno"] == product_selection
                    @@cart << item
                    puts "[You stash #{item["Artist"]}'s - #{item["Album"]} in your cart.]\n".blue
                    end
            end
                if product_selection.to_i > 498
                    puts "Errr that catalogue number must have been wrong, let's try that again."
                end
            end
            display_menu
    end
    
    def remove_items_from_cart
        finished = false
        puts "Type the " + "catalogue number ".magenta + "to remove the item from your cart."
        while !finished
                product_selection = gets.chomp
                if item = @@cart.detect{|item| item["Catno"] == product_selection} 
                    @@cart.delete(item)
                    system 'clear'
                    puts "[You put #{item["Artist"]}'s - #{item["Album"]} back on the shelf.]\n".green
                else 
                    system 'clear'
                    puts "INVALID CAT NO\n".red + "Hmm... my eyeballs must be playing up. Let me peak at those catalogue numbers again. They're probably the ones written in " + "purple..\n".light_magenta
                    puts
                    display_cart
                end
                finished = @prompt.yes?('Should I remove anything else?')
        end
        system 'clear'
        display_menu
    end
    def total_cost_of_cart
        @@cart_total = @@cart.sum{|item| item["Price"]}
    end


end

