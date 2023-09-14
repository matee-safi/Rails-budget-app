# spec/controllers/entities_controller_spec.rb

require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do
  # Assuming you have set up FactoryBot and Devise for testing

  let(:user) { create(:user) } # Create a test user
  let(:group) { create(:group, user: user) } # Create a test group

  before do
    sign_in user # Sign in the test user
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: { group_id: group.id }
      expect(response).to be_successful
    end

    it 'renders the new template' do
      get :new, params: { group_id: group.id }
      expect(response).to render_template('new')
    end

    it 'assigns a new entity as @entity' do
      get :new, params: { group_id: group.id }
      expect(assigns(:entity)).to be_a_new(Entity)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_attributes) { { name: 'Test Entity', amount: 100.0 } }

      it 'creates a new Entity' do
        expect {
          post :create, params: { group_id: group.id, entity: valid_attributes }
        }.to change(Entity, :count).by(1)
      end

      it 'redirects to the group page' do
        post :create, params: { group_id: group.id, entity: valid_attributes }
        expect(response).to redirect_to(group_path(group))
      end

      it 'sets the author of the entity to the current user' do
        post :create, params: { group_id: group.id, entity: valid_attributes }
        expect(Entity.last.author).to eq(user)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { name: nil, amount: nil } }

      it 'does not create a new Entity' do
        expect {
          post :create, params: { group_id: group.id, entity: invalid_attributes }
        }.to_not change(Entity, :count)
      end

      it 'renders the new template' do
        post :create, params: { group_id: group.id, entity: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end
end
