require 'spec_helper'

context 'When I go to the meetings admin page' do
  before(:each) do
    visit admin_meetings_path
  end

  it 'should succeed' do
    response.should be_success
  end
end
