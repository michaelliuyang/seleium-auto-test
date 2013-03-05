require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component.rb'

module WebDriver
  module Prom
    module Page
      module ProcessAssets
        class RiskLibraryPage < Common::BasePage

          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          
          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            @data_prom = Helper::ReadProfiles.data :prom
            process_manage = @prom_profiles['process_manage']
            risk_library = @prom_profiles['process_assets']['risk_library_organization_level']
            menu_click process_manage
            show_menu_by_js("spa_pd")
            menu_click risk_library
          end

          def add_risk(content,influence,mitigation,emergency)
            add_risk_button.click
            add_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, add_handle)
            import_project_risk
            input_risk_content(content,influence,mitigation,emergency)
            switch_window add_handle
          end
          
          def modify_risk(description,reasons)
            click_modify_img
            modify_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, modify_handle)
            risk_description.clear
            risk_description.send_keys description
            submit_button.click
            modification_reasons.send_key reasons 
            submit_button_reasons.click
            switch_window modify_handle
          end
          
          def delete_risk
            click_delete_img
            alert_ok
          end
          
          def into_describe_link
            click_describe_link
            link_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, link_handle)
            title = top_title
            close_button_link.click
            switch_window link_handle
            title           
          end
          
          def find_risk_describe_exist? risk_describe
            data_list = qone_data_list(rist_list_table,"style*='display:none'",:all)
            data_list.data_exist?(risk_describe,1)
          end

          def top_title
            @driver[:css=> 'h2'].text
          end

          private

          def click_describe_link
            riskID = @data_prom['organization_risk']['riskID']
            describe = @data_prom['organization_risk']['risk_describe']
            data_list = qone_data_list(rist_list_table,"style*='display:none'",:all)
            str = "table[id='dataListTable_NFSDataList'] tbody tr td[title='#{describe}'] div div a"
            data_list.operate(riskID,0,str,1)
          end
          
          def click_delete_img
            riskID = @data_prom['organization_risk']['riskID']
            data_list = qone_data_list(rist_list_table,"style*='display:none'",:all)
            data_list.operate(riskID,0,:delete,8)
          end
          
          def click_modify_img
            riskID = @data_prom['organization_risk']['riskID']
            data_list = qone_data_list(rist_list_table,"style*='display:none'",:all)
            data_list.operate(riskID,0,:edit,8)
          end  
          
          def input_risk_content(content,influence,mitigation,emergency)
            happen_phase.clear
            happen_phase.send_keys content
            produce_influence.clear
            produce_influence.send_keys influence
            mitigation_measures.clear
            mitigation_measures.send_keys mitigation
            emergency_measures.clear
            emergency_measures.send_keys emergency
            submit_button.click
          end
          
          def import_project_risk
            import_button.click
            handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, handle)
            select_box.click
            sleep 1
            confirm_import_button.click
            switch_window handle
          end

          def select_box
            @driver[:css => "table tbody tr td div div input[value='1']"]
          end

          def confirm_import_button
            @driver[:css => '#null']
          end

          def add_risk_button
            @driver[:css => "div span.button a"]
          end
          
          def happen_phase
            @driver[:name => 'phase']
          end
          
          def produce_influence
            @driver[:name => 'influence']
          end
          
          def mitigation_measures
            @driver[:name => 'guard']
          end
          
          def emergency_measures
            @driver[:name => 'riskEmergencyMeasure']
          end

          def import_button
            @driver[:css => '#yellowButton']
          end
          
          def modification_reasons
            @driver[:name => 'riskComment']
          end         
          
          def risk_description
            @driver[:name =>'description']
          end
          
          def rist_list_table
            @driver[:css => '#dataListTable_NFSDataList']
          end

          def submit_button
            @driver[:name=> 'submit']
          end
          
          def submit_button_reasons
            @driver[:css => "div[id='poplayer'] div input[type='submit']"]
          end
          
          def close_button_link
            @driver[:css => "div[id='content'] div[cklass='bottomButtons'] input[type='button']"]
          end

        end #RiskLibraryPage
      end # ProcessAssets
    end # Page
  end #  Prom
end # WebDriver