module PagesHelper
  def active_class(action, controller)
    if (params[:action] == action) && (params[:controller] == controller)
      'active'
    else
      ''
    end
  end

  def agile_roadmap_active?
    if %w[agile_map_definition agile_map_pasos].include?(params[:action]) || ['practicas'].include?(params[:controller])
      'active'
    else
      ''
    end
  end
end
