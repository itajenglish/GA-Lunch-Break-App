class Place < ApplicationRecord
  belongs_to :user, required: false
end

