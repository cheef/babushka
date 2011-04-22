# coding: utf-8

require 'acceptance_helper'

describe "babushka" do
  before(:all) {
    @vm = VM.instance
  }
  context "bootstrapping" do
    before(:all) {
      @vm.run 'bash -c "`wget -O - babushka.me/up/hard`"'
    }
    it "should have installed babushka" do
      @vm.run('babushka --version').should =~ /^[\d.]+$/
    end
    context "running basic deps" do
      it "should update rubygems" do
        @vm.babushka('rubygems').should =~ /^\} ✓ rubygems/
      end
    end
  end
end
