require_relative '../../load_helper'
module WebTest
   module Pm
     module ProductReview
          
        describe 'review plan page' do
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
          @review_plan_page = @page_container.review_plan_page
          @review_plan_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu page test' do
          #given
          review_plan_title = @pm_profiles['product_review']['review_plan_title']
          #when
          actual_top_title = @review_plan_page.top_title
          #then
          actual_top_title.should == review_plan_title
        end
        
        describe 'click review report super page operate' do
        # it 'click individual appraisal conclusion list super link success?' do
          # #given
          # conclusion_list_title = @pm_profiles['product_review']['individual_appraisal_conclusion_list_title']
          # report_name = @pm_data['product_review']['review_report_name']
          # #when
          # actual_top_title = @review_plan_page.click_review_report(report_name)
          # #then
          # actual_top_title.should == conclusion_list_title
        # end
        # it 'modify report basic information success?' do
          # #given
          # basic_information_title = @pm_profiles['product_review']['modify_report_basic_information_title']
          # report_name = @pm_data['product_review']['review_report_name']
          # #when
          # actual_top_title = @review_plan_page.modify_report_basic_information(report_name)
          # #then
          # actual_top_title.should == basic_information_title
        # end
        # it 'check the check list success?' do
          # #given
          # checklist_title = @pm_profiles['product_review']['check_the_checklist_title']
          # report_name = @pm_data['product_review']['review_report_name']
          # #when
          # actual_top_title = @review_plan_page.check_the_checklist(report_name)
          # #then
          # actual_top_title.should == checklist_title
        # end
        
        # it 'defect list success?' do
          # #given
          # defect_list_title = @pm_profiles['product_review']['defect_list_title']
          # report_name = @pm_data['product_review']['review_report_name']
          # #when
          # actual_top_title = @review_plan_page.defect_list(report_name)
          # #then
          # actual_top_title.should == defect_list_title
        # end
        
        it 'send mail notification success?' do
          #given
          send_mail_title = @pm_profiles['product_review']['send_mail_notification_title']
          report_name = @pm_data['product_review']['review_report_name']
          #when
          actual_top_title = @review_plan_page.send_mail_notification(report_name)
          #then
          actual_top_title.should == send_mail_title
        end
        end 
        
        # it 'modify review plan success?' do
          # #given
          # review_plan_title = @pm_profiles['product_review']['review_plan']
          # reveiw_report_name = @pm_data['product_review']['review_report_name']
          # #when
          # actual_top_title = @review_plan_page.modify_review_plan(reveiw_report_name)
          # #then
          # actual_top_title.should == review_plan_title
        # end
       end  # describe
     end   #  ProductReview
   end   # Pm
end # WebTest