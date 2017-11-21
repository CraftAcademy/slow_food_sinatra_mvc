require 'spec_helper'


describe User do

  it 'is not valid without a name' do
    expect(
        User.create(password: 'testing')
    ).to_not be_valid
  end

  it 'is not valid without a password' do
    expect(
        User.create(name: 'Thomas')
    ).to_not be_valid
  end

  describe 'database table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :password_digest }
  end

end