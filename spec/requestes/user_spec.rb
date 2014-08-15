require 'spec_helper'

describe 'Authorisation', :type => :feature do

  subject {page}

  before(:each) do
      @user = FactoryGirl.create(:user)
  end

  def sign_in(user)
    visit new_user_session_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end

describe 'Sign in'  do
  it 'signed in with correct credentials' do
    visit new_user_session_path
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => @user.password
    click_button "Sign in"
    page.should  have_content("Signed in successfully")
  end

  it 'signed in with wrong credentials' do
    visit new_user_session_path
    fill_in "Email", :with => "D@D.com"
    fill_in "Password", :with => "87654321"
    click_button "Sign in"
    page.should  have_content("Invalid email or password")
  end

end

  describe 'Sign out' do
      it 'sign out' do
        sign_in(@user)
        visit posts_path
        click_link 'Sign out'
        page.should have_content("Signed out successfully")
      end
  end

  describe 'Registration', :type => :feature do
    it 'Signed up with correct credentials' do
      visit new_user_session_path
      click_link 'Sign up'
      fill_in "Email", :with => "d@d.com"
      fill_in "Password", :with => "987654321"
      fill_in "Password confirmation", :with => "987654321"
      click_button "Sign up"
      page.should have_content("Welcome! You have signed up successfully")
    end

    it 'Signed up with wrong credentials' do
      visit new_user_session_path
      click_link 'Sign up'
      fill_in "Email", :with => "d@d.com"
      fill_in "Password", :with => "987654321"
      fill_in "Password confirmation", :with => "11111"
      click_button "Sign up"
      page.should have_content("1 error prohibited this user from being saved")
    end
  end
end