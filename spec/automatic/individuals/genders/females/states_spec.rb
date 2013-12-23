require 'spec_helper'

module Automatic
  module Individuals 
    module Genders  
      module Females
        module States

          shared_examples "includes BodyCounters" do
            let(:state) { described_class.new }

            describe '#new' do  
              it 'initializes variables' do    
                expect(state.body_counters).to be_a_kind_of BodyCounters
              end
            end

          end

          describe 'Whole mechanize' do
            let(:male) { double(Genders::Males::Male) }
            let(:female) { double(Genders::Females::Female) }
            let(:male_without_females) { double(Genders::Males::Male, females: []) }   
            let(:male_with_females) { double(Genders::Males::Male, females: [female]) }
            let(:mens) { Menstruation.new }
            let(:ovul) { Ovulation.new }
            let(:up) { WalkingUp.new } 
            let(:down) { WalkingDown.new } 
            let(:body) { BodyState.new 2 }
            let(:body_2) { BodyState.new 0 }
            let(:states_types) { [Ovulation, WalkingDown, Menstruation, WalkingUp] }

            describe BodyCounters do
              let(:counts) { BodyCounters.new }

              describe '#new' do
                it 'initializes variables' do
                  expect(counts.males).to be_a_kind_of Array
                  expect(counts.females).to be_a_kind_of Array
                  expect(counts.females.size).to eq 0
                  expect(counts.males.size).to eq 0
                end
              end
            end

            describe Menstruation do             

              it_behaves_like 'includes BodyCounters'
              
              describe '#wait' do
                it 'do nothing' do
                  expect(mens.wait).to be_nil
                end
              end

            end
            
            describe Ovulation do
                            
              it_behaves_like 'includes BodyCounters'
              
              describe '#add_sex_with' do
                it 'call private method' do
                  ovul.add_sex_with male
                  expect(ovul.body_counters.males.size).to eq 1
                end
              end

            end
            
            describe WalkingUp do
              
              it_behaves_like 'includes BodyCounters'

              describe '#speak' do
                context 'when empty' do
                  it 'returns nil' do
                    expect(up.speak).to be_nil
                  end
                end

                describe '#speak' do
                  it 'returns first of male' do
                    up.body_counters.stub(:males).and_return([male])
                    expect(up.speak).to eq male
                  end
                end
              end

            end

            describe WalkingDown do
              
              it_behaves_like 'includes BodyCounters'

              describe '#speak' do
                context 'when empty' do
                  it 'returns nil' do
                    expect(down.ask male_without_females).to be_nil
                  end
                end

                context 'when it not empty' do
                  it 'returns first of male' do
                    down.ask male_with_females
                    expect(down.body_counters.females.last).to eq female
                  end
                end
              end

            end

            describe BodyState do

              describe '#new' do
                it 'assigns right values' do
                  expect(body.current_state).to be_a_kind_of Ovulation
                  expect(body.instance_variable_get(:@state_circle).count).to eq 4
                  body.instance_variable_get(:@state_circle).each_with_index do |state_class, i|
                    expect(state_class).to be_a_kind_of states_types[i]
                  end
                end
              end

              describe '#next_state' do
                before do
                  states_types.rotate!
                end

                it 'change state to next in list' do
                  Marshal.should_receive(:dump)
                  Marshal.should_receive(:load)
                  body.next_state
                  expect(body.current_state).to be_a_kind_of WalkingDown
                  expect(body.instance_variable_get(:@state_circle).count).to eq 4
                  body.instance_variable_get(:@state_circle).each_with_index do |state_class, i|
                    expect(state_class).to be_a_kind_of states_types[i]
                  end
                end
              end

              describe '#males_count' do
                it 'returns call other method' do
                  body.current_state.body_counters.males.should_receive(:size)
                  body.males_count
                end
              end
              
              describe '#state_to_symbol' do
                it 'returns call other method' do
                  expect(body.state_symbolize).to eq :ovulation
                end
              end

              describe 'counters transfer' do
                it 'allows keep counters values during changing states' do
                  body.current_state.add_sex_with male
                  4.times do 
                    body.next_state
                    expect(body.current_state.body_counters.males.size).to eq 1
                  end
                end
              end

            end

          end

        end
      end
    end
  end
end