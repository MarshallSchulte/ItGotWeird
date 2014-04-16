require 'spec_helper'

describe "blogs/edit" do
  before(:each) do
    @blog = assign(:blog, stub_model(Blog,
      :userId => 1,
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit blog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", blog_path(@blog), "post" do
      assert_select "input#blog_userId[name=?]", "blog[userId]"
      assert_select "input#blog_title[name=?]", "blog[title]"
      assert_select "textarea#blog_content[name=?]", "blog[content]"
    end
  end
end
