require 'terminal-table'


class NumberTable

  def generate_table
    headings = []
    retreive_prime_numbers = []
 
    headings = generate_prime
    table = Terminal::Table.new :headings => headings.unshift(''), :title => "Prime Numbers Multiplication Table" do |t|
      retreive_prime_numbers = generate_prime 
      retreive_prime_numbers.each  do |first_field|
        row = []     
        row << first_field.to_i
        retreive_prime_numbers.each do |fill_row|
          row << first_field.to_i * fill_row.to_i
        end 
        t << row
        t << :separator unless first_field.to_i == 29   
      end
    end 
    puts table
  end
  
  def generate_prime
    array = []
    2.upto 30 do |count|
      get_prime_number = is_prime?(count)
      if get_prime_number == true
        array << count
      end
    end
    return array
  end

  def is_prime?(n)
    return false if n <= 1
    (2..Math::sqrt(n)).each do |x|
       return false if n % x == 0
    end
    return true
  end
end


NumberTable.new.generate_table
