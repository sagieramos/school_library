#!/usr/bin/ruby -w

require_relative 'modules/person'
require_relative 'modules/student'
require_relative 'modules/teacher'

person = Person.new(25, name: 'Osagie')
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
puts "Can use services? #{teacher.can_use_services? && 'Yes!'}"
