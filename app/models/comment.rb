# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  blog_id    :integer
#
class Comment < ApplicationRecord
# Direct associations
  belongs_to(:blog, { :required => false, :class_name => "Post", :foreign_key => "blog_id", :counter_cache => true })
  belongs_to(:author, { :required => false, :class_name => "User", :foreign_key => "author_id" })

# Indirect associations

# Validations
  validates(:body, { :presence => true })
  validates(:blog_id, { :presence => true })

end
