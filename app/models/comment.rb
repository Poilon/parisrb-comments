class Comment < ApplicationRecord

  belongs_to :talk
  belongs_to :spectator
end
