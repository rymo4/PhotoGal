require 'spec_helper'

describe "photos/new.html.erb" do
  before(:each) do
    assign(:photo, stub_model(Photo,
      :title => "MyString",
      :user_id => 1,
      :width => 1,
      :height => 1,
      :bought => false,
      :camera => "MyString",
      :aperature => 1.5,
      :shutter => "MyString",
      :iso => 1,
      :time_taken => "",
      :file_size => 1
    ).as_new_record)
  end

  it "renders new photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => photos_path, :method => "post" do
      assert_select "input#photo_title", :name => "photo[title]"
      assert_select "input#photo_user_id", :name => "photo[user_id]"
      assert_select "input#photo_width", :name => "photo[width]"
      assert_select "input#photo_height", :name => "photo[height]"
      assert_select "input#photo_bought", :name => "photo[bought]"
      assert_select "input#photo_camera", :name => "photo[camera]"
      assert_select "input#photo_aperature", :name => "photo[aperature]"
      assert_select "input#photo_shutter", :name => "photo[shutter]"
      assert_select "input#photo_iso", :name => "photo[iso]"
      assert_select "input#photo_time_taken", :name => "photo[time_taken]"
      assert_select "input#photo_file_size", :name => "photo[file_size]"
    end
  end
end
