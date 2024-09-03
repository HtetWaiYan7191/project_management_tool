# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'to_dos/index', type: :view do
  before(:each) do
    assign(:to_dos, [
             ToDo.create!(
               name: 'Name',
               company: nil
             ),
             ToDo.create!(
               name: 'Name',
               company: nil
             )
           ])
  end

  it 'renders a list of to_dos' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
