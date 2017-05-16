require 'rails_helper'

feature 'Creating posts' do
	scenario 'can create a post' do
		visit '/'
		click_link 'New Post'
		attach_file('Image', "spec/files/images/coffee.jpg")
		fill_in 'Caption', with: 'nom nom nom #coffeetime'
		click_button 'Create Post'
		expect(page).to have_content('#coffeetime')
		expect(page).to have_css("img[src*='coffee.jpg']")
	end

	scenario 'needs an image to create a post' do  
  		visit '/'
  		click_link 'New Post'
  		fill_in 'Caption', with: 'nom nom nom #coffeetime'
  		click_button 'Create Post'
  		expect(page).to have_content("Halt, you fiend! You need an image to post here!")
	end  
end

feature 'Can view individual posts' do 
	scenario 'can click click and view a single post' do
		post = create(:post, caption: "This will be a clickable and viewable post")
		visit '/'
		find(:xpath, "//a[contains(@href,'posts/1')]").click
		expect(page.current_path).to eq(post_path(post))
	end
end