require "rails_helper"

describe "/users/registrations/new", type: :feature do
  before {visit "users/sign_up"}

  it {expect(page).to have_selector("form")}
  it {expect(page).to have_selector("form input[type='text']", count: 1)}
  it {expect(page).to have_selector("form input[type='email']", count: 1)}
  it {expect(page).to have_selector("form input[type='password']", count: 2)}
  it {expect(page).to have_selector("form input[type='submit']", count: 1)}
end

