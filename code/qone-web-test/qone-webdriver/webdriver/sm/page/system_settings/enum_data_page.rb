require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'

module WebDriver
  module Sm
    module Page
      module SystemSettings
        class EnumDataPage < Common::BasePage
          include Support::MenuAction
          include Support::Component
          include Support::SwitchAction

          def to_this_page
            @page_profiles = Helper::ReadProfiles.apps_res_zh :sm
            system_manage = @page_profiles['system_manage']
            enum_data = @page_profiles['system_settings']['enum_data']
            menu_click system_manage
            show_menu_by_js('sm_sytem')
            menu_click enum_data
          end

          def top_title
            @driver[:css=>'h2'].text
          end

          def select_enum_data type
            select_component = select(enum_type)
            select_component.select_by :text, type
            sleep 3
            set_enum_table
          end

          def return_name_field_text_in_datalist
            set_enum_table
            datalist_head_row = 0
            name_field_col = 2
            field_text = @table[datalist_head_row][name_field_col].text
            field_text.rstrip
          end

          def add_enum_data(enum_name, description)
            row_count = @table.row_count
            name_col = 2
            description_col = 3
            name_element = enum_name_text(row_count - 1, name_col)
            name_element.send_keys enum_name
            description_element = enum_description_text(row_count - 1, description_col)
            description_element.send_keys description
            submit_button.click
            notice_success.text
          end

          def del_enum_data(enum_name)
            del_row = find_row_by_enum_name enum_name
            del_col = 4
            @table[del_row][del_col].all(:tag_name=>'img')[0].click
            alert_ok
            sleep 3
            set_enum_table
            find_by_name? enum_name
          end

          def bug_class_tab_click
            first_tab.click
          end

          def bug_priority_tab_click
            second_tab.click
          end

          def bug_resolve_method_tab_click
            third_tab.click
          end

          def bug_severity_tab_click
            forth_tab.click
          end

          def control_level_tab_click
            first_tab.click
          end

          def control_level_tab_text
            first_tab.text
          end

          def format_tab_click
            second_tab.click
          end

          def confidential_tab_click
            third_tab.click
          end

          def state_tab_click
            forth_tab.click
          end

           def problem_type_tab_click
            problem_type_tab.click
          end

          def problem_severity_tab_click
           problem_severity_tab.click
          end

            def risk_type_tab_click
           risk_type_tab.click
          end

          def risk_probability_tab_click
           risk_probability_tab.click
          end

          def risk_influence_tab_click
           risk_influence_tab.click
          end

          def risk_domain_value_tab_click
            risk_domain_value_tab.click
          end

          def risk_level_tab_click
            risk_level_tab.click
          end

          def stakeholders_activity_type_tab_click
            first_tab.click
          end

          def to_project_attitude_tab_click
            second_tab.click
          end

          def participation_way_tab_click
            third_tab.click
          end

          def stakeholders_type_tab_click
            forth_tab.click
          end

          def stakeholders_type_tab_text
            forth_tab.text
          end

          def software_scale_unit_tab_click
            first_tab.click
          end

          def work_product_scale_unit_tab_click
            second_tab.click
          end


          private

          def find_row_by_enum_name(enum_name)
            row_count = @table.row_count
            return_row = 0
            name_col = 2
            (1..row_count - 1).each do |r|
              element = enum_name_text(r, name_col)
              if element.attribute('title') == enum_name
                return_row = r
              end
            end
            return_row
          end

          def find_by_name?(enum_name)
            flag = false
            row_count = @table.row_count
            name_col = 2
            (1..row_count - 1).each do |r|
              element = enum_name_text(r, name_col)
              if element.attribute('title') == enum_name
                flag = true
                break
              end
            end
            flag
          end

          def set_enum_table
            @table = table(@driver[:id=>'enumDateTable'])
          end

          def notice_success
            @driver[:css=>'div#updateEnumDataNotice span']
          end

          def enum_type
            @driver[:name=>'enumDataTypeId']
          end

          def submit_button
            @driver[:xpath=>"//input[@type ='submit']"]
          end

          def name_title
            val = @table[0][2].text
            val.rstrip
          end

          def enum_name_text(row, col)
            @table[row][col].find_element(:name=>'enumDataLabel')
          end

          def enum_description_text(row, col)
            @table[row][col].find_element(:name=>'description')
          end

          def first_tab
            @driver[:class=>'pro_menu'].find_elements(:tag_name=>'div')[0]
          end

          def second_tab
            @driver[:class=>'pro_menu'].find_elements(:tag_name=>'div')[1]
          end

          def third_tab
            @driver[:class=>'pro_menu'].find_elements(:tag_name=>'div')[2]
          end

          def forth_tab
            @driver[:class=>'pro_menu'].find_elements(:tag_name=>'div')[3]
          end

          def problem_type_tab
            @driver[:class=>'pro_menu'].find_elements(:tag_name=>'div')[0]
          end

          def problem_severity_tab
            @driver[:class=>'pro_menu'].find_elements(:tag_name=>'div')[1]
          end

          def risk_type_tab
            @driver[:class=>'dh_menu'].find_elements(:tag_name=>'a')[0]
          end

          def risk_probability_tab
            @driver[:class=>'dh_menu'].find_elements(:tag_name=>'a')[1]
          end

          def risk_influence_tab
            @driver[:class=>'dh_menu'].find_elements(:tag_name=>'a')[2]
          end

          def risk_domain_value_tab
            @driver[:class=>'dh_menu'].find_elements(:tag_name=>'a')[3]
          end

          def risk_level_tab
            @driver[:class=>'dh_menu'].find_elements(:tag_name=>'a')[4]
          end

        end #EnumDataPage
      end # SystemSettings
    end # Page
  end # Sm
end # WebDriver

