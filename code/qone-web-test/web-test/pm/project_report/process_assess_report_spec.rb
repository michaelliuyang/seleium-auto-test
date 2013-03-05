require_relative '../../load_helper'
module WebTest
   module Pm
     module ProjectReport
        describe 'personal data page' do
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
          @process_assess_report_page = @page_container.process_assess_report_page
          @process_assess_report_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu page test' do
          #given
          process_assess_report_title = @pm_profiles['project_report']['process_assess_report_title']
          #when
          actual_top_title = @process_assess_report_page.top_title
          #then
          actual_top_title.should == process_assess_report_title
        end
        
        it 'new add assessment records success?' do
          #given
          fill_out_records = @pm_profiles['project_report']['fill_out_the_assessment_records']
          assess_of_subject = @pm_data['project_report']['assess_of_subject_for_add']
          assess_of_group_members = @pm_data['project_report']['assess_of_group_members_for_add']
          start_date = @pm_data['project_report']['start_date_for_add']
          end_date = @pm_data['project_report']['end_date_for_add']
          @process_assess_report_page.fill_out_the_assessment_records(assess_of_subject,assess_of_group_members,start_date,end_date)
          #when
          actual = @process_assess_report_page.find_records_by_name(assess_of_subject)
          #then
          actual.should == true
        end
        
        it 'modify assessment records success?' do
          #given
          assess_of_subject = @pm_data['project_report']['assess_of_subject_for_add']
          assess_of_subject_for_modify = @pm_data['project_report']['assess_of_subject_for_modify']
          assess_of_group_members = @pm_data['project_report']['assess_of_group_members_for_add']
          start_date = @pm_data['project_report']['start_date_for_add']
          end_date = @pm_data['project_report']['end_date_for_add']
          @process_assess_report_page.modify_assessment_records(assess_of_subject,assess_of_subject_for_modify,assess_of_group_members,start_date,end_date)
          #when
          actual = @process_assess_report_page.find_records_by_name(assess_of_subject_for_modify)
          #then
          actual.should == true
        end
        
        it 'look assessment records success?' do
          #given
          fill_out_records = @pm_profiles['project_report']['fill_out_the_assessment_records']
          assess_of_subject_for_modify = @pm_data['project_report']['assess_of_subject_for_modify']
          #when
          @process_assess_report_page.look_assessment_records(assess_of_subject_for_modify)
          #then
        end
        
        it 'look assessment records success?' do
          #given
          fill_out_records = @pm_profiles['project_report']['fill_out_the_assessment_records']
          assess_of_subject_for_modify = @pm_data['project_report']['assess_of_subject_for_modify']
          #when
          @process_assess_report_page.look_assessment_records(assess_of_subject_for_modify)
          #then
        end
        
        it 'look assessment records detail by name success?' do
          #given
          assess_records_look_detail = @pm_data['project_report']['assess_records_look_detail']
          assess_of_subject_for_modify = @pm_data['project_report']['assess_of_subject_for_modify']
          #when
          actual = @process_assess_report_page.look_assess_report_detail(assess_of_subject_for_modify)
          #then
          actual.should ==assess_records_look_detail
        end
        it 'delete assessment records success?' do
          #given
          assess_of_subject_for_modify = @pm_data['project_report']['assess_of_subject_for_modify']
          @process_assess_report_page.delete_assessment_records(assess_of_subject_for_modify)
          #when
          actual = @process_assess_report_page.find_records_by_name(assess_of_subject_for_modify)
          #then
          actual.should == true
        end
        
        end  # describe
     end   #  ProjectReport
   end   # Pm
end # WebTest


