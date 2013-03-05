require 'webdriver/common/page_container'

module WebDriver
  module Cm
    class PageContainer <Common::PageContainer
        def config_item_browse_page
             Page::ConfigItemBrowse::ConfigItemBrowsePage.new @driver
        end
        def baseline_browse_page
             Page::BaselineBrowse::BaselineBrowsePage.new @driver
        end
        def config_process_list_page
             Page::ConfigProcessList::ConfigProcessListPage.new @driver
        end
        def config_audit_page
            Page::ConfigAudit::ConfigAuditPage.new @driver
        end
        def config_library_relation_page
           Page::ConfigLibraryRelation::ConfigLibraryRelationPage.new @driver
        end
    end #PageContaine
  end #Cm
end #WebDriver