# coding: utf-8
class Phr
  include Mongoid::Document	
  include Mongoid::Timestamps

  field :name, type: String
  field :age, type: Integer
  field :gender, type: String
  field :relationship, type: String
  field :residence, type: String

  embeds_many :conditions
  embeds_many :symptoms
  embeds_many :treatments

  accepts_nested_attributes_for :conditions, reject_if: proc { |attributes| attributes["name"].blank? }
  accepts_nested_attributes_for :symptoms, reject_if: proc { |attributes| attributes["name"].blank? }
  accepts_nested_attributes_for :treatments, reject_if: proc { |attributes| attributes["name"].blank? }

  validates :gender, :inclusion => {:in => %w(男 女), :message => "%{value} is not a valid gender" }, :allow_nil => true	
  validates :relationship, :inclusion => {:in => %w(父亲 母亲 配偶 儿子 女儿 亲戚 朋友 自己), :message => "%{value} is not a valid relationship" }, :allow_nil => true	

  belongs_to :user

end