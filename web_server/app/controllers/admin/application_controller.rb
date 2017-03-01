# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_filter :authenticate_admin

    def column_name(name)
      if Rails.env.development?
        return name
      else
        return "\"#{name}\""
      end
    end 

    def authenticate_admin
      return ip_check
    end


    def ip_check
      @remote_ip = request.remote_ip.encode('utf-8')
      if Rails.env.development?
        return true
      else
        if "106.251.53.134" != @remote_ip && "211.192.197.103" != @remote_ip && @remote_ip[0, 8] != "192.168."
          logger.error("invalid ip. remote_ip: " + @remote_ip)
          head(403)
          return false
        end    
      end       
      return true
    end   

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
