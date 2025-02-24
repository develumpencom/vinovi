class Watched < ApplicationRecord
  self.table_name = "watched"

  belongs_to :user
  belongs_to :media, polymorphic: true

  validates_presence_of :watched_at
end
