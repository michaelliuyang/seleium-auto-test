require 'webdriver/common/page_container'

module WebDriver
  module Dm
    class PageContainer < Common::PageContainer
      
      def doc_list_page
        Page::DocList::DocListPage.new @driver
      end

      def doc_statistics_report_page
        Page::DocStatisticsReport::DocStatisticsReportPage.new @driver
      end

      def doc_type_manage_page
        Page::DocTypeManage::DocTypeManagePage.new @driver
      end

    end # PageContainer
  end # Dm
end # WebDriver