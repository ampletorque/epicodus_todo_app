require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe('Test adding tasks', {:type => :feature}) do
  it('Displays a user''s task after adding it') do
    visit('/')
    fill_in('description', :with => "rub kittycat")
    click_button('Add task')
    click_link("Back to main tasks screen.")
    expect(page).to have_content("rub kittycat")
  end
end

describe('Test clearing tasks', {:type => :feature}) do
  it('clears a user''s task after it''s added') do
    visit('/')
    fill_in('description', :with => "scratch itch")
    click_button('Add task')
    click_link("Back to main tasks screen.")
    expect(page).to have_content("scratch itch")
    click_button('Clear Tasks')
    click_link("Back to main tasks screen.")
    expect(page).to_not have_content("scratch itch")
end
end
