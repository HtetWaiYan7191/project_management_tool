# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'boards/show', type: :view do
  before(:each) do
    assign(:board, Board.create!(
                     title: 'Title'
                   ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
  end
end
