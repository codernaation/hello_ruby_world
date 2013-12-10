require 'spec_helper'

module Automatic
  module Individuals 
    module Populations

      describe 'module Populations' do
        let(:male) { Individuals::Genders::Males::Male.new 3, 2 }
        let(:female) { Individuals::Genders::Females::Female.new 4, 2, 2 }
        let(:unit) { Unit.new male, 's' }
        let(:unit_female) { Unit.new female, 'u' }
        let(:population) { ThreeRanksPopulation.new({ elite: 5, normal: 4, weak: 12 }) }
        let(:population_total) { ThreeRanksPopulation.new({ total: 12 }) }

        describe 'constants' do
          it 'contains right data' do
            expect(GENDERS[:male]).to eq 'Automatic::Individuals::Genders::Males::Male'
            expect(GENDERS[:female]).to eq 'Automatic::Individuals::Genders::Females::Female'
          end
        end

        describe Unit  do
          describe '#new' do
            it 'assigns variables' do
              expect(unit.gender).to be_a_kind_of Individuals::Genders::Males::Male
              expect(unit.label).to eq 's'
            end
          end   

          describe 'gender recognizing mechanize' do
            it 'allows check gender of unit' do
              expect(unit).to be_male
              expect(unit_female).to be_female
            end
          end

          describe 'current_action' do
            it 'returns current action for gender' do
              unit.gender.rank.should_receive(:method)
              unit.current_action
              unit_female.gender.body.should_receive(:detect_action)
              unit_female.current_action
            end
          end       
        end

        describe ThreeRanksPopulation do
          let(:units_number) { 5 }
          
          describe '#new' do
            it 'parsing initializing hash' do
              expect(population.units.count).to eq 21
            end
          end 

          describe 'differentiation by sex' do
            it 'allows get only males or females' do
              expect(population.all_males.count + population.all_females.count).to eq population.units.count
            end
          end  

          describe '#create_units' do

            it 'returns array of units' do
              expect(population.send(:create_units, units_number)).to be_a_kind_of Array
            end

            it 'create instances of Unit class' do
              population_total.units.each{ |u| expect(u).to be_a_kind_of Unit }
            end
          end

        end

      end

    end
  end
end