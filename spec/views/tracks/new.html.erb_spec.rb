require 'spec_helper'

describe "tracks/new" do
  before(:each) do
    assign(:track, stub_model(Track,
      :title => "MyString",
      :artist => "MyString",
      :album => "MyString",
      :year => 1
    ).as_new_record)
  end

  it "renders new track form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tracks_path, :method => "post" do
      assert_select "input#track_title", :name => "track[title]"
      assert_select "input#track_artist", :name => "track[artist]"
      assert_select "input#track_album", :name => "track[album]"
      assert_select "input#track_year", :name => "track[year]"
    end
  end
end
