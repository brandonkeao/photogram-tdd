require 'rails_helper'

feature 'Can view individual posts' do 
	scenario 'can click click and view a single post' do
		user = create :user
		post = create(:post, caption: "This will be a clickable and viewable post", user: user)
		sign_in_with user
		visit '/'
		find(:xpath, "//a[contains(@href,'posts/1')]").click
		expect(page.current_path).to eq(post_path(post))
	end
end