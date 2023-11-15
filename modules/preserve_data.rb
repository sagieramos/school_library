require 'json'
require 'fileutils'
require_relative 'book'
require_relative 'person'
require_relative 'rental'

class PreserveData
  DATA_DIR = 'data'.freeze

  def self.ensure_data_directory
    FileUtils.mkdir_p(DATA_DIR) unless File.directory?(DATA_DIR)
  end

  def self.save_books(books)
    ensure_data_directory
    File.open(File.join(DATA_DIR, 'books.json'), 'w') do |file|
      books_data = books.map do |book|
        {
          title: book.title,
          author: book.author,
        }
      end
      file.puts(JSON.generate(books_data))
    end
  end

  def self.save_people(people)
    ensure_data_directory
    File.open(File.join(DATA_DIR, 'people.json'), 'w') do |file|
      people_data = people.map do |person|
        {
          class: person.class.to_s,
          age: person.age,
          name: person.name,
          id: person.id,
          parent_permission: (person.parent_permission if person.is_a?(Student)),
          specialization: (person.specialization if person.is_a?(Teacher)),
        }
      end
      file.puts(JSON.generate(people_data))
    end
  end

  def self.load_books
    return [] unless File.exist?(File.join(DATA_DIR, 'books.json'))

    books_json = JSON.parse(File.read(File.join(DATA_DIR, 'books.json')))
    books_json.map do |book_data|
      book = Book.new(book_data['title'], book_data['author'])
      book
    end
  end

  def self.load_people
    return [] unless File.exist?(File.join(DATA_DIR, 'people.json'))
    return [] unless File.join(DATA_DIR, 'people.json').empty?

    people_json.map do |person_data|
      case person_data['class']
      when 'Teacher'
        Teacher.new(person_data['age'], person_data['specialization'], person_data['name'], person_data['id'])
      when 'Student'
        Student.new(person_data['age'], person_data['name'], person_data['id'],
                    parent_permission: person_data['parent_permission'])
      end
    end
  end
end
