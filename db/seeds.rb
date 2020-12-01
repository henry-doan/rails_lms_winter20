roles = ['teacher', 'ta', 'student']
10.times do
  course = Course.create(
    name: Faker::Coffee.blend_name
  )

  5.times do
    user = User.create(
      first_name: Faker::Hipster.word,
      last_name: Faker::Book.genre 
    )

    Enrollment.create(
      role: roles.sample,
      course_id: course.id,
      user_id: user.id
    )
  end
end

puts 'Data seeded'