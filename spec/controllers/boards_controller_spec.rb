require 'rails_helper'

RSpec.describe BoardsController, type: :controller do

  let(:valid_attributes){
    {name: 'Vacations', color: 'pink', priority: 1}
  }

  let(:invalid_attributes){
    {name: '', color: 'pink', priority: 1}
  }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
      board = Board.create! valid_attributes
      get :show, params: {id: board.id}
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
    it "allows the user to edit their board" do
      # GET /boards/5/edit
      board = Board.create! valid_attributes
      get :edit, params: {id: board.id}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "test with valid params" do
      it "allows the user to create a board" do
        expect {
          post :create, params: {board: valid_attributes}
        }.to change(Board, :count).by(1)
      end

      it "redirects the user to the created list" do
        post :create, params: {board: valid_attributes}
        expect(response).to redirect_to(Board.last)
      end
    end

    context "test with invalid params" do
      it "does not create new board" do
        expect {
          post :create, params: {board: invalid_attributes}
        }.to change(Board, :count).by(0)
      end

      it "renders the create form" do
        post :create, params: {board: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end


  describe "PUT #update" do
    let(:new_attributes) {
      { color: 'green'}
    }

    context "with valid params" do
      it "updates the requested board" do
        board = Board.create! valid_attributes
        put :update, params: {id: board.id, board: new_attributes}
        board.reload
        expect(board.color).to eq(new_attributes[:color])
      end

      it "redirects the user to the board" do
        board = Board.create! valid_attributes
        put :update, params: {id: board.id, board: new_attributes}
        expect(response).to redirect_to(board)
      end
    end

    context "with invalid params" do
      it "does not update the users board" do
        board = Board.create! valid_attributes
        put :update, params: {id: board.id, board: invalid_attributes}
        expect(board.name).to_not eq(invalid_attributes[:name])
      end

      it "returns a success (edit form)" do
        board = Board.create! valid_attributes
        put :update, params: {id: board.id, board: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested board" do
      board = Board.create! valid_attributes
      expect {
        delete :destroy, params: {id: board.id}
      }.to change(Board, :count).by(-1)
    end

    it "redirects the user to the board list" do 
      board = Board.create! valid_attributes
      delete :destroy, params: {id: board.id}
      expect(response).to redirect_to(board)
    end
  end
end
