require_relative '../../load_helper'

module WebTest
  module Dm
    class DocStatisticReportSpec
      describe 'doc statistics report page' do
        before :all do
          @profiles = Helper::ReadProfiles
          @dm_profiles = Helper::ReadProfiles.apps_res_zh :dm
          @doc_login_name =@dm_profiles['doc_login_name']
          @doc_login_passwd =@dm_profiles['doc_login_passwd']
          @driver = Support::Login.login(:name => @doc_login_name, :pwd => @doc_login_passwd)
          @page_container = WebDriver.create_page_container :dm, @driver
          @doc_statistics_report_page = @page_container.doc_statistics_report_page
          @doc_statistics_report_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'doc statistics report page accessed?'do
          url = @profiles.url
          expect = "#{url}/pm/commonDocumentAction.do?method=showStatisticalReport"
          actual = @doc_statistics_report_page.current_url
          actual.should == expect
        end

      end #describe
    end #DocTypeManageSpec
  end #Dm
end #Webtest