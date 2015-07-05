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

 describe Comment, 'validation' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:product) }
  end 

 describe Comment, 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:product) }
  end

  describe Comment do
    it { should belong_to (:product) }
    it { should belong_to (:user) }
  end 