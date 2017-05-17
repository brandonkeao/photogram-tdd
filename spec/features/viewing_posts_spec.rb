require 'rails_helper'

feature 'Can view individual posts' do 
	background do
		user = create :user
		sign_in_with user
	end
	scenario 'can click click and view a single post' do
		post = create(:post, caption: "This will be a clickable and viewable post")
		visit '/'
		find(:xpath, "//a[contains(@href,'posts/1')]").click
		expect(page.current_path).to eq(post_path(post))
	end
end