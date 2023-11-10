require 'date'
require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    raise ArgumentError, 'Title must be a string' unless title.is_a?(String)
    raise ArgumentError, 'Author must be a string' unless author.is_a?(String)

    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date = DateTime.now)
    raise ArgumentError, 'Person must be an instance of the Person class' unless person.is_a?(Person)

    return "#{person.name}(#{person.id}) already own this book" if rentals.any? { |rental| rental.person == person }

    Rental.new(self, person, date)
  end
end
