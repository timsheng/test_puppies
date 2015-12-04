require 'rspec'
require 'page-object'
require 'faker'
require 'data_magic'
require 'require_all'

require_all 'lib'



DataMagic.load('default1.yml')

# module Account
#   def account_number
#     # return the value to be displayed
#     'blah'
#   end
# end
#
# DataMagic.add_translator(Account)

World(PageObject::PageFactory)
