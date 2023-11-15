require_relative '../modules/person'

RSpec.describe Person do
  let(:person) { Person.new(20, 'John', 1, parent_permission: true) }

  describe '#initialize' do
    it 'creates a new person with the given age, name, and parent permission' do
      expect(person.age).to eq(20)
      expect(person.name).to eq('John')
      expect(person.id).to eq(1)
      expect(person.parent_permission).to be true
      expect(person.rentals).to be_empty
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      expect(person.can_use_services?).to be true
    end

    it 'returns true if the person has parent permission' do
      person = Person.new(15, 'Jane', 2, parent_permission: true)
      expect(person.can_use_services?).to be true
    end

    it 'returns false if the person is not of age and has no parent permission' do
      person = Person.new(15, 'Jane', 2, parent_permission: false)
      expect(person.can_use_services?).to be false
    end
  end
end
