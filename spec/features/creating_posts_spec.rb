require 'rails_helper'

feature 'Creating posts' do
	background do
		user = create :user 
		sign_in_with user
	end

	scenario 'can create a new post' do
		visit '/'
		click_link 'New Post'
		attach_file('Image', "spec/files/images/coffee.jpg")
		fill_in 'Caption', with: 'nom nom nom #coffeetime'
		click_button 'Create Post'
		expect(page).to have_content('#coffeetime')
		expect(page).to have_css("img[src*='coffee.jpg']")
		expect(page).to have_content('Arnie')  
	end

	scenario 'needs an image to create a post' do  
  		visit '/'
  		click_link 'New Post'
  		fill_in 'Caption', with: 'nom nom nom #coffeetime'
  		click_button 'Create Post'
  		expect(page).to have_content("Your new post couldn't be created!  Please check the form.")
	end  
end

