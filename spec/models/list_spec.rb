require 'rails_helper'

Rspec.describe List :type, :model do
  describe 'attributes' do
  [:title, :priority].each {|attr| it {should respond_to attr}}
  end

  describe 'validations' do
    it {should validate_presence_of(:title)}
  end

  describe 'methods' do
    before(:each) do
      @list1 = List.create(title: 'Disney Cruise', priority: 4)
      @list2 = List.create(title: 'Get Venue', priority: 1)
      @list3 = List.create(title: 'Dogs Shots', priority: 3)
      @list4 = List.create(title: 'Painting House', priority: 2)
    end

    it 'order list titles from a to z' do
      @lists = List.by_title
      expect(@lists).to eq([@list1, @list3, @list2, @list4])
    end

    # it 'order list titles by z to a' do
    #   @list = List.by_title(:desc)
    #   expect(@lists).to eq([@list4, @list2, @list3, @list1])
    # end

    it 'order list by priority asc' do
      @lists = List.by_priority
      expect(@lists).to eq([@list2, @list4, @list3, @list1])
    end
  end
end



# TITLE AND PRIORITY 
# RSpec.describe List, type: :model do
#   let(:list){FactoryBot.create(:list)}
# end

# it 'allows user to input their task' do
#   expect(list.task).to eq('Your task is:')
#   end

  
#   it 'allows user to input a priority' do
#   expect(list.priority).to eq(1)
#   end




