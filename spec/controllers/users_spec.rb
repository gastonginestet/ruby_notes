require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  context 'When user is login' do
    let!(:user) { create(:user) }
    let!(:session) { login_user(user) }

    describe 'GET index' do
      let!(:users) { create_list(:user, 3) }
      subject { get :index }

      it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
      end
    end

    describe 'GET show' do
      subject { get :show, params: { id: user.id } }

      it 'renders the show template' do
        subject
        expect(response).to render_template(:show)
      end

      it 'assigns the correct instance variables' do
        subject
        expect(assigns(:user)).to eq(user)
      end
    end

    describe 'GET new' do
      subject { get :new }

      it 'renders the new template' do
        subject
        expect(response).to render_template(:new)
      end

      it 'assigns the correct instance variables' do
        subject
        expect(assigns(:user)).to be_a_new_record
      end
    end

    describe 'POST create' do
      let!(:user_params) { FactoryBot.attributes_for(:user) }

      subject { post :create, params: { user: user_params } }

      it 'creates a user' do
        expect { subject }.to change { User.count }.by(1)
        expect(User.last).to have_attributes(user_params.except(:password, :password_confirmation))
      end

      it 'redirects to users#index' do
        subject
        expect(response).to redirect_to(users_path)
      end
    end

    describe 'GET edit' do
      subject { get :edit, params: { id: user.id } }

      it 'renders the edit template' do
        subject
        expect(response).to render_template(:edit)
      end

      it 'assigns the correct instance variables' do
        subject
        expect(assigns(:user)).to eq(user)
      end
    end

    describe 'PUT update' do
      let!(:user_params) { FactoryBot.attributes_for(:user) }

      subject { put :update, params: { id: user.id, user: user_params } }

      it 'updates a user' do
        subject
        expect(user.reload).to have_attributes(user_params.except(:password, :password_confirmation))
      end

      it 'redirects to users#index' do
        subject
        expect(response).to redirect_to(user_path)
      end
    end

    describe 'DELETE destroy' do
      subject { delete :destroy, params: { id: user.id } }

      it 'destroys a user' do
        expect { subject }.to change { User.count }.by(-1)
      end

      it 'redirects to users#index' do
        subject
        expect(response).to redirect_to(users_path)
      end
    end
  end
end
