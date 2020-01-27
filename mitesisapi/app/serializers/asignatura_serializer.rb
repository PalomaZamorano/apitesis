class AsignaturaSerializer < ActiveModel::Serializer
    attributes :id,:asign_nombre, :asign_code,:asign_coordinadores
    belongs_to :cursos
    end