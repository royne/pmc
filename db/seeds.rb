3.times do
  User.find(2).students.create(name: Faker::Name.name,last_name:Faker::Name.last_name,cellphone:Faker::PhoneNumber.cell_phone,email:"an@mail.com",age:28,address:Faker::Address.street_name,legal_guardian:Faker::Simpsons.character,phone_lg:Faker::PhoneNumber.cell_phone,eps:"abc",state:true)
end
