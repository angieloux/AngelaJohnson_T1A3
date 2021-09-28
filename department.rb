# require_relative 'vinyl_department'

class Department 
    #all Departments will have this data. 
    attr_reader :stock
    attr_accessor :cart

    def initialize 
        @stock = stock
    end

    def display_menu
        # visitors will have to filter their search specifically in each department (i.e. VinylDepartment will be by Genre/Artist, GamesDepartment will be by Console/Title etc)
        raise "The department should have this method"
    end

    def display_cart
        puts @cart
    end

    def add_items_to_cart
        add_more = true
            while add_more
                add_more = @prompt.yes?("Should you put something in your cart?")
                    if !add_more
                        system 'clear'
                        break
                    end
                puts "Type a catalogue number to add the item to your cart."
                product_selection = gets.chomp
                for item in @stock
                    if item["Catno"] == product_selection
                    @cart << item
                    end
            end
                if product_selection.to_i > 498
                    puts "Errr that must have been wrong, let's try that again."
                end
            end
            display_menu
        end
          # gets = @cat_no
          # add_items_to_cart(cat_no)
        
    

    def pay_for_item
    end


end

