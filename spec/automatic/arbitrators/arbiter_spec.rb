require 'spec_helper'

module Automatic
  module Arbitrators

    describe Arbiter do
      let(:params) { { 
        population: { total: 1 }, 
        grid: { size: 2 } 
      } } 
      let(:arbiter) { Arbiter.new params }
      let(:male) { Automatic::Individuals::Genders::Males::Male.new 3, 2 }
      let(:unit) { Automatic::Individuals::Populations::Unit.new male, 's' } 
      let(:female) { Automatic::Individuals::Genders::Females::Female.new 3, 2, 0 }
      let(:unit_f) { Automatic::Individuals::Populations::Unit.new female, 's' }
      let(:this_pos) { Automatic::Terrains::Positions::Position.new(0, 0) }
      let(:that_pos) { Automatic::Terrains::Positions::Position.new(1, 1) }
      let(:this) { arbiter.instance_variable_get(:@terrain).get_cell_by_position(this_pos) }
      let(:that) { arbiter.instance_variable_get(:@terrain).get_cell_by_position(that_pos) }


      before do
        this.bind unit
        that.bind unit_f
        arbiter.instance_variable_set(:@this, this)
        arbiter.instance_variable_set(:@that, that)
      end

      describe '#new' do
        it 'assigns variables' do
          expect(arbiter.instance_variable_get(:@population)).to be_a Individuals::Populations::ThreeRanksPopulation
          expect(arbiter.instance_variable_get(:@terrain)).to be_a Terrains::Grids::BorderedGrid
        end
      end

      context 'gender depended action' do
        describe '#different_gender?' do
          it 'checks if two cell are having units with different gender' do
            expect(arbiter.send(:different_gender?)).to be_true
            that.bind unit
            expect(arbiter.send(:different_gender?)).to be_false
          end
        end

        describe '#similar_gender?' do
          it 'checks if two cell are having units with same gender' do
            expect(arbiter.send(:similar_gender?)).to be_false
            that.bind unit
            expect(arbiter.send(:similar_gender?)).to be_true
          end
        end

        describe '#pick_female_action' do
          it 'gets current female method and call it on arbiter' do
            expect(arbiter).to receive(:menstruation).once
            arbiter.send(:pick_female_action)
          end
        end

        describe '#social_actions' do
          it 'choose wich method to call' do
            expect(arbiter).to receive(:pick_female_action)
            arbiter.send(:social_actions)
            that.bind unit
            expect(arbiter).to receive(:perform_ritual)
            arbiter.send(:social_actions)
          end
        end
      end

      describe '#find_neighbours_of' do
        it 'gets all cells which are matching possible ways' do
          expect(arbiter.instance_variable_get(:@terrain)).to receive(:get_cell_by_position).exactly(3).times
          expect(arbiter.instance_variable_get(:@candidate_cells)).to receive(:push).exactly(3).times
          arbiter.find_neighbours_of this
        end
      end

      describe '#next_random_cell' do
        it 'returns random of neibours cells' do
          expect(arbiter.instance_variable_get(:@candidate_cells)).to receive(:sample)
          arbiter.send(:next_random_cell)
        end
      end

      describe '' do
        it '' do

        end
      end

    end

  end
end

