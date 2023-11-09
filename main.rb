#!/usr/bin/ruby -w

require_relative 'modules/person'
require_relative 'modules/student'
require_relative 'modules/teacher'
require_relative 'modules/decorator'
require_relative 'modules/book'
require_relative 'modules/classroom'

puts "DAY 1\n--------------------------"
person = Person.new(25, name: 'maximilianus')
puts 'Person Info:'
puts "ID: #{person.id}"
puts "Name: #{person.name}"
puts "Age: #{person.age}"
puts "Can use services? #{person.can_use_services? && 'Yes!'}"
puts '--------------------------'

student = Student.new(16, name: 'Ramos')
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

puts "\nDAY 3\n--------------------------\n"

classroom1 = Classroom.new('Class One')
classroom2 = Classroom.new('Class Two')
student1 = Student.new(16, name: 'Ramos')
student2 = Student.new(14, name: 'Osagie')
student3 = Student.new(16, name: 'Tobi')
student4 = Student.new(14, name: 'Jasay')

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

person2 = Person.new(29, name: 'Abraham')
person3 = Person.new(29, name: 'Abija')
person4 = Person.new(24, name: 'Deborah')
person5 = Person.new(15, name: 'Tope')

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

puts "\nAdding Book to rental from person class"

puts person2.add_rental(book3)
puts person.add_rental(book4)
puts person3.add_rental(book2)
puts person3.add_rental(book3)
puts person3.add_rental(book4)
puts person3.add_rental(book4)
puts person3.add_rental(book3)

puts "\nAdding Book to rental from person class"

puts student.add_rental(book1)
puts student.add_rental(book1)
puts student1.add_rental(book1)

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
[person, person2, person3, person4, student, student1, student3, person5].each_with_index do |p, i|
  puts "\n#{i + 1} #{p.name} is holding"
  p.rentals.each do |rental|
    puts "\t> #{rental.book.title} by #{rental.book.author} (#{rental.date})"
  end
end

puts "--------------------------\n\n"
