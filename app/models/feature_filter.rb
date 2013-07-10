class FeatureFilter
  include Mongoid::Document

  field :conditions, type: Hash
  field :symptoms, type: Hash
  field :treatments, type: Hash

  belongs_to :phr
end