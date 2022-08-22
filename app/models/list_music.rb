class ListMusic < ActiveRecord::Base
  belongs_to :parent, class_name: "ListMusic"
  has_many :childrens, foreign_key: :parent_id, class_name: "ListMusic"
end
