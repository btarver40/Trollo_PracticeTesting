require 'rails_helper'

RSpec.describe ListsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      list = FactoryBot.create(:list)
      get :index, params: { board_id: list.board_id }
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
      list = FactoryBot.create(:list)
      get :show, params: { board_id: list.board_id, id: list.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns http success" do
      # GET /board/new
      list = FactoryBot.create(:list)
      get :new, params: { board_id: list.board_id }
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "allows the user to edit their list" do
      # GET /boards/5/edit
      list = FactoryBot.create(:list)
      get :edit, params: {board_id: list.board_id, id: list.id}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "allows the user to create a list" do
      list = FactoryBot.create(:list)
      expect {
        post :create, params: { board_id: list.board_id, list: { title: 'get passports', priority: 2 }}
      }.to change(List, :count).by(1)
    end

    it "redirects the user to the board" do
      board = FactoryBot.create(:board)
      post :create, params: {board_id: board.id, list: {title: 'get dog', priority: 1}}
      expect(response).to redirect_to(board_list_path(board.id, List.all.last))
    end
  end

  describe "PUT #update" do
    it "updates the requested list" do
      list = FactoryBot.create(:list)
      put :update, params: { board_id: list.board_id, id: list.id, list: {title: 'trip to texas'}}
      list.reload
      expect(list.title).to eq('trip to texas')
    end

    it "redirects the user to the list" do
      list = FactoryBot.create(:list)
      put :update, params: {board_id: list.board_id, id: list.id, list: {title: 'trip to texas'}}
      list.reload
      expect(list.title).to redirect_to(board_list_path(list.board_id, list.id))
    end
  end

  describe "DELETE #destroy" do
    it "destroys the list" do
      list = FactoryBot.create(:list)
      expect {
        delete :destroy, params: {id: list.id, board_id: list.board_id }
      }.to change(List, :count).by(-1)
    end

    it 'redirects to the board page' do
      list = FactoryBot.create(:list)
      delete :destroy, params: { id: list.id, board_id: list.board_id }
      expect(response).to redirect_to(board_path(list.board_id))
    end
  end
end
