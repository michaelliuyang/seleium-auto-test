require_relative '../../load_helper'
module WebTest
   module Pm
     module ProjectReport
        class TaskReportSpec
          describe 'progress report page' do
          before :all do
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            @pm_data = Helper::ReadProfiles.data :pm
            @pm_login_name = @pm_profiles['pm_login_name']
            @pm_password = @pm_profiles['password']
            @driver = Support::Login.login(:name => @pm_login_name, :pwd => @pm_password)
            @page_container = WebDriver.create_page_container :pm, @driver
            @project_list_page = @page_container.project_list_page
            @project_list_page.to_this_page
            project_name = @pm_data['project_list']['project_name']
            @project_list_page.enter_project project_name
            @progress_report_page = @page_container.progress_report_page
            @progress_report_page.to_this_page
          end
 
          after :all do
            @page_container.close
          end

          it 'menu page test' do
            #given
            progress_report_title = @pm_profiles['project_report']['progress_report_title']
            #when
            actual_top_title = @progress_report_page.top_title
            #then
            actual_top_title.should == progress_report_title
          end
           
          # it 'prapare pregress report success?' do
            # #given
            # prepare_progress_report = @pm_profiles['project_report']['prepare_progress_report']
            # create_progress_report_type =@pm_data['project_report']['progress_report_type_for_add']
            # report_name_for_add =@pm_data['project_report']['report_name_for_add']
            # current_for_add =@pm_data['project_report']['current_phase_of_project_for_add']
            # review_situation_for_add =@pm_data['project_report']['review_situation_for_add']
            # resoureces_for_add =@pm_data['project_report']['resoureces_for_add']
            # training_for_add =@pm_data['project_report']['training_for_add']
            # major_problem_for_add =@pm_data['project_report']['major_problem_analysis_for_add']
            # work_summary_for_add =@pm_data['project_report']['work_summary_for_add']
            # next_stage_for_add =@pm_data['project_report']['next_stage_arrangement_for_add']
            # #when
            # actual_top_title = @progress_report_page.propare_progress_report(create_progress_report_type,report_name_for_add,current_for_add,review_situation_for_add,resoureces_for_add,training_for_add,major_problem_for_add,work_summary_for_add,next_stage_for_add)
            # #then
            # actual_top_title.should == prepare_progress_report
          # end
          
          # it 'look  pregress report information success?' do
            # #given
            # report_name_for_find =@pm_data['project_report']['report_name_for_add']
            # #when
            # actual_top_title = @progress_report_page.report_information_by_name report_name_for_find
            # #then
            # actual_top_title.should == report_name_for_find
          # end
          
          it 'add reply information success?' do
            #given
            reply_progress_report = @pm_profiles['project_report']['reply_progress_report']
            report_name_for_find =@pm_data['project_report']['report_name_for_add']
            reply_for_add =@pm_data['project_report']['reply_for_add']
            #when
            actual_top_title = @progress_report_page.add_reply_by_report_name(report_name_for_find,reply_for_add)
            #then
            actual_top_title.should == reply_progress_report
          end
          
          
          
          

         end  # describe
       end  # ProgressReportSpec
     end #  ProjectReport
   end # Pm
end # WebTest




