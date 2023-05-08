require "present"

describe Present do
  context "instance#wrap" do
    it "to assigns value to '@content'" do
      gift1 = Present.new
      result = gift1.wrap("xbox")
      expect(result).to eq "xbox"
    end
    it "to fail if @content is already defined" do
      gift1 = Present.new
      gift1.wrap("xbox")
      expect { gift1.wrap("ps5") }.to raise_error "A content has already been wrapped."
    end
  end

  context "instance#unwrap" do
    it "to return '@content'" do
      gift1 = Present.new
      gift1.wrap("xbox")
      result = gift1.unwrap
      expect(result).to eq "xbox"
    end
    it "to fail if content has not been defined" do
      gift1 = Present.new
      expect { gift1.unwrap }.to raise_error "No contents have been wrapped."
    end
  end
end