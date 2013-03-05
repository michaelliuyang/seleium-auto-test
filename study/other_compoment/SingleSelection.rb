#encoding: utf-8
require 'selenium-webdriver'
driver=Selenium::WebDriver.for :ie
driver.manage.timeouts.implicit_wait=5
url='http://localhost:8080/pm'
driver.get url
#login
driver[:id=>'loginUserName'].send_keys 'lypm'
driver[:id=>'currentPassword'].send_keys'intec'
driver[:css=>'input.loginBtn'].click
#def show_child_menu(id)
#  js="q=document.getElementById('#{id}');q.style.display='block'"
#
#end
#选中单选按钮的否
driver.get 'http://localhost:8080/pm/showMyProblemAction.do'
 driver.find_element(:xpath=>"//input[@name='toSmRadio' and @value='0']").click

driver.quit