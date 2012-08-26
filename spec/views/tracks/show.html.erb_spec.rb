require 'spec_helper'

describe "tracks/show" do
  before(:each) do
    @track = assign(:track, stub_model(Track,
      :title => "Title",
      :artist => "Artist",
      :album => "Album",
      :year => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Artist/)
    rendered.should match(/Album/)
    rendered.should match(/1/)
  end
end
