class Url < ActiveRecord::Base
  validates_presence_of :trig_type
  validates_presence_of :address
  validates_uniqueness_of :address, scope: :trig_type
  validate :trig_type_is_valid

  def trig_type_is_valid
    "change" == :trig_type || "shelve" == :trig_type || "form" == :trig_type
  end
end
