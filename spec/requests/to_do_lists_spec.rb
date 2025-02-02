# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/to_do_lists', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # ToDoList. As you add validations to ToDoList, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      ToDoList.create! valid_attributes
      get to_do_lists_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      to_do_list = ToDoList.create! valid_attributes
      get to_do_list_url(to_do_list)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_to_do_list_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      to_do_list = ToDoList.create! valid_attributes
      get edit_to_do_list_url(to_do_list)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new ToDoList' do
        expect do
          post to_do_lists_url, params: { to_do_list: valid_attributes }
        end.to change(ToDoList, :count).by(1)
      end

      it 'redirects to the created to_do_list' do
        post to_do_lists_url, params: { to_do_list: valid_attributes }
        expect(response).to redirect_to(to_do_list_url(ToDoList.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new ToDoList' do
        expect do
          post to_do_lists_url, params: { to_do_list: invalid_attributes }
        end.to change(ToDoList, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post to_do_lists_url, params: { to_do_list: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested to_do_list' do
        to_do_list = ToDoList.create! valid_attributes
        patch to_do_list_url(to_do_list), params: { to_do_list: new_attributes }
        to_do_list.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the to_do_list' do
        to_do_list = ToDoList.create! valid_attributes
        patch to_do_list_url(to_do_list), params: { to_do_list: new_attributes }
        to_do_list.reload
        expect(response).to redirect_to(to_do_list_url(to_do_list))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        to_do_list = ToDoList.create! valid_attributes
        patch to_do_list_url(to_do_list), params: { to_do_list: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested to_do_list' do
      to_do_list = ToDoList.create! valid_attributes
      expect do
        delete to_do_list_url(to_do_list)
      end.to change(ToDoList, :count).by(-1)
    end

    it 'redirects to the to_do_lists list' do
      to_do_list = ToDoList.create! valid_attributes
      delete to_do_list_url(to_do_list)
      expect(response).to redirect_to(to_do_lists_url)
    end
  end
end
