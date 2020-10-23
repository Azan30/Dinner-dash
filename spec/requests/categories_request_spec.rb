require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:category) { FactoryBot.create(:category) }
  let(:admin) { FactoryBot.create(:user) }

  before(:each) do
    admin.type = 'Admin'
    sign_in admin
  end

  describe 'GET #index' do
    it 'returns all categories' do
      get :index

      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    it 'return one category' do
      get :show, params: { id: category.id }

      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    it 'assigns a new category to @category' do
      get :new

      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #edit' do
    it 'find and edit the category' do
      get :edit, params: { id: category.id, category: { title: 'yoyo' } }
      expect(response).to have_http_status(200)
    end
  end

  describe "POST categories#create" do
    it 'create category with valid attributes' do
      post :create, params: { category: { title: 'french2' } }

      expect(Category.find_by(title: 'french2').present?).to eq(true)
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the category" do
      delete :destroy, params: { id: category.id }

      expect(Category.find_by(id: category.id)).to eq(nil)
      expect(response).to have_http_status(302)
    end
  end

  describe 'UPDATE #update' do
    it "update the category" do
      patch :update, params: { id: category.id, category: { title: 'abcd' } }

      expect(Category.find_by(title: 'abcd').present?).to eq(true)
      expect(response.status).to eq(200)
    end
  end
end
