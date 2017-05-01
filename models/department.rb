class Department < ActiveRecord::Base
  has_many :course_depts
  has_many :courses, through: :course_depts
end