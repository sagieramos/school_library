#!/usr/bin/ruby -w

require 'pry'
require_relative 'modules/person'
require_relative 'modules/student'
require_relative 'modules/teacher'
require_relative 'modules/decorator'
require_relative 'modules/book'
require_relative 'modules/classroom'
require_relative 'modules/rental'

puts "DAY 1\n--------------------------"
person = Person.new(25, 'maximilianus')
puts 'Person Info:'
puts "ID: #{person.id}"
puts "Name: #{person.name}"
puts "Age: #{person.age}"
puts "Can use services? #{person.can_use_services? && 'Yes!'}"
puts '--------------------------'

student = Student.new(16, 'Ramos')
puts 'Student Info:'
puts "ID: #{student.id}"
puts "Name: #{student.name}"
puts "Age: #{student.age}"
puts "Can use services? #{student.can_use_services? && 'Yes!'}"
puts "Play hooky: #{student.play_hooky}"
puts '--------------------------'

teacher = Teacher.new(16, 'Science', 'Mr. Debo')
puts 'Teacher Info:'
puts "ID: #{teacher.id}"
puts "Name: #{teacher.name}"
puts "Age: #{teacher.age}"
puts "Can use services? #{teacher.can_use_services? && 'Yes!'}\n\n"

puts "DAY 2\n--------------------------"
puts 'The following code check if you managed to decorate your person'
puts '--------------------------'

puts "PERSON NAME:\t#{person.name}\n"

capitalize_name = CapitalizeDecorator.new(person)
puts "Capitalized:\t#{capitalize_name.correct_name}"

capitalized_trimmed_person = TrimmerDecorator.new(capitalize_name)
puts "Trimmed:\t#{capitalized_trimmed_person.correct_name}"

puts "\nDAY 3\n--------------------------\n"

classroom1 = Classroom.new('Class One')
classroom2 = Classroom.new('Class Two')
student1 = Student.new(16, 'Ramos')
student2 = Student.new(14, 'Osagie')
student3 = Student.new(16, 'Tobi')
student4 = Student.new(14, 'Jasay')

classroom1.add_student(student1)
classroom1.add_student(student2)
classroom2.add_student(student3)
classroom2.add_student(student3)
classroom2.add_student(student4)

[classroom1, classroom2].each do |classroom|
  puts "Students in #{classroom.label}:\t#{classroom.students.map(&:name).join(', ')}"
end

puts "--------------------------\n\nList of all students and their classroom\n\n"

[student1, student2, student3, student4].each_with_index do |s, i|
  puts "#{i + 1} #{s.name} (#{s.age}yrs): \t#{s.classroom.label}"
end

puts "--------------------------\n\n"

# Create book instances
book1 = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
book2 = Book.new('To Kill a Mockingbird', 'Harper Lee')
book3 = Book.new('Ride or die', 'Unknown')
book4 = Book.new('Turok', 'Redeem')

person2 = Person.new(29, 'Abraham')
person3 = Person.new(29, 'Abija')
person4 = Person.new(24, 'Deborah')
person5 = Person.new(15, 'Tope')

puts "--------------------------\nCreating teacher"

teacher1 = Teacher.new(30, 'Chemistry', 'Mr Kaburu')
teacher2 = Teacher.new(30, 'FineArt', 'Mr Kudus')
teacher3 = Teacher.new(30, 'Physics', 'Mr Agbola')

puts "\nAdding Book to rental from book class"

puts book1.add_rental(person)
puts book1.add_rental(person2)
puts book1.add_rental(person3)
puts book1.add_rental(person3)
puts book2.add_rental(person2)
puts book2.add_rental(person4)
puts book2.add_rental(student1)
puts book2.add_rental(student3)
puts book2.add_rental(student3)
puts book2.add_rental(person4)

puts "\nAdding teacher................................"
puts book2.add_rental(teacher1)

puts "\nAdding Book to rental from person class"

puts person2.add_rental(book3)
puts person.add_rental(book4)
puts person3.add_rental(book2)
puts person3.add_rental(book3)
puts person3.add_rental(book4)
puts person3.add_rental(book4)
puts person3.add_rental(book3)

puts "\nAdding Book to rental from student class"

puts student.add_rental(book1)
puts student.add_rental(book1)
puts student1.add_rental(book1)

puts "\nAdding Book to rental from Teacher class"

puts teacher1.add_rental(book2)
puts teacher1.add_rental(book3)
puts teacher1.add_rental(book4)
puts teacher2.add_rental(book2)
puts teacher3.add_rental(book1)

puts "--------------------------\n\n"

# Print Book Rentals
puts 'Book Rentals:'

[book1, book2, book3].each_with_index do |book, i|
  puts "\n#{i + 1}. \"#{book.title}\"\
  By #{book.author}\
  \n\tRentals: #{book.rentals.map do |rental|
                   "\n\t#{rental.person.name} (#{rental.person.age}yrs)  (#{rental.date})"
                 end.join(', ')}"
end

puts "--------------------------\n\n"
[person, person2, person3, person4, student, student1, student3, person5, teacher1, teacher2,
 teacher3].each_with_index do |p, i|
  specialization = p.is_a?(Teacher) ? " (#{p.specialization} Teaher) " : nil
  puts "\n#{i + 1} #{p.name}#{specialization}is holding"
  p.rentals.each do |rental|
    puts "\t> #{rental.book.title} by #{rental.book.author} (#{rental.date})"
  end
end

puts "--------------------------\n\n"

rent = Rental.new(book1, student1)
puts book3.add_rental(student1)

puts "--------------------------\n\n"
puts book1.rentals

puts "\nPerson/student/teacher instance\n-----".upcase

puts student1.methods - Object.methods
puts "\nbook instance\n-----".upcase
puts book1.methods - Object.methods
puts "\nRentals instance\n-----".upcase
puts rent.methods - Object.methods

puts Rental.new(book2, teacher1).status

puts teacher1.add_rental(book2)
puts book2.add_rental(teacher1)
puts "book1 before creating rental: #{book1.rentals.length}"
puts Rental.new(book1, teacher1).status
# will not add the same rental
puts "book1 after creating rental: #{book1.rentals.length}"
puts Rental.new(book1, teacher1).status
puts "book1 before creating another rental: #{book1.rentals.length}"
puts (result = book1.add_rental(teacher2)).nil? ? 'This is null' : result
puts (result = book1.add_rental(teacher2)).nil? ? 'This is null' : result

binding.pry

puts "program resumes here." 