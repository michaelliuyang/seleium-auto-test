require_relative '../../load_helper'

module WebTest
  module Wkb
    module MyTask
      describe 'approve task report page'do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb,driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @approve_task_report_page = @page_container.approve_task_report_page
          @approve_task_report_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'approve task report menu click success?'do
          task_report_approve = @wkb_profiles['my_task']['task_report_approve']
          actual_top_title = @approve_task_report_page.top_title
          actual_top_title.should == task_report_approve
        end
      end
    end #MyTask
  end #Wkb
end # WebTest