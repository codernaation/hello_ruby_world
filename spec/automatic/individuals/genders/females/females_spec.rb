require 'spec_helper'

module Automatic
  module Individuals 
    module Genders  
      module Females
      
        describe 'Female' do 
          let(:female) { Female.new 4, 2, 1 }
          
          describe '#new' do
            it 'assign instance variables' do
              expect(female.beauty).to eq 'Ideal'
              expect(female.rank).to eq 2
              expect(female.body).to be_a_kind_of States::BodyState
            end
          end

          describe '#males_count' do
            it 'requests body class for males data' do
              female.body.should_receive(:males_count)
              female.males_count
            end
          end

          describe '#state_symbolize' do
            it 'requests body class state as symbol' do
              female.body.should_receive(:state_symbolize)
              female.state_symbolize
            end
          end

          describe '#update' do
            it 'requst body object for updating' do
              female.body.should_receive(:next_state)
              female.update
            end
          end

          describe '#description' do
            it 'returns short description' do
              expect(female.description).to eq 'She is Ideal female.'
            end
          end
            
        end

      end
    end
  end
end