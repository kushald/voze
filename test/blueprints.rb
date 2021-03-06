require 'machinist/active_record'

User.blueprint do
  username              { "user_#{sn}" }
  email                 { "#{sn}@gmail.com" }
  password              { "password" }
  password_confirmation { "password" }
  invite_code           { Invite.create.code }
end