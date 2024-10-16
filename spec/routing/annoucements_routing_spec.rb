# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AnnoucementsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/annoucements').to route_to('annoucements#index')
    end

    it 'routes to #new' do
      expect(get: '/annoucements/new').to route_to('annoucements#new')
    end

    it 'routes to #show' do
      expect(get: '/annoucements/1').to route_to('annoucements#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/annoucements/1/edit').to route_to('annoucements#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/annoucements').to route_to('annoucements#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/annoucements/1').to route_to('annoucements#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/annoucements/1').to route_to('annoucements#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/annoucements/1').to route_to('annoucements#destroy', id: '1')
    end
  end
end
