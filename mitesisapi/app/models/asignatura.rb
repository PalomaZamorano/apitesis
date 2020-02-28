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
    
    def self.civilAsign()
       info =  Asignatura.where("asign_code>13000 OR asign_code=10126 OR asign_code=10110" )
       info.where("asign_code=10126 OR asign_code=10126 OR asign_code=10110 OR
       asign_code=13201 OR asign_code=13204 OR asign_code=13205 OR asign_code=13209 OR asign_code=13210 OR
       asign_code=13212 OR asign_code=13213 OR asign_code=13214 OR asign_code=13215 OR asign_code=13217 OR
       asign_code=13219 OR asign_code=13220 OR asign_code=13221 OR asign_code=13222 OR asign_code=13223 OR
       asign_code=13224 OR asign_code=13225 OR asign_code=13226 OR asign_code=13227 OR asign_code=13228 OR
       asign_code=13229 OR asign_code=13231 OR asign_code=13232 OR asign_code=13233 OR asign_code=13234 OR
       asign_code=13235 OR asign_code=13236 OR asign_code=13237 OR asign_code=13238 OR asign_code=13239 OR
       asign_code=13266 OR asign_code=13267 OR asign_code=13268 OR asign_code=13269 OR asign_code=13270 OR
       asign_code=13274 OR asign_code=13275 OR asign_code=13278 OR asign_code=13280 OR asign_code=13281 OR
       asign_code=13282 OR asign_code=13283 OR asign_code=13284 OR asign_code=13285 OR asign_code=13251 OR
       asign_code=13252 OR asign_code=13255 OR asign_code=13230 " )  
    end

    def self.ejecuAsign()
        info =  Asignatura.where("asign_code>13000 OR asign_code=10126 OR asign_code=10110" )
        info.where("asign_code=10126 OR asign_code=10126 OR asign_code=10110 OR
        asign_code=13201 OR asign_code=13204 OR asign_code=13205 OR asign_code=13209 OR asign_code=13212 OR 
        asign_code=13229 OR asign_code=13231 OR asign_code=13232 OR asign_code=13233 OR 
        asign_code=13252 OR asign_code=13256 OR asign_code=13260 OR asign_code=13261 OR asign_code=13262 OR
        asign_code=13265 OR asign_code=13267 OR asign_code=13268 OR asign_code=13269 OR asign_code=13270 OR
        asign_code=13273 OR asign_code=13274 OR asign_code=13275 OR asign_code=13276 OR asign_code=13278 OR  
        asign_code=13279 OR asign_code=13280 OR asign_code=13281" )  
     end
end
