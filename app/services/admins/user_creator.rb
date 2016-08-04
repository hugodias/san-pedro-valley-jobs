module Admins
  class UserCreator < GoodServices::Base
    rescuable_from ActiveRecord::RecordInvalid

    attr_reader :email, :password, :admin

    def initialize(email:, password:, admin: false)
      @email = email
      @password = password
      @admin = admin
    end

    def perform
      @record = User.find_or_create_by!(email: email) do |user|
        user.password = password
        user.password_confirmation = password
        user.admin = admin
      end
    end
  end
end
