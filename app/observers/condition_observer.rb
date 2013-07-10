class ConditionObserver < Mongoid::Observer
  def after_create(record)
    filter = record.phr.feature_filter
    unless filter.conditions.include?(record.name)
      filter.conditions.merge!({record.name => true})
      filter.save
    end	
  end

  def before_destroy(record)
    filter = record.phr.feature_filter
    filter.conditions.delete record.name
    filter.save
    # unless filter.conditions.include?(record.name)
    #   filter.conditions.merge!({record.name => true})
    #   filter.save
    # end	
  end
end