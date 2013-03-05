require_relative '../../load_helper'

module WebTest
  module Wkb
    module MyTask
      describe 'task list page'do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb,driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @task_list_page = @page_container.task_list_page
          @task_list_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'task list menu click success?'do
          personal_task_list = @wkb_profiles['my_task']['personal_task_list']
          actual_top_title = @task_list_page.top_title
          actual_top_title.should == personal_task_list
        end
      end
    end #MyTask
  end #Wkb
end # WebTest