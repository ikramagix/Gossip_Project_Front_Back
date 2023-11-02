module SessionsHelper
    def log_in(user)
      if user
      session[:user_id] = user.id
      end
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def log_out
      session.delete(:user_id)
    end
  end  