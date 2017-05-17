require 'rails_helper'

feature 'Index displays a list of posts' do 
	background do
		# Create multiple posts using factories.
		user = create(:user)
		post_one = create(:post, caption: "This is post one", user: user)
		post_two = create(:post, caption: "This is the second post", user: user)
		sign_in_with user

	end
	scenario 'the index displays correct created post information' do
		# User can see the comments and images of the posts we’ve created.
		expect(page).to have_content("This is post one")
		expect(page).to have_content("This is the second post")
		expect(page).to have_css("img[src*='coffee']")
	end
end