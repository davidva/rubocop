# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    describe UnlessElse do
      let (:ue) { UnlessElse.new }

      it 'registers an offence for an unless with else' do
        inspect_source(ue, 'file.rb', ['unless x',
                                       '  a = 1',
                                       'else',
                                       '  a = 0',
                                       'end'])
        ue.offences.map(&:message).should ==
          ['Never use unless with else. Rewrite these with the ' +
           'positive case first.']
      end

      it 'accepts an unless without else' do
        inspect_source(ue, 'file.rb', ['unless x',
                                       '  a = 1',
                                       'end'])
        ue.offences.map(&:message).should == []
      end
    end
  end
end