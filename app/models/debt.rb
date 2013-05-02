STATUS_KEYS = {"paid"=>"Odendi", "not_paid"=>"Odenmedi"}
class Debt < ActiveRecord::Base
  attr_accessible :amount, :status, :victim_id
  belongs_to :victim
  validates_inclusion_of :status, :in => STATUS_KEYS.keys
  validates_numericality_of :amount, :presence => true, :message => 'Rakam gir reiz.'
  
  def status_value
    STATUS_KEYS[status]
  end
end
