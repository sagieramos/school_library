require_relative '../modules/teacher'
RSpec.describe Teacher do
  let(:teacher) { Teacher.new(30, 'English', 'Mr. Charlse', 101, parent_permission: false) }
  describe '#initialize' do
    it 'creates a new teacher with the given age, specialization, name, and parent permission' do
      expect(teacher.age).to eq(30)
      expect(teacher.specialization).to eq('English')
      expect(teacher.name).to eq('Mr. Charlse')
      expect(teacher.id).to eq(101)
      expect(teacher.parent_permission).to be false
      expect(teacher.rentals).to be_empty
    end
  end
end
