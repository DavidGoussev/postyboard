# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  topic_id   :integer
#

class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic
  has_one :summary

  default_scope { order(created_at: :desc) }
  scope :ordered_by_title, -> { reorder(title: :asc)}
  scope :ordered_by_reverse_created_at, -> { reorder(created_at: :asc)}

end
