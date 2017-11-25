require 'spec_helper'

describe User do

  describe 'database table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :password_digest }

    it {is_expected.to have_many :orders}
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }

    describe ':email' do
      it { is_expected.to allow_value('thomas@craftacademy.se').for(:email) }
      it { is_expected.to allow_value('info@craftacademy.co').for(:email) }

      it { is_expected.to_not allow_value('thomas@craftacademy').for(:email) }
      it { is_expected.to_not allow_value('thomas@craftacademy com').for(:email) }
      it { is_expected.to_not allow_value('@craftacademy com').for(:email) }
    end
  end
end