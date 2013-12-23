require 'spec_helper'

module Automatic
  module Terrains
    module Cells

      describe Cell do
        let(:male) { Automatic::Individuals::Genders::Males::Male.new 3, 2 }
        let(:unit) { Automatic::Individuals::Populations::Unit.new male, 's' } 
        let(:female) { Automatic::Individuals::Genders::Females::Female.new 3, 2, 0 }
        let(:unit_f) { Automatic::Individuals::Populations::Unit.new female, 's' }
        let(:position) { Terrains::Positions::Position.new 3, 5 }
        let(:cell) { Cell.new 9, position }
        let(:other_cell) { Cell.new 9, position }
        let(:north)      { Terrains::Positions::Position.new(3,4) }
        let(:south)      { Terrains::Positions::Position.new(3,6) }
        let(:east)       { Terrains::Positions::Position.new(4,5) }
        let(:west)       { Terrains::Positions::Position.new(2,5) }
        let(:north_east) { Terrains::Positions::Position.new(4,4) }
        let(:south_east) { Terrains::Positions::Position.new(4,6) }
        let(:north_west) { Terrains::Positions::Position.new(2,4) }
        let(:south_west) { Terrains::Positions::Position.new(2,6) }

        describe '#new' do
          it 'assigns variables' do
            expect(cell.x_pos).to eq 3
            expect(cell.y_pos).to eq 5
            expect(cell.ways_to_move).to eq Directions::WAYS
            expect(cell.occupator).to be_nil
          end
        end

        context 'Occupations' do
          describe '#occupated?' do
            it 'checks if there is binded occupator' do
              expect(cell.occupated?).to be_false
            end
          end

          describe '#bind' do
            it 'set occupator to cell' do
              cell.bind(unit)
              expect(cell.occupator).to eq unit
            end
          end

          describe '#unbind' do
            it 'set occupator to nil' do
              cell.unbind
              expect(cell.occupator).to be_nil
            end
          end

          describe '#transfer' do
            it 'set occupator to other cell' do
              cell.bind(unit)
              expect(cell.transfer(other_cell)).to be_true
              expect(other_cell.occupator).to eq unit
            end
          end

          context 'gender detecting' do
            describe '#has_male?' do
              it 'checks is unit a male' do
                cell.bind(unit)
                expect(cell).to have_male
                expect(cell).not_to have_female
              end
            end

            describe '#has_female?' do
              it 'checks is unit a male' do
                cell.bind(unit_f)
                expect(cell).to have_female
                expect(cell).not_to have_male
              end
            end
          end

        end

        context 'Directions' do
          describe 'Constants' do
            it 'contain rigth data' do
              expect(Directions::WAYS).to eq ['N','NE','E','SE','S','SW','W','NW']

              expect(Directions::CELL_TYPES[1]).to eq ['E','SE','S']
              expect(Directions::CELL_TYPES[2]).to eq ['N','NE','E','SE','S']
              expect(Directions::CELL_TYPES[3]).to eq ['N','NE','E']
              expect(Directions::CELL_TYPES[4]).to eq ['W','NW','N','NE','E']
              expect(Directions::CELL_TYPES[5]).to eq ['W','NW','N']
              expect(Directions::CELL_TYPES[6]).to eq ['S','SW','W','NW','N']
              expect(Directions::CELL_TYPES[7]).to eq ['S','SW','W']
              expect(Directions::CELL_TYPES[8]).to eq ['E','SE','S','SW','W']
              expect(Directions::CELL_TYPES[9]).to eq ['N','NE','E','SE','S','SW','W','NW']
            end
          end

          describe '#set_directions' do
            it 'assigns possible ways' do
              cell.set_directions 5
              expect(cell.ways_to_move).to eq ['W','NW','N']
            end
          end

          describe '#random_direction' do
            it 'assigns possible ways' do
              cell.random_direction
              expect(cell.ways_to_move).to include('W','NW','N')
            end
          end

          describe '#way2pos' do
            it 'transform way abbreviation to coordinates' do
              expect(cell.way2pos('N') ).to be_a_kind_of Terrains::Positions::Position
              expect(cell.way2pos('N') ).to eq north      
              expect(cell.way2pos('S') ).to eq south     
              expect(cell.way2pos('E') ).to eq east       
              expect(cell.way2pos('W') ).to eq west       
              expect(cell.way2pos('NE')).to eq north_east 
              expect(cell.way2pos('SE')).to eq south_east 
              expect(cell.way2pos('NW')).to eq north_west 
              expect(cell.way2pos('SW')).to eq south_west
            end
          end

        end
      
      end

    end
  end
end
