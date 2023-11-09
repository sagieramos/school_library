class Rental
  attr_accessor :date, :book, :person

  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date
  end
end
