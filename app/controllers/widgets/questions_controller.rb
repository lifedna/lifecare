class Widgets::QuestionsController < ApplicationController
  def new
    @qa = Qa.find params[:qa_id]
    @question = Question.new
    @question.title = params[:title]
  end

  def create
    @qa = Qa.find params[:qa_id]
    @question = Question.new(params[:question])
    if @question.save 
      flash[:notice] = "Question saved successfully."
      current_user.publish_activity(:new_question, :object => @question, :target_object => @qa.community)
      redirect_to community_section_path(@qa.community, @qa.section)
    else
      flash[:notice] = "Failed to save question."    
      render :action => :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @community = Community.find params[:community_id]
    @sections = @question.community.sections
    @current_section = @question.qa.section
  end

  def update
  end

  def destroy
  end
end
