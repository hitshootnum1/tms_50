describe "/users/sessions/new", :type => :feature do

  before {visit "users/sign_in"}

  it {expect(page).to have_selector("form")}
  it {expect(page).to have_selector("form input[type='email']", count: 1)}
  it {expect(page).to have_selector("form input[type='password']", count: 1)}
  it {expect(page).to have_selector("form input[type='checkbox']", count: 1)}
  it {expect(page).to have_selector("form input[type='submit']", count: 1)}
end
