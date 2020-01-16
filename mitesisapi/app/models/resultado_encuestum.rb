class ResultadoEncuestum < ApplicationRecord
    has_and_belongs_to_many :profesors
    has_many :preguntum

    def self.resultCurso(asign, agno, sem)
        ResultadoEncuestum.where(:result_asign => asign, :result_agno => agno, :result_semestre => sem )
       end

    def self.restCurso(agno,sem)
        @resultInfo = ResultadoEncuestum.where("result_asign>13000 OR result_asign=10123 OR result_asign=10110" )
        @actual = @resultInfo.where(:result_agno => agno, :result_semestre => sem)
        @actual.where("result_promg1n <= 3.5 OR result_promg2n <= 3.5 OR result_promg3n <= 3.5 OR result_promg4n <= 3.5" )
    end   
end
