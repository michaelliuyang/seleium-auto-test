require_relative '../../load_helper'

module WebTest
  module Wkb
    module MyTask
      describe 'problem track page'do
        before :all do
          driver = Support::Login.login(:name=>'lypm',:pwd=>'intec')
          @page_container = WebDriver.create_page_container :wkb,driver
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @problem_track_page = @page_container.problem_track_page
          @problem_track_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'problem track menu click success?'do
          problem_track = @wkb_profiles['my_task']['problem_track']
          actual_top_title = @problem_track_page.top_title
          actual_top_title.should == problem_track
        end
        it 'problem alter be success?'do
          alter_description = @wkb_profiles['my_task']['alter_description']
          @problem_track_page.alter_problem(alter_description)
          @problem_track_page.refresh
          actual_description = @problem_track_page.table_problem_description.text
          puts actual_description
          puts alter_description
          actual_description.should == alter_description
        end
        it 'problem deleted be success?'do
          @problem_track_page.refresh
          expect_number = @problem_track_page.total_row_number-1
          @problem_track_page.delete_problem
          @problem_track_page.refresh
          actual_number = @problem_track_page.total_row_number
          actual_number.should == expect_number
        end
        it 'problem view be success?'do
          expect_view_problem_title = @wkb_profiles['my_task']['expect_view_problem_title']
          actual_title = @problem_track_page.view_problem_title
          actual_title.should == expect_view_problem_title
        end
        it 'search problem by id 'do
          id = @wkb_profiles['my_task']['id']
          @problem_track_page.open_search_condition   #ti chulai dao zu jian
          @problem_track_page.open_advanced_condition  #ti chulai dao zu jia
          @problem_track_page.cancel_default_condition
          @problem_track_page.search_condition_by_id id #by_id
          @problem_track_page.click_search_button.click
          actual = @problem_track_page.match_id_condition id
          @problem_track_page.click_id_condition.click
          actual.should == true
        end
        it 'search problem by submiter' do
          submiter = @wkb_profiles['my_task']['submiter']
          @problem_track_page.open_search_condition
          @problem_track_page.open_advanced_condition
          @problem_track_page.search_condition_by_submiter submiter
          @problem_track_page.click_search_button.click
          actual = @problem_track_page.match_submiter_condition submiter
          @problem_track_page.click_submiter_condition.click
          actual.should == true
        end
        it 'search problem by id+submiter 'do
         id = @wkb_profiles['my_task']['id']
         submiter = @wkb_profiles['my_task']['submiter']
         @problem_track_page.open_search_condition
         @problem_track_page.open_advanced_condition
         @problem_track_page.search_condition_by_id id
         @problem_track_page.search_condition_by_submiter submiter
         @problem_track_page.click_search_button.click
         @problem_track_page.click_id_condition.click
         @problem_track_page.click_submiter_condition.click
         actual1 = @problem_track_page.match_id_condition id
         actual = @problem_track_page.match_submiter_condition submiter
        (actual&&actual1).should ==true
        end
      end
    end #MyTask
  end #Wkb
end # WebTest