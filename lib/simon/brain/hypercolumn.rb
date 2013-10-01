module Simon::Brain
  class Hypercolumn

    attr_accessor :neurons
    def initialize(neurons)
      @neurons = neurons || []
    end

    def excite
      neurons.each do |neuron|
        neuron.excite
      end
    end

    def suppress
      neurons.each do |neuron|
        neuron.suppress
      end
    end

    def measure
      total = 0.0
      neurons.each do |neuron|
        total += neuron.value
      end
      total / neurons.count.to_f
    end
  end
end