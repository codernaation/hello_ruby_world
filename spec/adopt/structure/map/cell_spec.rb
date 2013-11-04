require File.expand_path "../SG/spec/spec_helper"

module Adopt
  module Positions
    describe Cell do
      before(:each) do
        @cell = Cell.new 9 
        @female = double(Adopt::Gender::Female.new 4,1,1).stub(:body).
          and_return(mock(Adopt::States::BodyState.new 1)) 
      end

      describe "Cell#ocupator_gender_current_method" do
        context "cell ocupator has type female" do
          it "return instance of method" do
            @cell.cell_ocupator = @female
            m = @cell.ocupator_gender_current_method
            expect(m).to eq Adopt::States::WalkingUp#speak
          end
        end
      end
    end
  end
end