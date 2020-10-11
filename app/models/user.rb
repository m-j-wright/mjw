# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  bio             :text
#  blogs_count     :integer
#  email           :string
#  image           :string
#  is_private      :boolean
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
# Direct associations
  has_many(:blogs, { :class_name => "Post", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:comments, { :class_name => "Comment", :foreign_key => "author_id", :dependent => :destroy })

# Indirect associations

# Validations
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
