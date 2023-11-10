require 'date'

class Rental
  attr_accessor :date
  attr_reader :book, :person, :status

  def initialize(book, person, date = DateTime.now)
    raise ArgumentError, 'Book must be an instance of the Book class.' unless book.is_a?(Book)
    raise ArgumentError, 'Person must be an instance of the Person class.' unless person.is_a?(Person)

    @date = date
    @book = book
    @person = person

    # Check if a rental with the same book and person already exists
    existing_rental = book.rentals.find { |rental| rental.person == person }

    if existing_rental
      @status = false
    else
      book.rentals << self
      person.rentals << self
      @status = true
    end
  end
end
