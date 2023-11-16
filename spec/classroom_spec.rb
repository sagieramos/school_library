require_relative '../modules/classroom'
require_relative '../modules/student'

RSpec.describe Classroom do
  let(:classroom) { Classroom.new('History') }
  let(:student) { Student.new(17, 'Bob', 1, parent_permission: true) }

  describe '#initialize' do
    it 'creates a new classroom with the given label' do
      expect(classroom.label).to eq('History')
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
      expect(student.classroom).to eq(classroom)
    end

    it 'does not add the student to the classroom if already present' do
      classroom.add_student(student)
      classroom.add_student(student)
      expect(classroom.students.count(student)).to eq(1)
    end
  end
end
