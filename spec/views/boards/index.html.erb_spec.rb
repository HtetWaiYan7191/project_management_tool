require 'rails_helper'

RSpec.describe "boards/index", type: :view do
  before(:each) do
    assign(:boards, [
      Board.create!(
        title: "Title"
      ),
      Board.create!(
        title: "Title"
      )
    ])
  end

  it "renders a list of boards" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
  end
end
