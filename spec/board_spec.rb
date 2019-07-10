require './lib/board'

RSpec.describe Board do
  describe '#add ' do
    board = Board.new
    it 'adding valid tile and value' do
      expect( board.add(1,'x') ).to eql('x')
      expect( board.add(2,'o') ).to eql('o')
      expect( board.add(5,'x') ).to eql('x')
      expect( board.add(9,'o') ).to eql('o')
    end
    it 'adding unvalid tile and value' do
      expect( board.add(10,'x') ).to eql(false)
      expect( board.add(-6,'o') ).to eql(false)
      expect( board.add(5,'x') ).to eql(false)
      expect( board.add(9,'o') ).to eql(false)
    end
  end
  describe '#clear ' do
    board = Board.new
    empty_matrix = [[1,2,3],[4,5,6],[7,8,9]]
    board.add(1,'x')
    board.add(5,'o')
    board.add(3,'x')
    board.add(9,'x')
    board.add(2,'o')
    it 'clears the board' do
      expect( board.clear ).to eql(empty_matrix)
    end
  end
  describe '#check_row ' do
    it 'checks winning rows' do
      board = Board.new
      board.add(1,'x')
      board.add(4,'o')
      board.add(2,'x')
      board.add(5,'o')
      board.add(3,'x')
      expect( board.check_row(1,'x') ).to eql(true)
      board.clear
      board.add(5,'o')
      board.add(4,'o')
      board.add(6,'o')
      expect( board.check_row(6,'o') ).to eql(true)
      board.clear
      board.add(9,'x')
      board.add(7,'x')
      board.add(8,'x')
      expect( board.check_row(8,'x') ).to eql(true)
    end
    it 'checks loosing rows' do
      board = Board.new
      board.add(1,'x')
      board.add(4,'o')
      board.add(2,'o')
      board.add(5,'o')
      board.add(3,'x')
      expect( board.check_row(1,'x') ).to eql(false)
      board.clear
      board.add(5,'o')
      board.add(4,'x')
      board.add(6,'o')
      expect( board.check_row(6,'o') ).to eql(false)
      board.clear
      board.add(9,'x')
      board.add(8,'x')
      expect( board.check_row(8,'o') ).to eql(false)
      board.clear
      board.add(9,'x')
      board.add(7,'o')
      board.add(8,'x')
      expect( board.check_row(8,'o') ).to eql(false)
    end
  end
  describe '#check_col ' do
    it 'checks winning columns' do
      board = Board.new
      board.add(1,'x')
      board.add(2,'o')
      board.add(4,'x')
      board.add(5,'o')
      board.add(7,'x')
      expect( board.check_col(1,'x') ).to eql(true)
      board.clear
      board.add(2,'o')
      board.add(5,'o')
      board.add(8,'o')
      expect( board.check_col(8,'o') ).to eql(true)
      board.clear
      board.add(9,'x')
      board.add(6,'x')
      board.add(3,'x')
      expect( board.check_col(3,'x') ).to eql(true)
    end
    it 'checks loosing columns' do
      board = Board.new
      board.add(1,'x')
      board.add(4,'o')
      board.add(2,'o')
      board.add(7,'o')
      board.add(3,'x')
      expect( board.check_col(1,'x') ).to eql(false)
      board.clear
      board.add(8,'o')
      board.add(2,'x')
      board.add(5,'o')
      expect( board.check_col(5,'o') ).to eql(false)
      board.clear
      board.add(9,'x')
      board.add(6,'o')
      board.add(3,'x')
      expect( board.check_col(9,'o') ).to eql(false)
      board.clear
      board.add(9,'x')
      board.add(8,'x')
      expect( board.check_col(8,'o') ).to eql(false)
    end
  end
  describe '#check_d ' do
    it 'checks winning diagonals' do
      board = Board.new
      board.add(1,'x')
      board.add(4,'o')
      board.add(5,'x')
      board.add(3,'o')
      board.add(9,'x')
      expect( board.check_d('x') ).to eql(true)
      board.clear
      board.add(3,'o')
      board.add(5,'o')
      board.add(7,'o')
      expect( board.check_d('o') ).to eql(true)
    end
    it 'checks loosing diagonals' do
      board = Board.new
      board.add(1,'x')
      board.add(4,'o')
      board.add(2,'o')
      board.add(5,'o')
      board.add(9,'x')
      expect( board.check_d('x') ).to eql(false)
      board.clear
      board.add(3,'o')
      board.add(7,'x')
      board.add(5,'o')
      expect( board.check_d('o') ).to eql(false)
      board.clear
      board.add(9,'x')
      board.add(8,'x')
      expect( board.check_d('o') ).to eql(false)
    end
  end
  describe '#check ' do
    it 'checks winning boards' do
      board = Board.new
      board.add(1,'x')
      board.add(4,'o')
      board.add(5,'x')
      board.add(3,'o')
      board.add(9,'x')
      expect( board.check(9,'x') ).to eql(true)
      board.clear
      board.add(3,'o')
      board.add(5,'o')
      board.add(7,'o')
      expect( board.check(7,'o') ).to eql(true)
      board.clear
      board.add(1,'o')
      board.add(4,'o')
      board.add(2,'o')
      board.add(7,'o')
      board.add(3,'x')
      expect( board.check(7,'o') ).to eql(true)
    end
    it 'checks loosing boards' do
      board = Board.new
      board.add(1,'x')
      board.add(4,'o')
      board.add(2,'o')
      board.add(5,'o')
      board.add(9,'x')
      expect( board.check(9,'o') ).to eql(false)
      board.clear
      board.add(3,'o')
      board.add(7,'x')
      board.add(5,'o')
      expect( board.check(5,'o') ).to eql(false)
      board.clear
      board.add(9,'x')
      board.add(8,'x')
      expect( board.check(8,'o') ).to eql(false)
    end
  end
end
