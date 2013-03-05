require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require  'webdriver/support/driver_extension_action'

module WebDriver
  module Hl
    module Page
      module MemberMonitor
        class WorkLogPage < Common::BasePage
         include Support::MenuAction
         include Support::SwitchAction
         def to_this_page
           @page_profiles = Helper::ReadProfiles.apps_res_zh :hl
           high_level_view = @page_profiles['high_level_view']
           member_monitor = @page_profiles['member_monitor']['member_monitor']
           work_log = @page_profiles['member_monitor']['work_log']
           menu_click high_level_view
           #menu_click_for_hide member_monitor,work_log
           show_menu_by_js("hl_em")
           menu_click work_log
           sleep 2
         end

         def completed_log_search_title
           switch_to_frame iframe
           switch_to_frame right_main_frame
           completed_log_search.click
           completed_log_search_title = @driver[:class=>'frame_title'].text
           switch_out_frame
           completed_log_search_title
         end

         def left_tree_title
           switch_to_left_frame
           left_tree_title = @driver[:css => '#content h2'].text
           switch_out_frame
           left_tree_title
         end

         def not_completed_log_search_title
           switch_to_right_frame
           not_completed_log_search.click
           not_completed_log_search_title = @driver[:class => 'frame_title'].text
           switch_out_frame
           not_completed_log_search_title
         end

         def completed_log_search
           completed_log_search = @page_profiles['member_monitor']['completed_log_search']
           @driver[:link => completed_log_search]
         end

         def not_completed_log_search
           not_completed_log_search = @page_profiles['member_monitor']['not_completed_log_search']
           @driver[:link => not_completed_log_search]
         end

         def print_task_daily_report
           print_task_daily_report = @page_profiles['member_monitor']['print_task_daily_report']
           @driver[:link => print_task_daily_report]
         end

         def print_unplanned_task
           print_unplanned_task = @page_profiles['member_monitor']['print_unplanned_task']
           @driver[:link => print_unplanned_task]
         end

         def print_work_diary
           print_work_diary = @page_profiles['member_monitor']['print_work_diary']
           @driver[:link => print_work_diary]
         end

         def left_treeview_frame
           @driver[:name => 'department_left_treeview']
         end

          def iframe
            @driver[:xpath => "//iframe[@src = '/pm/pm/departstatus/userWorkLogIframe.jsp?type=department']"]
          end

         def switch_to_left_frame
           switch_to_frame iframe
           switch_to_frame left_treeview_frame
         end

         def switch_to_right_frame
           switch_to_frame iframe
           switch_to_frame right_main_frame
         end

          def right_main_frame
            @driver[:name => 'department_right_main']
          end
        end#WorkLogPage
      end#MemberMonitor
    end#Page
  end#Hl
end#WebDriver