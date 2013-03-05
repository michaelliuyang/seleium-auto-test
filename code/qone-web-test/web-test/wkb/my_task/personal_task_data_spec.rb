require_relative '../../load_helper'

module WebTest
  module Wkb
    module MyTask
      describe 'personal task data page'do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :wkb,driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @personal_task_data_page = @page_container.personal_task_data_page
          @personal_task_data_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'personal task data menu click success?'do
          personal_task_data = @wkb_profiles['my_task']['personal_task_data']
          actual_top_title = @personal_task_data_page.top_title
          actual_top_title.should == personal_task_data
        end
      end
    end #MyTask
  end #Wkb
end # WebTest