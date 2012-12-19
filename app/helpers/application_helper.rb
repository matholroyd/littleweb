module ApplicationHelper
  def body_class
    full_name = controller.class.to_s.underscore.gsub(/[\/_]/, '-').sub(/-controller/, '')
    [                     full_name,
         controller.controller_name, 
                       "#{full_name}-#{controller.action_name}", 
      "#{controller.controller_name}-#{controller.action_name}"
      
    ].uniq.join(' ')
  end
end
