require_relative('../models/account')
require_relative('../models/tag')
require_relative('../models/vendor')
require_relative('../models/transaction')
require('pry-byebug')

Transaction.delete_all()
Vendor.delete_all()
Tag.delete_all()
Account.delete_all()

account1 = Account.new({'income' => 28000})

account1.save()

tag1 = Tag.new({'t_name' => 'Council Tax', 't_type' => 'Essential'})
tag2 = Tag.new({'t_name' => 'Electricity Bill', 't_type' => 'Essential'})
tag3 = Tag.new({'t_name' => 'Gas Bill', 't_type' => 'Essential'})
tag4 = Tag.new({'t_name' => 'Mobile Phone', 't_type' => 'Essential'})
tag5 = Tag.new({'t_name' => 'Gym', 't_type' => 'Non-essential'})
tag6 = Tag.new({'t_name' => 'Mortgage', 't_type' => 'Essential'})
tag7 = Tag.new({'t_name' => 'Internet', 't_type' => 'Essential'})
tag8 = Tag.new({'t_name' => 'Subscription Services', 't_type' => 'Non-essential'})
tag9 = Tag.new({'t_name' => 'Dinner Out', 't_type' => 'Non-essential'})
tag10 = Tag.new({'t_name' => 'Groceries', 't_type' => 'Essential'})
tag11 = Tag.new({'t_name' => 'Drinks', 't_type' => 'Non-essential'})
tag12 = Tag.new({'t_name' => 'Video Games', 't_type' => 'Non-essential'})
tag13 = Tag.new({'t_name' => 'Days out', 't_type' => 'Non-essential'})

vendor1 = Vendor.new({'name' => 'Glasgow City Council'})
vendor2 = Vendor.new({'name' => 'Solarplicity'})
vendor3 = Vendor.new({'name' => 'Scottish Gas'})
vendor4 = Vendor.new({'name' => 'Vodafone'})
vendor5 = Vendor.new({'name' => 'The Gym - Bothwell Street'})
vendor6 = Vendor.new({'name' => 'Bank of Scotland'})
vendor7 = Vendor.new({'name' => 'BT Internet'})
vendor8 = Vendor.new({'name' => 'Netflix'})
vendor9 = Vendor.new({'name' => 'Spotify'})
vendor10 = Vendor.new({'name' => 'Paesano'})
vendor11 = Vendor.new({'name' => 'Marks & Spencers'})
vendor12 = Vendor.new({'name' => 'Tesco'})
vendor13 = Vendor.new({'name' => 'Super Bario'})
vendor14 = Vendor.new({'name' => 'Fault & Blame'})
vendor15 = Vendor.new({'name' => 'Steam (Valve)'})

tag1.save()
tag2.save()
tag3.save()
tag4.save()
tag5.save()
tag6.save()
tag7.save()
tag8.save()
tag9.save()
tag10.save()
tag11.save()
tag12.save()
tag13.save()
vendor1.save()
vendor2.save()
vendor3.save()
vendor4.save()
vendor5.save()
vendor6.save()
vendor7.save()
vendor8.save()
vendor9.save()
vendor10.save()
vendor11.save()
vendor12.save()
vendor13.save()
vendor14.save()
vendor15.save()

transaction1 = Transaction.new({
  'vendor_id' => vendor1.id,
  'tag_id' => tag1.id,
  'amount' => 120,
  'transaction_date' => '01-December-2017'
}
)

transaction2 = Transaction.new({
  'vendor_id' => vendor2.id,
  'tag_id' => tag2.id,
  'amount' => 50,
  'transaction_date' => '01-December-2017'
}
)

transaction3 = Transaction.new({
  'vendor_id' => vendor4.id,
  'tag_id' => tag4.id,
  'amount' => 20,
  'transaction_date' => '01-December-2017'
}
)

transaction4 = Transaction.new({
  'vendor_id' => vendor5.id,
  'tag_id' => tag5.id,
  'amount' => 10,
  'transaction_date' => '01-December-2017'
}
)

transaction5 = Transaction.new({
  'vendor_id' => vendor6.id,
  'tag_id' => tag6.id,
  'amount' => 450,
  'transaction_date' => '03-December-2017'
}
)

transaction6 = Transaction.new({
  'vendor_id' => vendor7.id,
  'tag_id' => tag7.id,
  'amount' => 20,
  'transaction_date' => '01-December-2017'
}
)

transaction7 = Transaction.new({
  'vendor_id' => vendor8.id,
  'tag_id' => tag8.id,
  'amount' => 9,
  'transaction_date' => '02-December-2017'
}
)

transaction8 = Transaction.new({
  'vendor_id' => vendor10.id,
  'tag_id' => tag9.id,
  'amount' => 31,
  'transaction_date' => '14-December-2017'
}
)

transaction9 = Transaction.new({
  'vendor_id' => vendor10.id,
  'tag_id' => tag9.id,
  'amount' => 25,
  'transaction_date' => '07-December-2017'
}
)

transaction10 = Transaction.new({
  'vendor_id' => vendor11.id,
  'tag_id' => tag10.id,
  'amount' => 100,
  'transaction_date' => '05-December-2017'
}
)

transaction11 = Transaction.new({
  'vendor_id' => vendor11.id,
  'tag_id' => tag10.id,
  'amount' => 120,
  'transaction_date' => '19-December-2017'
}
)

transaction12 = Transaction.new({
  'vendor_id' => vendor13.id,
  'tag_id' => tag13.id,
  'amount' => 5,
  'transaction_date' => '07-December-2017'
}
)

transaction13 = Transaction.new({
  'vendor_id' => vendor13.id,
  'tag_id' => tag13.id,
  'amount' => 9,
  'transaction_date' => '14-December-2017'
}
)

transaction1.save()
transaction2.save()
transaction3.save()
transaction4.save()
transaction5.save()
transaction6.save()
transaction7.save()
transaction8.save()
transaction9.save()
transaction10.save()
transaction11.save()
transaction12.save()
transaction13.save()



pry.binding
nil
