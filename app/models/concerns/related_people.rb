module RelatedPeople
  extend ActiveSupport::Concern

  included do
    has_many :people, foreign_key: :company_id

    accepts_nested_attributes_for :people, allow_destroy: true, reject_if: :invalid_person?

    validate :validate_number_of_related_people
  end

  private

  def invalid_person?(attributes)
    attributes['name'].blank?
  end

  # most probably needs to be defined in the classes that include this concern
  def validate_number_of_related_people
    errors.add(:people, " can't be more than 4") if people.size > 4
  end
end
