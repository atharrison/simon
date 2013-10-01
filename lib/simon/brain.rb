module Simon
  module Brain
    def self.create(seed = 0)

      seed
      @prng = Random.new(seed)

      neuron_collection = []
      synapse_collection = []
      hypercolumn_count = @prng.rand(8) + 2
      hypercolumns = []
      hypercolumn_count.times do
        neuron_count = @prng.rand(100) + 5
        neurons = []
        neuron_count.times do
          synapse = Synapse.new
          neuron = Neuron.new(synapse, @prng.rand)
          neurons << neuron
          neuron_collection << neuron
          synapse_collection << synapse
        end
        hypercolumns << Hypercolumn.new(neurons)
      end

      Neocortex.new(seed, hypercolumns)
    end
  end
end
