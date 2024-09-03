require 'rails_helper'

RSpec.describe "boards/edit", type: :view do
  let(:board) {
    Board.create!(
      title: "MyString"
    )
  }

  before(:each) do
    assign(:board, board)
  end

  it "renders the edit board form" do
    render

    assert_select "form[action=?][method=?]", board_path(board), "post" do

      assert_select "input[name=?]", "board[title]"
    end
  end
end
