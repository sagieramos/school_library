requie "./nameable.rb"

class BaseDecorator < Nameable
    def initialize(nameable)
        @nameable = nameable
    end

    def correct_name
        @nameable.correct_name
    end
end

class CapitalizeDecorator < BaseDecorator
    def correct_name
        super.correct_name.capitalize 
    end
end

class TrimmerDecorator < BaseDecorator
    def correct_name 
        trimmed_name = super.correct_name[0, 10]
        
        if trimmed_name.length < super.correct_name.length
            trimmed_name
        else
            super.correct_name
        end
    end
end