class Task < ActiveRecord::Base

  validates :title , presence: true , length: {maximum: 30}
  validates :memo , length: {maximum: 500}
end
