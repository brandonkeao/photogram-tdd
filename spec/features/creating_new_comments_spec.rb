require 'rails_helper'

feature 'Creating Comments' do 
	scenario 'can comment on an existing post' do
		user = create :user
		post = create(:post, user: user)
		sign_in_with user 
		visit '/'
		fill_in 'Comment', with: ';P'
		click_button 'Submit'
		expect(page).to have_css("div.comment-content", text: ';P')
	end
end