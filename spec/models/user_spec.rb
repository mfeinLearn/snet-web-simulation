require 'rails_helper'

RSpec.describe User, :type => :model do
  # let(:user) {
  #   User.create(
  #     :username => "malcomefein",
  #     :password => "password",
  #     :email => "mfein90@gmail.com",
  #     :data => 5
  #   )
  # }
  # let(:user) {
  #   User.create(
  #     :username => "avi",
  #     :password => "password",
  #     :email => "avi@flatironschool.com",
  #     :data => 5
  #   )
  # }

  it "is valid with a name and password" do
    # expect(user).to be_valid
  end

  it "is not valid without a password" do
    # expect(User.new(name: "Name")).not_to be_valid
  end

  it "has many ais" do
    # first_ride = Ride.create(:user_id => user.id, :attraction_id => roller_coaster.id)
    # second_ride = Ride.create(:user_id => user.id, :attraction_id => ferris_wheel.id)
    # expect(user.rides.first).to eq(first_ride)
    # expect(user.rides.last).to eq(second_ride)
  end

  it "has many transactions through ais" do
    # user.attractions << [roller_coaster, ferris_wheel]
    # expect(user.attractions.first).to eq(roller_coaster)
    # expect(user.attractions.last).to eq(ferris_wheel)
  end

  it "has many services through transactions" do
    # user.attractions << [roller_coaster, ferris_wheel]
    # expect(user.attractions.first).to eq(roller_coaster)
    # expect(user.attractions.last).to eq(ferris_wheel)
  end

  it "has a default of 0 data" do
    # expect(user.mood).to eq("Good to go!")
  end

  it "has a method 'data' that returns 'Good to go!' when the user has 5 or more data" do
    # expect(user.mood).to eq("Good to go!")
  end

  it "has a method 'data' that returns 'Sorry' when the user has less then 5 of data" do
    # user.update(:data => 2)
    # expect(user.mood).to eq("Sorry")
  end

end
