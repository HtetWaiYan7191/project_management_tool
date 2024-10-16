# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'messages/show', type: :view do
  before(:each) do
    assign(:message, Message.create!(
                       content: 'Content'
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Content/)
  end
end
