# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'comments/new', type: :view do
  before(:each) do
    assign(:comment, Comment.new(
                       content: 'MyString',
                       user: nil,
                       commentable: nil
                     ))
  end

  it 'renders new comment form' do
    render

    assert_select 'form[action=?][method=?]', comments_path, 'post' do
      assert_select 'input[name=?]', 'comment[content]'

      assert_select 'input[name=?]', 'comment[user_id]'

      assert_select 'input[name=?]', 'comment[commentable_id]'
    end
  end
end
