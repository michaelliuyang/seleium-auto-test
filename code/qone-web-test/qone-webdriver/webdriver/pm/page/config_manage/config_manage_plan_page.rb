require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action.rb'
require 'selenium-webdriver'
require 'webdriver/support/component.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Pm
    module Page
      module ConfigManage
        class ConfigManagePlanPage  < Common::BasePage

          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          include Support::DriverExtensionAction
          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            config_manage = @pm_profiles['config_manage']['config_manage']
            #config_manage1 = @driver[:id=>'navSub'].find_element(:link=>config_manage)
            config_manage_plan = @pm_profiles['config_manage']['config_manage_plan']
            show_menu_by_js  "pm_scmt"
            menu_click config_manage_plan

          end

          def top_title
            @driver[:css => '#content h2'].text
          end

          def new_config_manage_plan(change_describe,date_of_plan,audit_person_name,operate_type)
            new_config_manage_plan_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            add_change_describe.send_keys(change_describe)
            add_date_of_plan.input_date date_of_plan
            select_audit_person.select_by_text audit_person_name
            sleep 3
            if operate_type.should == @pm_profiles['config_manage']['preservation']
                preservation_button.click
            else
              submit_examine_and_approve_button.click
            end
            switch_window first_handle
          end
          
          def config_manage_plan_by_change_describe change_describe
              data_list = qone_data_list(config_manage_plan_table)
              data_list.data_exist?(change_describe,1)
          end
          
          def modify_config_manage_plan(change_describe,change_describe_for_modify)
            data_list = qone_data_list(config_manage_plan_table)
            data_list.operate(change_describe,1,:edit,5)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            add_change_describe.clear
            add_change_describe.send_keys(change_describe_for_modify)
            submit_examine_and_approve_button.click
            switch_window first_handle 
          end
          
          def examination_and_approval_config_manage_plan(change_describe_for_modify)
            data_list = qone_data_list(config_manage_plan_table)
            data_list.operate(change_describe_for_modify,1,:b_evaluate,5)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            page_title = top_title
            examine_and_approve_button.click
            switch_window first_handle 
            page_title
          end
          
          def look_config_manage_plan(change_describe_for_modify)
            data_list = qone_data_list(config_manage_plan_table)
            data_list.operate(change_describe_for_modify,1,:view,5) 
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles, first_handle
            page_title = top_title
            sleep 3
            close_button.click
            switch_window first_handle 
            page_title
          end
          
          private
          
          def config_manage_plan_table
            @driver.find_element(:css =>"div[id='content'] table")
          end
           
          def preservation_button
            preservation_name = @pm_profiles['config_manage']['preservation']
            @driver.find_element(:css =>"input[value = '#{preservation_name}']")
          end
          
          def submit_examine_and_approve_button
            submit_name = @pm_profiles['config_manage']['submit_examine_and_approve']
            @driver.find_element(:css =>"input[value = '#{submit_name}']")
          end
          
          def examine_and_approve_button
            approval_name = @pm_profiles['config_manage']['examine_and_approve']
            @driver.find_element(:css =>"input[value = '#{approval_name}']")
          end
          
          def close_button
            close_name = @pm_profiles['config_manage']['close']
            @driver.find_element(:css =>"input[value = '#{close_name}']")
          end
          
          def new_config_manage_plan_button
            @driver.find_element(:id=>'yellowButton')
          end
          
          def add_change_describe
            @driver.find_element(:name =>'changeDesc')
          end
          
          def add_date_of_plan
            qone_date(@driver,"id = 'planDate'")
          end
          
          def select_audit_person
            select_name = @driver.find_element(:id => 'approver_input')
            qone_select(@driver,select_name)
          end
          
          def config_identify_for_control
            @driver.find_element(:id =>'info_3').find_element(:id =>'dataListTable_NFSDataList')
          end
          
          def config_identify_for_product
            @driver.find_element(:id => 'info_13').find_element(:id =>'dataListTable_NFSDataList')
          end
          
          def baseline_identify_add_baseline
            @driver.find_element(:id =>'info_4').find_element(:id  =>'yellowButton')
          end

        end

      end
    end
  end
end
