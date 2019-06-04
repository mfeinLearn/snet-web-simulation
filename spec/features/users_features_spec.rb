require_relative "../rails_helper.rb"
describe 'Feature Test: User Signup', :type => :feature do

  it 'successfully signs up' do
    visit '/users/new'
    expect(current_path).to eq('/users/new')
    # user_signup method is defined in login_helper.rb
    user_signup
    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Amy Poehler")
    expect(page).to have_content(0)
 end

  it "on sign up, successfully adds a session hash" do
    visit '/users/new'
    # user_signup method is defined in login_helper.rb
    user_signup
    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

  it 'successfully logs in' do

    # user_login method is defined in login_helper.rb
    create_standard_user
    visit '/signin'
    expect(current_path).to eq('/signin')
    user_login
    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Mindy")
    expect(page).to have_content(0)
  end

  it "on log in, successfully adds a session hash" do
    create_standard_user
    visit '/signin'
    # user_login method is defined in login_helper.rb
    user_login
    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

  it 'prevents user from viewing user show page and redirects to home page if not logged in' do
    create_standard_user
    visit '/users/1'
    expect(current_path).to eq('/')
    expect(page).to have_content("Sign Up")
  end



end

describe 'Feature Test: User Signout', :type => :feature do

  it 'has a link to log out from the users/show page' do
    visit '/users/new'
    # user_signup method is defined in login_helper.rb
    user_signup
    expect(page).to have_content("Log Out")
  end

  it 'redirects to home page after logging out' do
    visit '/users/new'
    # user_signup method is defined in login_helper.rb
    user_signup
    click_link("Log Out")
    expect(current_path).to eq('/')
  end

  it "successfully destroys session hash when 'Log Out' is clicked" do
    visit '/users/new'
    # user_signup method is defined in login_helper.rb
    user_signup
    click_link("Log Out")
    expect(page.get_rack_session).to_not include("user_id")
  end

end

describe 'Feature Test: User - AI calling Service', :type => :feature do

  # before :each do
  #   @rollercoaster = Attraction.create(
  #     :name => "Roller Coaster",
  #     :tickets => 5,
  #     :nausea_rating => 2,
  #     :happiness_rating => 4,
  #     :min_height => 32
  #   )
  #   @ferriswheel = Attraction.create(
  #     :name => "Ferris Wheel",
  #     :tickets => 2,
  #     :nausea_rating => 2,
  #     :happiness_rating => 1,
  #     :min_height => 28
  #   )
  #   @teacups = Attraction.create(
  #     :name => "Teacups",
  #     :tickets => 1,
  #     :nausea_rating => 5,
  #     :happiness_rating => 1,
  #     :min_height => 28
  #   )
  #   visit '/users/new'
  #   user_signup
  # end

  it 'has a link from the user show page to the ai index page' #do
    # expect(page).to have_content("See attractions")
    # click_link('See attractions')
  #end

  it 'links from the user show page to the ai index page' #do
    # click_link('See attractions')
    # expect(current_path).to eq('/attractions')
  #end

  it 'prevents unaorthized users from editing/deleting an ai on the ai index page' #do
    # click_link('See attractions')
    # expect(current_path).to eq('/attractions')
    # expect(page).to have_content("edit")
    # expect(page).to have_content("delete")
    # expect(page).to have_content("new attraction")
  #end

  it 'allows aorthized users to edit/delete an ai on the ai index page' #do
    # click_link('See attractions')
    # expect(current_path).to eq('/attractions')
    # expect(page).to_not have_content("edit")
    # expect(page).to_not have_content("delete")
    # expect(page).to_not have_content("new attraction")
  #end
#######
#######
####### comeback!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#######
#######
#  it 'has titles of the rides on the ais index page' do
    # click_link('See attractions')
    # expect(page).to have_content("#{@ferriswheel.name}")
    # expect(page).to have_content("#{@rollercoaster.name}")
#  end
  #######
  #######!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  #######
  #######

  it "has links on the ais index page to the ais' show pages"# do
    # click_link('See attractions')
    # expect(page).to have_content("Go on #{@ferriswheel.name}")
    # expect(page).to have_content("Go on #{@rollercoaster.name}")
#  end

  it "links from the ais index page to the ais' show pages" #do
    # click_link('See attractions')
    # click_link("Go on #{@ferriswheel.name}")
    # expect(current_path).to eq("/attractions/2")
  #end
#
#
#
#----------here--------------------
#
#
#

  it "has a button from the ai show page to get more data" #do
    # click_link('See attractions')
    # click_link("Go on #{@ferriswheel.name}")
    # expect(current_path).to eq("/attractions/2")
    # expect(page).to have_button("Go on this ride")
  #end

  it "clicking on 'data' redirects to user show page" #do
    # click_link('See attractions')
    # click_link("Go on #{@ferriswheel.name}")
    # click_button("Go on this ride")
    # expect(current_path).to eq("/users/1")
  #end

  it "clicking on 'data' updates the users data number" #do
    # click_link('See attractions')
    # click_link("Go on #{@ferriswheel.name}")
    # click_button("Go on this ride")
    # expect(page).to have_content("Tickets: 13")
  # end



