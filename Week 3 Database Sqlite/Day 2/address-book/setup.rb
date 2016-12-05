# Start coding here!

require 'sqlite3'

database_file = "address_book.db"
$db = SQLite3::Database.new(database_file)

# TODO: set up your schema here

$db.execute("CREATE TABLE contacts (
  'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  'first_name' VARCHAR(64) DEFAULT NULL,
  'last_name' VARCHAR(64) DEFAULT NULL,
  'created_at' DATETIME NOT NULL,
  'updated_at' DATETIME NOT NULL);")

$db.execute("CREATE TABLE contacts_groups (
  'group_id' INTEGER NOT NULL,
  'contact_id' INTEGER NOT NULL);")

$db.execute("CREATE TABLE groups (
  'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  'name' VARCHAR(64) NOT NULL,
  'created_at' DATETIME NOT NULL,
  'updated_at' DATETIME NOT NULL);")

# TODO: set up any initial data here

$db.execute("INSERT INTO contacts
  ('first_name', 'last_name', 'created_at', 'updated_at')
  VALUES ('Mayuyu', 'Watanabe', DATETIME('now'), DATETIME('now'));")
$db.execute("INSERT INTO contacts
  ('first_name', 'last_name', 'created_at', 'updated_at')
  VALUES ('Sakuratan', 'Miyazaki', DATETIME('now'), DATETIME('now'));")
$db.execute("INSERT INTO contacts
  ('first_name', 'last_name', 'created_at', 'updated_at')
  VALUES ('PonPon', 'Aron', DATETIME('now'), DATETIME('now'));")
$db.execute("INSERT INTO contacts
  ('first_name', 'last_name', 'created_at', 'updated_at')
  VALUES ('KokPong', 'Chi', DATETIME('now'), DATETIME('now'));")
