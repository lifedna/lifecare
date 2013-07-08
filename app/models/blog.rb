# coding: utf-8
class Blog
  include Mongoid::Document	
  include Mongoid::Timestamps

  field :title, type: String
  field :body, type: String
  field :hits, type: Integer, :default => 0
  field :locked, type: Boolean, :default => false
  field :public, type: Boolean, :default => true
  field :category, type: String

  validates :title, :body, :presence => true
  validates :category, :inclusion => {:in => %w(健康知识 就医指南 治疗交流 护理园地 用药常识), :message => "%{value} is not a valid category" }, :allow_nil => true

  belongs_to :user


  def hit!
    self.class.increment_counter :hits, id
  end  	

end