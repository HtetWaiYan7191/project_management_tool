# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'annoucements/new', type: :view do
  before(:each) do
    assign(:annoucement, Annoucement.new(
                           user: nil,
                           company: nil,
                           title: 'MyString',
                           is_all_department: false
                         ))
  end

  it 'renders new annoucement form' do
    render

    assert_select 'form[action=?][method=?]', annoucements_path, 'post' do
      assert_select 'input[name=?]', 'annoucement[user_id]'

      assert_select 'input[name=?]', 'annoucement[company_id]'

      assert_select 'input[name=?]', 'annoucement[title]'

      assert_select 'input[name=?]', 'annoucement[is_all_department]'
    end
  end
end
