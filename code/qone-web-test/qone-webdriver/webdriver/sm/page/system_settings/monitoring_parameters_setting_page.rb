require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'


module WebDriver
  module Sm
    module Page
      module SystemSettings
        class MonitoringParametersSettingPage  < Common::BasePage
          include Support::MenuAction
          include Support::Component
          include Support::SwitchAction

           def to_this_page
            @page_profiles=Helper::ReadProfiles.apps_res_zh :sm
            system_manage =  @page_profiles['system_manage']
            system_settings =  @page_profiles['system_settings']['system_settings']
            monitoring_parameters = @page_profiles['system_settings']['monitoring_parameters_setting']
            menu_click system_manage
            menu_click_for_hide(system_settings,monitoring_parameters)
           end

          def top_title
            @driver[:css=>'h2'].text
          end

          def to_schedule_tab_page
            schedule_tab.click
          end

          def to_cost_tab_page
            cost_tab.click
          end

          def to_quality_tab_page
            quality_tab.click
          end

          def to_organization_track_tab_page
            organization_track_tab.click
          end

          def tab_page_flag_text
            set_schedule_table
           (@table[0][2].text).lstrip
          end

          def to_organization_track_tab_add_button_page
            to_organization_track_tab_page
             organization_track_tab_add_button.click
          end

          def organization_track_tab_add_page_title
            handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles,handle)
            title =  @driver[:css=>'h2'].text
            add_track_page_close_button.click
            switch_window handle
            title
          end

          private

          def schedule_tab
            @driver[:class=>'dh_menu'].find_elements(:tag_name=>'div')[0]
          end

          def set_schedule_table
            @table = table(@driver[:id=>'dataListTable_NFSDataList'])
          end

          def cost_tab
            @driver[:class=>'dh_menu'].find_elements(:tag_name=>'div')[1]
          end

          def quality_tab
            @driver[:class=>'dh_menu'].find_elements(:tag_name=>'div')[2]
          end

          def organization_track_tab
            @driver[:class=>'dh_menu'].find_elements(:tag_name=>'div')[3]
          end

          def organization_track_tab_add_button
            @driver[:class=>'button']
          end

          def add_track_page_close_button
            close = @page_profiles['system_settings']['close_button']
            @driver[:xpath=>"//input[@value='#{close}']"]
          end


        end # MonitoringParametersSettingPage

      end # SystemSettings
    end # Page
  end # Sm
end # WebDriver

