class Partnership < Company
  include RelatedPeople

  MAX_PARTNERS = 4

  private

  def validate_number_of_related_people
    unless people.size <= MAX_PARTNERS
      errors.add(:parthers, " should be no more than #{MAX_PARTNERS}")
    end
  end
end
