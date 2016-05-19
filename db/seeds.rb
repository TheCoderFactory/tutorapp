# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: 'tutor3@example.com', password: '12345678')
puts "Created user"
profile = Profile.create(first_name: 'Jane', last_name: 'Smith', qualification: 'Primary Teacher', years_experience: 4, hourly_rate: 20, picture: 'jane.jpg', bio: 'I am a primary teacher.', street: '7 Kelly Street', suburb: 'Ultimo', state: 'NSW', postcode: '2007', user_id: user.id)
puts "Created profile"

subjects = [
  "Mathematics",
  "Social Sciences",
  "English",
  "Languages",
  "Science",
  "Economics",
  "History"
]

def create_subjects(subjects)
  subjects.each do |subject|
    Subject.create(name: subject)
  end
end

create_subjects(subjects)
puts "Subjects created!"

year_levels = [
  "1 - 2",
  "3 - 5",
  "6 - 7",
  "8 - 10",
  "11 - 12"
]

def create_year_levels(year_levels)
  year_levels.each do |level|
    YearLevel.create(name: level)
  end
end

create_year_levels(year_levels)
puts "Year Levels Created!"
