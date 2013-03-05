require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/component'

module WebDriver
  module Wkb
    module Page
      module WorkCalendar
        class WorkCalendarPage < Common::BasePage
          
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component

          def to_this_page
            @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
            work_bench = @wkb_profiles['work_bench']
            work_calendar = @wkb_profiles['work_calendar']['work_calendar']
            menu_click work_bench
            menu_click work_calendar
          end

          def work_calendar_seach_title
            seach_calendar_button.click
            current_handle = @driver.window_handle
            all_handles= @driver.window_handles
            switch_alert_window(all_handles, current_handle)
            seach_top_title = calendar_seach_top_title
            close_button.click
            switch_window current_handle
            seach_top_title
          end

          def notice
            @notice
          end

          def add_no_plan_task(work_load, description)
            current_handle = @driver.window_handle
            into_today_page
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            old_row_count = no_plan_task_table.row_count
            add_no_plan_task_button.click
            current_row = 0
             new_row_count = no_plan_task_table.row_count
            (old_row_count...new_row_count).each do |i|
              work_load(i).clear
              work_load(i).send_keys work_load
              personal_task_description(i).clear
              personal_task_description(i).send_keys description
              current_row = i
            end
            submit_button.click
            @notice = notice_success
            current_work_load = no_plan_work_load(current_row)
            close_button.click
            switch_window current_handle
            current_work_load
          end

          def update_no_plan_task(work_load)
            current_handle = @driver.window_handle
            into_today_page
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            new_row_count = no_plan_task_table.row_count
            work_load(new_row_count - 1).clear
            work_load(new_row_count - 1).send_keys work_load
            submit_button.click
            @notice = notice_success
            current_work_load = no_plan_work_load(new_row_count - 1)
            close_button.click
            switch_window current_handle
            current_work_load
          end

          def delete_no_plan_task
            current_handle = @driver.window_handle
            into_today_page
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            row_count = no_plan_task_table.row_count
            delete_no_plan_task_button(1).click
            submit_button.click
            @notice = notice_success
            current_rows = no_plan_task_table.row_count
            close_button.click
            switch_window current_handle
            row_count - current_rows
          end

          def add_work_diary(work_diary)
            current_handle = @driver.window_handle
            into_today_page
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            work_diary_content.clear
            work_diary_content.send_keys work_diary
            submit_button.click
            text = work_diary_content.text
            @notice = notice_success
            close_button.click
            switch_window current_handle
            text
          end

          def add_task(work_load)
            current_handle = @driver.window_handle
            into_today_page
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            if tasks.size > 0
              first_task = tasks[0]
              task_work_load(first_task).clear
              task_work_load(first_task).send_keys work_load
              submit_button.click
              current_work_load = task_work_load(tasks[0]).attribute('value')
              @notice = notice_success
              close_button.click
              switch_window current_handle
              current_work_load
            else
              switch_window current_handle
              raise "this not any task"
            end
          end

          def total_work_time #todo
            before_text =@wkb_profiles["work_calendar"]["before_text"]
            after_text =@wkb_profiles["work_calendar"]["after_text"]
            text = @driver.find_element(:class => 'notice').text
            text.delete before_text, after_text
            text.to_i
          end

          private

          def into_today_page
            row_count = work_calendar_table.row_count
            (1...row_count).each do |i|
              (0..6).each do |j|
                if work_calendar_table[i][j].text.strip == today_date
                  today_work = work_calendar_table[i][j].find_element(:tag_name => 'a')
                  today_work.click
                end
              end
            end
          end
          
          def seach_calendar_button
            @driver[:css=> '#yellowButton']
          end

          def calendar_seach_top_title
            @driver[:css=>'#content h2'].text
          end

          def submit_button
            @driver[:css =>"input[name = 'submit1']"]
          end

          def notice_success
            @driver[:class => 'noticeSuccess'].text
          end

          def tasks
            rows = @driver.find_elements(:tag_name => 'table')[1].find_elements(:tag_name => 'tr')
            row_count = rows.length
            tasks = []
            (0...row_count).each do |i|
              if rows[i].attribute('id') != ''
                tasks << rows[i]
              end
            end
            tasks
          end

          def task_work_load(task)
            task.find_element(:css =>"input[name = 'dayWorkLoad']")
          end

          def work_calendar_table
            table @driver[:class => 'workDayTable']
          end

          def no_plan_task_table
            table @driver[:id => 'notPlannedTaskTable']
          end

          def today_date
            date = @driver.find_element(:class => 'userName').text
            (date[8..9].to_i).to_s
          end

          def add_no_plan_task_button            
            add_button = @wkb_profiles['work_calendar']['add_button']
            @driver[:css => "input[name ='#{add_button}']"]
          end

          def work_load(row)
            no_plan_task_table[row][4].find_element(:tag_name => 'input')
          end

          def personal_task_description(row)
            no_plan_task_table[row][5].find_element(:css => "textarea[name = 'nptDescription']")
          end

          def no_plan_work_load(row)
            work_load(row).attribute('value')
          end

          def delete_no_plan_task_button(row)
            no_plan_task_table[row][6].find_element(:tag_name => 'img')
          end

          def work_diary_content
            @driver[:css => "textarea[name = 'diaryContent']"]
          end

          def close_button
            close = @wkb_profiles["work_calendar"]["close"]
            @driver[:css =>"input[value = '#{close}']"]
          end

        end # WorkCalendarPage
      end # WorkCalendar
    end # Page
  end # Wkb
end # WebDriver