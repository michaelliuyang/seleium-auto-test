require 'webdriver/common/page_container'

module WebDriver
  module Login
    class PageContainer < Common::PageContainer
      def login_page(url)
        Page::LoginPage.new @driver,url
      end
    end
  end # Login
end # WebDriver
