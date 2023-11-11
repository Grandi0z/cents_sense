require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  let(:user) { create(:user) }
  let(:expense_category) { create(:expense_category, user:) }
  let(:expense) { create(:expense, author: user, expense_category:) }
  let(:valid_attributes) { attributes_for(:expense) }
  let(:invalid_attributes) { attributes_for(:expense, name: nil) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'assigns a new expense to @expense' do
      get :new, params: { user_id: user.id, expense_category_id: expense_category.id }
      expect(assigns(:expense)).to be_a_new(Expense)
    end

    it 'renders the new template' do
      get :new, params: { user_id: user.id, expense_category_id: expense_category.id }
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new expense for the user and the expense category' do
        expect do
          post :create, params: { user_id: user.id, expense_category_id: expense_category.id, expense: valid_attributes }
        end.to change(user.expenses, :count).by(1)
          .and change(expense_category.expenses, :count).by(1)
      end

      it 'redirects to the expense category show page' do
        post :create, params: { user_id: user.id, expense_category_id: expense_category.id, expense: valid_attributes }
        expect(response).to redirect_to(user_expense_category_path(user, expense_category))
      end

      it 'sets a flash success message' do
        post :create, params: { user_id: user.id, expense_category_id: expense_category.id, expense: valid_attributes }
        expect(flash[:success]).to eq(' Expense added ')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new expense for the user and the expense category' do
        expect do
          post :create, params: { user_id: user.id, expense_category_id: expense_category.id, expense: invalid_attributes }
        end.not_to change(expense_category.expenses, :count)
      end

      it 'renders the new template' do
        post :create, params: { user_id: user.id, expense_category_id: expense_category.id, expense: invalid_attributes }
        expect(response).to render_template(:new)
      end

      it 'sets the status to unprocessable entity' do
        post :create, params: { user_id: user.id, expense_category_id: expense_category.id, expense: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
