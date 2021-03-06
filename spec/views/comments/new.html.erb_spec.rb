require 'spec_helper'

describe "comments/new.html.erb" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :photo_id => 1,
      :comment => "MyString"
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path, :method => "post" do
      assert_select "input#comment_photo_id", :name => "comment[photo_id]"
      assert_select "input#comment_comment", :name => "comment[comment]"
    end
  end
end
