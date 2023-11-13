require_relative 'book'
require_relative 'classroom'
require_relative 'decorator'
require_relative 'nameable'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class LibraryManagement
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts "\nNo books to display. Create a book!"
    else
      puts "\nBooks:"
      @books.each_with_index { |book, i| puts "#{i}) #{book.title} by #{book.author}" }
    end
  end

  def list_people
    if @people.empty?
      puts "\nNo people to display. Create a person!"
    else
      puts "\nPeople:"
      @people.each_with_index do |person, i|
        person_type = person.is_a?(Teacher) ? 'Teacher' : 'Student'
        specialization = person.is_a?(Teacher) ? "specialization: #{person.specialization}" : nil
        puts "#{i}) [#{person_type}] name: #{person.name}, ID: #{person.id}, age: #{person.age}, #{specialization}"
      end
    end
  end

  def create_person
    print "\nDo you want to create a student (1) or a teacher (2)? [Input the number]: "
    person_type = gets.chomp.to_i

    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option. Please choose (1) for Student or (2) for Teacher.'
    end
  end

  def create_teacher
    age = nil
    loop do
      print 'Age: '
      age = gets.chomp.to_i
      break if age > 18

      puts 'Teacher age must be 18 or greater. Please try again.'
    end

    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts "Teacher #{teacher.name} created successfully!"
  end

  def create_student
    age = nil
    loop do
      print 'Age: '
      age = gets.chomp.to_i
      break if age.positive?

      puts 'Age must be greater than 0. Please try again.'
    end

    name = get_non_empty_input('Name')
    student = Student.new(age, name)
    @people << student
    puts "Student #{student.name} created successfully!"
  end

  def create_book
    title = get_non_empty_input('Title')
    author = get_non_empty_input('Author')

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully!'
  end

  def create_rental
    list_people
    print 'Select a person from the following list by number (not id): '
    person_id = gets.chomp.to_i
    person = @people[person_id]

    unless person
      puts 'Person not found!'
      return
    end

    list_books
    print 'Select a book from the following list by number: '
    book_id = gets.chomp.to_i
    book = @books[book_id]

    unless book
      puts 'Book not found!'
      return
    end

    rental = person.add_rental(book)
    @rentals << rental

    puts "#{person.name} (ID: #{person.id}) has successfully rented #{book.title}!"
  end

  def list_rentals_for_person
    list_people
    print "\nEnter the ID of the person to list rentals: "
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }

    unless person
      puts 'Person not found!'
      return
    end

    person_type = person.is_a?(Teacher) ? 'Teacher' : 'Student'

    puts "Rentals for [#{person_type}] #{person.name} (ID: #{person.id}):"
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  private

  def get_non_empty_input(prompt)
    input = nil
    loop do
      print "#{prompt}: "
      input = gets.chomp.strip
      break unless input.empty?

      puts "#{prompt} cannot be empty. Please try again."
    end
    input
  end
end
