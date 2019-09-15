class Chef < ApplicationRecord

  before_save { self.email = email.downcase }

  validates :chefname, presence: true, length: { maximum: 30}
  validates :email, presence: true, length: { maximum: 255}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false }

  has_many :recipes


end