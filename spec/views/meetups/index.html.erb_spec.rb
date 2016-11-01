require 'rails_helper'

RSpec.describe "meetups/index", type: :view do
  before(:each) do
    assign(:meetups, [
      Meetup.create!(
        :title => "Title",
        :address => "Address",
        :content => "Content",
        :user => nil
      ),
      Meetup.create!(
        :title => "Title",
        :address => "Address",
        :content => "Content",
        :user => nil
      )
    ])
  end

  it "renders a list of meetups" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
