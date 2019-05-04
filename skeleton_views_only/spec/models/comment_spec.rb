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

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should validate_presence_of(:body) }
  it 'should validate that :user cannot be empty/falsy' do
    should validate_presence_of(:user).with_message(/must exist|can't be blank/)
  end
  it 'should validate that :link cannot be empty/falsy' do
    should validate_presence_of(:link).with_message(/must exist|can't be blank/)
  end
  it { should belong_to(:user).class_name(:User) }
  it { should belong_to(:link).class_name(:Link) }
end
