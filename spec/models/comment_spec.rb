require "rails_helper"

  describe Comment do

   context "has a body" do	
     it "should be invalid without a body" do
     comment = Comment.new(body: nil)
     comment.valid?
     expect(comment.errors[:body]).to include("can't be blank")
     end
   end

   it "is invalid without a product" do
   comment = Comment.new(product: nil)
   comment.valid?
   expect(comment.errors[:product]).to include("can't be blank")
   end
  end

   describe '#orders' do
    it 'can have orders' do
      expect(subject).to respond_to(:orders)
    end  
  end