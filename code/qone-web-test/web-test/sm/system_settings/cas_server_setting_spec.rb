require_relative '../../load_helper'

module WebTest
  module Sm
    module SystemSettings

      describe 'cas server setting page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :sm,driver
          @sm_profiles = Helper::ReadProfiles.apps_res_zh :sm
          @cas_server_setting_page = @page_container.cas_server_setting_page
          @cas_server_setting_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'cas server setting menu click success?' do
          cas_server_setting_menu_name = @sm_profiles['system_settings']['cas_server_setting']
          actual_top_title = @cas_server_setting_page.top_title
          actual_top_title.should ==  cas_server_setting_menu_name
        end

        it 'submit cas server settings info ' do
          radio =@sm_profiles['system_settings']['cas_radio']
          name = @sm_profiles['system_settings']['cas_name']
          domain = @sm_profiles['system_settings']['cas_domain']
          port = @sm_profiles['system_settings']['cas_port']
          description = @sm_profiles['system_settings']['cas_description']
          @cas_server_setting_page.submit_cas_sever_setting  radio,name,domain,port,description
          expect_result = 1
          actual = @cas_server_setting_page.verification_info  radio,name,domain,port,description
          actual.should == expect_result
        end

        it'yellow button test' do
          actual_flag = @cas_server_setting_page.yellow_button_test
          expect_flag = 1
          actual_flag.should ==expect_flag
        end

      end
    end # SystemSettings
  end # Sm
end # WebTest