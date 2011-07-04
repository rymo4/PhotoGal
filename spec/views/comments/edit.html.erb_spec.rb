require 'spec_helper'

describe "comments/edit.html.erb" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :photo_id => 1,
      :comment => "MyString"
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path(@comment), :method => "post" do
      assert_select "input#comment_photo_id", :name => "comment[photo_id]"
      assert_select "input#comment_comment", :name => "comment[comment]"
    end
  end
end
