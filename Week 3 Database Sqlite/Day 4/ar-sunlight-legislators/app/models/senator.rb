require_relative '../models/legislators.rb'

class Senator < legislator
  self.inheritance_column = :title
end