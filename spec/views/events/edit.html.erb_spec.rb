# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'events/edit', type: :view do
  let(:event) do
    Event.create!(
      title: 'MyString',
      description: 'MyString',
      location: 'MyString'
    )
  end

  before(:each) do
    assign(:event, event)
  end

  it 'renders the edit event form' do
    render

    assert_select 'form[action=?][method=?]', event_path(event), 'post' do
      assert_select 'input[name=?]', 'event[title]'

      assert_select 'input[name=?]', 'event[description]'

      assert_select 'input[name=?]', 'event[location]'
    end
  end
end
