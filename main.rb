# require relative files:
  # require_relative "store1"
  
  # require_relative "toys1"
  # require_relative "vinyl1"
  # require_relative "visitor1"
  # require_relative "games1"

  # require_relative "store1"

  require 'colorize'
  require 'tty-prompt'
  require 'ruby-progressbar'
  require 'artii'
  require_relative "department"
  require_relative "vinyl"
  store = Department.new
  

  store_name = Artii::Base.new
  @prompt = TTY::Prompt.new
  puts store_name.asciify('Rockaway Records!')
  puts "You arrive at a swanky looking retro record store. " +
  "The aisles are lined with hundreds of records, CDs, games, comic books.... " +
  "the walls are covered in posters and memorabilia, there are a million pop vinyl and other toys staring directly at you. " +
  "Oh my god is that Baby Yoda? You're so overstimulated your eyeballs almost explode. \n"
  
  
  def walk(department)
    system 'clear'
    # display a progress bar while the visitor *walks* over to the department
    puts "\n・・・～～～～～ᕕ( ᐛ )ᕗ #{department} here I come!" # imitate the visitor walking
    progressbar = ProgressBar.create
    10.times { progressbar.increment; sleep 0.20}
  end

  def choose_department(choice)
    case choice
        when 1
            department = "Vinyl"
            vinyl ||= Vinyl.new
        when 2 
            department = "Listening Station"
            listening_station ||= ListeningStation.new
        when 3
            department = "Games"
            games ||= Games.new
        when 4
            department = "Toys"
            vinyl ||= Vinyl.new
        when 5
            department = "Counter"
            vinyl ||= Vinyl.new
        when 6
            exit
        end 
        walk(department)
end

  def look_around
    input = @prompt.select('Where do you want to go?') do |menu|
    menu.choice "Cruise over to the " + "VINYL".light_magenta, 1
    menu.choice "Have a boogie over at the " + "LISTENING STATION".blue, 2
    menu.choice "Check out the " + "GAMES".light_green, 3
    menu.choice "Spend too much money on " + "memorabilia & TOYS!".yellow, 4
    menu.choice "Head over to the " + "COUNTER".red, 5
    menu.choice "Turn around and leave, I'm scared".magenta, 6
    end
    choose_department(input)
end

  answer = @prompt.yes?("Do you want to go in?")
      if !answer 
          system 'clear'
          puts "You realise you have absolutely no understanding of how to talk to humans anymore since COVID. You turn around and leave."
          exit
      else
        look_around
      end    
  
    


      

    

      

    






  



 