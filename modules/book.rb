require 'date'
require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person)
    return "#{person.name}(#{person.id}) already own this book" if rentals.any? { |rental| rental.person == person }

    Rental.new(self, person, DateTime.now)
  end
end
