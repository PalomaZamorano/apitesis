class Preguntum < ApplicationRecord
    belongs_to :resultado_encuesta

    def self.pregAsign(cod,coord, secc,agno,sem,elect)
     Preguntum.where(:preg_codsign => cod, :preg_coord => coord, :preg_secc => secc, :preg_agno => agno, :preg_sem => sem , :preg_elect => elect)
       end
end
