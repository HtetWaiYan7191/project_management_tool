# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cards/new', type: :view do
  before(:each) do
    assign(:card, Card.new(
                    title: 'MyString'
                  ))
  end

  it 'renders new card form' do
    render

    assert_select 'form[action=?][method=?]', cards_path, 'post' do
      assert_select 'input[name=?]', 'card[title]'
    end
  end
end
