class Magneto
  include Mongoid::Document
  include Mongoid::Timestamps

  field :dna, type: Array
  field :is_mutant, type: Boolean


  def self.verify_dna!(dna)
    mutant = Mutant.new 
    magneto = Magneto.new
    magneto.dna = dna
    mutant.isMutantOptimized(dna)
    if mutant.errors.empty?
      magneto.is_mutant = mutant.is_mutant?
      magneto.save
    end
    return magneto
  end

  def self.ratio
    total = self.count
    mutant = self.where(mutant: true).count
    human = total - mutant
    return {count_mutant_dna: mutant, count_human_dna: human ,ratio: (mutant/total.to_f).round(2)}
  end

end
