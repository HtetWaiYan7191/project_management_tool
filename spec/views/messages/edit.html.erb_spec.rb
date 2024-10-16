# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'messages/edit', type: :view do
  let(:message) do
    Message.create!(
      content: 'MyString'
    )
  end

  before(:each) do
    assign(:message, message)
  end

  it 'renders the edit message form' do
    render

    assert_select 'form[action=?][method=?]', message_path(message), 'post' do
      assert_select 'input[name=?]', 'message[content]'
    end
  end
end
