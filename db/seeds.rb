# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do |no|
  if no<33
    Task.create(:title => "test-A#{no}" , :line => "201#{no/7.to_i}-06-28" , :memo => "memo-A#{no}", :priority => "高", :status =>"着手中" , :userId=>1)
  elsif no<66
    Task.create(:title => "test-B#{no}" , :line => "20#{no/8.to_i}3-06-28", :memo => "memo-B#{no}", :priority => "中", :status =>"未着手", :userId=>1)
  else
    Task.create(:title => "test-C#{no}" , :line => "2#{no/101.to_i}11-06-28", :memo => "memo-C#{no}", :priority => "低", :status =>"完了", :userId=>1)
  end
end

User.create(:name => "admin" , :pass => "0422", :role => "admin")

#Task.create(:title => "B1234BB"  ,:text => "memo223")
#tasks = Task.create([{ title: 'AAA' }, { line: DateTime.now }, { memo: 'AAA' }, { priority: 1 }, { statusId: 1 }, { labelId: 2 }])
