class Computer_Player
    attr_reader :mark
    def initialize(val)
        @mark = val
    end

    def get_position(legal_positions)
        pos = legal_positions.sample
        puts "Computer Player #{mark.to_s}, has selected #{pos}"
        pos
    end
end