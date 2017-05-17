require 'rails_helper'

feature 'User authentication' do 
	background do
		# create our user factory
		user = create(:user)
	end
	scenario 'can log in from the index' do
		visit '/'
		expect(page).not_to have_content('New Post')

		click_link 'Login'
		fill_in 'Email', with: 'fancyfrank@gmail.com'
		fill_in 'Password', with: 'illbeback'
		click_button 'Log in'

		expect(page).to have_content('Signed in successfully')
		expect(page).not_to have_content('Register')
		expect(page).to have_content('Logout')
	end

end