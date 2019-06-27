module SessionsHelper
  def already_signed_in
    content_tag(:p, "You are already signed in")
  end
end
