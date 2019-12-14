class ResultadoEncuestum < ApplicationRecord
    has_and_belongs_to_many :profesors
    has_many :preguntum
   
end
