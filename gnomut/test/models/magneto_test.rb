require 'test_helper'

class MagnetoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "is  mutant" do
    assert_equal(true, Magneto.verify_dna!(["aaaaa","ccaaa","cdaav","ccaaq","ccaaa"]).is_mutant)
    assert_equal(true,  Magneto.verify_dna!(["taaaa","tcaaa","tdaav","tcaaq","tcaaa"]).is_mutant)
    assert_equal(true,  Magneto.verify_dna!(["aaaaa","aaaaa","aaaaa","aaaaa","aaaaa"]).is_mutant)
    assert_equal(true,  Magneto.verify_dna!(["aaaaa","asdds","aaaaa","aaaaa","aaaaa"]).is_mutant)
    assert_equal(true,  Magneto.verify_dna!(["aaaaa","asdds","aaaaa","aadaa","aaaaa"]).is_mutant)
    assert_equal(true, true)
  end
 
  test "is not  mutant" do
    assert_equal(false, Magneto.verify_dna!(["adrax","asdds","avfrt","aadaa","aantr"]).is_mutant)
  end
end
