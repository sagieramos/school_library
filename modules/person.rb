class Person
    @@latest_id = 1000

    attr_reader :id
    attr_accessor :name, :age
  
    def initialize(name: "Unknown", age: 0, parent_permission: true)
      @@latest_id += 1
      @id = @@latest_id
      @name = name
      @age = age
      @parent_permission = parent_permission
    end
  
    def can_use_services?
      of_age? || @parent_permission
    end
  
    private
  
    def of_age?
      @age >= 18
    end
  end
  