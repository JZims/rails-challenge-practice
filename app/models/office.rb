class Office < ApplicationRecord
    belongs_to :company
    belongs_to :building

    validates :floor, numericality: true
end
