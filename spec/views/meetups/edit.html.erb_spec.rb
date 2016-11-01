require 'rails_helper'

RSpec.describe "meetups/edit", type: :view do
  before(:each) do
    @meetup = assign(:meetup, Meetup.create!(
      :title => "MyString",
      :address => "MyString",
      :content => "MyString",
      :user => nil
    ))
  end

  it "renders the edit meetup form" do
    render

    assert_select "form[action=?][method=?]", meetup_path(@meetup), "post" do

      assert_select "input#meetup_title[name=?]", "meetup[title]"

      assert_select "input#meetup_address[name=?]", "meetup[address]"

      assert_select "input#meetup_content[name=?]", "meetup[content]"

      assert_select "input#meetup_user_id[name=?]", "meetup[user_id]"
    end
  end
end
