class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(book, person, date)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end
end
