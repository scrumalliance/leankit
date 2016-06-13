module ConfigHelper
  def self.set_test_config
    LeanKit::Config.email    = EMAIL
    LeanKit::Config.password = PASSWORD
    LeanKit::Config.account  = TEST_ACCOUNT
  end
end
