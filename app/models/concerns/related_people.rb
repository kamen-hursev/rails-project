module RelatedPeople
  extend ActiveSupport::Concern

  included do
    has_many :people

    accepts_nested_attributes_for :people, allow_destroy: true, reject_if: :invalid_person?
  end

  private

  def invalid_person?(attributes)
    attributes['name'].blank?
  end
end
