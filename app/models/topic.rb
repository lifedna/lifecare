class Topic
  include Mongoid::Document	
  include Mongoid::Timestamps
  include Mongoid::Likeable
  include Mongoid::Commentable

  field :title, type: String
  field :body, type: String
  field :hits, type: Integer, :default => 0
  field :sticky, type: Boolean, :default => false
  field :locked, type: Boolean, :default => false
  field :posts_count, type: Integer, :default => 0
  field :category, type: Integer

  validates_presence_of :title, :body

  # attr_accessible :title, :body, :forum_id, :community_id

  belongs_to :forum
  belongs_to :user
  belongs_to :community

  has_many :posts

  def hit!
    self.class.increment_counter :hits, id
  end

  def liked?(user)
    return self.likers.include?(user)
  end 
end