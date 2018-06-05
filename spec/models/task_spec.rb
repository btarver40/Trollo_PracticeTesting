require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'attributes' do
    [:body, :priority].each { |attr| it { should respond_to attr }}
  end

  describe 'validations' do
    it { should validate_presence_of(:body) }
  end

  describe 'methods' do
    before(:each) do
      @task1 = Task.create(body: 'Need passports!', priority: 1)
      @task2 = Task.create(body: 'Get marriage license', priority: 3)
      @task3 = Task.create(body: 'Go to Petsmart', priority: 4)
      @task4 = Task.create(body: 'Get paint!', priority: 2)
    end

    it 'orders board names from a to z' do
      @tasks = Task.by_body
      expect(@tasks).to eq([@task2, @task4, @task3, @task1])
    end

    it 'order board by priority asc' do
      @tasks = Task.by_priority
      expect(@tasks).to eq([@task1, @task4, @task2, @task3])
    end
  end
end



# BODY AND PRIORITY
# RSpec.describe Task, type: :model do
#   let(:task){FactoryBot.create(:task)}
# end

# it 'allows user to type in their task' do
#   expect(task.input).to eq('user task')
# end

# it 'allows user to input a priority' do
#   expect(task.priority).to eq(1)
# end

