class Website < ApplicationRecord
  has_many :screenshots, dependent: :destroy
  validates :address, presence: true
end