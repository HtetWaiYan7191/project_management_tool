# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  before(:each) do
    assign(:event, Event.create!(
                     title: 'Title',
                     description: 'Description',
                     location: 'Location'
                   ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Location/)
  end
end
