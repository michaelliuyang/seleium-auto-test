require_relative '../../load_helper'

module WebTest
  module Wkb
    module MyTodo
      # describe 'my todo page test' do
        # before :all do
          # driver = Support::Login.login
          # @page_container = WebDriver.create_page_container :wkb, driver
          # @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          # @data_wkb = Helper::ReadProfiles.data :wkb
          # @my_todo_page = @page_container.my_todo_page
          # @my_todo_page.to_this_page
        # end
# 
        # after :all do
          # @page_container.close
        # end
# 
        # it 'menu click success ?' do
        # #given
          # expect_title = @wkb_profiles['my_todo']['my_todo_page_title']
          # #when
          # actual_title = @my_todo_page.page_title
          # #then
          # expect_title.should == actual_title
        # end
# 
        # it 'new todo success ?' do
        # #given
          # todo_text = @data_wkb['new_todo']['context_for_my_todo']
          # personnel_name = @data_wkb['new_todo']['personnel_name']
          # @my_todo_page.new_todo(todo_text, personnel_name)
          # #when
          # actual = @my_todo_page.find_form_name_exist? todo_text
          # #then
          # actual.should == true
        # end
# 
        # #can't use
        # it 'cancel todo success ?' do
        # #given
          # todo_text = @data_wkb['new_todo']['context_for_my_todo']
          # @my_todo_page.cancel_todo todo_text
        # #when
        # # actual = @my_todo_page.find_form_name_exist? todo_text
        # # #then
        # # actual.should == false
        # end
# 
        # #can't use
        # it 'cancel supervision success' do
        # #given
          # supervision_text = @wkb_profiles['my_todo']['supervision']
          # #when
          # actual = @my_todo_page.cancel_supervision supervision_text
          # #then
          # actual.should == true
        # end
# 
        # it 'save handle form success ?' do
        # #given
          # to_handle_form_text = @wkb_profiles['my_todo']['to_handle_form']
          # #when
          # actual = @my_todo_page.handle_form_save to_handle_form_text
          # #then
          # actual.should_not == nil
        # end
# 
        # it 'check to handle form success ?' do
        # #given
          # to_handle_form_text = @wkb_profiles['my_todo']['to_handle_form']
          # check_page_top_title = @wkb_profiles['my_todo']['check_to_handle_form_top_title']
          # #when
          # actual_top_title = @my_todo_page.check_to_handle_form to_handle_form_text
          # #then
          # actual_top_title.should == check_page_top_title
        # end
# 
        # it 'can view form button success ?' do
        # #given
          # to_handle_form_text = @wkb_profiles['my_todo']['to_handle_form']
          # view_text = @wkb_profiles['my_todo']['view_text']
          # #when
          # actual_view_text = @my_todo_page.into_can_view_form to_handle_form_text
          # #then
          # actual_view_text = view_text
        # end
# 
        # # cancel and delete form not use becasue alert
        # it 'cancel form success ?' do
        # #given
          # to_handle_form_text = @wkb_profiles['my_todo']['to_handle_form']
          # @my_todo_page.cancel_form to_handle_form_text
        # # actual = nil
        # # #when
        # # begin
        # # @my_todo_page.find_form_name_exist? name_for_form
        # # rescue
        # # puts 'not find form'
        # # actual = 'not find form'
        # # end
        # # #then
        # # actual.should.not == nil
        # end
# 
        # it 'delete form success ?' do
        # #given
          # to_handle_form_text = @wkb_profiles['my_todo']['to_handle_form']
          # @my_todo_page.delete_form to_handle_form_text
        # end
# 
        # it 'click form handle history link success ?' do
        # #given
          # to_handle_form_text = @wkb_profiles['my_todo']['to_handle_form']
          # title = @data_wkb['to_handle_form']['title']
          # #when
          # actual_top_title = @my_todo_page.check_flow_handle_history to_handle_form_text
          # #then
          # actual_top_title.should == title
        # end
# 
        # it 'risk for tracking click success ?' do
        # #given
          # risk_for_tracking = @wkb_profiles['my_todo']['risk_for_tracking']
          # risk_describe = @data_wkb['risk']['describe_for_modify']
          # reasons = @data_wkb['risk']['reasons']
          # #when
          # flag = @my_todo_page.risk_for_tracking_text(risk_for_tracking,risk_describe,reasons)
          # #then
          # flag.should_not == nil
        # end
# 
        # it 'comment to deal with promble input success ?' do
        # #given
          # to_deal_text = @wkb_profiles['my_todo']['to_deal_with']
          # link_text = @data_wkb['promble']['promble_source']
          # comment_text = @data_wkb['promble']['comment_text']
          # #when
          # flag = @my_todo_page.comment_to_deal_with_promble(to_deal_text,link_text,comment_text)
          # #then
          # flag.should_not == nil
        # end
# 
        # it 'deal with promble success ?' do
        # #given
          # to_deal_text = @wkb_profiles['my_todo']['to_deal_with']
          # promble_status = @data_wkb['promble']['to_verificate']
          # promble_describe = @data_wkb['promble']['promble_describe']
          # @my_todo_page.deal_with_promble(to_deal_text,promble_status)
          # #then
          # expect = false
          # #when
          # actual = @my_todo_page.find_promble_describe_exist?(to_deal_text,promble_describe)
          # #then
          # actual.should == expect
        # end
