require 'spec_helper'

describe Cluster do

  before(:each) do
    @cluster = Cluster.new
  end

  it 'instantiates' do
    expect(@cluster).to be_instance_of Cluster
  end

  it 'remembers its member variables' do
    expect(@cluster.pixels).to    eq []
    expect(@cluster.centroid).to  eq nil
  end

  context 'management of pixel collection' do

    before(:each) do
      @p1 = Pixel.new(1, 1, 1)
      @p2 = Pixel.new(2, 2, 2)
      @p3 = Pixel.new(3, 3, 3)
    end

    describe '.add(pixel)' do
      it 'adds a pixel object to pixels array' do
        expect(@cluster.pixels.length).to eq 0
        
        @cluster.add(@p1)
        expect(@cluster.pixels.length).to eq 1
        
        @cluster.add(@p2)
        expect(@cluster.pixels.length).to eq 2
        
        @cluster.add(@p3)
        expect(@cluster.pixels.length).to eq 3
      end

      it 'merges an array of pixels into pixels array' do
        pixels = [@p1, @p2, @p3]
        expect(@cluster.pixels.length).to eq 0

        @cluster.add(pixels)
        expect(@cluster.pixels.length).to eq 3
      end
    end

    describe '.empty()' do
      it 'should empty the pixel array' do
        @cluster.add(@p1)
        @cluster.add(@p2)
        @cluster.add(@p3)
        expect(@cluster.pixels.length).to eq 3

        @cluster.empty
        expect(@cluster.pixels.length).to eq 0

      end
    end

  end

  context 'calculation of optimal centroid for pixels' do

    # Pixels form a cube around 2,2,2
    before (:all) do
      p1 = Pixel.new(1,1,1)
      p2 = Pixel.new(1,1,3)
      p3 = Pixel.new(1,3,1)
      p4 = Pixel.new(1,3,3)

      p5 = Pixel.new(3,1,1)
      p6 = Pixel.new(3,1,3)
      p7 = Pixel.new(3,3,1)
      p8 = Pixel.new(3,3,3)

      pixels = [p1, p2, p3, p4, p5, p6, p7, p8]

      @cluster = Cluster.new
      @cluster.add(pixels)
    end

    describe '.centroid()' do
      it 'should calculate and return the optimal centroid' do
        centroid = @cluster.centroid

        expect(centroid).to be_instance_of Pixel

        expect(centroid.red).to   eq 2
        expect(centroid.green).to eq 2
        expect(centroid.blue).to  eq 2

      end

    end

  end



end
