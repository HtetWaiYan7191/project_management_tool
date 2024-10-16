# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'departments/edit', type: :view do
  let(:department) do
    Department.create!(
      name: 'MyString',
      company: nil
    )
  end

  before(:each) do
    assign(:department, department)
  end

  it 'renders the edit department form' do
    render

    assert_select 'form[action=?][method=?]', department_path(department), 'post' do
      assert_select 'input[name=?]', 'department[name]'

      assert_select 'input[name=?]', 'department[company_id]'
    end
  end
end
