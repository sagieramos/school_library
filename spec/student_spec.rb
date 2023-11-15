require_relative '../modules/student'
require_relative '../modules/classroom'

RSpec.describe Student do
  let(:student) { Student.new(18, 'Osas', 1, parent_permission: true) }

  describe '#initialize' do
    it 'creates a new student with the given age, name, and parent permission' do
      expect(student.age).to eq(18)
      expect(student.name).to eq('Osas')
      expect(student.id).to eq(1)
      expect(student.parent_permission).to be true
      expect(student.rentals).to be_empty
      expect(student.classroom).to be nil
    end
  end

  describe '#play_hooky' do
    it 'returns a string indicating playing hooky' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end

  describe '#classroom=' do
    let(:classroom) { Classroom.new('Math') }

    it 'sets the classroom for the student and adds the student to the classroom' do
      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
      expect(classroom.students).to include(student)
    end

    it 'does not add the student to the classroom if already present' do
      classroom.add_student(student)
      student.classroom = classroom
      expect(classroom.students.count(student)).to eq(1)
    end
  end
end
