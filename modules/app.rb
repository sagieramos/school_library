require_relative 'library_management'

EXIT_MESSAGE = "\n\nThank you for using this app\n\n".freeze

class App
  MENU_OPTIONS = {
    '1' => :list_books,
    '2' => :list_people,
    '3' => :create_person,
    '4' => :create_book,
    '5' => :create_rental,
    '6' => :list_rentals_for_person
  }.freeze

  def initialize
    @library_system = LibraryManagement.new
  end

  def start
    display_menu
    choice = user_choice
    
    if choice == '0'
      puts EXIT_MESSAGE
      break
    end

    if MENU_OPTIONS.key?(choice)
      send(MENU_OPTIONS[choice])
    else
      puts 'Invalid option. Please try again.'
    end
  rescue Interrupt
    puts EXIT_MESSAGE
    break
  end

  private

  def display_menu
    puts "\nPlease choose an option by entering a number:"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person ID'
    puts '0 - Exit'
  end

  def user_choice
    print '>> '
    gets.chomp.strip
  end

  def list_books
    @library_system.list_books
  end

  def list_people
    @library_system.list_people
  end

  def create_person
    @library_system.create_person
  end

  def create_book
    @library_system.create_book
  end

  def create_rental
    @library_system.create_rental
  end

  def list_rentals_for_person
    @library_system.list_rentals_for_person
  end
end
