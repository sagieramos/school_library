require 'date'
require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person)
    rental = Rental.new(self, person, Date.today)
    @rentals << rental
  end
end
