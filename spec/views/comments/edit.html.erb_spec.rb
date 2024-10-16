# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'comments/edit', type: :view do
  let(:comment) do
    Comment.create!(
      content: 'MyString',
      user: nil,
      commentable: nil
    )
  end

  before(:each) do
    assign(:comment, comment)
  end

  it 'renders the edit comment form' do
    render

    assert_select 'form[action=?][method=?]', comment_path(comment), 'post' do
      assert_select 'input[name=?]', 'comment[content]'

      assert_select 'input[name=?]', 'comment[user_id]'

      assert_select 'input[name=?]', 'comment[commentable_id]'
    end
  end
end
