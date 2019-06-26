module ServicesHelper
  def display_ai(service)
  #  service.ai.nil? ? link_to("Add Ai", edit_service_path(service)) : link_to(service.ai_name, ai_path(service.ai))
    service.ai.nil? ? link_to("Add Ai") : link_to(service.name)
  end
  def use(user,service)

  end
end
