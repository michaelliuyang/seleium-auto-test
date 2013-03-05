require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'

module WebDriver
  module Sm
    module Page
      module SystemSettings
        class CasServerSettingPage  < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction

          def to_this_page
              @page_profiles=Helper::ReadProfiles.apps_res_zh :sm
              system_manage =  @page_profiles['system_manage']
              system_settings =  @page_profiles['system_settings']['system_settings']
              cas_sever_setting = @page_profiles['system_settings']['cas_server_setting']
              menu_click system_manage
              menu_click_for_hide(system_settings,cas_sever_setting)
          end


          def top_title
            @driver[:css=>'h2'].text
          end

          def submit_cas_sever_setting  radio,name,domain,port,description
             @radio_text = @page_profiles['system_settings']['cas_no']
            if radio == @radio_text
              radio_box_no_element.click
            else
             radio_box_yes_element.click
            end
            cas_name_element.clear
            cas_name_element.send_keys name
            cas_domain_element.clear
            cas_domain_element.send_keys domain
            cas_port_element.clear
            cas_port_element.send_keys port
            cas_description_element.clear
            cas_description_element.send_keys description
            submit_button.submit
          end

          def verification_info radio,name,domain,port,description
            result_flag=0
             if radio == @radio_text
              e =(radio_box_no_element.attribute('checked')== 'true')
             else
              e =(radio_box_yes_element.attribute('checked') == 'true')
             end
            a = (cas_name_element.attribute('value')==name)
            b = (cas_domain_element.attribute('value')==domain)
            c = (cas_port_element.attribute('title')=="#{port}")
            d = (cas_description_element.text == description)
            if a&&b&&c&&d&&e
              result_flag = 1
            end
             result_flag
          end

          def yellow_button_test
            return_flag = 0
            error_reminding = @page_profiles['system_settings']['error_reminding']
            @driver[:id=>'yellowButton'].click
            if reminding_message.text== error_reminding
             return_flag =1
            end
          end

          private

          def reminding_message
            @driver[:class=>'redCenter']
          end

          def cas_name_element
             @driver[:name=>'casAlias']
          end

          def cas_domain_element
            @driver[:name=>'casDomain']
          end

          def cas_port_element
             @driver[:name=>'casPort']
          end

          def cas_description_element
            @driver[:name=>'casDescription']
          end

          def submit_button
            @driver[:xpath=>"//input[@type='submit']"]
          end

          def radio_box_yes_element
            @driver[:xpath=>"//input[@name='casSwitch' and @value='1']"]
          end

          def radio_box_no_element
             @driver[:xpath=>"//input[@name='casSwitch' and @value='0']"]
          end

        end # CasServerSettingPage

      end # SystemSettings
    end # Page
  end # Sm
end # WebDriver

