require_relative 'db'


class Contact
  attr_accessor :first_name, :last_name, :id, :created_at, :updated_at

  def initialize(options = {})
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @id = options["id"]
    @created_at = options["created_at"]
    @updated_at = options["updated_at"]
  end

  def create(options = {})
  end

  def self.find(id)
    found_contact = $db.execute("SELECT * FROM contacts WHERE id = ?;", id).first
    return nil if found_contact == nil
    Contact.new(found_contact)
  end

  def save
    $db.execute("INSERT INTO contacts ('first_name', 'last_name', 'created_at', 'updated_at' ) VALUES (?, ?, ?, ?, DATETIME('now'), DATETIME('now'));", first_name, last_name)
    @id = $db.last_insert_row_id
    database_version = Contact.find(id)
    created_at = database_version.created_at
    updated_at = database_version.updated_at
  end

  def update

  end

end