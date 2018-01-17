class Task < ActiveRecord::Base

  validates :title , presence: true, uniqueness: true, length: {maximum: 20}
  validates :memo , length: {maximum: 500}
end
