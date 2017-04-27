
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
# add own description
# describe('the rock,paper,scissor result path', {:type => :feature}) do
  # it('processes the user entry and returns the result of their rock,paper,scissors game') do
  #   visit('/')
  #   select('Rock', from: 'title1')
  #   click_button('Send')
  #   expect(page).to have_content('Computer threw Rock. Draw Game')
  # end
# end
