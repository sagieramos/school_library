require 'date'
require_relative '../modules/person'
require_relative '../modules/book'
require_relative '../modules/rental'
require_relative '../modules/decorator'

RSpec.describe Person do
  let(:book) { Book.new('Title', 'Author') }

  describe '#initialize' do
    it 'creates a new person with the given age, name, and parent permission' do
      person = Person.new(20, 'John', 1, parent_permission: true)

      expect(person.age).to eq(20)
      expect(person.name).to eq('John')
      expect(person.id).to eq(1)
      expect(person.parent_permission).to be true
      expect(person.rentals).to be_empty
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      person = Person.new(20, 'Bob', 2, parent_permission: false)
      expect(person.can_use_services?).to be true
    end

    it 'returns true if the person has parent permission' do
      person = Person.new(15, 'Jane', 2, parent_permission: true)
      expect(person.can_use_services?).to be true
    end

    it 'returns false if the person is not of age and has no parent permission' do
      person = Person.new(15, 'Jane', 2, parent_permission: false)
      expect(person.can_use_services?).to be false
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      person = Person.new(30, 'Eve', 5)
      expect(person.correct_name).to eq('Eve')
    end

    it 'returns the correct name with CapitalizeDecorator' do
      person = Person.new(30, 'Eve', 5)
      decorated_person = CapitalizeDecorator.new(person)
      allow(person).to receive(:correct_name).and_return('original name')
      expect(decorated_person.correct_name).to eq('Original name')
    end

    it 'returns the correct name with TrimmerDecorator' do
      person = Person.new(30, 'Eve', 5)
      decorated_person = TrimmerDecorator.new(person)
      allow(person).to receive(:correct_name).and_return('Long Name Example')
      expect(decorated_person.correct_name).to eq('Long Name')
    end
  end

  describe '#add_rental' do
    let(:person) { Person.new(22, 'Frank', 6) }

    it 'adds a rental for the book with the given person' do
      rental = person.add_rental(book)
      expect(rental).to be_an_instance_of(Rental)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(person.rentals).to include(rental)
    end

    it 'prevents adding duplicate rentals for the same book' do
      person.add_rental(book)
      message = person.add_rental(book)
      expect(message).to eq('Frank(6) already owns "Title" by Author')
    end
  end
end
