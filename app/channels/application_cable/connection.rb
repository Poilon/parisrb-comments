module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_user

    def connect
      # Check authentication, and define current user
      self.current_user = nil
    end

  end
end
