require 'date'
require_relative 'nameable'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name = 'Unknown', id = Random.rand(1..1000), parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book)
    return "#{name}(#{id}) already owns \"#{book.title}\" by #{book.author}" if rentals.any? do |rental|
                                                                                  rental.book == book
                                                                                end

    Rental.new(book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
