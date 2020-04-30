require 'rails_helper'

RSpec.describe User, type: :model do
  #these are the validation tests
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe 'uniqueness' do
    before :each do
      create :user
      #users :user factory to create a user in our DB before each test
    end
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token)}
  end

  describe 'finds users by credentials' do
  #testing #find_by_credentials, we want test if it works as intended 
  #we look up a user by its username, check if the pw from arg matches our 
    #'is_password? method

  end

  describe 'finds users by credentials' do #naming convention doesnt use underscores like original method, assuming
    #this line is not the actual method but a reference to it

    context 'with a valid username and password' do #stating when tests pass do this
      it 'should return the proper user' do
        humphrey = User.create(username: 'humphrey_lipton', password: 'password')
        user = User.find_by_credentials('humphrey_lipton','password')

        expect(humphrey.username).to eq(user.username)
        expect(humphrey.password_digest).to eq(user.password_digest)
      end
    end

    context 'with an invalid username and password' do
      it 'should return nil' do
        naomi = User.create(username: 'naomi_willinstoits', password: 'abcdef')
        user = User.find_by_credentials('naomi_willinstoits','notthepassword')
        expect(user).to be_nil
      end
    end
  end

  describe 'is_password?' do
    let!(:user) { create :user }

    context 'with a valid password' do 
      it 'should be true' do
        expect(user.is_password?('starwars')).to be true 
      end
    end

    context 'with an invalid password' do 
      it 'should be false' do 
        expect(user.is_password?('not_star_wars')).to be false 
      end 
    end 
  end 



end



