require 'spec_helper'

describe "notifications/new.html.erb" do
  before(:each) do
    assign(:notification, stub_model(Notification,
      :photo_id => 1,
      :reciever_id => 1
    ).as_new_record)
  end

  it "renders new notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => notifications_path, :method => "post" do
      assert_select "input#notification_photo_id", :name => "notification[photo_id]"
      assert_select "input#notification_reciever_id", :name => "notification[reciever_id]"
    end
  end
end
