module WebTest
  module Support
    module Login
       
      def self.login(*args)
        hash = extract_args(args)
        login_name = hash[:name]
        login_pwd = hash[:pwd]
        browser = login_info.browser
        url = login_info.url
        driver = Selenium::WebDriver.for browser.to_sym
        page_container = WebDriver.create_page_container :login,driver
        login_page = page_container.login_page("#{url}/pm").open
        login_page.login login_name,login_pwd
        driver
      end
      
      private
      
      def self.login_info
        Helper::ReadProfiles
      end
      
      def self.extract_args(args)
        case args.size
        when 0
          {:name=>"#{login_info.login_name}",
           :pwd=>"#{login_info.login_pwd}"}
        when 1
          hash = args.first
          if hash.has_key?(:name) && hash.has_key?(:pwd)
            hash
          else
            raise "must have keys :name and :pwd"
          end
        else
          raise "args num is wrong"
        end
      end
      
    end # Login
  end # Support
end # WebTest

