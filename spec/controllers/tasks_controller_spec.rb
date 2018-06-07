require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      task = FactoryBot.create(:task)
      get :index, params: { list_id: task.list_id }
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
      task = FactoryBot.create(:task)
      get :show, params: { list_id: task.list_id, id: task.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns http success" do
      # GET /board/new
      task = FactoryBot.create(:task)
      get :new, params: { list_id: task.list_id }
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "allows the user to edit their task" do
      # GET /boards/5/edit
      task = FactoryBot.create(:task)
      get :edit, params: {list_id: task.list_id, id: task.id}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "allows the user to create a task" do
      task = FactoryBot.create(:task)
      expect {
        post :create, params: { list_id: task.list_id, task: { title: 'get passports', priority: 2 }}
      }.to change(Task, :count).by(1)
    end

    it "redirects the user to the list" do
      list = FactoryBot.create(:list)
      post :create, params: {list_id: list.id, task: {title: 'get dog', priority: 1}}
      expect(response).to redirect_to(list_task_path(list.id, Task.all.last))
    end
  end

  describe "PUT #update" do
    it "updates the requested task" do
      task = FactoryBot.create(:task)
      put :update, params: { list_id: task.list_id, id: task.id, task: {title: 'trip to texas'}}
      list.reload
      expect(task.title).to eq('trip to texas')
    end

    it "redirects the user to the task" do
      task = FactoryBot.create(:task)
      put :update, params: {list_id: task.list_id, id: task.id, task: {title: 'trip to texas'}}
      list.reload
      expect(task.title).to redirect_to(list_task_path(task.list_id, task.id))
    end
  end

  describe "DELETE #destroy" do
    it "destroys the task" do
      task = FactoryBot.create(:task)
      expect {
        delete :destroy, params: {id: task.id, list_id: task.list_id }
      }.to change(Task, :count).by(-1)
    end

    it 'redirects to the board page' do
      task = FactoryBot.create(:task)
      delete :destroy, params: { id: task.id, list_id: task.list_id }
      expect(response).to redirect_to(list_path(task.list_id))
    end
  end
end
