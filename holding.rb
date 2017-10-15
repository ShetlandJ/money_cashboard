transaction1 = Transaction.new({
  'vendor_id' => vendor1.id,
  'tag_id' => tag1.id,
  'amount' => 120,
  'transaction_date' => '01-12-2017'
}
)

transaction2 = Transaction.new({
  'vendor_id' => vendor2.id,
  'tag_id' => tag2.id,
  'amount' => 50,
  'transaction_date' => '01-12-2017'
}
)

transaction3 = Transaction.new({
  'vendor_id' => vendor4.id,
  'tag_id' => tag4.id,
  'amount' => 20,
  'transaction_date' => '01-12-2017'
}
)

transaction4 = Transaction.new({
  'vendor_id' => vendor5.id,
  'tag_id' => tag5.id,
  'amount' => 10,
  'transaction_date' => '01-12-2017'
}
)

transaction5 = Transaction.new({
  'vendor_id' => vendor6.id,
  'tag_id' => tag6.id,
  'amount' => 450,
  'transaction_date' => '03-12-2017'
}
)

transaction6 = Transaction.new({
  'vendor_id' => vendor7.id,
  'tag_id' => tag7.id,
  'amount' => 20,
  'transaction_date' => '01-12-2017'
}
)

transaction7 = Transaction.new({
  'vendor_id' => vendor8.id,
  'tag_id' => tag8.id,
  'amount' => 9,
  'transaction_date' => '02-12-2017'
}
)

transaction8 = Transaction.new({
  'vendor_id' => vendor10.id,
  'tag_id' => tag10.id,
  'amount' => 31,
  'transaction_date' => '07-12-2017'
}
)

transaction9 = Transaction.new({
  'vendor_id' => vendor10.id,
  'tag_id' => tag10.id,
  'amount' => 25,
  'transaction_date' => '14-12-2017'
}
)

transaction10 = Transaction.new({
  'vendor_id' => vendor11.id,
  'tag_id' => tag11.id,
  'amount' => 100,
  'transaction_date' => '05-12-2017'
}
)

transaction11 = Transaction.new({
  'vendor_id' => vendor11.id,
  'tag_id' => tag11.id,
  'amount' => 120,
  'transaction_date' => '19-12-2017'
}
)

transaction12 = Transaction.new({
  'vendor_id' => vendor13.id,
  'tag_id' => tag13.id,
  'amount' => 5,
  'transaction_date' => '07-12-2017'
}
)

transaction13 = Transaction.new({
  'vendor_id' => vendor13.id,
  'tag_id' => tag13.id,
  'amount' => 9,
  'transaction_date' => '14-12-2017'
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
