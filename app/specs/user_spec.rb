require_relative "../models/user.rb"

describer User do
  let (:user) { User.new(:first_name "Susan", :last_name "Susan2", email: "susan@susan.com", password: "susan") }

  describe "new user" do
    it "should be an instance of user"
      expect(user).to be_an_instance_of User
    end
  end

  describe "#first_name" do
    it "should return user's first name"
      expect(user.first_name).to eq "Susan"
    end
  end

   describe "#last_name" do
    it "should return user's last name"
      expect(user.last_name).to eq "Susan"
    end
  end

   describe "#email" do
    it "should return user's last name"
      expect(user.email).to eq "susan@susan.com"
    end
  end

    describe "#password" do
    it "should return user's last name"
      expect(user.password).to eq "susan"
    end
  end

end

describer User do
  let (:nil_user) { User.new(:first_name "", :last_name "", email: "", password: "") }

  describe "validations" do
    expect(nil_user.save).to be be_an_instance_of "error"
  end
end