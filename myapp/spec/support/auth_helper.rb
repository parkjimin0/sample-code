module AuthHelper
    def http_login_beehive
        request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials("user","pass")
    end  

    def http_login_cell
        request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials("cell","pass")
    end
  end