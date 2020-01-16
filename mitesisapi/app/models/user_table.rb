class UserTable < ApplicationRecord

    def self.verification(mail)
        UserTable.where(:user_mail =>mail)
       end
end
