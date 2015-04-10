module RegistrationsHelper

def register_link (event)
 	if !event.sold_out?
      link_to("Register", new_event_registration_path(event), class: 'button ok register')
     else
        content_tag(:strong,"Sold Out!")
    end
end 

end
