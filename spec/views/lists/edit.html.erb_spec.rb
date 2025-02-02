# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'lists/edit', type: :view do
  let(:list) do
    List.create!
  end

  before(:each) do
    assign(:list, list)
  end

  it 'renders the edit list form' do
    render

    assert_select 'form[action=?][method=?]', list_path(list), 'post' do
    end
  end
end
