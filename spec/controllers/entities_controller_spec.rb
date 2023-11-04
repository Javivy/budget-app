require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #new' do
    it 'assigns categories and a new entity' do
      sign_in user
      get :new
      expect(assigns(:categories)).to eq(user.groups)
      expect(assigns(:entity)).to be_a_new(Entity)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:group) { create(:group, user: user) }
    let(:valid_params) { { entity: { name: 'Test', amount: 100, group_id: group.id } } }

    before { sign_in user }

    context 'with valid parameters' do
      it 'creates a new entity' do
        expect {
          post :create, params: valid_params
        }.to change(Entity, :count).by(1)
      end

      it 'redirects to the group path' do
        post :create, params: valid_params
        expect(response).to redirect_to(group_path(group))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { entity: { name: '', amount: -10, group_id: group.id } } }

      it 'does not create a new entity' do
        expect {
          post :create, params: invalid_params
        }.not_to change(Entity, :count)
      end

      it 'renders the new template' do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end

      it 'sets flash error message' do
        post :create, params: invalid_params
        expect(flash[:error]).to eq('There was an error creating the new transaction, please try again.')
      end
    end
  end
end
