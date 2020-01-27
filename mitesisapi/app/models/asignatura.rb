class Asignatura < ApplicationRecord
    has_many :cursos
     accepts_nested_attributes_for :cursos
     validates :asign_code, presence: true
     def self.asignCode(code)
        Asignatura.where(:asign_code => code)
       end 

    def self.restAsign()
        Asignatura.where("asign_code>13000 OR asign_code=10126 OR asign_code=10110" )
    end   
end
