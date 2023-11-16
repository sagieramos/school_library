require_relative '../modules/rental'
require_relative '../modules/book'
require_relative '../modules/person'
RSpec.describe Rental do
  let(:book) { Book.new('Title', 'Author') }
  let(:person) { Person.new(25, 'Alice', 1, parent_permission: true) }
  describe '#initialize' do
    it 'creates a new rental with the given book, person, and date' do
      date = DateTime.now
      rental = Rental.new(book, person, date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.date).to eq(date)
      expect(rental.status).to be true
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
    it 'prevents creating a duplicate rental for the same book and person' do
      Rental.new(book, person)
      rental = Rental.new(book, person)
      expect(rental.status).to be false
      expect(book.rentals.count(person)).to eq(1)
      expect(person.rentals.count(book)).to eq(1)
    end
  end
end 