#!/usr/bin/ruby -w

require_relative 'modules/person'
require_relative 'modules/student'
require_relative 'modules/teacher'
require_relative 'modules/decorator'

puts "DAY 1\n--------------------------"
person = Person.new(25, name: 'maximilianus')
puts 'Person Info:'
puts "ID: #{person.id}"
puts "Name: #{person.name}"
puts "Age: #{person.age}"
puts "Can use services? #{person.can_use_services? && 'Yes!'}"
puts '--------------------------'

student = Student.new(16, 'Math', name: 'Ramos')
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
