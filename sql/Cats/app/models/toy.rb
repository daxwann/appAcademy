class Toy < ApplicationRecord
  belongs_to :cat, {
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat
  }

  has_one :house,
    through: :cat,
    source: :house
end