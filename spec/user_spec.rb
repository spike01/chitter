require 'spec_helper'

describe User do
  context 'making sure database works' do
    it 'can be created and retrieved' do
      expect(User.count).to eq(0)
      User.create(fullname: "Spike Lindsey",
                  username: "spikenox",
                  email: "spike01@gmail.com")
      expect(User.count).to eq(1)
      user = User.first
      expect(user.fullname).to eq("Spike Lindsey")
      expect(user.username).to eq("spikenox")
      expect(user.email).to eq("spike01@gmail.com")
      user.destroy
      expect(User.count).to eq(0)
    end
  end
end

