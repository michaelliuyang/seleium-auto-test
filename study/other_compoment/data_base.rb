#encoding: utf-8
require 'selenium-webdriver'
driver=Selenium::WebDriver.for :ie
driver.manage.timeouts.implicit_wait=5
url='http://localhost:8080/pm'
driver.get url
#login
driver[:id=>'loginUserName'].send_keys 'sa'
driver[:id=>'currentPassword'].send_keys'intec'
driver[:css=>'input.loginBtn'].click
#def show_child_menu(id)
#  js="q=document.getElementById('#{id}');q.style.display='block'"
#
#end
#driver.get 'http://localhost:8080/pm/sm/orgmgr/orgDepIndex.jsp'
driver.get 'http://localhost:8080/pm/enumDataAction.do?method=initEnumDate&enumDataTypeId=PROJ_TYPE'
=begin
#添加一条基础数据
driver[:id=>"2"].find_element(:id,'initEnum').send_keys 'yingyong'
driver[:id=>'2'].find_element(:id,'lineEditDiv').find_element(:name=>'description').send_keys 'jjdosoososoo'
driver[:xpath=>"//input[@id='importSub' and @type='submit']"].click
=end
=begin
#删除一条基础数据，点击删除列的删除按钮删除
driver[:xpath=>"//a[@href='/pm/enumDataAction.do?method=removeEnumDate&enumDataTypeId=PROJ_TYPE&enumDataId=12']"].click
driver.switch_to.alert.accept
=end

#删除基础数据，通过“删除基础数据”按钮
driver[:xpath=>"//input[@value='11']"].click
driver[:xpath=>"//input[@id='importSub' and @value='删除基础数据']"].click
driver.switch_to.alert.dismiss


sleep 2
driver.quit
