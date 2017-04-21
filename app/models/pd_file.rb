class PdFile < ApplicationRecord
  has_many :invoice_lines, :dependent => :destroy
  accepts_nested_attributes_for :invoice_lines, :allow_destroy => true
end
