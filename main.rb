#!/usr/bin/ruby -w
require './modules/app'

EXIT_MESSAGE = "\n\nThank you for using this app\n\n".freeze

def display_menu
  puts "\nPlease choose an option by entering a number:"
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person ID'
  puts '0 - Exit'
  print '>> '
end

def execute_option(app, choice)
  case choice
  when '1'
    app.list_books
  when '2'
    app.list_people
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.list_rentals_for_person
  else
    puts 'Invalid option. Please try again.'
  end
end

def start_app
  app = App.new

  loop do
    display_menu
    choice = gets.chomp.strip

    if choice == '0'
      puts EXIT_MESSAGE
      app.save_all_data
      break
    end

    execute_option(app, choice)
  rescue Interrupt
    puts EXIT_MESSAGE
    app.save_all_data
    break
  end
end

def main
  start_app
end

main
