class Trust < Company
  MAX_TRUSTEES = nil

  private

  def valid_number_of_related_people
    true # we can add whatever number we want, so just overwrite the base validation method
  end
end
