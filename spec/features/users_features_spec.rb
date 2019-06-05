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

describe 'Feature Test: User AI Flow', :type => :feature do

  before :each do
    @cortana_ai = Ai.create(
      :name => "Cortana",
      :description => "Is a smart AI formerly in service with the United Nations Space Command. :P ",
      :balance => 10
    )
    @siri_ai = Ai.create(
      :name => "Siri",
      :description => "Siri is an intelligent assistant that offers a faster, easier way to get things done on your Apple devices.",
      :balance => 10
    )
    @alexa_ai = Ai.create(
      :name => "Siri",
      :description => "Echo, better known by its wake word, 'Alexa,' can be queried about the weather, stream news and music on demand and serves as a robotic assistant that responds to voice commands to control home lighting and much more.",
      :balance => 10
    )
    visit '/users/new'
    userm_admin_signup
  end

  it 'links to the ais that was created by the user from the users show page when user is logged in' do
    expect(page).to have_content("See ais")
  end

  it 'has a link from the user show page to the ais index page' do
    click_link('See ais')
    expect(page).to have_content("#{@cortana_ai.name}")
    expect(page).to have_content("#{@siri_ai.name}")
    expect(page).to have_content("#{@alexa_ai.name}")
  end

  it 'a users can create a ai from the user show page' do
    click_link('See ais')
    expect(page).to have_content("Create new AI")
  end

  it 'a user can create an ai' do
    click_link('See ais')
    click_link("Create new AI")
    expect(current_path).to eq('/ais/new')
    fill_in("ai[name]", :with => "C-3PO")
    fill_in("ai[description]", :with => "'fluent in over six million forms of communication'")
    fill_in("ai[balance]", :with => "3")
    click_button('Create AI')
    expect(current_path).to eq("/ais/4")
    expect(page).to have_content("C-3PO")
  end

  it "has link to ai/show from ai/index page" do
    click_link('See ais')
    expect(page).to have_content("Show #{@alexa_ai.name}")
  end

  it "links to ais/show page from ais/index" do
    click_link('See ais')
    click_link("Show #{@cortana_ai.name}")
    expect(current_path).to eq("/ais/1")
  end


  it "has a link (as the ai creator) to edit ai from the ais/show page" do
    click_link('See ais')
    click_link("Show #{@cortana_ai.name}")
    expect(page).to have_content("Edit AI")
  end

  it "links to ai/edit page from ai/show page when logged in as the ai creator" do
    click_link('See ais')
    click_link("Show #{@cortana_ai.name}")
    click_link("Edit AI")
    expect(current_path).to eq("/ais/1/edit")
  end

  it "updates an ai when the ai creator edits it" do
    click_link('See ais')
    click_link("Show #{@cortana_ai.name}")
    click_link("Edit AI")
    fill_in("ai[name]", :with => "R2-D2")
    click_button("Update AI")
    expect(current_path).to eq("/ais/1")
    expect(page).to have_content("R2-D2")
  end

end

describe 'Feature Test: services', :type => :feature do
  before :each do
    #  Service.destroy_all
    Ai.destroy_all
    @ai = Ai.create!(name: "BB-8", description: "he’s aggressively cute",balance: 10 )
    @service = @ai.services.create!(name: "ChatBot", description: "Lots of talking",price: 2 )

    visit '/users/new'
    userm_admin_signup
  end

  it 'links to the ais from the users show page when logged in' do
    expect(page).to have_content("See ais")
  end

  it "links to ais/show page from ais/index" do
    click_link('See ais')
    click_link("Show #{@ai.name}")
    expect(current_path).to eq("/ais/1")
  end

  it "has a link to a spicific ai services from the ai show page" do
    click_link('See ais')
    click_link("Show #{@ai.name}")
    click_link("Show all services for #{@ai.name}")
    expect(page).to have_text(@service.name)
  end

  it "has a link to an ais/:id/services/new from the ai show page" do
    click_link('See ais')
    click_link("Show #{@ai.name}")
    click_link("Create new service for #{@ai.name}")
    expect(page).to have_text("Create new AI Service for #{@ai.name}")
  end

end

describe 'Feature Test: User - AI calling Service', :type => :feature do

  before :each do
    @cortana_ai = Ai.create(
      :name => "Cortana",
      :description => "Is a smart AI formerly in service with the United Nations Space Command. :P ",
      :balance => 10
    )
    @siri_ai = Ai.create(
      :name => "Siri",
      :description => "Siri is an intelligent assistant that offers a faster, easier way to get things done on your Apple devices.",
      :balance => 10
    )
    @alexa_ai = Ai.create(
      :name => "Siri",
      :description => "Echo, better known by its wake word, 'Alexa,' can be queried about the weather, stream news and music on demand and serves as a robotic assistant that responds to voice commands to control home lighting and much more.",
      :balance => 10
    )
    @ai_service_01 = Service.create(
      :name => "AI Service 1",
      :description => "An AI service that does something cool! :P",
      :price => 3
    )
- name:string
- description:string
- price:integer
    visit '/users/new'
    userm_admin_signup
  end

  it 'has a link from the user show page to the ai index page' do
    expect(page).to have_content("See ais")
    click_link('See ais')
    expect(page).to have_content("#{@cortana_ai.name}")
    expect(page).to have_content("#{@siri_ai.name}")
    expect(page).to have_content("#{@alexa_ai.name}")
  end

  it 'links from the user show page to the ai index page' do
    click_link('See ais')
    expect(current_path).to eq('/ais')
  end

  it 'prevents unauthorized users from editing/deleting an ai on the ai index page'# do
  #   click_link('See ais')
  #   expect(page).to_not have_content("edit")
  #   expect(page).to_not have_content("delete")
  #   expect(page).to_not have_content("Create new AI")
  # end

  it 'allows authorized users to edit/delete an ai on the ai index page' do
    click_link('See ais')
    expect(current_path).to eq('/ais')
    expect(page).to have_content("edit")
    expect(page).to have_content("delete")
    expect(page).to have_content("Create new AI")
  end


  it "has links on the ais index page to the ais' show pages" do
    click_link('See ais')
    expect(page).to have_content("Go on #{@cortana_ai.name}")
    expect(page).to have_content("Go on #{@siri_ai.name}")
  end

  it "links from the ais index page to the ais show pages" do
    click_link('See ais')
    click_link("Go on #{@siri_ai.name}")
    expect(current_path).to eq("/ais/2")
  end

  it "has a button from the user show page to get more data" do
    expect(page).to have_content("data")
  end

  it "clicking on 'data' updates the users data number" do
    click_link("data")
    expect(page).to have_content("Data: 1")
   end

# ai calls service
  # 1. if ai balance is greater then the ai service price then
  # say 'run the service'
  it "when the ai balance is greater then the ai service price, clicking on 'data' on the user show page displays a transaction (confirmation) message" #do
      click_link('See ais')
      click_link("Go on #{@siri_ai.name}")
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
