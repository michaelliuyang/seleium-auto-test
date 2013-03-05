require_relative '../../load_helper'
module WebTest
  module Pm
    module ConfigManage

      describe 'config library information  page' do

        before :all do
          @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
          @pm_data = Helper::ReadProfiles.data :pm
          @pm_login_name = @pm_profiles['pcm_login_name']
          @pm_password = @pm_profiles['password']
          @driver = Support::Login.login(:name => @pm_login_name, :pwd => @pm_password)
          @page_container = WebDriver.create_page_container :pm, @driver
          @project_list_page = @page_container.project_list_page
          @project_list_page.to_this_page
          project_name = @pm_data['project_list']['project_name']
          @project_list_page.enter_project project_name
          @config_library_information_page = @page_container.config_library_information_page
          @config_library_information_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu page test' do
          expect_name = @pm_profiles['config_manage']['config_library_information_title']
          actual_top_title = @config_library_information_page.top_title
          actual_top_title.should == expect_name
        end

        it 'look control library success?' do
          #given
          look_page_title= @pm_profiles['config_manage']['view_config_library_struct_template']
          control_name = @pm_profiles['config_manage']['control_library']
          #when
          actual_top_title = @config_library_information_page.look_config_library_information control_name
          #then
          actual_top_title.should == look_page_title
        end

        it 'look product library success?' do
          #given
          look_page_title= @pm_profiles['config_manage']['view_config_library_struct_template']
          product_name = @pm_profiles['config_manage']['product_library']
          #when
          actual_top_title = @config_library_information_page.look_config_library_information product_name
          #then
          actual_top_title.should == look_page_title
        end

        it 'modify  control library success?' do
          #given
          control_name = @pm_profiles['config_manage']['control_library']
          contorl_scm_name = @pm_data['config_manage']['contorl_scm_name']
          @config_library_information_page.modify_config_library_through_name control_name,contorl_scm_name
          #when
          actual = @config_library_information_page.find_scm_by_name contorl_scm_name
          #then
          actual.should == true
        end

        it 'modify product library success ' do
          #given
          product_name = @pm_profiles['config_manage']['product_library']
          product_scm_name = @pm_data['config_manage']['product_scm_name']
          @config_library_information_page.modify_config_library_through_name product_name,product_scm_name
          #when
          actual = @config_library_information_page.find_scm_by_name product_scm_name
          #then
          actual.should == true
        end

        it 'add develop library success?' do
          #given
          config_library_name = @pm_data['config_manage']['config_library_name']
          server_address = @pm_data['config_manage']['server_address']
          port = @pm_data['config_manage']['port']
          warehouse_address = @pm_data['config_manage']['warehouse_address']
          @config_library_information_page.add_develop_library_test(config_library_name,server_address,port,warehouse_address)
          #when
          actual = @config_library_information_page.find_config_by_name config_library_name
          #then
          actual.should == true
        end
        
        it 'create develop user relation success?' do
          #given
          create_user_relation_title= @pm_profiles['config_manage']['create_user_relation_title']
          config_library_name= @pm_data['config_manage']['find_config_library_name']
          user_name= @pm_data['config_manage']['user_name']
          pass_word= @pm_data['config_manage']['pass_word']
          #when
          actual_top_title = @config_library_information_page.create_user_relation_test(config_library_name,user_name,pass_word)
          #then
          actual_top_title.should == create_user_relation_title
        end
        
        it 'modify develop library success?' do
          #given
          old_library_name= @pm_data['config_manage']['find_config_library_name']
          modify_config_library_name = @pm_data['config_manage']['modify_config_library_name']
          server_address = @pm_data['config_manage']['server_address']
          port = @pm_data['config_manage']['port']
          warehouse_address = @pm_data['config_manage']['warehouse_address']
          @config_library_information_page.modify_develop_library(old_library_name,modify_config_library_name,server_address,port,warehouse_address)
          #given
          actual = @config_library_information_page.find_config_by_name old_library_name
          #then
          actual.should == false
        end
        
        it 'look develop library success?' do
          #given
          user_config_state= @pm_profiles['config_manage']['user_config_state']
          library_name= @pm_data['config_manage']['find_config_library_name']
          #when
          actual_top_title = @config_library_information_page.look_develop_library(library_name)
          #then
          actual_top_title.should == user_config_state
        end
        
          it 'delete develop library success?' do
            #given
            find_config_library_name = @pm_data['config_manage']['find_config_library_name']
            @config_library_information_page.delete_develop_library(find_config_library_name)
            actual = nil
            #when
            begin
             @config_library_information_page.find_config_by_name find_config_library_name 
            rescue
              puts 'not find library name'
              actual = 'not find library name'
            end
            #then
            actual.should_not == nil
          end

      end #describe
    end # ConfigManage
  end # Pm
end #WebTest

