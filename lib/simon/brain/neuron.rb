module Simon::Brain
  class Neuron

    attr_accessor :synapse, :value, :network
    def initialize(synapse, value)
      @synapse = synapse
      @value = value
    end

    def excite(amount = Simon:: DEFAULT_EXCITE_DELTA)
      @value += amount
      @synapse.trigger unless @synapse.nil? || @value < Simon::DEFAULT_TRIGGER_THRESHOLD
    end

    def suppress(amount = Simon::DEFAULT_SUPPRESS_DELTA)
      @value -= amount
      @synapse.suppress unless @synapse.nil? || @value > Simon::DEFAULT_TRIGGER_THRESHOLD
    end
  end
end
