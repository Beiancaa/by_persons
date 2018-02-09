unless Rails.env.production?
  0..1.times do
    User.create(
      email: Faker::String.random(10),
      encrypted_password: Faker::String.random(8),
      reset_password_token: Faker::Date.between(10.days.ago, Date.today),
      reset_password_sent_at: Faker::Date.between(10.days.ago, Date.today),
      remember_created_at: Faker::Date.between(20.days.ago, Date.today),
      sign_in_count: Faker::Number.digit,
      current_sign_in_at: Faker::Date.between(2.days.ago, Date.today),
      last_sign_in_at: Faker::Date.between(2.days.ago, Date.today),
      current_sign_in_ip: Faker::String.random(4),
      last_sign_in_ip: Faker::String.random(4)
      )    
  end 

  User.all.each do |user|
    100.times do
      Person.create(
        user_id: user.id,
        name: Faker::Name.name,
        birth_day: Faker::Date.birthday(18, 65),
        phone_number: Faker::PhoneNumber.phone_number)
    end
    Person.all.each do |person|      
      0..2.times do
        Profile.create(
          first_name: Faker::Name.name,
          last_name: Faker::Name.name,
          age: Faker::Number.digit,
          gender: Faker::Name.initials(3)
          )
      end

      0..3.times do
        Addresses.create(
          person_id: Faker::Number.between(1, 100),
          city: Faker::Address.city,
          street: Faker::Address.street_name,
          zip_code: Faker::Address.zip_code)
      end
    end
  end
end