class ResultadoEncuestum < ApplicationRecord
    has_and_belongs_to_many :profesors
    has_many :preguntum

    def self.resultCurso(asign, agno, sem)
        ResultadoEncuestum.where(:result_asign => asign, :result_agno => agno, :result_semestre => sem )
       end

    def self.restCurso(agno,sem)
        @resultInfo = ResultadoEncuestum.where("result_asign>13000 OR result_asign=10126 OR result_asign=10110" )
        @actual = @resultInfo.where(:result_agno => agno, :result_semestre => sem)
        @actual.where("result_promg1n <= 3.5 OR result_promg2n <= 3.5 OR result_promg3n <= 3.5 OR result_promg4n <= 3.5" )
    end
    
    def self.civilCurso(agno,sem)
        @resultInfo = ResultadoEncuestum.where("result_asign>13000 OR result_asign=10126 OR result_asign=10110" )

        @resultInfo2 = @resultInfo.where("result_asign=10126 OR result_asign=10126 OR result_asign=10110 OR
        result_asign=13201 OR result_asign=13204 OR result_asign=13205 OR result_asign=13209 OR result_asign=13210 OR
        result_asign=13212 OR result_asign=13213 OR result_asign=13214 OR result_asign=13215 OR result_asign=13217 OR
        result_asign=13219 OR result_asign=13220 OR result_asign=13221 OR result_asign=13222 OR result_asign=13223 OR
        result_asign=13224 OR result_asign=13225 OR result_asign=13226 OR result_asign=13227 OR result_asign=13228 OR
        result_asign=13229 OR result_asign=13231 OR result_asign=13232 OR result_asign=13233 OR result_asign=13234 OR
        result_asign=13235 OR result_asign=13236 OR result_asign=13237 OR result_asign=13238 OR result_asign=13239 OR
        result_asign=13266 OR result_asign=13267 OR result_asign=13268 OR result_asign=13269 OR result_asign=13270 OR
        result_asign=13274 OR result_asign=13275 OR result_asign=13278 OR result_asign=13280 OR result_asign=13281 OR
        result_asign=13282 OR result_asign=13283 OR result_asign=13284 OR result_asign=13285 OR result_asign=13251 OR
        result_asign=13252 OR result_asign=13255 OR result_asign=13230" )

        @actual = @resultInfo2.where(:result_agno => agno, :result_semestre => sem)
        @actual.where("result_promg1n <= 3.5 OR result_promg2n <= 3.5 OR result_promg3n <= 3.5 OR result_promg4n <= 3.5" )
    end


    def self.ejecuCurso(agno,sem)
        @resultInfo = ResultadoEncuestum.where("result_asign>13000 OR result_asign=10126 OR result_asign=10110" )

        @resultInfo2 = @resultInfo.where("result_asign=10126 OR result_asign=10126 OR result_asign=10110 OR
        result_asign=13201 OR result_asign=13204 OR result_asign=13205 OR result_asign=13209 OR result_asign=13212 OR 
        result_asign=13229 OR result_asign=13231 OR result_asign=13232 OR result_asign=13233 OR 
        result_asign=13252 OR result_asign=13256 OR result_asign=13260 OR result_asign=13261 OR result_asign=13262 OR
        result_asign=13265 OR result_asign=13267 OR result_asign=13268 OR result_asign=13269 OR result_asign=13270 OR
        result_asign=13273 OR result_asign=13274 OR result_asign=13275 OR result_asign=13276 OR result_asign=13278 OR  
        result_asign=13279 OR result_asign=13280 OR result_asign=13281" )

        @actual = @resultInfo2.where(:result_agno => agno, :result_semestre => sem)
        @actual.where("result_promg1n <= 3.5 OR result_promg2n <= 3.5 OR result_promg3n <= 3.5 OR result_promg4n <= 3.5" )
    end
end
