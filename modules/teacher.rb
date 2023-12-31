require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'Unknown', id = Random.rand(1..1000), parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @specialization = specialization
  end
end
