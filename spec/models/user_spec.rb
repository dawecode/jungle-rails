require 'rails_helper'

RSpec.describe User, type: :model do
  
 describe 'Validations' do 
  it "validates the presence of  first name" do 
    @user = User.new(:first_name => nil, :last_name => "test", :email => "test@test.com", :password =>"test")
    expect(@user).not_to be_valid 
    expect(@user.errors.full_messages[0]).to eq("First name can't be blank")
  end 

  it "validates the presence of last name" do 
    @user = User.new(:first_name => "test", :last_name => nil,  :email => "test@test.com", :password_digest => "test")
    expect(@user).not_to be_valid 
    expect(@user.errors.full_messages[0]).to eq("Last name can't be blank")
  end 


  end
end
