require 'spec_helper'

module Automatic
  module Individuals 
    module Genders  
      module Males

        describe Male do
          let(:male) { Male.new 4, 2 }
          let(:female) { Genders::Females::Female.new 2, 1, 3 }

          describe '#new' do 
            it 'assigns correct values' do
              expect(male.rank).to be_a_kind_of Strategies::Alfarank 
              expect(male.females).to be_a_kind_of Array
              expect(male.females.count).to eq 0
            end
          end

          describe '#add_sex_with' do 
            it 'add object to collection' do
              male.add_sex_with female
              expect(male.females.count).to eq 1
            end
          end

          describe '#update' do 
            it 'call method of other object' do
              male.rank.should_receive(:increase_power)
              male.update
            end
          end

          describe '#description' do 
            it 'returns a short description' do
              expect(male.description).to eq 'He is Hero male.'
            end
          end

        end

      end
    end
  end
end