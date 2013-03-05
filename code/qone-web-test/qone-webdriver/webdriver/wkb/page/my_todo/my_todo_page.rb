require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action.rb'
require 'selenium-webdriver'
require 'webdriver/support/component.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Wkb
    module Page
      module MyTodo
        class MyTodoPage < Common::BasePage
          include Support::DriverExtensionAction
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          
          def to_this_page
            @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
            @data_wkb = Helper::ReadProfiles.data :wkb
            work_bench = @wkb_profiles['work_bench']
            my_todo = @wkb_profiles['my_todo']['my_todo']
            menu_click work_bench
            menu_click my_todo
          end

          def page_title
            @driver.title
          end

          def top_title
            @driver[:css => '#content h2'].text
          end

          def new_todo(text, name)
            switch_to_man_frame
            input_text_box text
            sleep 1
            input_personnel name
            sleep 2
            add_button.click
            switch_out_frame
          end

          #cancel todo can't use          
          def cancel_todo todo_content
            switch_to_man_frame 
            sleep 2
            cancel_todo_data_list todo_content
            sleep 2
            switch_out_frame
          end
          
          def cancel_supervision supervision_text
            switch_to_left_frame
            find_todo_list supervision_text
            sleep 2
            switch_out_frame
            switch_to_man_frame
            sleep 2
            cancel_supervision_data_list supervision_text
            sleep 2
            switch_out_frame
          end

          def handle_form_save handle_form_text
            click_to_handle_form handle_form_text
            switch_to_man_frame
            handle_data_list
            sleep 2
            save_handle_form
            
          end

          def check_to_handle_form handle_form_text
            click_to_handle_form handle_form_text
            check_form_top_title
          end

          def into_can_view_form handle_form_text
            click_to_handle_form handle_form_text
            can_view_text
          end
 
          #no use alert no make         
          def cancel_form handle_form_text        
            click_to_handle_form handle_form_text
            cancel_form_alert_ok        
          end
          
          #no use alert no make
          def delete_form handle_form_text
            click_to_handle_form handle_form_text
            delete_form_click
          end
          
          def find_form_name_exist? form_name
            switch_to_man_frame
            data_list = qone_data_list(form_table,"style*='display:none'",:all)
            flag = data_list.data_exist?(form_name,1)
            switch_out_frame
            flag
          end
          
          def find_promble_describe_exist?(promble_option,promble_describe)
            switch_to_left_frame
            find_todo_list promble_option
            switch_out_frame 
            switch_to_man_frame
            data_list = qone_data_list(form_table,"style*='display:none'",:all)
            flag = data_list.data_exist?(promble_describe,2)
            switch_out_frame
            flag
          end
          
          def find_bug_id_exist?(bug_option,bug_id)
            switch_to_left_frame
            find_todo_list bug_option
            switch_out_frame
            sleep 2
            switch_to_man_frame
            data_list = qone_data_list(form_table,"style*='display:none'",:all)
            flag = data_list.data_exist?(bug_id,0)
            switch_out_frame
            flag
          end  
          
          def find_project_evalue_exist?(to_deal_project_evalue,evalue_id)
            switch_to_left_frame
            find_todo_list to_deal_project_evalue
            switch_out_frame  
            switch_to_man_frame
            data_list = qone_data_list(form_table,"style*='display:none'",:all)
            flag = data_list.data_exist?(evalue_id,0)
            switch_out_frame
            flag
          end      
          
          def find_report_name_exist? 
            switch_to_man_frame
            report_name = @data_wkb['progress_report']['report_name']
            data_list = qone_data_list(form_table,"style*='display:none'",:all)
            flag = data_list.data_exist?(report_name,0) 
            switch_out_frame  
            flag      
          end 

          def check_flow_handle_history history_flow
            click_to_handle_form history_flow
            flow_handle_history_top_title
          end
          
          def risk_for_tracking_text(risk_for_tracking_text,description_text,reasons)
            switch_to_left_frame
            risk.click
            sleep 2
            find_todo_list risk_for_tracking_text
            switch_out_frame  
            switch_to_man_frame
            risk_tracing_data_list
            modify_risk_information(description_text,reasons)
            switch_out_frame            
          end
          
         def comment_to_deal_with_promble(deal_promble_option,link_text,comment_text)
            select_promble_option deal_promble_option
            switch_to_man_frame
            input_comment_text(link_text,comment_text)
            switch_out_frame
          end
          
          def deal_with_promble(deal_promble_option,promble_status)
            select_promble_option deal_promble_option
            switch_to_man_frame
            to_deal_promble_data_list
            modify_promble_information promble_status
            switch_out_frame
          end
          
          def verificate_problem(deal_promble_option,promble_status)
            select_promble_option deal_promble_option
            switch_to_man_frame
            to_verificate_problem_data_list
            modify_promble_information promble_status
            switch_out_frame
          end
          
          def confirmed_bug(bug_option,solve_people)
            select_bug_option bug_option
            switch_to_man_frame
            bug_data_list
            sleep 2
            bug_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, bug_handle)
            confirm_button.click
            sleep 2
            select_solve_people.select_by_text solve_people
            sleep 2
            submit_button_confirmed.click
            sleep 2
            close_button_bug.click
            switch_window bug_handle
            switch_out_frame
          end
          
          def solve_bug bug_option
            select_bug_option bug_option
            switch_to_man_frame
            bug_data_list
            sleep 2
            bug_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, bug_handle)
            sleep 2
            solve_button.click
            sleep 2
            submit_button_solve.click
            sleep 2
            close_button_bug.click
            switch_window bug_handle
            switch_out_frame
          end
          
          def close_bug bug_option
            select_bug_option bug_option
            switch_to_man_frame
            bug_data_list
            sleep 2
            bug_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, bug_handle)
            sleep 2
            close_bug_button.click
            sleep 2
            submit_button_close_bug.click
            sleep 2
            close_button_bug.click
            switch_window bug_handle
            switch_out_frame
          end
          
          def solve_deferred_bug bug_option
            select_bug_option bug_option
            switch_to_man_frame
            bug_data_list
            sleep 2
            bug_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, bug_handle)
            sleep 2
            confirm_button.click
            sleep 2
            submit_button_solve.click
            sleep 2
            close_button_bug.click
            switch_window bug_handle
            switch_out_frame
          end
          
          def start_project_evalue(to_deal_project_evalue,reuse_degree_text,estimated_scale_text)
            switch_to_left_frame
            project_estimate.click
            sleep 2
            find_todo_list to_deal_project_evalue
            switch_out_frame  
            switch_to_man_frame
            project_evalue_data_list
            evalue_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, evalue_handle)
            sleep 2 
            find_and_input_reuse_degree_context reuse_degree_text
            find_and_input_estimated_scale_context estimated_scale_text
            sleep 2
            submit_button_project_evalue.click
            switch_window evalue_handle
            switch_out_frame
          end
          
          def to_submit_task_report_top_title task_report_option
            select_project_option task_report_option
            switch_to_man_frame
            top_title = @driver[:css => '#ext-gen369 h2'].text           #.rstrip
            switch_out_frame
            top_title
          end
          
          def to_exam_and_approve_top_title exam_approve_option
            select_project_option exam_approve_option
            switch_to_man_frame
            top_title = @driver[:css => '#ext-gen156 h2'].text
            switch_out_frame
            top_title
          end
          
          def submit_progress_report(to_submit_report,report_name,current_phase)
            select_report_option to_submit_report
            switch_to_man_frame
            progress_report_data_list
            submit_report_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, submit_report_handle)
            @driver[:name => 'reportName'].send_keys report_name
            @driver[:name => 'currentPhase'].send_keys current_phase
            @driver[:css => '#formallySubmit'].click
            switch_window submit_report_handle
            switch_out_frame
          end
          
          def reply_progress_report(to_reply_report,comment)
            select_report_option to_reply_report
            switch_to_man_frame
            reply_progress_report_data_list
            reply_report_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, reply_report_handle)
            @driver[:css => '#reply'].clear
            @driver[:css => '#reply'].send_keys comment
            @driver[:css => '#submitBtn'].click
            switch_window reply_report_handle
            switch_out_frame
          end
          
          # limits of department report's authority is departmanager
          def submit_department_report(to_submit_report,name,title)
            select_report_option to_submit_report
            switch_to_man_frame
            department_tab_click
            click_title
            input_department_report name
            flag = find_title_exist? title            
            switch_out_frame
            flag
          end
          

     private
     
           def find_title_exist? title
            # switch_to_man_frame
            data_list = qone_data_list(form_table)
            data_list.data_exist?(title,0)
            # switch_out_frame
            # flag
          end
          
          def department_tab_click
            @driver.find_element(:class=>'dh_menu').find_elements(:tag_name => 'a')[1].click
          end
          
          def click_title
            report_type = @data_wkb['department_report']['report_type']
            title = @data_wkb['department_report']['title']
            data_list = qone_data_list(form_table)
            str = "table[id='dataListTable_NFSDataList'] tr td[title='#{title}'] div div nobr a"
            data_list.operate(report_type,1,str,0)
          end
          
          def input_department_report name
            report_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, report_handle)
            @driver[:name => 'reportName'].send_keys name
            @driver[:css => '#formallySubmit'].click
            switch_window report_handle
          end
          
          def select_report_option report_option
            switch_to_left_frame
            report_list.click
            find_todo_list report_option
            switch_out_frame
          end
          
          def report_list
            @driver[:css => '#num_REPORT']
          end
     
          def submit_button_project_evalue
            submit_button = @wkb_profiles['my_todo']['submit_button']
            @driver[:css => "form div input[value='#{submit_button}']"]
          end
     
          def reuse_degree
            @driver.find_element(:name => 'codeReusability')
          end
          
          def estimated_scale
            @driver.find_element(:name => 'codePersonalTaskValue')
          end
          
          def find_and_input_reuse_degree_context reuse_degree_text
            context_text_box = @driver.all(:css => "input[name='codeReusability']")
            context_text_box.each do |text_box|
              text_box.send_keys reuse_degree_text
            end
          end
          
          def find_and_input_estimated_scale_context estimated_scale_text
            context_text_box = @driver.all(:css => "input[name='codePersonalTaskValue']")
            context_text_box.each do |text_box|
              text_box.send_keys estimated_scale_text
            end
          end

          def click_to_handle_form handle_form_text
            switch_to_left_frame
            form.click
            sleep 2
            find_todo_list handle_form_text
            switch_out_frame
            sleep 1
          end
          
          def save_handle_form
            handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, handle)
            find_and_input_opeion_context
            pass_end.click
            save_button_handle.click
            #close_button_handle.click
            #submit_button_handle.click   #submit can not realize because ext
            sleep 2
            alert_ok
            switch_window handle
          end

          def check_form_top_title
            switch_to_man_frame
            check_data_list
            check_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, check_handle)
            check_form_page_title = top_title
            sleep 2
            close_button.click
            switch_window check_handle
            switch_out_frame
            check_form_page_title
          end

          def can_view_text
            switch_to_man_frame
            can_view_data_list
            can_view_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, can_view_handle)
            sleep 2
            text = view_text
            close_button_view.click
            # @driver.close
            switch_window can_view_handle
            switch_out_frame
            text
          end
          
          def cancel_form_alert_ok
            switch_to_man_frame
            cancel_data_list
            sleep 2
            alert_ok
            sleep 2
            alert_ok
            switch_out_frame
          end
          
          def delete_form_click
            switch_to_man_frame
            delete_data_list
            sleep 2
            alert_ok
            switch_out_frame
          end

          def flow_handle_history_top_title
            switch_to_man_frame
            history_link.click
            history_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, history_handle)
            sleep 2           
            title = @driver.find_element(:class => 'searchdiv').find_elements(:tag_name => 'span')[1].text
            sleep 2
            @driver.close
            switch_window history_handle
            switch_out_frame
            title            
          end
          
          def click_to_risk risk_option
            switch_to_left_frame
            risk.click
            sleep 2
            find_todo_list risk_option
            switch_out_frame
            sleep 1
          end
          
          def select_promble_option promble_option
            switch_to_left_frame
            promble.click
            sleep 2
            find_todo_list promble_option
            switch_out_frame            
          end
          
          def select_bug_option bug_option
            switch_to_left_frame
            bug_list.click
            find_todo_list bug_option
            switch_out_frame
          end
          
          def select_project_option project_option
            switch_to_left_frame
            task_list.click
            find_todo_list project_option
            switch_out_frame
          end
          
          def input_comment_text(link_text,comment_text)
            @driver.find_element(:link =>link_text).click
            comment_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, comment_handle)
            sleep 2
            @driver[:css => '#commentCountent'].send_keys comment_text
            sleep 2
            comment_button.click
            sleep 2            
            close_button_comment.click
            switch_window comment_handle
          end
          
          def modify_risk_information(description_text,reasons)
            modify_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, modify_handle)
            sleep 2
            risk_description.clear
            risk_description.send_keys description_text
            sleep 2
            submit_button_modify.click
            sleep 2
            modification_reasons.send_keys reasons
            submit_button_reasons.click
            switch_window modify_handle
          end
          
          def modify_promble_information promble_status
            modify_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, modify_handle)
            sleep 2
            select_promble_status.select_by_text promble_status
            sleep 2
            submit_button_modify.click
            switch_window modify_handle
          end
          
          def select_promble_status
            select_status = @driver[:css =>'#problemStatus_input']
            qone_select(@driver,select_status)
          end
          
          def select_solve_people
            solve_people = @driver[:css =>'#resolver_input']
            qone_select(@driver,solve_people)
          end


          #can't use          
          def cancel_todo_data_list todo_content
            todo_data_list = qone_data_list(form_table,"style*='display:none'",:all)
            todo_data_list.operate(todo_content,1,:cancelToDo,4)
          end
          
          #can't use                       
          def cancel_supervision_data_list supervision_content
            supervision_data_list = qone_data_list(form_table,"style*='display:none'",:all)
            supervision_data_list.operate(supervision_content,1,:cancelToDo,4)            
          end

          def handle_data_list
            form_id = @data_wkb['to_handle_form']['form_id_handle']
            data_list = qone_data_list(form_table,"style*='display:none'",:all)
            data_list.operate(form_id,0,:b_evaluate,7)
          end

          def check_data_list
            form_id = @data_wkb['to_handle_form']['form_id_check']
            data_list = qone_data_list(form_table,"style*='display:none'",:all)
            data_list.operate(form_id,0,:view,7)
          end

          def can_view_data_list
            form_id = @data_wkb['to_handle_form']['form_id_view']
            data_list = qone_data_list(form_table,"style*='display:none'",:all)
            data_list.operate(form_id,0,:viewProcess,7)
          end
          
          def cancel_data_list
            form_id = @data_wkb['to_handle_form']['form_id_cancel']
            data_list = qone_data_list(form_table,"style*='display:none'",:all)
            data_list.operate(form_id,0,:cancel,7)
          end
          
          def delete_data_list 
            form_id = @data_wkb['to_handle_form']['form_id_delete']
            data_list = qone_data_list(form_table,"style*='display:none'",:all)
            data_list.operate(form_id,0,:delete,7)
          end
          
          def risk_tracing_data_list
            title = @data_wkb['risk']['describe_for_risk']
            risk_id = @data_wkb['risk']['risk_id']
            str = "table[id='dataListTable_NFSDataList'] tr td[title='#{title}'] div div a.riskIdHref"
            data_list = qone_data_list(form_table,"style*='display:none'",:all)
            data_list.operate(risk_id,0,str,2)
          end
          
          def to_deal_promble_data_list
            describe = @data_wkb['promble']['promble_describe']
            problem_id = @data_wkb['promble']['problem_id']
            str = "table[id='dataListTable_NFSDataList'] tr td[title='#{describe}'] div div a"
            data_list = qone_data_list(form_table,"style*='display:none'",:all)
            data_list.operate(problem_id,0,str,2)            
          end
          
          def to_verificate_problem_data_list
            describe = @data_wkb['promble']['promble_describe']
            problem_id = @data_wkb['promble']['problem_id']
            str = "table[id='dataListTable_NFSDataList'] tr td[title='#{describe}'] div div a"
            data_list = qone_data_list(form_table,"style*='display:none'",:all)
            data_list.operate(problem_id,0,str,2)            
          end
          
          def bug_data_list
            bug_title = @data_wkb['bug']['bug_title']
            bug_id = @data_wkb['bug']['bug_id']
            str = "table[id='dataListTable_NFSDataList'] tr td[title='#{bug_title}'] div div a"
            data_list = qone_data_list(form_table,"style*='display:none'",:all)
            data_list.operate(bug_id,0,str,1)            
          end
          
          def project_evalue_data_list
            evalue_id = @data_wkb['project_evalue']['evalue_id']
            data_list_project_evalue = qone_data_list(form_table,"style*='display:none'",:all)
            data_list_project_evalue.operate(evalue_id,0,:process,8)
          end
          
          def submit_progress_report_data_list
            report_type = @data_wkb['progress_report']['report_type']
            report_title = @data_wkb['progress_report']['report_title']
            str = "table[id='dataListTable_NFSDataList'] tr td[title='#{report_title}'] div div nobr a"
            data_list = qone_data_list(form_table,"style*='display:none'",:all)
            data_list.operate(report_type,1,str,0)            
          end
          
          def reply_progress_report_data_list
            report_name = @data_wkb['progress_report']['report_name']
            data_list_reply_progress = qone_data_list(form_table,"style*='display:none'",:all)
            data_list_reply_progress.operate(report_name,0,:b_evaluate,4)            
          end


          def find_todo_list option
            span_arr = @driver.all(:css=>"div.main div.main_left div.list_detail_display li")
            flag = false
            span_arr.each do |li|
              if li.text == option
              flag = true
              li.click
              break
              end             
            end
           flag
          end

          def find_and_input_opeion_context
            opinion_iframes = @driver.all(:css => 'iframe.ke-iframe')
            opinion_iframes.each do |opinion_iframe|
              switch_to_frame opinion_iframe
              input_order_opinion
              switch_out_frame
            end
          end

          def switch_to_left_frame
            switch_to_frame iframe
            switch_to_frame left_frame
          end

          def switch_to_man_frame
            switch_to_frame iframe
            switch_to_frame man_frame
          end

          def input_order_opinion 
            opinion = @data_wkb['create_order']['opinion']
            opinion_elements = @driver[:class => 'ke-content']
            opinion_elements.send_keys opinion
          end

          def view_text
            switch_to_frame iframe_can_view
            view_text = @driver[:id => 'panelDraghandle'].text
            switch_out_frame
            view_text
          end

          def iframe
            @driver[:name => 'iframeContent']
          end

          def left_frame
            @driver[:css => '#leftFrame']
          end

          def man_frame
            @driver[:css => '#manFrame']
          end

          def todo
            @driver[:css => '#num_APPOINT_ADD_TODO']
          end
          
          def input_text_box text
            @driver[:css => "input[name='title']"].send_keys text
          end
          
          def input_personnel name
            @driver[:css => '#operatorIdsView'].send_keys name
          end

          def form
            @driver[:css => '#num_FORM']
          end

          def form_table
            @driver[:css => '#dataListTable_NFSDataList']
          end

          def history_link
            @driver[:css => "div[id='content'] div[class='hostory_form'] a"]
          end
          
          def risk
            @driver[:css => '#num_RISK']
          end
          
          def promble
            @driver[:css => '#num_PROBLEM']
          end

          def bug_list
            @driver[:css => '#num_BUG']
          end
          
          def project_estimate
            @driver[:css => '#num_PROJECT_ESTIMATE']
          end
          
          def task_list
            @driver[:css => '#num_TASK']
          end

          def iframe_can_view
            @driver.find_element(:xpath => "//iframe[@src='../cusvisual/main/autoPose.htm']")
          end

          def pass_end
            @driver[:css => "table tbody tr td input[value='-1']"]
          end 
            
          def submit_button_modify
            @driver[:name => 'submit']
          end
          
          def submit_button_reasons
            @driver[:css => "div[id='poplayer_content'] input[type='submit']"]
          end 
          
          def risk_description
            @driver[:name => 'description']
          end
          
          def modification_reasons
            @driver[:name => 'riskComment']
          end       
                    
          def add_button
            @driver[:css => '#addNew']
          end
          
          def comment_table
            table @driver[:css => '#commentTable']
          end
          
          def comment_button
            @driver[:css => "#addCommentBtn"]
          end
          
          def confirm_button
            @driver[:css => '#bugIdMenu_div'].find_elements(:tag_name =>'span')[0]
          end
          
          def solve_button
            @driver[:css => '#bugIdMenu_div'].find_elements(:tag_name =>'span')[1]
          end
          
          def close_bug_button
            @driver[:css => '#bugIdMenu_div'].find_elements(:tag_name =>'span')[1]
          end
          
          def submit_button_confirmed
            submit_button = @wkb_profiles['my_todo']['submit_button']
            @driver[:css =>"form[name='conformBugForm'] div input[value='#{submit_button}']"]
          end  
          
          def submit_button_solve
            submit_button = @wkb_profiles['my_todo']['submit_button']
            @driver[:css =>"form[name='resolveBugForm'] div input[value='#{submit_button}']"]
          end
          
          def submit_button_close_bug
            submit_button = @wkb_profiles['my_todo']['submit_button']
            @driver[:css =>"form[name='closeBugForm'] div input[value='#{submit_button}']"]
          end              
          
          def close_button_bug
            close_button = @wkb_profiles['my_todo']['close_button']
            @driver[:css => "div[id='content'] div input[value='#{close_button}']"]
          end

          def submit_button_handle  #ext not implemented
            submit_button = @wkb_profiles['my_todo']['submit_button']
            @driver.find_element(:css => "input[value = '#{submit_button}']")
          end

          def save_button_handle
            save_button = @wkb_profiles['my_todo']['save_button']
            @driver[:css => "form[name='cusRequestForm'] input[value='#{save_button}']"]
          end
          
          def close_button_handle
            close_button_handle = @wkb_profiles['my_todo']['cancel_button']
            @driver[:css => "form[name='cusRequestForm'] input[value='#{close_button_handle}']"]
          end

          def close_button_view
            @driver[:css => "input[type='button']"]
          end
          
          def close_button_comment
            close_button_comment = @wkb_profiles['my_todo']['close_button']
            @driver[:css => "input[value='#{close_button_comment}']"]
          end

          def close_button
            close_button = @wkb_profiles['my_todo']['close_button']
            @driver[:css => "div[id='content'] p input[value='#{close_button}']"]
          end

        end # MyTodoPage
      end # MyTodo
    end #  Page
  end # Wkb
end #WebDriver