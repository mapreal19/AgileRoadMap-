module PagesHelper
  def active_class(action, controller)
    if params[:action] == action and params[:controller] == controller
      'active'
    else
      ''
    end
  end
end
