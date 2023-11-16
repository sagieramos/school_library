require 'date'
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
      expect(person.rentals.count).to eq(1)
    end

    it 'raises an ArgumentError if book is not an instance of the Book class' do
      invalid_book = 'InvalidBook'
      expect do
        Rental.new(invalid_book, person)
      end.to raise_error(ArgumentError, 'Book must be an instance of the Book class.')
    end

    it 'raises an ArgumentError if person is not an instance of the Person class' do
      invalid_person = 'InvalidPerson'
      expect do
        Rental.new(book, invalid_person)
      end.to raise_error(ArgumentError, 'Person must be an instance of the Person class.')
    end
  end
end