# ai calls service
  # 1. if ai balance is greater then the ai service price then
  # say 'run the service'
  it "when the ai balance is greater then the ai service price, clicking on 'run the service' displays a transaction (confirmation) message" #do
    # click_link('See attractions')
    # click_link("Go on #{@ferriswheel.name}")
    # click_button("Go on this ride")
    # expect(page).to have_content("Thanks for riding the #{@ferriswheel.name}!")
  #end

  # 1. On transaction message select how was the experience
  it "on transaction message select your experience" #do
  #end

  # 2. decrease the ai balance
  it "clicking on 'run the service' updates the ai balance" #do
    # click_link('See attractions')
    # click_link("Go on #{@teacups.name}")
    # click_button("Go on this ride")
    # expect(page).to have_content("sad")
  #end

  # 3. if ai balance is less then the ai service price then
  # say 'sorry you can not call this service'
  it "when the ai balance is less then the ai service price, clicking on 'run the service' displays this sorry message 'sorry you can not call this service' " #do
    # click_link('See attractions')
    # click_link("Go on #{@ferriswheel.name}")
    # click_button("Go on this ride")
    # expect(page).to have_content("Thanks for riding the #{@ferriswheel.name}!")
  #end




end

describe 'Feature Test: User Flow for AI', :type => :feature do
  #
  # before :each do
  #   @rollercoaster = Attraction.create(
  #     :name => "Roller Coaster",
  #     :tickets => 5,
  #     :nausea_rating => 2,
  #     :happiness_rating => 4,
  #     :min_height => 32
  #   )
  #   @ferriswheel = Attraction.create(
  #     :name => "Ferris Wheel",
  #     :tickets => 2,
  #     :nausea_rating => 2,
  #     :happiness_rating => 1,
  #     :min_height => 28
  #   )
  #   @teacups = Attraction.create(
  #     :name => "Teacups",
  #     :tickets => 1,
  #     :nausea_rating => 5,
  #     :happiness_rating => 1,
  #     :min_height => 28
  #   )
  #   visit '/users/new'
  #   admin_signup
  # end

  it 'links to the ais that was created by the user from the users show page when user is logged in' #do
    # expect(page).to have_content("See attractions")
  #end

  it 'has a link from the user show page to the ais index page' #do
    # click_link('See attractions')
    # expect(page).to have_content("#{@teacups.name}")
    # expect(page).to have_content("#{@rollercoaster.name}")
    # expect(page).to have_content("#{@ferriswheel.name}")
  #end

  it 'a users can create a ai from the user show page' #do
    # click_link('See attractions')
    # expect(page).to have_content("New Attraction")
  #end

  it 'a user can create an ai'# do
    # click_link('See attractions')
    # click_link("New Attraction")
    # expect(current_path).to eq('/attractions/new')
    # fill_in("attraction[name]", :with => "Haunted Mansion")
    # fill_in("attraction[min_height]", :with => "32")
    # fill_in("attraction[happiness_rating]", :with => "2")
    # fill_in("attraction[nausea_rating]", :with => "1")
    # fill_in("attraction[tickets]", :with => "4")
    # click_button('Create Attraction')
    # expect(current_path).to eq("/attractions/4")
    # expect(page).to have_content("Haunted Mansion")
  #end

  it "has link to ai/show from ai/index page"# do
    # click_link('See attractions')
    # expect(page).to have_content("Show #{@ferriswheel.name}")
  #end

  it "links to ais/show page from ais/index" #do
    # click_link('See attractions')
    # click_link("Show #{@rollercoaster.name}")
    # expect(current_path).to eq("/attractions/1")
  #end


  it "has a link as the ai creator to edit ai from the ais/show page" #do
    # click_link('See attractions')
    # click_link("Show #{@rollercoaster.name}")
    # expect(page).to have_content("Edit Attraction")
  #end

  it "links to ai/edit page from ai/show page when logged in as the ai creator" #do
    # click_link('See attractions')
    # click_link("Show #{@rollercoaster.name}")
    # click_link("Edit Attraction")
    # expect(current_path).to eq("/attractions/1/edit")
  #end

  it "updates an ai when the ai creator edits it" #do
    # click_link('See attractions')
    # click_link("Show #{@rollercoaster.name}")
    # click_link("Edit Attraction")
    # fill_in("attraction[name]", :with => "Nitro")
    # click_button("Update Attraction")
    # expect(current_path).to eq("/attractions/1")
    # expect(page).to have_content("Nitro")
  #end


end

describe 'Feature Test: User Flow for AI Services', :type => :feature do

end
