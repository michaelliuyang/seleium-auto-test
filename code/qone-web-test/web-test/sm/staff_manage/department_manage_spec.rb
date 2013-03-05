require_relative '../../load_helper'

module WebTest
  module Sm
    module StaffManage

      describe 'department manage page' do
        before :all do
          @page_profiles = Helper::ReadProfiles.apps_res_zh :sm
          @data_profiles = Helper::ReadProfiles.data :sm
          @sm_login_name = @page_profiles['sa_login_name']
          @sm_password = @page_profiles['password']
          @driver = Support::Login.login(:name=>@sm_login_name, :pwd=>@sm_password)
          @page_container = WebDriver.create_page_container :sm, @driver
          @department_manage_page = @page_container.department_manage_page
          @department_manage_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'accessd?' do
        #given
          department_menu_name = @page_profiles['staff_manage']['department_manage']
          #when
          actual_top_title = @department_manage_page.top_title
          #then
          actual_top_title.should == department_menu_name
        end

        it 'add department success?' do
        #given
          name = @data_profiles['department']['name_for_add']
          @department_manage_page.add_department name
          #when
          actual = @department_manage_page.find_department_by_name name
          #then
          actual.should_not == nil
        end

        it 'modify department success?' do
        #given
          name_for_add = @data_profiles['department']['name_for_add']
          name_for_modify = @data_profiles['department']['name_for_modify']
          @department_manage_page.modify_department name_for_add,name_for_modify
          #when
          actual =@department_manage_page.find_department_by_name name_for_modify
          #then
          actual.should_not == nil
        end

        it 'delete department success?' do
        #given
          name = @data_profiles['department']['name_for_modify']
          @department_manage_page.delete_department name
          @department_manage_page.find_department_by_name name
          #when
          begin
            @department_manage_page.find_department_by_name name
          rescue
            puts 'not find department'
            actual = 'not find department'
          end
          #then
          sleep = 2
          actual.should_not == nil
        end

        it 'add user success?' do
          department_name = @data_profiles['department']['name1_for_add']
          @department_manage_page.add_department department_name
          login_name = @data_profiles['user']['login_name_for_add']
          login_passwd = @data_profiles['user']['login_passwd']
          user_name = @data_profiles['user']['name']
          email= @data_profiles['user']['email']
          @department_manage_page.add_user department_name
          @department_manage_page.submit_add_user login_name,login_passwd,user_name,email
          @department_manage_page.search_by_login_name login_name
          actual =@department_manage_page.table_first_username
          actual.should == user_name
        end

        it 'modify username by login_name success?' do
          login_name = @data_profiles['user']['login_name_for_add']
          user_name_for_modify = @data_profiles['user']['name_for_modify']
          @department_manage_page.modify_userinfo_by_loginname login_name, user_name_for_modify
          @department_manage_page.search_by_login_name login_name
          actual = @department_manage_page.table_first_username
          actual.should == user_name_for_modify
        end
#         
        it 'add sub department successed?'do
        #given
          parent_department_name = @data_profiles['department']['name1_for_add']
          sub_department_name = @data_profiles['sub_department']['name']
          @department_manage_page.add_sub_department parent_department_name,sub_department_name
          #when
          actual = @department_manage_page.find_department_by_name sub_department_name
          #then
          actual.should_not == nil
        end
        
        

      end
    end # StaffManage
  end # Sm
end # WebTest