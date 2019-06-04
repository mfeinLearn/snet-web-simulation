module LoginHelper

  def user_signup # okay
    fill_in("user[name]", :with => "Amy Poehler")
    fill_in("user[password]", :with => "password")
    click_button('Create User')
  end

  def user_login # okay
    select 'Mindy',from:'user_name'
    fill_in("user[password]", :with => "password")
    click_button('Sign In')
  end

  def userm_admin_signup
    fill_in("user[name]", :with => "Walt Disney")
    fill_in("user[password]", :with => "password")
    click_button('Create User')
  end

  def admin_login
    select 'Walt Disney',from:'user_name'
    fill_in("password", :with => "password")
    click_button('Sign In')
  end

  def create_standard_user # okay
    @mindy = User.create(
      name: "Mindy",
      password: "password",
      email: "mindy@gmail.com",
      )
  end

  def create_standard_and_admin_user
    @mindy = User.create(
      name: "Mindy",
      password: "password",
      happiness: 3,
      nausea: 2,
      tickets: 10,
      height: 50
    )
    @walt = User.create(
      name: "Walt Disney",
      password: "password",
      admin: true
    )
  end

end
