class Mutant
  extend ActiveModel::Naming
  attr_reader :errors

  def initialize
    @errors = ActiveModel::Errors.new(self)
  end

  MUTANT_LENGHT = 4
  attr_accessor :is_mutant

  def is_mutant?
    self.is_mutant
  end

  def check_dna_string_size(pos,offset,mutation_count)
    return ((offset - pos).abs >= MUTANT_LENGHT) ? (mutation_count + 1) : mutation_count
  end

  def isMutantOptimized(dna)
    self.errors.add(:dna, "invalid_format" ,"DNA is't array") if !dna.is_a?(Array)
    self.errors.add(:dna, "invalid_format","Invalid: array all size are not equal") if dna.map{|d| d.size }.uniq.size > 1
    self.errors.add(:dna, "invalid_format" ,"Invalid: array is't nxn") if dna.first.size != dna.size
    mutation_count = 0
    if self.errors.empty?
      dna_array = dna.map{|l| l.split('')}
      mutation_row = 0
      mutation_col = 0
      mutation_dd = 0
      mutation_dc = 0

      dna_size = dna_array.size

      for row in 0..dna_size-1 do
        mutation_row += check_row(dna_array[row],dna_size)
        mutation_col += check_col(dna_array.map{|d| d[row]},dna_size)
      end

      mutation_dd = check_positive_diag(dna_array,dna_size)
      mutation_dc = check_negative_diag(dna_array,dna_size)
      mutation_count = mutation_dd + mutation_row + mutation_col + mutation_dc
    end
    self.is_mutant = (mutation_count > 2) ? true : false
  end

protected
  def check_row(dna_array,dna_size)
      max_offset_row = 0
      mutation_row = 0
      offset_row = 0
      while max_offset_row < dna_size  do
        row = offset_row
        while (offset_row < dna_size) && dna_array[row] == dna_array[offset_row]  do
          offset_row += 1
        end
        mutation_row = check_dna_string_size(row,offset_row,mutation_row)
        row = offset_row
        max_offset_row += offset_row
      end
      return mutation_row
  end


  def check_col(dna_array,dna_size)
    max_offset_col = 0
    mutation_col = 0
    offset_col = 0
    while max_offset_col < dna_size  do
      col = offset_col
      while (offset_col < dna_size) && dna_array[col] == dna_array[offset_col]  do
        offset_col += 1
      end
      mutation_col = check_dna_string_size(col,offset_col,mutation_col)
      max_offset_col += offset_col
    end
    return mutation_col
  end

  def check_positive_diag(dna_array,dna_size)
      iterations = dna_size - MUTANT_LENGHT
      mutation_dd = 0
      # by rows
      offset_dr = 0
      offset_dc = 0

      for r in 1..iterations do
        while dna_size > offset_dr &&  dna_size > offset_dc do
          row = offset_dr 
          col = offset_dc
          while dna_size > offset_dr &&  dna_size > offset_dc && dna_array[row][col] == dna_array[offset_dr][offset_dc] do
            offset_dr += 1
            offset_dc += 1
          end
          mutation_dd = check_dna_string_size(row, offset_dr,mutation_dd)
        end
      end

      # by cols
      offset_dr = 1
      offset_dc = 0
      for r in 1..iterations do
        while dna_size > offset_dr &&  dna_size > offset_dc do 
          row = offset_dr
          col = offset_dc
          while dna_size > offset_dr &&  dna_size > offset_dc && dna_array[row][col] == dna_array[offset_dr][offset_dc] do
            offset_dr += 1
            offset_dc += 1
          end
          mutation_dd = check_dna_string_size(r, offset_dr,mutation_dd)
        end
      end

      # central diag   
      offset_dr = 0
      offset_dc = 0
      while dna_size > offset_dr &&  dna_size > offset_dc do 
        row = offset_dr
        col = offset_dc
        while dna_size > offset_dr &&  dna_size > offset_dc && dna_array[row][col] == dna_array[offset_dr][offset_dc] do
          offset_dr += 1
          offset_dc += 1
        end
        mutation_dd = check_dna_string_size(row, offset_dr,mutation_dd)
      end

      return mutation_dd
  end


  def check_negative_diag(dna_array,dna_size)
      iterations = dna_size - MUTANT_LENGHT
      mutation_dd = 0
      # by rows
      for r in 1..iterations do
        row = 0
        offset_dr = 0
        offset_dc = dna_size-1
        col = offset_dc-r
        while dna_size > offset_dr && offset_dc > 0 do
          while dna_size > offset_dr && offset_dc > 0 && dna_array[row][col] == dna_array[offset_dr][offset_dc] do
            offset_dr += 1
            offset_dc -= 1
          end
          mutation_dd = check_dna_string_size(row, offset_dr,mutation_dd)
          col = offset_dc
          row = offset_dr
        end
      end

      # by cols
      offset_dc = dna_size-1
      offset_dr = 0
      row = 0
      for r in 1..iterations do
        col = offset_dc - r
        while dna_size > offset_dr && offset_dc > 0 do
          while dna_size > offset_dr && offset_dc > 0 && dna_array[row][col] == dna_array[offset_dr][offset_dc] do
            offset_dr += 1
            offset_dc -= 1
          end
          mutation_dd = check_dna_string_size(row, offset_dr,mutation_dd)
          row = offset_dr
          col = offset_dc
        end
      end

      # central diag   
      offset_dr = 0
      offset_dc = dna_size-1
      row = 0
      col = dna_size-1

      while dna_size > offset_dr &&  offset_dc > 0 do
        while dna_size > offset_dr &&  offset_dc > 0 && dna_array[row][col] == dna_array[offset_dr][offset_dc] do
          offset_dr += 1
          offset_dc -= 1
        end
        mutation_dd = check_dna_string_size(row, offset_dr,mutation_dd)
        row = offset_dr
        col = offset_dc
      end
      return mutation_dd
  end

end

