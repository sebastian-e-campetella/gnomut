require 'byebug'
require "test/unit"

class Mutant
  def check_dna_string_size(pos,offset,mutation_count)
    return (offset - pos >= 4) ? (mutation_count + 1) : mutation_count
  end

  def isMutant(dna)
    return "DNA is't array" if !dna.is_a?(Array)
    return "Invalid: array all size are not equal" if dna.map{|d| d.size }.uniq.size > 1
    return "Invalid: array is't nxn" if dna.first.size != dna.size
    dna_array = dna.map{|l| l.split('')}
    offset_x = 0
    offset_y = 0
    max_offset_x = 0
    max_offset_y = 0
    max_offset_dd = 0
    x = 0
    y = 0
    dna_size = dna_array.size
    mutation_count = 0

    for i in 0..dna_size-1 do

      while max_offset_x < dna_size && max_offset_y < dna_size do

        max_offset_x = offset_x
        max_offset_y = offset_y
        max_offset_dd = offset_dd

        # x match
        while dna_array[x][y] == dna_array[offset_x][y] && (x + offset_x < dna_size) do
          offset_x += 1
        end
        mutation_count = check_dna_string_size(x,offset_x,mutation_count)
      
        while (dna_array[x][y] == dna_array[x][offset_y]) && (y + offset_y < dna_size) do
          offset_y += 1
          puts "#{offset_y}"
        end
        mutation_count = check_dna_string_size(y,offset_y,mutation_count)

        offset_dd = x
        while ((x + offset_dd < dna_size) && (y + offset_dd < dna_size)) && (dna_array[x][y] == dna_array[offset_dd][offset_dd]) do
          offset_dd += 1
          puts "#{offset_dd}"
        end
        mutation_count = check_dna_string_size(x,offset_dd,mutation_count)

        offset_di = x
        offset_dd = y
        while (dna_array[x][y] == dna_array[offset_dd][offset_di]) && (x - offset_di > dna_size) && (y - offset_dd > dna_size) do
          offset_di -= 1
          offset_dd += 1
        end
        mutation_count = check_dna_string_size(x,offset_di,mutation_count)
      end
    end
    return (mutation_count > 2) ? true : false
  end
end

class MutantTest < Test::Unit::TestCase
  def setup
    @mutant =  Mutant.new()
  end

  test "not mutant " do
    assertEqual(false,isMutant(["aaaaa","ccaaa","cdaav","ccaaq","ccaaa"]))
  end

  test "pop an object at the inmutable stack" do
    pass
  end

end
