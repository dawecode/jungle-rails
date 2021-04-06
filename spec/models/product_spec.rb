require 'rails_helper'



RSpec.describe Product, type: :model do


 describe 'Validations' do 
    it "saves successfully when all fields are present" do
      @categories = Category.new(:name => "Vintage Clothing")
      @product = Product.new(:name => "Sun dress",  :price => 9000, :quantity => 1, :category =>@categories)
      expect(@product).to be_valid 
    end 

    it "validates the presence of name" do 
      @categories = Category.new(:name => "Vintage Clothing")
      @product = Product.new(:name => nil,  :price => 9000, :quantity => 1, :category =>@categories)
      expect(@product).not_to be_valid 
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
    end 

    it "validates the presence of price_cents and price" do 
      @categories = Category.new(:name => "Vintage Clothing")
      @product = Product.new(:name => "Sunflower dress", :price => nil, :price_cents =>nil, :quantity => 1, :category =>@categories)
      expect(@product).not_to be_valid 
      expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
      expect(@product.errors.full_messages[1]).to eq("Price is not a number")
      expect(@product.errors.full_messages[2]).to eq("Price can't be blank")
    end 

    it "validates the presence of quantity" do 
      @categories = Category.new(:name => "Vintage Clothing")
      @product = Product.new(:name => "Sunflower dress", :price => 9000, :quantity =>nil, :category =>@categories)
      expect(@product).not_to be_valid 
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end 

    it "validates the presence of category" do 
      @categories = Category.new(:name => "Vintage Clothing")
      @product = Product.new(:name => "Sunflower dress", :price => 9000, :quantity =>1, :category =>nil )
      expect(@product).not_to be_valid 
      expect(@product.errors.full_messages[0]).to eq("Category can't be blank")
    end 
  end
end 