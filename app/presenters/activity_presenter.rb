# coding: utf-8
class ActivityPresenter < BasePresenter
  presents :activity

  def text
  	case activity.verb
  	when :new_article
  	  out = %(#{raw link_to(activity.the_actor.name, activity.the_actor)} 写了新文章 #{raw link_to(activity.the_object.title, [activity.the_object.community, activity.the_object])} 来自 #{raw link_to(activity.the_target.name, activity.the_target)})	
  	when :new_question
  	  out = %(#{raw link_to(activity.the_actor.name, activity.the_actor)} 发起了新问题 #{raw link_to(activity.the_object.title, [activity.the_object.community, activity.the_object])} 来自 #{raw link_to(activity.the_target.name, activity.the_target)})		
  	when :new_topic
      out = %(#{raw link_to(activity.the_actor.name, activity.the_actor)} 写了新帖子 #{raw link_to(activity.the_object.title, [activity.the_object.community, activity.the_object])} 来自 #{raw link_to(activity.the_target.name, activity.the_target)})    
    when :new_poll
      out = %(#{raw link_to(activity.the_actor.name, activity.the_actor)} 发起了新投票 #{raw link_to(activity.the_object.name, [activity.the_object.community, activity.the_object])} 来自 #{raw link_to(activity.the_target.name, activity.the_target)})    
    when :join
      out = %(#{raw link_to(activity.the_actor.name, activity.the_actor)} 加入了社群 #{raw link_to(activity.the_object.name, activity.the_object)})   
  	else
      out = ""
  	end	
  	return raw out
  end	
end  