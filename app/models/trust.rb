class Trust < Company
  include RelatedPeople

  MAX_TRUSTEES = nil

  private

  def validate_number_of_related_people
    true # we can add whatever number we want, so just overwrite the base validation method
  end
end
