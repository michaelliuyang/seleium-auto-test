#Before run this spec file,please ensure there is a user having authority for doc manage menu and its children menu.
require_relative '../../load_helper'

module WebTest
  module Dm
    class DocListSpec
      describe 'doc list page' do
        before :all do
          @page_profiles = Helper::ReadProfiles.apps_res_zh :dm
          @data_profiles = Helper::ReadProfiles.data :dm
          @doc_login_name = @data_profiles['login']['login_name']
          @doc_login_passwd = @data_profiles['login']['login_passwd']
          @driver = Support::Login.login(:name => @doc_login_name, :pwd => @doc_login_passwd)
          @page_container = WebDriver.create_page_container :dm, @driver
          @doc_list_page = @page_container.doc_list_page
          @doc_list_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'doc list page accessed?'do
        #given
          expect = @page_profiles['doc_list']['doc_list']
          #when
          actual = @doc_list_page.top_title
          #then
          actual.should == expect
        end

        it 'add doc page accessed?'do
        #given
          expect = @page_profiles['doc_list']['add_doc']
          #when
          actual = @doc_list_page.add_doc_title
          #then
          actual.should == expect
        end

        it 'add doc function worked?'do
        #given
          doc_title = @data_profiles['doc']['title_for_add']
          @doc_list_page.add_doc doc_title
          expect = true
          #when
          actual = @doc_list_page.doc_title_exist? doc_title
          #then
          actual.should == expect
        end
        
        it 'look doc function worked?'do
        #given
          doc_title = @data_profiles['doc']['title_for_add']
          expect = @page_profiles['doc_list']['look_doc']
          #when
          actual = @doc_list_page.look_doc doc_title
          #then
          actual.should == expect
        end

        it 'modify doc function worked?'do
        #given
          doc_title = @data_profiles['doc']['title_for_add']
          new_doc_title = @data_profiles['doc']['title_for_modify']
          @doc_list_page.modify_doc doc_title,new_doc_title
          expect = true
          #when
          actual = @doc_list_page.doc_title_exist? new_doc_title
          #then
          actual.should == expect
        end

        it 'delete doc funciton worked?'do
        #given
          new_doc_title = @data_profiles['doc']['title_for_modify']
          @doc_list_page.del_doc new_doc_title
          expect = false
          sleep 3
          #when
          actual = @doc_list_page.doc_title_exist? new_doc_title
          #then
          sleep 2
          actual.should == expect
        end

      end #describe
    end #doclistspec
  end #Sm
end #Webtest