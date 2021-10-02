require "terminal-table"
require 'json'

module Cart
    
        @headings = []
        @@cart = [] 
        @@cart_total = 0

    def display_cart
        if @@cart.empty? 
            puts "What a sad little empty cart. :(".red
            look_around
        else 
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
                system 'clear'
                look_around
            end
    end

    def add_items_to_cart
        puts "Typing the record's " + "CATALOGUE # ".light_magenta + "should do it."
        done = false
        while !done    
            product_selection = gets.chomp
            unless (1...498).include?(product_selection.to_i)
                puts "[Invalid cat number, let's try that again.]".italic
                puts "HINT: Catalogue numbers are between 1 & 498\n".yellow
                next
            end
            for item in STOCK
                if item["Catno"] == product_selection
                @@cart << item
                puts "[You stash #{item["Artist"]}'s - #{item["Album"]} in your cart.]\n".blue.italic
                end
            end
                if PROMPT.yes?("Anything else?".green) == false 
                    done = true 
                    system 'clear'
                end
        end
        display_menu
    end
    
    def remove_items_from_cart
        finished = false
        puts "[Type the ".italic + "catalogue number ".magenta.italic + "to remove the item from your cart.]".italic
        while !finished
                product_selection = gets.chomp
                if item = @@cart.detect{|item| item["Catno"] == product_selection} 
                    @@cart.delete(item)
                    system 'clear'
                    puts "[You put #{item["Artist"]}'s - #{item["Album"]} back on the shelf.]".blue.italic
                else 
                    system 'clear'
                    puts "INVALID CAT NO\n".red + "Hmm... my eyeballs must be playing up. Let me peak at those catalogue numbers again. They're probably the ones written in " + "purple..".magenta
                    puts
                end
                display_cart
        end
        system 'clear'
        display_menu
    end
    def total_cost_of_cart
        @@cart_total = @@cart.sum{|item| item["Price"]}.round(2)
    end


end

