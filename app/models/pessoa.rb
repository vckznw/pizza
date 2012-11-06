class Pessoa < ActiveRecord::Base
  set_table_name("pessoa")
  attr_accessible :nome

  validates :nome,  presence: true, length: { maximum: 50 }
end