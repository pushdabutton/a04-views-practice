# == Schema Information
#
# Table name: links
#
#  id         :bigint           not null, primary key
#  title      :string
#  url        :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ApplicationRecord
    validates :title, :url, :user_id, presence: true

    belongs_to :user
    has_many :comments
end
