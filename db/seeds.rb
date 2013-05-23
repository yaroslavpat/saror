# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.find_or_initialize_by_email('admin@admin.com')
admin.login = 'admin'
admin.password = 'admin'
admin.admin = true
admin.save

user = User.find_or_initialize_by_email('user@user.com')
user.login = 'user'
user.password = 'user'
user.save