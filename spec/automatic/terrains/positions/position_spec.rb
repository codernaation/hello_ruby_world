require 'spec_helper'

module Automatic
  module Terrains
    module Positions

      describe Position do
        let(:position) { Position.new 3, 5 }
        let(:other_position) { Position.new 3, 5 }

        describe '#new' do
          it 'assigns variables' do
            expect(position.x_pos).to eq 3
            expect(position.y_pos).to eq 5
          end
        end

        describe '#to_a' do
          it 'returns array with coordinates' do
            expect(position.to_a).to eq [3,5]
          end
        end

        describe '#==' do
          it 'checks if coordinates match' do
            expect(position).to eq other_position
          end
        end
      end

    end
  end
end