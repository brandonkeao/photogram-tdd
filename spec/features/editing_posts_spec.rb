require 'rails_helper'

feature 'Editing posts' do
	background do
		user = create :user
		post = create( :post, user: user ) 
		
		sign_in_with user

		find(:xpath, "//a[contains(@href,'posts/1')]").click
		click_link 'Edit Post'
	end
	scenario 'can edit post' do
		fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
		click_button 'Update Post'
		expect(page).to have_content("Post updated hombre")
		expect(page).to have_content("Oh god, you weren't meant to see this picture!")
	end

	scenario "won't update a post without an image" do 
		attach_file('Image', 'spec/files/images/dance.txt')
		click_button 'Update Post' 
		expect(page).to have_content("Something is wrong with your form")
	end
end