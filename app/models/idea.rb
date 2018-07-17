class Idea < ApplicationRecord
    belongs_to :user

    has_many :reviews, dependent: :destroy
 

    validates(:title, presence: true, uniqueness: true)

  
    validates(
      :description,
      presence: {
        message: "must be given"
      },
      length: {
        minimum: 10,
        maximum: 2048
      }
    )
  
  
    validate :no_monkey
  
    private
  
    def no_monkey

      if description&.downcase&.include?("monkey")
        errors.add(:body, "must not have a monkey")
      end
    end
  end
