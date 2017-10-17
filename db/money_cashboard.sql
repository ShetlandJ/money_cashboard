DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS vendors;
DROP TABLE IF EXISTS tags;

CREATE TABLE accounts (
  id SERIAL4 PRIMARY KEY,
  income INT4
);

CREATE TABLE tags (
  id SERIAL4 PRIMARY KEY,
  t_name VARCHAR(255),
  t_type VARCHAR(255)
);

CREATE TABLE vendors (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) UNIQUE
);

CREATE TABLE transactions (
  id SERIAL4 PRIMARY KEY,
  tag_id INT4 REFERENCES tags(id) ON DELETE CASCADE,
  vendor_id INT4 REFERENCES vendors(id) ON DELETE CASCADE,
  amount INT4,
  transaction_date DATE
);
