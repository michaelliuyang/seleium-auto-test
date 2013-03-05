require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'

module WebDriver
  module Wkb
    module Page
      module MyTask
        class TaskCommentPage <Common::BasePage
          include Support::MenuAction

          def top_title
            @driver[:css=>'#content h2'].text
          end

          def to_this_page
            @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
            work_bench = @wkb_profiles['work_bench']
            my_task = @wkb_profiles['my_task']['my_task']
            task_comment = @wkb_profiles['my_task']['task_comment']
            menu_click work_bench
            menu_click_for_hide my_task,task_comment
          end
        end  #  TaskCommentPage
      end # MyTask
    end  #Page
  end #Wkb
end #WebDriver