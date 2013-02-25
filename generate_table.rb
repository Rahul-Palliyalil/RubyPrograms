require 'terminal-table'
require 'trollop'

opts = Trollop::options do
  opt :prime_numbers, "Count of prime numbers", 
  :type => :integer, 
  :default =>30
end


class NumberTable

  def initialize(prime_number_count)
    @prime_number_count = prime_number_count
  end  

  def get_prime_number_table
    headings = []
    retreive_prime_numbers = []
    
 
    main_headings = get_prime_numbers(@prime_number_count)
    table = Terminal::Table.new :headings => main_headings.unshift(''), :title => "Prime Numbers Multiplication Table" do |t|
      retreive_prime_numbers = get_prime_numbers(@prime_number_count) 
      retreive_prime_numbers.each  do |first_field|
        row = []     
        row << first_field.to_i
        retreive_prime_numbers.each do |fill_row|
          row << first_field.to_i * fill_row.to_i
        end 
        t << row
        t << :separator unless first_field.to_i == retreive_prime_numbers[-1]
      end
    end 
    return table
  end
  
  def get_prime_numbers(prime)
    array = []
    2.upto prime do |count|
      get_prime_number = is_prime?(count)
      if get_prime_number == true
        array << count
      end
    end
    return array
  end

  def is_prime?(random_number)
    (2..Math::sqrt(random_number)).each do |x|
       return false if random_number % x == 0
    end
    return true
  end
end

if __FILE__ == $0
  prime = NumberTable.new(opts[:prime_numbers])
  table = prime.get_prime_number_table
  puts table
end  
