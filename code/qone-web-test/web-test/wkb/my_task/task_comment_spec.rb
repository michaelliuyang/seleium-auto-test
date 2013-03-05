require_relative '../../load_helper'

module WebTest
  module Wkb
    module MyTask
      describe 'task comment page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb,driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @task_comment_page = @page_container.task_comment_page
          @task_comment_page.to_this_page
        end

        after :all do
         @page_container.close
        end

        it 'task comment menu click success?' do
          task_comment = @wkb_profiles['my_task']['task_comment']
          actual_top_title = @task_comment_page.top_title
          actual_top_title.should == task_comment
        end
      end

    end  #MyTask
  end  #Wkb
end #WebDriver