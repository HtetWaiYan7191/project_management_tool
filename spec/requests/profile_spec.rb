# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Profiles', type: :request do
  describe 'GET /edit' do
    it 'returns http success' do
      get '/profile/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/profile/update'
      expect(response).to have_http_status(:success)
    end
  end
end
