class FeedbackTrait < ApplicationRecord
	belongs_to :feedback, inverse_of: :feedback_traits
  belongs_to :trait

  def name
    trait.name
  end

  def indent
    trait.indent
  end

  def self.averages(feedback_traits, decimal_place:)
    feedback_traits.group_by(&:trait_id).map do |trait_id, fts|
      count = fts.count
      average = fts.map{ |ft| ft.rating.to_f }.inject(:+) / count
      {
        name: Trait.find(trait_id).name.to_sym,
        average: average.round(decimal_place),
        count: count
      }
    end
  end
end
