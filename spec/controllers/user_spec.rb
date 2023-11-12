require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:expense_categories) { create_list(:expense_category, 3) }

  describe 'GET #show' do
    context 'when the user is signed in' do
      before do
        sign_in user
        get :show
      end

      it 'assigns the current user to @user' do
        expect(assigns(:user)).to eq(user)
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end
    end
  end
end
