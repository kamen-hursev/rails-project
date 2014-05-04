class LimitedCompany < Company
  include RelatedPeople
  MAX_DIRECTORS = 4

  has_one :document, dependent: :destroy

  private

  def validate_number_of_related_people
    unless people.size.between?(1, MAX_DIRECTORS)
      errors.add(:directors, " should be between 1 and #{MAX_DIRECTORS}")
    end
  end
end
