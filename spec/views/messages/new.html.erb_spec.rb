# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'messages/new', type: :view do
  before(:each) do
    assign(:message, Message.new(
                       content: 'MyString'
                     ))
  end

  it 'renders new message form' do
    render

    assert_select 'form[action=?][method=?]', messages_path, 'post' do
      assert_select 'input[name=?]', 'message[content]'
    end
  end
end
