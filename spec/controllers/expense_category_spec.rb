require 'rails_helper'

RSpec.describe ExpenseCategoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:expense_category) { create(:expense_category, user:) }
  let(:valid_attributes) { attributes_for(:expense_category, user:) }
  let(:invalid_attributes) { attributes_for(:expense_category, name: nil) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'assigns a new expense category to @expense_category' do
      get :new, params: { user_id: user.id }
      expect(assigns(:expense_category)).to be_a_new(ExpenseCategory)
    end

    it 'renders the new template' do
      get :new, params: { user_id: user.id }
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'redirects to the user show page' do
        post :create, params: { user_id: user.id, expense_category: valid_attributes }
        expect(response).to redirect_to(user_path(user))
      end

      it 'sets a flash success message' do
        post :create, params: { user_id: user.id, expense_category: valid_attributes }
        expect(flash[:success]).to eq(' Category created ')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new expense category for the user' do
        expect do
          post :create, params: { user_id: user.id, expense_category: invalid_attributes }
        end.not_to change(user.expense_categories, :count)
      end

      it 'renders the new template' do
        post :create, params: { user_id: user.id, expense_category: invalid_attributes }
        expect(response).to render_template(:new)
      end

      it 'sets the status to unprocessable entity' do
        post :create, params: { user_id: user.id, expense_category: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the current expense category to @current_exp_category' do
      get :show, params: { user_id: user.id, id: expense_category.id }
      expect(assigns(:current_exp_category)).to eq(expense_category)
    end

    it 'assigns the current expense category\'s expenses to @expenses' do
      get :show, params: { user_id: user.id, id: expense_category.id }
      expect(assigns(:expenses)).to match_array(expense_category.expenses.sort_by(&:created_at).reverse)
    end

    it 'renders the show template' do
      get :show, params: { user_id: user.id, id: expense_category.id }
      expect(response).to render_template(:show)
    end
  end
end
