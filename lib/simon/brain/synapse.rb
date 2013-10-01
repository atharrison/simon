module Simon::Brain
  class Synapse

    attr_accessor :signal_strength, :output_neurons

    def initialize(signal_strength = Simon::DEFAULT_SIGNAL_STRENGTH, output_neurons = [])
      @signal_strength = signal_strength
      @output_neurons = output_neurons
    end

    def trigger
      output_neurons.each do |neuron|
        neuron.excite(signal_strength)
      end
      excite

    end

    def excite(amount = Simon::DEFAULT_EXCITE_DELTA)
      @signal_strength += amount
    end

    def suppress(amount = Simon::DEFAULT_SUPPRESS_DELTA)
      @signal_strength -= amount
    end
  end
end
