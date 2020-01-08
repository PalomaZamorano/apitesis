class Asignatura < ApplicationRecord
    has_many :cursos
     accepts_nested_attributes_for :cursos
     validates :asign_code, presence: true
     def self.asignCode(code)
        Asignatura.where(:asign_code => code)
       end 
end
