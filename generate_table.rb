require 'terminal-table'


class NumberTable

  def get_prime_number_table
    headings = []
    retreive_prime_numbers = []
 
    headings = get_prime_numbers
    table = Terminal::Table.new :headings => headings.unshift(''), :title => "Prime Numbers Multiplication Table" do |t|
      retreive_prime_numbers = get_prime_numbers 
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
  
  def get_prime_numbers
    array = []
    2.upto 30 do |count|
      get_prime_number = is_prime?(count)
      if get_prime_number == true
        array << count
      end
    end
    return array
  end

  def is_prime?(random_number)
    return false if random_number <= 1
    (2..Math::sqrt(random_number)).each do |x|
       return false if random_number % x == 0
    end
    return true
  end
end


NumberTable.new.get_prime_number_table
