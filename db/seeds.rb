User.create!(email:"admin@gmail.com", password: 'qwerty', password_confirmation: 'qwerty')
30.times do
  Course.create!([{
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote,
    user_id: User.first.id
    }])
end
