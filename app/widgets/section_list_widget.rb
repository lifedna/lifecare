class SectionListWidget < AuthorizableWidget
  responds_to_event :updateName, :with => :update, :passing => :root	

  def display(options)
  	@community = options[:community]
  	@sections = @community.sections
    @current_section = options[:current_section]

    render
  end

  def update(evt)
  	id = evt[:section].id
  	name = evt[:section].name
  	render :text => "$(\"li[data-id=#{id}] :first-child\").text(\"#{name}\");"
  end	

end
