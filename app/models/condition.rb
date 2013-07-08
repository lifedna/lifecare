class Condition
  include Mongoid::Document	

  field :name, type: String
  field :status, type: String
  field :started_at, type: Time
  field :ended_at, type: Time  

  embedded_in :phr
end