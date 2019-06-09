require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {
    User.create(
      :name => "malcomefein",
      :password => "password",
      :data => 6
    )
  }
  let(:user0) {
    User.create(
      :name => "malcomefein",
      :password => "password",
      :data => 0
    )
  }
  let(:ai0) {
    Ai.create(
      :name => "Cortana",
      :description => "Is a smart AI formerly in service with the United Nations Space Command. :P ",
      :balance => 5,
      :user_id => 1
    )
  }
  let(:ai1) {
    Ai.create(
      :name => "Siri",
      :description => "Siri is an intelligent assistant that offers a faster, easier way to get things done on your Apple devices.",
      :balance => 10,
      :user_id => 1
    )
  }
  let(:service1) {
    Service.create(
      :name => "Chat Bot 1",
      :description => "Talking with humans :P",
      :price => 10
    )
  }
  let(:service2) {
    Service.create(
      :name => "Driving 1",
      :description => "Driving Humans :.D ",
      :price => 10
    )
  }
  let(:transaction1) {
    Transaction.create(
      :ai_id => 1,
      :service_id => 1,
      :status => true
    )
  }
  let(:transaction2) {
    Transaction.create(
      :ai_id => 2,
      :service_id => 2,
      :status => true
    )
  }


  it "is valid with a name and password" do
    expect(user).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(name: "Name")).not_to be_valid
  end

  it "has many ais" do
    first_ai = Ai.create(:name => "Cortana", :description => "Is a smart AI formerly in service with the United Nations Space Command. :P ", :balance => 10, :user_id => 1)
    second_ai = Ai.create(:name => "Siri", :description =>  "Siri is an intelligent assistant that offers a faster, easier way to get things done on your Apple devices.", :balance => 10, :user_id => 1)
    user.ais << first_ai
    user.ais << second_ai
    expect(user.ais.first).to eq(first_ai)
    expect(user.ais.last).to eq(second_ai)
    #binding.pry
  end

  it "has many transactions through ais" #do
    # user.ais << [ai0, ai1]
    # expect(user.ais.first).to eq(ai0)
    # expect(user.ais.last).to eq(ai1)
  # end

  it "has many services through transactions" #do
  #   user.ais << [ai0, ai1]
  #   expect(user.ais.first).to eq(ai0)
  #   expect(user.ais.last).to eq(ai1)
  # end

  it "has a default of 0 data" do
    expect(user0.data).to eq(0)
    # binding.pry
  end

  it "has a link 'add data' that increments the user data attribute" do
    expect(user.data).to be >= 1
  end

  # it "has a method 'add data' that returns 'Good to go!' when the user has 5 or more data" do
  #   expect(user.data).to eq("Good to go!")
  # end
  #
  # it "has a method 'add data' that returns 'Sorry' when the user has less then 5 of data" do
  #   user.update(:data => 2)
  #   expect(user.data).to eq("Sorry")
  # end

end
