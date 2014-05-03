class Company < ActiveRecord::Base
  MAX_BROKERS = 3

  has_many :people
  has_and_belongs_to_many :brokers

  accepts_nested_attributes_for :people, allow_destroy: true, reject_if: :invalid_person?

  validates :name, presence: true
  validates :email, format: { with: /\A([^@]+@[^@]+\.[^@]+)?\z/, message: ' is invalid format' }
  validate :validate_number_of_brokers

  def validate_number_of_brokers
    unless brokers.size.between?(1, MAX_BROKERS)
      errors.add(:brokers, "Number of brokers should be between 1 and #{MAX_BROKERS}")
    end
  end

  private

  def invalid_person?(attributes)
    attributes['name'].blank?
  end
end
