require 'spec_helper'

module Automatic
  module Individuals 
    module Genders
      module Constants

        describe 'Genders constants' do
          it 'contains correct data' do
            expect(RANKS[0]).to eq 'Automatic::Individuals::Genders::Males::Strategies::Omegarank'
            expect(RANKS[1]).to eq 'Automatic::Individuals::Genders::Males::Strategies::Betarank'
            expect(RANKS[2]).to eq 'Automatic::Individuals::Genders::Males::Strategies::Alfarank'
            
            expect(POWER[0]).to eq 'Weak'
            expect(POWER[1]).to eq 'Good'
            expect(POWER[2]).to eq 'Strong'
            expect(POWER[3]).to eq 'Powerful'
            expect(POWER[4]).to eq 'Hero'

            expect(BEAUTY[0]).to eq 'Invalid'
            expect(BEAUTY[1]).to eq 'Ugly'
            expect(BEAUTY[2]).to eq 'Normal'
            expect(BEAUTY[3]).to eq 'Beautyful'
            expect(BEAUTY[4]).to eq 'Ideal'
          end
        end

      end
    end
  end
end