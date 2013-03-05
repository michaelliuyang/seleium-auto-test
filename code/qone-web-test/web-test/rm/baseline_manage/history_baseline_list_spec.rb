require_relative '../../load_helper'

module WebTest
  module Rm
    module BaselineManage
    class HistoryBaselineListSpec
      describe 'history baseline list page' do
        before :all do
          @rm_profiles = Helper::ReadProfiles.apps_res_zh :rm
          @sa_login_name =@rm_profiles['sa_login_name']
          @login_passwd =@rm_profiles['login_passwd']
          @driver = Support::Login.login(:name => @sa_login_name, :pwd => @login_passwd)
          @page_container = WebDriver.create_page_container :rm, @driver
          @history_baseline_list_page = @page_container.history_baseline_list_page
          @history_baseline_list_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'history baseline list page accessed?'do
          expect = @rm_profiles['baseline_manage']['history_baseline_list']
          actual = @history_baseline_list_page.top_title
          actual.should == expect
        end
      end #describe
    end #HistoryProductListspec
   end#BaselineMange
  end #Rm
end #Webtest