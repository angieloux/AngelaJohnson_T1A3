class Department 
    #all Departments will have this data. 
    attr_reader :stock

    def initialize 
        @stock = stock
    end

    def display_menu
        # visitors will have to filter their search specifically in each department (i.e. VinylDepartment will be by Genre/Artist, GamesDepartment will be by Console/Title etc)
        raise "The department should have this method"
    end

    def display_cart
    end

    def add_item_to_cart
    end

    def pay_for_item
    end
end

