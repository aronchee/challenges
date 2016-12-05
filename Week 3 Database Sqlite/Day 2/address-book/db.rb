require 'sqlite3'

database_file = "address_book.db"
$db = SQLite3::Database.open(database_file)
$db.results_as_hash = true