module WebDriver
  module Support
    module Component
      class QoneMultipleSelect

        def initialize(driver, element)
          begin
            @element_name, suffix = element['id'].split(/\s*\_showDiv\s*/)
            @global_profiles = Helper::ReadProfiles.apps_res_zh :global
            #@show_options_button = element.find_element(:css => '+img')
            @show_options_button = driver.find_element(:css => "##{@element_name}_showImg")
            @options = driver["#{@element_name}_option"].find_elements(:tag_name, 'div')
            select_all = @global_profiles['select_all']
            uncheck = @global_profiles['uncheck']
            confirm = @global_profiles['confirm']
            search_button_div = driver["#{@element_name}_input_layer"]
            @select_all_button = search_button_div.find_element(:css => "input[value='#{select_all}']")
            @uncheck_button = search_button_div.find_element(:css => "input[value='#{uncheck}']")
            @confirm_button = search_button_div.find_element(:css => "input[value='#{confirm}']")
          rescue
            raise NotValidElementError, "can not init QoneMultipleSelect : #{@element_name}"
            exit
          end
        end

        def select_by_value *values
          @show_options_button.click
          values.each do |value|
            @options.each do |option|
              option_checkbox = option.find_element(:id => @element_name)
              option_checkbox.click if option_checkbox['value'] == value
            end
          end
          @confirm_button.click
        end

        def select_by_index *indexes
          @show_options_button.click
          indexes.each do |index|
            @options[index].find_element(:id => @element_name).click if valid_index? index
          end
          @confirm_button.click
        end

        def select_by_text *texts
          @show_options_button.click
          texts.each do |text|
            @options.each do |option|
              option.find_element(:id => @element_name).click if option.find_element(:tag_name => "label").text == text
            end
          end
          @confirm_button.click
        end

        def select_all
          @show_options_button.click
          @select_all_button.click
          @confirm_button.click
        end

        def uncheck
          @show_options_button.click
          @uncheck_button.click
          @confirm_button.click
        end

        private

        def valid_index? index
          index.to_i <= (@options.size - 1)
        end

      end # QoneMultipleSelect
    end # Component
  end # Support
end # WebDriver