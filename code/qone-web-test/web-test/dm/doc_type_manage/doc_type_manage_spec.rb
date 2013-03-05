require_relative '../../load_helper'

module WebTest
  module Dm
    class DocTypeManageSpec
      describe 'doc type manage page' do
        before :all do
          @page_profiles = Helper::ReadProfiles.apps_res_zh :dm
          @data_profiles = Helper::ReadProfiles.data :dm
          @doc_login_name =@data_profiles['login']['login_name']
          @doc_login_passwd =@data_profiles['login']['login_passwd']
          @driver = Support::Login.login(:name => @doc_login_name, :pwd => @doc_login_passwd)
          @page_container = WebDriver.create_page_container :dm, @driver
          @doc_type_manage_page = @page_container.doc_type_manage_page
          @doc_type_manage_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'doc type manage page accessed?'do
        #given
          expect = @page_profiles['doc_type_manage']['doc_type_manage']
          #when
          actual = @doc_type_manage_page.top_title
          #then
          actual.should == expect
        end

        it 'add doc type page accessed?'do
        #given
          expect = @page_profiles['doc_type_manage']['add_doc_type']
          #when
          actual = @doc_type_manage_page.add_doc_type_title
          #then
          actual.should == expect
        end

        it 'add doc type function worked?'do
        #given
          add_doc_type_name = @data_profiles['doc_type']['name_for_add']
          @doc_type_manage_page.add_doc_type add_doc_type_name
          expect = true
          #when
          actual = @doc_type_manage_page.type_name_exist? add_doc_type_name
          #then
          actual.should == expect
        end

        it 'modify doc type function worked?'do
        #given
          name_for_add = @data_profiles['doc_type']['name_for_add']
          name_for_modify = @data_profiles['doc_type']['name_for_modify']
          @doc_type_manage_page.modify_doc_type name_for_add,name_for_modify
          expect = true
          #when
          actual = @doc_type_manage_page.type_name_exist? name_for_modify
          #then
          actual.should == expect
        end

        it 'delete doc type function worked?'do
        #given
          name_for_modify = @data_profiles['doc_type']['name_for_modify']
          @doc_type_manage_page.del_doc_type name_for_modify
          expect = false
          #when
          actual = @doc_type_manage_page.type_name_exist? name_for_modify
          #then
          actual.should == expect
        end

      end #describe
    end #doctypeMange
  end #dm
end #Webtest