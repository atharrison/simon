module Simon::Brain
  class Neocortex

    attr_accessor :seed, :hypercolumns

    def initialize(seed, hypercolumns = [])
      @seed = seed
      @hypercolumns = hypercolumns || []
    end


    def to_s
      puts "Brain (#{seed})"
      puts "\tContains a Neocortex"
      puts "\t\tContains #{hypercolumns.count} Hypercolumns"
      hypercolumns.each_with_index do |hc, i|
        puts "\t\t\tHC#{i}: #{hc.measure}"
      end
    end
  end
end
