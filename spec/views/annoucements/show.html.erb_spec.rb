# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'annoucements/show', type: :view do
  before(:each) do
    assign(:annoucement, Annoucement.create!(
                           user: nil,
                           company: nil,
                           title: 'Title',
                           is_all_department: false
                         ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/false/)
  end
end
