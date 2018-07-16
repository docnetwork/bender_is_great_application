#
# Cookbook:: bender_is_great_application
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

### PLEASE READ!

# ChefSpec offers an incredibly lightweight pipeline for verifying your recipes
# are doing exactly what you expect them to do.  As an example, if a specific
# package and version needs to be verified, we can write a test that checks the
# mocked output for that resource.  The basic block for scanning your recipe is
# already in place, so just add tests inside the 'context' block of this file.
# All ChefSpec files must end with a *_spec.rb
#
# As stated in the README.md, you can find ChefSpec resource tests at:
#  https://github.com/chefspec/chefspec
#
#
# The command to run a test with ChefSpec is as follows:
#
#  $ chef exec rspec -fd ./spec/unit/recipes/<name_of_file>.rb --color
#
#  -fd  => Formatted as documentation
#  --color  => Make it pretty
#
# For more information about terminal output options, just enter the command
# below:
#
# $ chef exec rspec --help

# Good luck!

require 'spec_helper'

# Tell ChefSpec the recipe you're testing
describe 'bender_is_great_application::default' do
  # Give your output context so you know which OS and attributes you're passing
  # through into the test.
  context 'When all attributes are default, on Ubuntu 16.04' do

    let(:chef_run) do
      ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') do |node|
        # Insert attribute values here
      end.converge(described_recipe)
    end

    # Title of the test block
    it 'converges successfully' do
      # The actual test itself
      expect { chef_run }.to_not raise_error
    end
  end
end
