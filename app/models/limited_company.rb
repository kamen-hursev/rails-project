class LimitedCompany < Company
  # TODO: see if you can make this with a concern
  # include RelatedPeople
  MAX_DIRECTORS = 4

  validate :valid_number_of_related_people

  private

  def valid_number_of_related_people
    unless people.size.between?(1, MAX_DIRECTORS)
      errors.add(:directors, " should be between 1 and #{MAX_DIRECTORS}")
    end
  end
end
