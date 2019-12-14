class UserTableSerializer < ActiveModel::Serializer
  attributes :id, :user_name, :user_mail, :user_rol, :user_cargo
end
