# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'to_do_lists/index', type: :view do
  before(:each) do
    assign(:to_do_lists, [
             ToDoList.create!(
               to_do: nil,
               creator: nil,
               name: 'Name',
               note: 'Note'
             ),
             ToDoList.create!(
               to_do: nil,
               creator: nil,
               name: 'Name',
               note: 'Note'
             )
           ])
  end

  it 'renders a list of to_do_lists' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Note'.to_s), count: 2
  end
end
