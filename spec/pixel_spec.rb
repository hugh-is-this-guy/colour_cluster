require 'spec_helper'

describe Pixel do

  describe '.new(r, g, b)' do
    before(:all) do
      @red    = 100
      @green  = 200
      @blue   = 150

      @p = Pixel.new(@red, @green, @blue)

    end

    it 'instantiates' do
      expect(@p).to be_instance_of Pixel
    end

    it 'remembers its member variables' do
      expect(@p.red).to   eq @red
      expect(@p.green).to eq @green
      expect(@p.blue).to  eq @blue
    end
  end

  context 'pixel distance and addition' do

    before(:all) do
      @pixel_1 = Pixel.new(1, 2, 3)
      @pixel_2 = Pixel.new(-4, -8, -12)
    end

    describe '.distance_to(pixel)' do
      it 'can calculate distance from another pixel instance' do
        expect(@pixel_1.distance_to(@pixel_2)).to eql 18.708286933869708
        expect(@pixel_2.distance_to(@pixel_1)).to eql 18.708286933869708
      end
    end

    describe '.+(pixel)' do
      it 'implements the addition operator' do
        pixel_temp = @pixel_1 + @pixel_2

        expect(pixel_temp.red).to   eql -3
        expect(pixel_temp.green).to eql -6
        expect(pixel_temp.blue).to  eql -9
      end
    end

    describe './(n)' do
      it 'implements the division operator' do
        pixel_temp = @pixel_1 / 2

        expect(pixel_temp.red).to   eql 0
        expect(pixel_temp.green).to eql 1
        expect(pixel_temp.blue).to  eql 1

        pixel_temp = @pixel_2 / 3

        expect(pixel_temp.red).to   eql -2
        expect(pixel_temp.green).to eql -3
        expect(pixel_temp.blue).to  eql -4
      end
    end

  end

end
