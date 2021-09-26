require 'colorize'
require 'tty-prompt'
require 'ruby-progressbar'

class Store 
    attr_reader :prompt
    def initialize
        @prompt = TTY::Prompt.new     # use with prompt.ask? or prompt.select? or prompt.mask? or prompt.yes?
        puts "You arrive at a swanky looking retro record store. " +
        "The aisles are lined with hundreds of records, CDs, games, comic books.... " +
        "the walls are covered in posters and memorabilia, there are a million pop vinyl and other toys staring straight at you " +
        "Oh my god is that Baby Yoda? You're so overstimulated your eyeballs almost explode. "
    end

    def decide_where_to_go
        input = @prompt.select('What do you do first?') do |menu|
            menu.choice "Cruise over to the " + "VINYL".light_magenta, 1
            menu.choice "Have a boogie over at the " + "LISTENING STATION".blue, 2
            menu.choice "Check out the " + "GAMES".light_green, 3
            menu.choice "Spend too much money on " + "memorabilia & TOYS!".yellow, 4
            menu.choice "Head over to the " + "COUNTER".red, 5
            menu.choice "Turn around and leave, I'm scared".magenta, 6
        end
        progressbar = ProgressBar.create
        50.times { progressbar.increment; sleep 0.01 }
        visit_department(input)
    end
        # menu_selector(input)
        # puts "---" * 30
    def visit_department(input)
        system 'clear'
        case input 
        when 1
            print "VINYL"
        when 2
            print "LISTENING STATION"
        when 3
            print "GAMES"
        when 4
            print "MEM"
        when 5
            print "COUNTER"
        when 6
            exit
        end
    end

end

rockaway = Store.new
rockaway.decide_where_to_go


# class Vinyl
# end

# class Games
# end
