$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bicycle_orm'

require 'minitest/autorun'

def assert_raises_with_message(exception, msg, &block)
  block.call
rescue exception => e
  assert_match msg, e.message
end
