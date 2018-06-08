require 'rails_helper'

RSpec.describe Magneto, type: :model do

  it "is mutant" do
    assert_equal(true,  Magneto.verify_dna!(["aaaaa","ccaaa","cdaav","ccaaq","ccaaa"]).is_mutant?)
    assert_equal(true,  Magneto.verify_dna!(["taaaa","tcaaa","tdaav","tcaaq","tcaaa"]).is_mutant?)
    assert_equal(true,  Magneto.verify_dna!(["aaaaa","aaaaa","aaaaa","aaaaa","aaaaa"]).is_mutant?)
    assert_equal(true,  Magneto.verify_dna!(["aaaaa","asdds","aaaaa","aaaaa","aaaaa"]).is_mutant?)
    assert_equal(true,  Magneto.verify_dna!(["aaaaa","asdds","aaaaa","aadaa","aaaaa"]).is_mutant?)
    assert_equal(true,  Magneto.verify_dna!(["aaaaa","asdds","aaaaa","aaaaa","aaaaa"]).is_mutant?)
  end
 
  it "is not mutant" do
    assert_equal(false, Magneto.verify_dna!(["adrax","asdds","avfrt","aadaa","aantr"]).is_mutant?)
  end

  it "ratio is 0.33" do
    create :magneto, :human
    create :magneto, :human
    create :magneto, :mutant
    assert_equal( 0.33, Magneto.ratio[:ratio])
  end
end
