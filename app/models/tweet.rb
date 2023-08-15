class Tweet < ApplicationRecord
   validates :description,  presence: true, 
                            length: { maximum: 140 }
   validates :userName,     presence: true, 
                            length: { maximum: 50 }
end
