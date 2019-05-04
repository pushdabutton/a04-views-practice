# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  user_id    :integer
#  link_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
    validates :body, :user_id, :link_id, presence: true

    belongs_to :user
    belongs_to :link
end
