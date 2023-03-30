class HeroPower < ApplicationRecord
  belongs_to :hero
  belongs_to :power

  validates :strength,
            {
              inclusion: {
                in: %w[Strong Weak Average],
                message:
                  "The strength must be either 'Strong', 'Weak' or 'Average'",
              },
              presence: true,
            }
end
