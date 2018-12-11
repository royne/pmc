10.times do
  User.find(1).students.create(name: Faker::Name.name,last_name:Faker::Name.last_name,cellphone:Faker::PhoneNumber.cell_phone,email:"an@mail.com",age:28,address:Faker::Address.street_name,course:"sistemas",legal_guardian:Faker::Simpsons.character,phone_lg:Faker::PhoneNumber.cell_phone,eps:"abc",state:true)
end

5.times do
  User.find(1).students.create(name: Faker::Name.name,last_name:Faker::Name.last_name,cellphone:Faker::PhoneNumber.cell_phone,email:"an@mail.com",age:28,address:Faker::Address.street_name,course:"full stack",legal_guardian:Faker::Simpsons.character,phone_lg:Faker::PhoneNumber.cell_phone,eps:"abc",state:true)
end

5.times do
  User.find(1).students.create(name: Faker::Name.name,last_name:Faker::Name.last_name,cellphone:Faker::PhoneNumber.cell_phone,email:"an@mail.com",age:28,address:Faker::Address.street_name,course:"peluqueria",legal_guardian:Faker::Simpsons.character,phone_lg:Faker::PhoneNumber.cell_phone,eps:"abc",state:true)
end
