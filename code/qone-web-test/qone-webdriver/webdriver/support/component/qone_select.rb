module WebDriver
  module Support
    module Component
      class QoneSelect

        def initialize(driver, element)
          begin
            element_name, suffix = element['id'].split(/\s*\_\s*/)
            @select_input = element
            @options = driver.find_elements(:name, "#{element_name}_select_childs_name")
          rescue
            raise NotValidElementError, "can not init QoneSelect : #{element_name}"
            exit
          end
        end

        def select_by_value value
          @select_input.click
          @options.each do |option|
            option.click if option['c_value'] == value
          end
        end

        def select_by_index index
          @select_input.click
          @options[index].click if valid_index? index
        end

        def select_by_text text
          @select_input.click
          @options.each do |option|
            option.click if option['title'] == text
          end
        end

        private

        def valid_index? index
          index.to_i <= (@options.size - 1)
        end

      end # QoneSelect
    end # Component
  end # Support
end # WebDriver
