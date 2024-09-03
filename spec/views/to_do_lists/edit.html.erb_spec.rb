# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'to_do_lists/edit', type: :view do
  let(:to_do_list) do
    ToDoList.create!(
      to_do: nil,
      creator: nil,
      name: 'MyString',
      note: 'MyString'
    )
  end

  before(:each) do
    assign(:to_do_list, to_do_list)
  end

  it 'renders the edit to_do_list form' do
    render

    assert_select 'form[action=?][method=?]', to_do_list_path(to_do_list), 'post' do
      assert_select 'input[name=?]', 'to_do_list[to_do_id]'

      assert_select 'input[name=?]', 'to_do_list[creator_id]'

      assert_select 'input[name=?]', 'to_do_list[name]'

      assert_select 'input[name=?]', 'to_do_list[note]'
    end
  end
end
