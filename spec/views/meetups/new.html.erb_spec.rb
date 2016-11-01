require 'rails_helper'

RSpec.describe "meetups/new", type: :view do
  before(:each) do
    assign(:meetup, Meetup.new(
      :title => "MyString",
      :address => "MyString",
      :content => "MyString",
      :user => nil
    ))
  end

  it "renders new meetup form" do
    render

    assert_select "form[action=?][method=?]", meetups_path, "post" do

      assert_select "input#meetup_title[name=?]", "meetup[title]"

      assert_select "input#meetup_address[name=?]", "meetup[address]"

      assert_select "input#meetup_content[name=?]", "meetup[content]"

      assert_select "input#meetup_user_id[name=?]", "meetup[user_id]"
    end
  end
end
