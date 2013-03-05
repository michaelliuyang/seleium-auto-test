require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'

module WebDriver
  module Wkb
    module Page
      module MyMeeting
        class MyMeetingPage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          def to_this_page
            @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
            @data_wkb = Helper::ReadProfiles.data :wkb
            work_bench = @wkb_profiles['work_bench']
            my_meeting = @wkb_profiles['my_meeting']['my_meeting']
            menu_click work_bench
            menu_click my_meeting
          end

          def page_title
            @driver.title
          end

          #select time is no use
          def add_meeting_summary_title
            meeting_name = @data_wkb['my_meeting']['name_for_add_meeting']
            anchorman = @data_wkb['my_meeting']['anchorman']
            add_meeting_summary_button.click
            input_meeting_context(meeting_name,anchorman)
            meeting_summary_title
          end

          def modify_meeting meeting_name_modify
            modify_img_click
            modify_meeting_context meeting_name_modify
          end

          def delete_meeting
            delete_img_click
            sleep 7
            alert_ok  #tip wrong
          end

          def view_meeting
            view_img_click
            view_handle = @driver.window_handle
            handles= @driver.window_handles
            switch_alert_window(handles, view_handle)
            title = top_title
            close_button.click
            switch_window view_handle
            title
          end

          def email_meeting
            email_img_click
            email_handle = @driver.window_handle
            handles= @driver.window_handles
            switch_alert_window(handles, email_handle)
            tab_text = email_tab_text
            submit_button_email
            switch_window email_handle
            tab_text
          end

          def find_meeting_name? meeting_name
            data_list = qone_data_list(meeting_table,"style*='display:none'",:all)
            data_list.data_exist?(meeting_name,1)
          end
          
          def draft_meeting_summary_title
            draft_meeting_summary_link.click
            sleep 2
            title = top_title
          end
          
          def unread_meeting_summary_title
            unread_meeting_summary_link.click
            sleep 2
            title = top_title
          end
          
          def all_meeting_summary_title
            all_meeting_summary_link.click
            sleep 2
            title = top_title
          end

          private
          
          def draft_meeting_summary_link
            @driver[:class => 'nfs-myRequests-divLeft'].find_elements(:tag_name => 'a')[1]
          end
          
          def unread_meeting_summary_link
            @driver[:class => 'nfs-myRequests-divLeft'].find_elements(:tag_name => 'a')[2]
          end
          
          def all_meeting_summary_link
            @driver[:class => 'nfs-myRequests-divLeft'].find_elements(:tag_name => 'a')[0]
          end

          def email_img_click
            meeting_id_email = @data_wkb['my_meeting']['meeting_id_for_view']
            data_list_email = qone_data_list(meeting_table,"style*='display:none'",:all)
            data_list_email.operate(meeting_id_email,0,:email,5)
          end

          def view_img_click
            meeting_id_view = @data_wkb['my_meeting']['meeting_id_for_view']
            data_list_view = qone_data_list(meeting_table,"style*='display:none'",:all)
            data_list_view.operate(meeting_id_view,0,:view,5)
          end

          def modify_img_click
            meeting_id_modify = @data_wkb['my_meeting']['meeting_id_for_modify']
            data_list_modify = qone_data_list(meeting_table,"style*='display:none'",:all)
            data_list_modify.operate(meeting_id_modify,0,:edit,5)
          end

          def delete_img_click
            meeting_id_delete = @data_wkb['my_meeting']['meeting_id_for_delete']
            data_list_delete = qone_data_list(meeting_table,"style*='display:none'",:all)
            data_list_delete.operate(meeting_id_delete,0,:delete,5)
          end

          def modify_meeting_context meeting_name_modify
            handle = @driver.window_handle
            handles= @driver.window_handles
            switch_alert_window(handles, handle)
            @driver[:name => 'subject'].clear
            @driver[:name => 'subject'].send_keys meeting_name_modify
            submit_button.click
            sleep 2
            close_button.click
            switch_window handle
          end

          def input_meeting_context(meeting_name,anchorman)
            handle = @driver.window_handle
            handles= @driver.window_handles
            switch_alert_window(handles, handle)
            @driver[:name => 'subject'].send_keys meeting_name
            # show_menu_by_js "ui-datepicker-div"
            # time_click
            sleep 2
            # system_time_button.click
            sleep 3
            select_meeting_summary_type
            @driver[:css => '#emceeView'].send_keys anchorman
            meeting_summary_title = top_title
            # submit_button.click
            switch_window handle
          end

          def select_meeting_summary_type
            summary_type = @data_wkb['my_meeting']['type_for_meeting_summary']
            select_summary_type = qone_select(@driver, meeting_summary_type)
            select_summary_type.select_by_text summary_type
          end

          def email_tab_text
            @driver[:class => 'cardmenu'].text
          end

          def meeting_summary_type
            @driver[:css => '#meetsTypeId_input']
          end

          def time_click
            @driver.find_element(:name => 'meetingStartTime').click
          end

          def system_time_button
            @driver.find_element(:class=>'ui-datepicker-current ui-state-default ui-priority-secondary ui-corner-all')
          end

          def all_meeting_summary
            all_meeting_summary = @wkb_profiles['my_meeting']['all_meeting_summary']
            @driver.find_element(:link => all_meeting_summary)
          end

          def meeting_table
            @driver[:css=> '#dataListTable_NFSDataList']
          end

          def add_meeting_summary_button
            @driver[:css=> '#yellowButton']
          end

          def top_title
            @driver[:css=>'#content h2'].text
          end

          def save_button
            @driver[:class=>'bottomButtons'].find_elements(:tag_name => 'input')[0]
          end

          def submit_button
            @driver[:class=>'bottomButtons'].find_elements(:tag_name => 'input')[1]
          end

          def submit_button_email
            @driver[:id => 'button_div'].find_elements(:tag_name => 'input')[0]
          end

          def close_button
            @driver[:class=>'bottomButtons'].find_elements(:tag_name => 'input')[2]
          end

        end # MyMeetingPage
      end #MyMeeting
    end #  Page
  end # Wkb
end #WebDriver