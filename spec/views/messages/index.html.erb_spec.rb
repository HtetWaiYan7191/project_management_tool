require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        content: "Content"
      ),
      Message.create!(
        content: "Content"
      )
    ])
  end

  it "renders a list of messages" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Content".to_s), count: 2
  end
end
