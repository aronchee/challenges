require_relative '../models/legislators.rb'

class Representative < Legislator
  self.inheritance_column = :title
end