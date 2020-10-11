# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  comments_count :integer
#  content        :text
#  image          :string
#  mood           :string
#  tag            :string
#  title          :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#
class Post < ApplicationRecord
# Direct associations
  has_many(:comments, { :class_name => "Comment", :foreign_key => "blog_id", :dependent => :destroy })
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id", :counter_cache => :blogs_count })

# Indirect associations

# Validations
  validates(:user_id, { :presence => true })
  validates(:title, { :presence => true })
  validates(:content, { :presence => true })
  
end
