require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'

module WebDriver
  module Mea
    module Page
      module ProjectMeasure
        class ProjectListPage < Common::BasePage

          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          def to_this_page
            @mea_profiles = Helper::ReadProfiles.apps_res_zh :mea
            @data_mea = Helper::ReadProfiles.data :mea
            measure_analysis = @mea_profiles['measure_analysis']
            project_list = @mea_profiles['project_measure']['project_list']
            menu_click measure_analysis
            show_menu_by_js 'mt_mr'
            menu_click project_list
          end

          def top_title
            @driver[:css => 'h2'].text
          end

          def project_name_link_title
            project_name_link_click
            name_link_title = top_title
            sleep 2
          end
          
          
          #no realize error no click events
          def measure_activity_tab_click
            measure_activity_tab.click
            activity_top_title = top_title
          end

          private

          def project_name_link_click
            project_num = @data_mea['project_list']['project_num']
            title = @data_mea['project_list']['title']
            data_list = qone_data_list(project_list_table)
            str = "table tbody tr td[title='#{title}'] div div nobr a"
            data_list.operate(project_num,0,str,1)
          end

          def project_list_table
            @driver[:css => '#dataListTable_NFSDataList']
          end
          
          #tag_name no use error code
          def measure_tagert
            @driver.find_element(:class => 'dh_menu').find_elements(:tag_name => 'div')[0]
          end

          def measure_activity_tab
            @driver.find_element(:css => 'div.dh_menu div').find_elements(:tag_name => 'a')[1]
          end
          
          def plan_summary
            @driver.find_element(:class => 'dh_menu').find_elements(:tag_name => 'div')[2]
          end
        end
      end
    end
  end
end