require 'rails_helper'

describe Product do 
  
  describe '#name' do
    context 'when missing' do
      before do
        expect(subject.name).to be_blank 
      end  

      it 'renders subject invalid' do
        subject.valid?
        expect(subject.errors[:name]).to include("can't be blank")
      end 
    end
    
    context 'when present' do
      subject {
        Product.new(name: 'Apple iPhone')
      }
      before do
        expect(subject.name).to be_present
      end 

      it 'does not have errors on name' do
        subject.valid?
        expect(subject.errors[:name]).to be_blank        
      end  
    end  
  end # name

  describe '#average_rating' do
    context 'when we have 5 comments with ratings' do
      subject { build(:product) }
      before do
        # user = User.new(email: "foo@mailinator.com", password: '12345678aE')
        # user.save!
        user = create :user
         # build is equivalent to .new
         # create is equivalent to .new and then save
        subject.comments << build(:comment, rating: 2, user: user)
        subject.comments << build(:comment, rating: 5, user: user)
        subject.comments << build(:comment, rating: 1, user: user)
        subject.comments << build(:comment, rating: 3, user: user)
        subject.comments << build(:comment, rating: 4, user: user)
        subject.save!
      end  

      it 'returns 3' do
        expect(subject.average_rating).to eq(3)
      end  
    end  

  end  
    
  describe '#orders' do
    it 'can have orders' do
      expect(subject).to respond_to(:orders)
    end  
  end  
 

  # context "has a name" do
  # 	before { @product = Product.new(name: "Angus Beef") }

  # 	it "should return name" do
  # 	  expect(@product.name).to eq "Angus Beef"
  # 	end
  # end

  # context "has a price" do 
  #   before { @product = Product.new(price: 20.0) }

  #   it "should return price only" do
  #     expect(@product.price).to eq 20.0
  #   end
  # end

  # #validates uniqueness
  # before do
  # 	@product = Product.new(name: "Carrot")
  # end

  # describe "when product name is already taken" do
  # 	before do
  # 		another_product = @product.dup
  # 		another_product.save
  # 	end

  # 	subject {@product}
  # 	it {should_not be_valid} do
  # 	end
  # end  
end