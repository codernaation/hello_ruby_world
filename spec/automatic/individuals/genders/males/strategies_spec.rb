require 'spec_helper'

module Automatic
  module Individuals 
    module Genders  
      module Males
        module Strategies

          describe 'Strategies' do
            let(:rank) { Rank.new 4 }
            (0..2).each do |i|
              let(:"alfa_#{i}") { Alfarank.new i }
              let(:"beta_#{i}") { Betarank.new i }
              let(:"omega_#{i}") { Omegarank.new i }
            end

            describe Rank do
              describe '#new' do 
                it 'assigns correct data' do
                  expect(rank.power).to eq 4
                end
              end

              describe '#new' do 
                it 'assigns correct data' do
                  expect(rank.power).to eq 4
                end
              end

              describe '#increase_power' do 
                let(:less_powered) { Rank.new 2 }

                context 'when power can be increased' do
                  it 'change power' do
                    less_powered.increase_power
                    expect(less_powered.power).to eq 3
                  end
                end
                context 'when power can is max' do
                  it 'does not change power' do
                    rank.increase_power
                    expect(rank.power).to eq 4
                  end
                end
              end

              describe '#reaction?' do 
                it 'has abstract method' do
                  expect(rank.respond_to?(:reaction?)).to be_true                  
                end
              end

              describe '#me_stronger?' do 
                it 'compared powers' do
                  expect(alfa_1.me_stronger? alfa_0.power).to be_true                  
                  expect(alfa_0.me_stronger? alfa_1.power).to be_false                 
                end
              end
            end

            describe Alfarank do
              describe '#reaction?' do 
                it 'return true if power is greater than argument' do
                  expect(alfa_1.reaction? alfa_0).to be_true
                  expect(alfa_0.reaction? alfa_0).to be_false
                  expect(alfa_1.reaction? beta_1).to be_false
                  expect(alfa_1.reaction? beta_0).to be_true
                  expect(alfa_1.reaction? omega_1).to be_false
                  expect(alfa_1.reaction? omega_0).to be_true
                end
              end
            end

            describe Betarank do
              describe '#reaction?' do 
                it 'return true if power is greater and ' do
                  expect(beta_1.reaction? alfa_1).to be_false
                  expect(beta_0.reaction? alfa_0).to be_false
                  expect(beta_1.reaction? beta_1).to be_false
                  expect(beta_1.reaction? beta_0).to be_true
                  expect(beta_1.reaction? omega_1).to be_false
                  expect(beta_1.reaction? omega_0).to be_true
                end
              end
            end

            describe Omegarank do
              describe '#reaction?' do 
                it 'return true if power is greater than argument' do
                  expect(omega_1.reaction? alfa_0).to be_false
                  expect(omega_0.reaction? alfa_0).to be_false
                  expect(omega_1.reaction? beta_1).to be_false
                  expect(omega_1.reaction? beta_0).to be_false
                  expect(omega_1.reaction? omega_1).to be_false
                  expect(omega_1.reaction? omega_0).to be_true
                end
              end
            end

          end

        end
      end
    end
  end
end