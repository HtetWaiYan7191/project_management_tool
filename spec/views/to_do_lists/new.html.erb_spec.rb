# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'to_do_lists/new', type: :view do
  before(:each) do
    assign(:to_do_list, ToDoList.new(
                          to_do: nil,
                          creator: nil,
                          name: 'MyString',
                          note: 'MyString'
                        ))
  end

  it 'renders new to_do_list form' do
    render

    assert_select 'form[action=?][method=?]', to_do_lists_path, 'post' do
      assert_select 'input[name=?]', 'to_do_list[to_do_id]'

      assert_select 'input[name=?]', 'to_do_list[creator_id]'

      assert_select 'input[name=?]', 'to_do_list[name]'

      assert_select 'input[name=?]', 'to_do_list[note]'
    end
  end
end
