class PostSub < ActiveRecord::Base
  validates :post, :sub, presence: true

  belongs_to :post, class_name: "Post", foreign_key: :post_id
  belongs_to :sub

end
