require 'rails_helper'

feature 'Deleting comments' do
	background do
		user = create :user
		user_two = create( :user, 
							email: 'hi@hi.com',
							user_name: 'bigrigoz',
							id: 2)
		post = create(:post, user: user)
		comment = create(:comment, user_id: user_two.id, post_id: post.id, content: "Nice post!")
		commment_two = create(:comment, user_id: user.id, post_id: post.id, content: "You guys are too kind xo")
		sign_in_with user_two
	end
	scenario 'user can delete thier own comments' do
		visit '/'
		expect(page).to have_content('Nice post!')
		click_link 'delete-1'
		expect(page).to_not have_content('Nice post!')
	end
	scenario 'user cannot delete a comment not belonging to them via the ui' do
		visit '/'
		expect(page).to have_content('You guys are too kind xo')
    	expect(page).to_not have_css('#delete-2')
	end
	scenario 'user cannot dlete a comment not belonging to them via urls' do
		visit '/'
		expect(page).to have_content('You guys are too kind xo')
		page.driver.submit :delete, "posts/1/comments/2", {}
		expect(page).to have_content("That doesn't belong to you!")
		expect(page).to have_content("You guys are too kind xo")
	end
end