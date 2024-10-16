# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'boards/edit', type: :view do
  let(:board) do
    Board.create!(
      title: 'MyString'
    )
  end

  before(:each) do
    assign(:board, board)
  end

  it 'renders the edit board form' do
    render

    assert_select 'form[action=?][method=?]', board_path(board), 'post' do
      assert_select 'input[name=?]', 'board[title]'
    end
  end
end
