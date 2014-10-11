require 'spec_helper'

describe User do

    it 'creates a user from the param hash' do
      params = { fullname: 'fullname', username: 'username', email: 'email', 
                 password: 'password'}

      expect(User).to receive(:create).with(params)
      User.from(params)
  end

    it 'ensures that e-mail addresses are unique' do
      2.times { create_email_user }
      expect(User.count).to eq(1) 
    end

    it 'ensures that usernames are unique' do
      2.times { create_username_user }
      expect(User.count).to eq(1) 
    end

    def create_email_user
      User.create(fullname: 'fullname', email: 'email', 
                 password: 'password')
    end

    def create_username_user
      User.create(fullname: 'fullname', username: 'username', 
                 password: 'password')
    end
end



