require 'webdriver/common/base_page'

module WebDriver
  module Login
    module Page
      class LoginPage < Common::BasePage
        def login(login_name,login_pwd)
          begin
            login_name_field.clear
            login_name_field.send_keys login_name
            login_pwd_field.clear
            login_pwd_field.send_keys login_pwd
            login_btn.click
          rescue
            raise 'login failed'
          end
        end

        private

        def login_name_field
          @driver[:id=>'loginUserName']
        end

        def login_pwd_field
          @driver[:id=>'currentPassword']
        end

        def login_btn
          @driver[:id=>'bn_login']
        end
      end
    end # Page
  end # Login
end # WebDirver