# spec/controllers/groups_controller_spec.rb

require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  let(:user) { create(:user) } # Assuming you have FactoryBot set up

  before do
    sign_in user # Sign in a user before each test
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:group) { create(:group, user:) }

    it 'returns a success response' do
      get :show, params: { id: group.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { { name: 'Test Group' } }

    context 'with valid parameters' do
      it 'creates a new Group' do
        expect do
          post :create, params: { group: valid_attributes }
        end.to change(Group, :count).by(1)
      end

      it 'redirects to the groups index page' do
        post :create, params: { group: valid_attributes }
        expect(response).to redirect_to(groups_url)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Group' do
        expect do
          post :create, params: { group: { name: nil } }
        end.to_not change(Group, :count)
      end

      it 'renders the new template' do
        post :create, params: { group: { name: nil } }
        expect(response).to render_template('new')
      end
    end
  end
end
