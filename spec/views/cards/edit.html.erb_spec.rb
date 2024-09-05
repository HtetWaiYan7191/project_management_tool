# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'cards/edit', type: :view do
  let(:card) do
    Card.create!(
      title: 'MyString'
    )
  end

  before(:each) do
    assign(:card, card)
  end

  it 'renders the edit card form' do
    render

    assert_select 'form[action=?][method=?]', card_path(card), 'post' do
      assert_select 'input[name=?]', 'card[title]'
    end
  end
end
