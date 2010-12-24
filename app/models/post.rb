class Post < ActiveRecord::Base
  validates :name,  :presence => true
  validates :title, :presence => true,
    :length => { :minimum => 5 }
  
  has_many :comments ,  :dependent => :destroy
  has_many :tags

  accepts_nested_attributes_for :tags , :allow_destroy => :true, # 允许删除
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } } # tag为空的时候 不保存
end
