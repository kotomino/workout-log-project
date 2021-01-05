class Workout < ActiveRecord::Base
  validates_presence_of :name, :date, :personal_record
end
