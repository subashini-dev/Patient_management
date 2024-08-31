class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def after_sign_in_path_for(resource)
        if resource.role == 'doctor'
            dashboard_patients_path
        else
            patients_path
        end
    end
end
