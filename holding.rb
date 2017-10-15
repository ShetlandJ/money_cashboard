transaction1 = Transaction.new({
  'vendor_id' => vendor1.id,
  'tag_id' => tag1.id,
  'amount' => 120,
  'transaction_date' => '01-12-2017'
}
)
transaction1.save()

transaction2 = Transaction.new({
  'vendor_id' => vendor2.id,
  'tag_id' => tag2.id,
  'amount' => 50,
  'transaction_date' => '01-12-2017'
}
)
transaction2.save()

transaction3 = Transaction.new({
  'vendor_id' => vendor4.id,
  'tag_id' => tag4.id,
  'amount' => 20,
  'transaction_date' => '01-12-2017'
}
)
transaction3.save()

transaction4 = Transaction.new({
  'vendor_id' => vendor5.id,
  'tag_id' => tag5.id,
  'amount' => 10,
  'transaction_date' => '01-12-2017'
}
)
transaction4.save()


transaction5 = Transaction.new({
  'vendor_id' => vendor6.id,
  'tag_id' => tag6.id,
  'amount' => 450,
  'transaction_date' => '03-12-2017'
}
)

transaction5.save()

transaction6 = Transaction.new({
  'vendor_id' => vendor7.id,
  'tag_id' => tag7.id,
  'amount' => 20,
  'transaction_date' => '01-12-2017'
}
)

transaction6.save()
