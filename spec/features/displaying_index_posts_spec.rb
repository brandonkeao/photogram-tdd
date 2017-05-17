require 'rails_helper'

feature 'Index displays a list of posts' do 
	background do
		# Create multiple posts using factories.
		post_one = create(:post, caption: "This is post one")
		post_two = create(:post, caption: "This is the second post")
		user = create(:user)

		visit '/'
		click_link 'Login'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button 'Log in'
	end
	scenario 'the index displays correct created post information' do
		# User can see the comments and images of the posts we’ve created.
		expect(page).to have_content("This is post one")
		expect(page).to have_content("This is the second post")
		expect(page).to have_css("img[src*='coffee']")
	end
end