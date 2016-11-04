require 'rails_helper'

RSpec.describe "meetups/show", type: :view do
  before(:each) do
    @meetup = assign(:meetup, Meetup.create!(
      :title => "Title",
      :address => "Address",
      :content => "Content",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(//)
  end
end
