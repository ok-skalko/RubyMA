require 'csv'

namespace :user do
  desc 'import'
  task import: :environment do
    CSV.foreach('users.csv') do |row|
      User.create(first_name: row[0], last_name: row[1], personal_data: row[2], password: row[3], email: row[4], birthday: row[5])
    end
  end

  desc 'export'
  task export: :environment do
    file = 'users.csv'

    table = User.order(:first_name)

    headers = %w[first_name last_name personal_data password email birthday]

    CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
      table.each do |user|
        writer << [user.first_name, user.last_name, user.personal_data.to_json, user.password, user.email, user.birthday]
      end
    end
  end
end
