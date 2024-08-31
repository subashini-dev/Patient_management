class Patient < ApplicationRecord
    validates :name, presence: true
    validates :age, presence: true
    validates :height, presence: true
    validates :weight, presence: true
    validates :gender, presence: true
end
