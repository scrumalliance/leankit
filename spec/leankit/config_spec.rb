require "spec_helper"

describe LeanKit::Config do
  describe :validate do
    before :each do
      ConfigHelper.set_test_config
    end

    context "when the config is not set" do
      it "raises a no credentials error when no email" do
        LeanKit::Config.email = nil
        lambda{ LeanKit::Config.validate }.should raise_error(LeanKit::Config::NoCredentials)
      end

      it "raises a no credentials error when no password" do
        LeanKit::Config.password = nil
        lambda{ LeanKit::Config.validate }.should raise_error(LeanKit::Config::NoCredentials)
      end

      it "raises a no account error when no account" do
        LeanKit::Config.account = nil
        lambda{ LeanKit::Config.validate }.should raise_error(LeanKit::Config::NoAccount)
      end
    end

    context "when the config is set" do
      it "doesn't raise a no credentials error" do
        lambda{ LeanKit::Config.validate }.should_not raise_error
      end

      it "doesn't raise a no account error" do
        lambda{ LeanKit::Config.validate }.should_not raise_error
      end
    end
  end

  describe :uri do
    it "validates the config" do
      LeanKit::Config.should_receive(:validate)
      LeanKit::Config.uri
    end

    it "returns the domain including the account name" do
      LeanKit::Config.uri.should eql "https://#{TEST_ACCOUNT}.leankit.com/kanban/api"
    end
  end

  describe :basic_auth_hash do
    it "validates the config" do
      LeanKit::Config.should_receive(:validate)
      LeanKit::Config.basic_auth_hash
    end

    it "returns a hash with the credentials" do
      expected_hash = {:basic_auth => {:username => EMAIL, :password => PASSWORD}}
      LeanKit::Config.basic_auth_hash.should eql expected_hash
    end
  end
end
