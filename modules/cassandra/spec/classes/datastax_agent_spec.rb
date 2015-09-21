require 'spec_helper'
describe 'cassandra::datastax_agent' do
  let(:pre_condition) { [
    'define ini_setting ($ensure, $path, $section, $key_val_separator, $setting, $value) {}'
  ] }

  context 'Test for cassandra::datastax_agent.' do
    it { should contain_class('cassandra::datastax_agent').with_package_ensure('present') }
    it { should contain_class('cassandra::datastax_agent').with_package_name('datastax-agent') }
    it { should contain_class('cassandra::datastax_agent').with_service_enable('true') }
    it { should contain_class('cassandra::datastax_agent').with_service_ensure('running') }
    it { should contain_class('cassandra::datastax_agent').with_service_name('datastax-agent') }
    it { should contain_class('cassandra::datastax_agent').with_stomp_interface() }
  end

  context 'Test for cassandra::datastax_agent package.' do
    it {
      should contain_package('datastax-agent')
    }
  end

  context 'Test for cassandra::datastax_agent service.' do
    it {
      should contain_service('datastax-agent')
    }
  end

  context 'Test that stomp_interface can be set.' do
    let :params do
      {
        :stomp_interface => '192.168.0.1'
      }
    end

    it { should contain_ini_setting('stomp_interface').with_ensure('present') }
    it { should contain_ini_setting('stomp_interface').with_value('192.168.0.1') }
  end

  context 'Test that stomp_interface can be ignored.' do
    it {
      should contain_ini_setting('stomp_interface').with_ensure('absent')
    }
  end
end
