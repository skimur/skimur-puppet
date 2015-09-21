require 'spec_helper'
describe 'cassandra::java' do

  context 'On a RedHat OS with defaults for all parameters' do
    let :facts do
      {
        :osfamily => 'RedHat'
      }
    end

    it { should contain_class('cassandra::java') }
    it { should contain_package('java-1.8.0-openjdk-headless') }
  end

  context 'On an Ubuntu OS with defaults for all parameters' do
    let :facts do
      {
        :operatingsystem => 'Ubuntu'
      }
    end

    it { should contain_class('cassandra::java') }
    it { should contain_package('openjdk-7-jre-headless') }
  end

  context 'With java_package_name set to foobar' do
    let :params do
      {
        :package_name   => 'foobar-java',
        :ensure         => '42',
      }
    end

    it {
      should contain_package('foobar-java').with({
        :ensure => 42,
      })
    }
  end
end
