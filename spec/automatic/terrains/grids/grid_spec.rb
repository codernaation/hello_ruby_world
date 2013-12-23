require 'spec_helper'

module Automatic
  module Terrains
    module Grids

      describe BorderedGrid do
        let(:position) { Terrains::Positions::Position.new(1, 1) }
        let(:population) { Automatic::Individuals::Populations::ThreeRanksPopulation.new }
        let(:big_population) { Automatic::Individuals::Populations::ThreeRanksPopulation.new( total: 5) }
        let(:grid) { BorderedGrid.new(population.units, 2) }

        describe '#new' do
          it 'assigns variables and build' do
            grid.instance_variable_get(:@collection).each do |row|
              expect(row.count).to eq 3
            end
            expect(grid.instance_variable_get(:@size)).to eq 2
          end
        end

        describe '#build_and_random_bind' do
          it 'builds grids of cells and bind units to cells' do
            expect(grid.get_cells_by_occupate(true).count).to eq 1
          end
        end

        describe '#occupated_cells' do
          it 'returns all instances which have units in' do
            expect(grid.send(:occupated_cells).count).to eq 1
          end
        end

        describe '#not_occupated_cells' do
          it 'returns all instances which have not units in' do
            expect(grid.send(:not_occupated_cells).count).to eq 8
          end
        end
        
        describe '#get_cell_by_position' do
          it 'returns all instances which have not units in' do
            expect(grid.get_cell_by_position(position).ways_to_move.count).to eq 8
          end
        end
        
        describe '#get_cells_by_occupate' do
          it 'is method-switcher between cells geter' do
            grid.should_receive(:occupated_cells).once
            grid.should_receive(:not_occupated_cells).once
            grid.get_cells_by_occupate(true)
            grid.get_cells_by_occupate(false)
          end
        end

        context 'GridBuilder' do
          describe '#any?' do
            it 'checks if argument is in range from 1 to decremented size' do
              expect(grid.send(:any?, 1)).to be_true
              expect(grid.send(:any?, 2)).to be_false
            end
          end 

          describe '#detect_type' do
            it 'returns number wich means type of cell' do
              expect(grid.send(:detect_type, 0, 0)).to eq 1
              expect(grid.send(:detect_type, 1, 0)).to eq 8
              expect(grid.send(:detect_type, 2, 0)).to eq 7
              expect(grid.send(:detect_type, 0, 1)).to eq 2
              expect(grid.send(:detect_type, 2, 1)).to eq 6
              expect(grid.send(:detect_type, 0, 2)).to eq 3
              expect(grid.send(:detect_type, 1, 2)).to eq 4
              expect(grid.send(:detect_type, 2, 2)).to eq 5
              expect(grid.send(:detect_type, 1, 1)).to eq 9
            end
          end

          describe '#build' do
            it 'create two dimentional array of Cells' do
              grid.should_receive(:detect_type).exactly(9).times
              Terrains::Positions::Position.should_receive(:new).exactly(9).times
              Terrains::Cells::Cell.should_receive(:new).exactly(9).times
              grid.build
            end
          end
        end
      end

    end
  end
end