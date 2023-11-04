require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    it 'assigns categories' do
      sign_in user
      get :index
      expect(assigns(:categories)).to eq(user.groups)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'assigns a new group' do
      sign_in user
      get :new
      expect(assigns(:group)).to be_a_new(Group)
      expect(assigns(:group).user).to eq(user)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    before { sign_in user }

    context 'with valid parameters' do
      let(:valid_params) { { group: { name: 'New Group', icon: 'icon.png' } } }

      it 'creates a new group' do
        expect {
          post :create, params: valid_params
        }.to change(Group, :count).by(1)
      end

      it 'redirects to groups index' do
        post :create, params: valid_params
        expect(response).to redirect_to(groups_path)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { group: { name: '', icon: '' } } }

      it 'does not create a new group' do
        expect {
          post :create, params: invalid_params
        }.not_to change(Group, :count)
      end

      it 'renders the new template' do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    let(:group) { create(:group, user: user) }

    it 'assigns category, transactions, icon, and total_amount' do
      sign_in user
      get :show, params: { id: group.id }
      expect(assigns(:category)).to eq(group)
      expect(assigns(:transactions)).to eq(group.entities.order('created_at DESC'))
      expect(assigns(:icon)).to eq(group.icon)
      expect(assigns(:total_amount)).to eq(group.entities.sum(&:amount))
      expect(response).to render_template(:show)
    end
  end
end
