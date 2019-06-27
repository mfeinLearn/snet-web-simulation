module ServicesHelper
  def display_ai(service)
  #  service.ai.nil? ? link_to("Add Ai", edit_service_path(service)) : link_to(service.ai_name, ai_path(service.ai))
  #  service.ai.nil? ? link_to("Add Ai") : link_to(service.name)
  end
  # def use(user,service)
  #
  # end

  def if_current_user_has_service(ai)
    if ai.user_id == current_user.id
      content_tag(:p, "The folloiwng are the AIs that you created for this service: ")
      content_tag(:p, "Name of Ai:")
    end
  end
end
