require 'rails_helper'

RSpec.describe ListsController, type: :controller do

  let(:valid_attributes){
    {title: 'Cruise', priority: 2}
  }

  let(:invalid_attributes){
    {title: '', priority: 2}
  }

  describe "GET #index" do
    it "returns http success" do
      list = FactoryBot.create!(:list)
      get :index, params: {board_id: list.board_id}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
      list = FactoryBot.create!(:list)
      get :show, params: {id: board.id id: list.id}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns http success" do
      # GET /board/new
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "allows the user to edit their list" do
      # GET /boards/5/edit
      list = FactoryBot.create!(:list)
      get :edit, params: {id: board.id, id: list.id}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "test with valid params" do
      it "allows the user to create a list" do
        list = FactoryBot.create!(:list)
        expect {
          post :create, params: {list:}
        }.to change(List, :count).by(1)
      end

      it "redirects the user to the created list" do
        post :create, params: {list: valid_attributes}
        expect(response).to redirect_to(List.last)
      end
    end

    context "test with invalid params" do
      it "does not create new list" do
        expect {
          post :create, params: {list: invalid_attributes}
        }.to change(List, :count).by(0)
      end

      it "renders the create form" do
        post :create, params: {list: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end


  describe "PUT #update" do
    let(:new_attributes) {
      { title: 'trip to texas'}
    }

    context "with valid params" do
      it "updates the requested list" do
        list = FactoryBot.create!(:list)
        put :update, params: {id: list.id, list: new_attributes}
        board.reload
        expect(list.title).to eq(new_attributes[:title])
      end

      it "redirects the user to the list" do
        llist = FactoryBot.create!(:list)
        put :update, params: {id: list.id, list: new_attributes}
        expect(response).to redirect_to(list)
      end
    end

    context "with invalid params" do
      it "does not update the users list" do
        list = FactoryBot.create!(:list)
        put :update, params: {id: list.id, list: invalid_attributes}
        expect(list.title).to_not eq(invalid_attributes[:title])
      end

      it "returns a success (edit form)" do
        list = FactoryBot.create!(:list)
        put :update, params: {id: list.id, list: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end
2
  describe "DELETE #destroy" do
    itlist = FactoryBot.create!(:list)
      expect {
        delete :destroy, params: {id: board.id, id: list.id}
      }.to change(List, :count).by(-1)
    end

    it "redirects the user to the board list" do 
      list = FactoryBot.create!(:list)
      delete :destroy, params: {id: list.id}
      expect(response).to redirect_to(board_lists_path)
    end
  end
end
