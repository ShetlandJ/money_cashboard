DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS vendors;

CREATE TABLE tags (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE vendors (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL4 PRIMARY KEY,
  tag_id INT4 REFERENCES tags(id) ON DELETE CASCADE,
  vendor_id INT4 REFERENCES merchants(id) ON DELETE CASCADE,
  amount INT4,
  transaction_date DATE
);