# 
        # it 'verificate with promble success ?' do
        # #given
          # to_deal_text = @wkb_profiles['my_todo']['to_verificate_problem']
          # promble_status = @data_wkb['promble']['close']
          # promble_describe = @data_wkb['promble']['promble_describe']
          # @my_todo_page.verificate_problem(to_deal_text,promble_status)
          # expect = false
          # #when
          # actual = @my_todo_page.find_promble_describe_exist?(to_deal_text,promble_describe)
          # #then
          # actual.should == expect
        # end
# 
        # it 'confirmed bug success ?' do
        # #given
          # to_confirmed_text = @wkb_profiles['my_todo']['to_be_confirmed_bug']
          # solve_people = @data_wkb['bug']['solve_people']
          # bug_id = @data_wkb['bug']['bug_id']
          # @my_todo_page.confirmed_bug(to_confirmed_text,solve_people)
          # expect = false
          # #when
          # actual = @my_todo_page.find_bug_id_exist?(to_confirmed_text,bug_id)
          # #then
          # actual.should == expect
        # end
# 
        # it 'solve bug success ?' do
        # #given
          # to_solve_text = @wkb_profiles['my_todo']['to_solve_bug']
          # bug_id = @data_wkb['bug']['bug_id']
          # @my_todo_page.solve_bug to_solve_text
          # expect = false
          # #when
          # actual = @my_todo_page.find_bug_id_exist?(to_solve_text,bug_id)
          # #then
          # actual.should == expect
        # end
# 
        # it 'close bug success ?' do
        # #given
          # to_checking_text = @wkb_profiles['my_todo']['to_checking_bug']
          # bug_id = @data_wkb['bug']['bug_id']
          # @my_todo_page.close_bug to_checking_text
          # expect = false
          # #when
          # actual = @my_todo_page.find_bug_id_exist?(to_checking_text,bug_id)
          # #then
          # actual == expect
        # end
# 
        # it 'solve deferred bug success ?' do
        # #given
          # to_defer_text = @wkb_profiles['my_todo']['defer_bug']
          # bug_id = @data_wkb['bug']['bug_id']
          # @my_todo_page.solve_deferred_bug to_defer_text
          # #when
          # actual = @my_todo_page.find_bug_id_exist?(to_defer_text,bug_id)
          # expect = false
          # #then
          # actual.should == expect
        # end
# 
        # it 'start project evalue success ?' do
        # #given
          # project_evalue_text = @wkb_profiles['my_todo']['to_deal_project_evalue']
          # reuse_degree_text = @data_wkb['project_evalue']['reuse_degree']
          # estimated_scale_text = @data_wkb['project_evalue']['estimated_scale']
          # evalue_id = @data_wkb['project_evalue']['evalue_id']
          # @my_todo_page.start_project_evalue(project_evalue_text,reuse_degree_text,estimated_scale_text)
          # expect = false
          # #when
          # actual = @my_todo_page.find_project_evalue_exist?(project_evalue_text,evalue_id)
          # #then
          # actual.should == expect
        # end
# 
        # it 'to submit tast report option click success ?' do
        # #given
          # task_report_option_text = @wkb_profiles['my_todo']['to_submit_tast_report']
          # expect_top_title = @wkb_profiles['my_todo']['task_report_submit']
          # #when
          # actual_top_title = @my_todo_page.to_submit_task_report_top_title task_report_option
          # #then
          # actual_top_title.should == expect_top_title
        # end
# 
        # it 'to exam and approve task report option click success ?' do
        # #given
          # exam_approve_text = @wkb_profiles['my_todo']['to_exam_and_approve']
          # expect_top_title = @wkb_profiles['my_todo']['task_report_exam_and_approve']
          # #when
          # actual_top_title = @my_todo_page.to_exam_and_approve_top_title exam_approve_text
          # #then
          # actual_top_title.should == expect_top_title
        # end
# 
        # it 'submit report success ?' do
        # #given
          # to_submit_report_text = @wkb_profiles['my_todo']['to_submit_report']
          # report_name = @data_wkb['progress_report']['report_name']
          # current_phase = @data_wkb['progress_report']['current_phase']
          # #when
          # actual = @my_todo_page.submit_report(to_submit_report_text,report_name,current_phase)
          # #then
          # actual.should_not == nil
        # end
# 
        # it 'reply report success ?' do
        # #given
          # to_reply_report_text = @wkb_profiles['my_todo']['to_reply_report']
          # comment = @data_wkb['progress_report']['comment']
          # @my_todo_page.reply_report(to_reply_report_text,comment)
          # #when
          # actual = @my_todo_page.find_report_name_exist?
          # #then
          # actual.should == false
        # end
# 
      # end
    
      describe 'department report' do
        before :all do
          @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
          @data_wkb = Helper::ReadProfiles.data :wkb
          @dm_login_name = @data_wkb['dm_login_name']
          @dm_password = @data_wkb['password']
          @driver = Support::Login.login(:name=>@dm_login_name, :pwd=>@dm_password)          
          @page_container = WebDriver.create_page_container :wkb,@driver          
          @my_todo_page = @page_container.my_todo_page
          @my_todo_page.to_this_page
        end

        after :all do
          @page_container.close
        end
        
                
        it 'submit success ?' do
          #given
          to_submit_report_text = @wkb_profiles['my_todo']['to_submit_report']
          report_name = @data_wkb['department_report']['report_name']
          title = @data_wkb['department_report']['report_type']
          #when
          actual = @my_todo_page.submit_department_report(to_submit_report_text,report_name,title)
          #then
          actual.should == false
        end
        
      end
    end #mytodo
  end # Wkb
end # WebTest