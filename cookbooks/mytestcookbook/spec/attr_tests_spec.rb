require 'bundler/setup'
require 'chefspec'

describe 'attributes tests' do
  it 'chefspec converge picks up default attr values' do
    runner = ChefSpec::ChefRunner.new
    runner.converge 'mytestcookbook::default'
    puts "runner.node.os: #{runner.node.os.inspect}"
    runner.node.mytestcookbook.attr_a.should eq 'default value'
  end
  it 'can set values for default attributes' do
    runner = ChefSpec::ChefRunner.new do |node|
      node["mytestcookbook"] = { :attr_a => 'bar' }
    end
    runner.converge 'mytestcookbook::default'
    runner.node.mytestcookbook.attr_a.should eq 'bar'
  end
  it 'can differentiate by os' do
    runner = ChefSpec::ChefRunner.new
    runner.converge 'mytestcookbook::default'
    runner.node.mytestcookbook.attr_os.should eq 'foo value'
  end
end
