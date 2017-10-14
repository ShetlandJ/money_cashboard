require_relative('../models/account')
require_relative('../models/tag')
require_relative('../models/vendor')
require_relative('../models/transaction')
require('pry-byebug')

Transaction.delete_all()
Vendor.delete_all()
Tag.delete_all()
Account.delete_all()

account1 = Account.new({
  'income' => 28000
  })

  account1.save()

tag1 = Tag.new({
  't_name' => 'Council Tax',
}
)

tag1.save()

tag2 = Tag.new({
  't_name' => 'Eating Out',
}
)

tag2.save()


tag3 = Tag.new({
  't_name' => 'Groceries',
}
)

tag3.save()

vendor1 = Vendor.new({
  'name' => 'Glasgow City Council',
}
)
vendor1.save()

vendor2 = Vendor.new({
  'name' => 'Paesano',
}
)
vendor2.save()

vendor3 = Vendor.new({
  'name' => 'Tesco',
}
)
vendor3.save()

transaction1 = Transaction.new({
  'vendor_id' => vendor1.id,
  'tag_id' => tag1.id,
  'amount' => 150,
  'transaction_date' => '01-12-2017'
}
)

transaction1.save()

transaction2 = Transaction.new({
  'vendor_id' => vendor2.id,
  'tag_id' => tag2.id,
  'amount' => 15,
  'transaction_date' => '14-12-2017'
}
)

transaction2.save()

transaction3 = Transaction.new({
  'vendor_id' => vendor3.id,
  'tag_id' => tag3.id,
  'amount' => 80,
  'transaction_date' => '15-12-2017'
}
)

transaction3.save()


pry.binding
nil
