# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'annoucements/index', type: :view do
  before(:each) do
    assign(:annoucements, [
             Annoucement.create!(
               user: nil,
               company: nil,
               title: 'Title',
               is_all_department: false
             ),
             Annoucement.create!(
               user: nil,
               company: nil,
               title: 'Title',
               is_all_department: false
             )
           ])
  end

  it 'renders a list of annoucements' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
