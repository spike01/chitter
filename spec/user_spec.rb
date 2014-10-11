require 'spec_helper'

describe User do

    it 'creates a user from the param hash' do
      params = { fullname: 'fullname', username: 'username', email: 'email', 
                 password: 'password'}

      expect(User).to receive(:create).with(params)
      User.from(params)
  end

    it 'ensures that e-mail addresses are unique' do
      2.times { create_user }
      expect(User.count).to eq(1) 
    end

    def create_user
      User.create(fullname: 'fullname', username: 'username', email: 'email', 
                 password: 'password')
    end
end



