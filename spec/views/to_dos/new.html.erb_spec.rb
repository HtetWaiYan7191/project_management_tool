# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'to_dos/new', type: :view do
  before(:each) do
    assign(:to_do, ToDo.new(
                     name: 'MyString',
                     company: nil
                   ))
  end

  it 'renders new to_do form' do
    render

    assert_select 'form[action=?][method=?]', to_dos_path, 'post' do
      assert_select 'input[name=?]', 'to_do[name]'

      assert_select 'input[name=?]', 'to_do[company_id]'
    end
  end
end
