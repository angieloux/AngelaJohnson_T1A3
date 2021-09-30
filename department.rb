require "terminal-table"

class Department 
    #all Departments will have this data. 
    attr_reader :stock, :total
    attr_accessor :cart

    def initialize 
        @stock = stock
        @headings = []
        @cart = [] 
        @prompt = TTY::Prompt.new
        @total = total 
    end

    def display_menu
        # visitors will have to filter their search specifically in each department (i.e. VinylDepartment will be by Genre/Artist, GamesDepartment will be by Console/Title etc)
        raise "The department should have this method"
    end

    def display_cart
        puts "You look in your cart..." 
        display_records_in_cart
        # puts @cart
        # rows = []
        # @total = @products.sum{|item| item["Price"]}
        # headings = ["Catno", "Album", "Artist", "Year", "Price", "Console"]
        # # puts @cart
        # @stock.each do |i|
        #     rows << ["#{i["Catno"]}", "#{i["Album"]}", "#{i["Artist"]}", "#{i["Year"]}", "$#{i["Price"]}"]
        # end
        
        # table = Terminal::Table.new :title => "Example", :headings => headings, :rows => rows, :style => {:all_separators => true}
        # puts "#{table} \n"
        if @prompt.yes?("Want to remove anything?")
            remove_items_from_cart
        else 
            system 'clear'
            display_menu
        end

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
                    p @cart
                    # table = TTY:Table.new(@cart)
                    # renderer = TTY::Table::Renderer::Unicode.new(table)
                    # renderer.render
                    end
            end
                if product_selection.to_i > 498
                    puts "Errr that must have been wrong, let's try that again."
                end
            end
            display_menu
    end
    
    def remove_items_from_cart
        finished = false
        puts "Type the " + "catalogue number ".magenta + "to remove the item from your cart."
        while !finished
                product_selection = gets.chomp
                if item = @cart.detect{|item| item["Catno"] == product_selection} 
                    @cart.delete(item)
                    puts "With a small tear falling down your cheek, you realise you are a broke student and you can't afford the nice things in life. You sadly put #{item["Artist"]}'s - #{item["Album"]} back on the shelf."
                else 
                    system 'clear'
                    puts "INVALID CAT NO\n".red + "Hmm... my eyeballs must be playing up. Let me peak at those catalogue numbers again:\n\n"
                    display_cart
                end
                finished = @prompt.yes?('Done?')
        end
        system 'clear'
        display_menu
    end

    def pay_for_item
    end

    # def look_around
    #     puts "HELLO!"
    # end



  


end

