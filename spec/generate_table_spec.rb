require_relative '../lib/generate_table'


describe NumberTable do
  before do
   @get_prime = NumberTable.new(30) 
  end

  context "retreive only prime numbers" do

    it "returns false in case of non-prime numbers " do
    	@get_prime.is_prime?(4).should be_false
    end

    it "should confirm the number of elements in the array returned is 10" do
    	array = @get_prime.get_prime_numbers(30)
	array.count.should == 10
    end	
  end

  context "displays a multiplication table of prime numbers" do
    it "should return a table" do
      @get_prime.get_prime_number_table.should be_a(Terminal::Table)
    end
  end  

end
