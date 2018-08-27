require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :body => "MyString",
      :title => "MyString",
      :author_id => 1,
      :slug => "MyString"
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input[name=?]", "post[body]"

      assert_select "input[name=?]", "post[title]"

      assert_select "input[name=?]", "post[author_id]"

      assert_select "input[name=?]", "post[slug]"
    end
  end
end
