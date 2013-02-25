require_relative 'generate_table'


describe NumberTable do
  before do
   @get_prime = NumberTable.new 
  end

  context "retreive only prime numbers" do

    it "returns false in case of non-prime numbers " do
    	@get_prime.is_prime?(4).should be_false
    end

    it "should confirm the number of elements in the array returned is 10" do
    	array = @get_prime.get_prime_numbers
	array.count.should == 10
    end	
  end
end
