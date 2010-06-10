require 'spec_helper'

context 'When I go to the meetings admin page' do
  before(:each) do
    visit admin_meetings_path
  end

  context 'and add a new meeting' do
    before(:each) do
      click_link 'Add Meeting'

      fill_in 'Date', :with => '18 June 2010'
      fill_in 'Title', :with => 'We loooove (*squirt*) plataformatec!'
      fill_in 'Description', :with => 'Whatever!'
      click_button 'Add'
    end

    it 'should display a confirmation message' do
      response.should contain('Meeting was successfully created')
      response.should contain('We loooove')
    end
  end
end
