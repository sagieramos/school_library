require_relative '../modules/book'
require_relative '../modules/person'

RSpec.describe Book do
  let(:book) { Book.new('Title', 'Author') }

  describe '#initialize' do
    it 'creates a new book with the given title and author' do
      expect(book.title).to eq('Title')
      expect(book.author).to eq('Author')
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
  let(:person) { Person.new(20, 'Ayo', 1, parent_permission: true) }

    it 'adds a rental for the book with the given person' do
      rental = book.add_rental(person)
      expect(rental).to be_an_instance_of(Rental)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(book.rentals).to include(rental)
    end

    it 'prevents adding duplicate rentals for the same person' do
      book.add_rental(person)
      message = book.add_rental(person)
      expect(message).to eq('Ayo(1) already owns this book')
    end
  end
end
