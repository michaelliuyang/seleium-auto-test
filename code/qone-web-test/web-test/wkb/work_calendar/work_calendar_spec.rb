require_relative '../../load_helper'

module WebTest
  module Wkb
    module WorkCalendar

      describe 'work calendar page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb, driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @data_work = Helper::ReadProfiles.data :wkb
          @work_calendar_page = @page_container.work_calendar_page
          @work_calendar_page.to_this_page
          @notice_success = @data_work['work_calendar']['notice_success']
        end

        after :all do
          @page_container.close
        end

        it 'menu click success? ' do
          #given
          work_calendar_page_title = @wkb_profiles['work_calendar']['work_calendar_page_title']
          #when
          actual_page_title = @work_calendar_page.title
          #then
          actual_page_title.should == work_calendar_page_title
        end

        it 'seach button click success?' do
          #given
          check_calendar_top_title = @wkb_profiles['work_calendar']['work_calendar']
          #when
          actual_top_title = @work_calendar_page.work_calendar_seach_title
          #then
          actual_top_title.should == check_calendar_top_title
        end

        it 'add not plan work success?' do
          #given
          work_load_expect = @data_work['work_calendar']['work_load']
          description = @data_work['work_calendar']['description']
          #when
          work_load = @work_calendar_page.add_no_plan_task(work_load_expect, description)          
          notic = @work_calendar_page.notice
          #then
          work_load.should == "#{work_load_expect}.00"
          notic.should == "#{@notice_success}"
        end

        it 'update no plan task success ?' do
          #given
          work_load_expect = @data_work['work_calendar']['work_load_for_update']
          #when
          work_load = @work_calendar_page.update_no_plan_task work_load_expect
          #then
          work_load.should =="#{work_load_expect}.00"
          @work_calendar_page.notice.should == @notice_success
        end

        it 'delete no plan task success ?' do
          #when
          interval_row = @work_calendar_page.delete_no_plan_task
          #then
          interval_row.should == 1
          @work_calendar_page.notice.should == @notice_success
        end

        it 'add work diary success ?' do
          #given
          work_diary = @data_work['work_calendar']['work_diary']
          #when
          work_diary_text = @work_calendar_page.add_work_diary(work_diary)
          #then
          work_diary_text.should == work_diary
          @work_calendar_page.notice.should == @notice_success
        end

        it 'input task diary report success ?' do
          #given
          work_load_expect = @data_work['work_calendar']['work_load']
          #when
          work_load = @work_calendar_page.add_task(work_load_expect)
          #then
          work_load.should =="#{work_load_expect}.00"
          @work_calendar_page.notice.should == @notice_success
        end

      end
    end # WorkCalendar
  end # Wkb
end # WebTest