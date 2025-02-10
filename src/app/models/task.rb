class Task < ApplicationRecord
    validates :title, presence: true
    validates :completed, presence: true
    validates :title, length: { maximum: 50 }
end
