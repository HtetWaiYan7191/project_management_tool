# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'annoucements/edit', type: :view do
  let(:annoucement) do
    Annoucement.create!(
      user: nil,
      company: nil,
      title: 'MyString',
      is_all_department: false
    )
  end

  before(:each) do
    assign(:annoucement, annoucement)
  end

  it 'renders the edit annoucement form' do
    render

    assert_select 'form[action=?][method=?]', annoucement_path(annoucement), 'post' do
      assert_select 'input[name=?]', 'annoucement[user_id]'

      assert_select 'input[name=?]', 'annoucement[company_id]'

      assert_select 'input[name=?]', 'annoucement[title]'

      assert_select 'input[name=?]', 'annoucement[is_all_department]'
    end
  end
end
