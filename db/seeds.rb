# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


contact = Contact.new
contact.email = 'INFO@TOTRANS.EU'
contact.support_email = 'support@totrans.eu'
contact.air_transpot_phone = '0032 484064215'
contact.shipping_phone = '0032 484064215'
contact.customer_service_phone = '0032 484064215'
contact.address_1 = 'LEUVENSESTEENWEG 510. BUILDING 2.'
contact.save