FactoryBot.define do
  factory :magneto do
    trait :human do
      is_mutant false
      dna ["adrax","asdds","avfrt","aadaa","aantr"]
    end

    trait :mutant do
      is_mutant true
      dna ["aaaaa","aaaaa","aaaaa","aaaaa","aaaaa"]
    end
  end
end
