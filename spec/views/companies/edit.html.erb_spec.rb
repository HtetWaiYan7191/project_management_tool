# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'companies/edit', type: :view do
  let(:company) do
    Company.create!
  end

  before(:each) do
    assign(:company, company)
  end

  it 'renders the edit company form' do
    render

    assert_select 'form[action=?][method=?]', company_path(company), 'post' do
    end
  end
end
