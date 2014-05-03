class Company < ActiveRecord::Base
  MAX_BROKERS = 3

  has_and_belongs_to_many :brokers

  validates :name, presence: true
  validates :email, format: { with: /\A([^@]+@[^@]+\.[^@]+)?\z/, message: ' is invalid format' }
  validate :validate_number_of_brokers

  def validate_number_of_brokers
    unless brokers.size.between?(1, MAX_BROKERS)
      errors.add(:brokers, "Number of brokers should be between 1 and #{MAX_BROKERS}")
    end
  end
end
