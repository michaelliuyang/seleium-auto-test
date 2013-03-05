require_relative '../../load_helper'

module WebTest
  module Wkb
    module MyTask
      describe 'submit task report page'do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb,driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @submit_task_report_page = @page_container.submit_task_report_page
          @submit_task_report_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'submit task report menu click success?'do
          task_report_submit = @wkb_profiles['my_task']['task_report_submit']
          actual_top_title = @submit_task_report_page.top_title
          actual_top_title.should == task_report_submit
        end
      end
    end #MyTask
  end #Wkb
end # WebTest