require 'json'
require_relative 'department'

class Vinyl < Department
    def initialize
        file = File.read('vinyl.json')
        
    end
end

