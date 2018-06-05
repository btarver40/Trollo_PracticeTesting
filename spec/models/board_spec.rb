require 'rails_helper'

RSpec.describe Board, type: :model do
  describe 'attributes' do
    [:name, :priority, :color].each { |attr| it { should respond_to attr }}
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'methods' do
    before(:each) do
      @board1 = Board.create(name: 'Vacation', color: 'blue', priority: 1)
      @board2 = Board.create(name: 'Wedding', color: 'pink', priority: 3)
      @board3 = Board.create(name: 'New Dog', color: 'yellow', priority: 2)
      @board4 = Board.create(name: 'House', color: 'green', priority: 4)
    end

    it 'orders board names from a to z' do
      @boards = Board.by_name
      expect(@boards).to eq([@board4, @board3, @board1, @board2])
    end

    it 'order board by priority asc' do
      @boards = Board.by_priority
      expect(@boards).to eq([@board1, @board3, @board2, @board4])
    end

    it 'allows user to choose a color for their board' do
      @boards = Board.by_color

    end
  end
end





# RSpec.describe Board, type: :model do
#   let(:board){FactoryBot.create(:board)}
#   end

#   describe 'abilities' do


#   it 'accepts a name for the board' do
#   expect(board.name).to eq('Vacation' )
#   end

#   it 'allows user to choose a color for their board'
#   expect(board.color).to eq('Board color')

#   it 'allows user to input a priority' do
#   expect(board.priority).to eq(1)
#   end

#   it 'allows user to change order of their priority' do
#   expect(board.new_order).to eq('new order of board')
#   end
# end
