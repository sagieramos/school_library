#!/usr/bin/ruby -w

require_relative 'modules/person'
require_relative 'modules/student'
require_relative 'modules/teacher'
require_relative 'modules/decorator'
require_relative 'modules/book'
require_relative 'modules/rental'
require_relative 'modules/classroom'

puts "DAY 1\n--------------------------"
person = Person.new(25, name: 'maximilianus')
puts 'Person Info:'
puts "ID: #{person.id}"
puts "Name: #{person.name}"
puts "Age: #{person.age}"
puts "Can use services? #{person.can_use_services? && 'Yes!'}"
puts '--------------------------'

classroom = Classroom.new('Class A')

student = Student.new(16, classroom, name: 'Ramos')
puts 'Student Info:'
puts "ID: #{student.id}"
puts "Name: #{student.name}"
puts "Age: #{student.age}"
puts "Can use services? #{student.can_use_services? && 'Yes!'}"
puts "Play hooky: #{student.play_hooky}"
puts '--------------------------'

teacher = Teacher.new(16, 'Science', name: 'Mr. Debo')
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

puts "DAY 3\n--------------------------\n"

classroom1 = Classroom.new('Class One')
classroom2 = Classroom.new('Class Two')
student1 = Student.new(16, classroom1, name: 'Ramos')
student2 = Student.new(14, classroom2, name: 'Osagie')
student3 = Student.new(16, classroom1, name: 'Tobi')
student4 = Student.new(14, classroom2, name: 'Jasay')

puts "#{student1.name} is in #{student1.classroom.label}"
puts "Students in #{classroom1.label}: #{classroom1.students.map(&:name).join(', ')}"
puts "#{student2.name} is in #{student2.classroom.label}"
puts "Students in #{classroom2.label}: #{classroom2.students.map(&:name).join(', ')}"

puts "--------------------------\n"
classroom1.add_student(student1)
classroom1.add_student(student3)
classroom2.add_student(student2)
classroom2.add_student(student4)

puts "#{student1.name} is in #{student1.classroom.label}"
puts "Students in #{classroom1.label}: #{classroom1.students.map(&:name).join(', ')}"
puts "#{student2.name} is in #{student2.classroom.label}"
puts "Students in #{classroom2.label}: #{classroom2.students.map(&:name).join(', ')}"

puts "--------------------------\n\n"

# Create book instances
book1 = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
book2 = Book.new('To Kill a Mockingbird', 'Harper Lee')
book3 = Book.new('1984', 'George Orwell')
book4 = Book.new('1960', 'Unknown')

person2 = Person.new(29, name: 'Abraham')
person3 = Person.new(29, name: 'Abija')
person4 = Person.new(24, name: 'Nomal')

rental1 = Rental.new(book1, person, '2023-11-10')
rental2 = Rental.new(book2, person2, '2023-11-10')
rental3 = Rental.new(book3, person3, '2023-11-11')
rental4 = Rental.new(book4, person4, '2023-11-11')

# Print Book Rentals
puts 'Book Rentals:'

[rental1, rental2, rental3, rental4].each_with_index do |rental, i|
  puts "#{i + 1}: Book: #{rental.book.title},\
  Author: #{rental.book.author},\
  Rented by: #{rental.person.name},\
  Date: #{rental.date}"
end

# Print Person Rentals
puts "\nPerson Rentals:"

[person, person2, person3, person4].each_with_index do |p, i|
  p.rentals.each do |rental|
    puts "#{i + 1}. #{rental.person.name}, Book: #{rental.book.title},\
    Author: #{rental.book.author},\
    Date: #{rental.date}"
  end
end
