# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'to_do_lists/show', type: :view do
  before(:each) do
    assign(:to_do_list, ToDoList.create!(
                          to_do: nil,
                          creator: nil,
                          name: 'Name',
                          note: 'Note'
                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Note/)
  end
end
