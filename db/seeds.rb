# admin = User.new(email: "admin@mail.com", username: "admin", password: "123456")
# admin.add_role(:admin)
# admin.save!

User.create(email: "escuela@mail.com", password: "123456", username: "escuela 1")

3.times do
  User.find(2).students.create(name: Faker::Name.name,last_name:Faker::Name.last_name,cellphone:Faker::PhoneNumber.cell_phone,email:"an@mail.com",age:28,address:Faker::Address.street_name,legal_guardian:"#{Faker::Name.name} #{Faker::Name.last_name}",phone_lg:Faker::PhoneNumber.cell_phone,eps:"abc",state:true)
end
