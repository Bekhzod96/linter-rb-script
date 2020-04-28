require './lib//test.rb'

RSpec.describe Test do
  let(:subject) { Test.new('../src/style.css') }

  context '#init_test' do
    it 'instance of Test class created' do
      expect(subject).not_to be_a NilClass
    end
  end

  context '#check_multiplication?' do
    it '!multiple rule applied' do
      result = subject.check_multiplication({ 'margin' => 1, 'padding' => 1 })
      expect(result).to eq([])
    end
    it 'multiple rule applied' do
      result = subject.check_multiplication({ 'margin' => 2, 'padding' => 1 })
      expect(result[0]).to eq('margin')
    end
  end

  context '#upload_file' do
    it 'other file should be uploaded' do
      result = subject.load_file('./src/style1.css')
      expect(result).to eq(['body {font-family: Arial;}'])
    end
    it 'Enter valid address' do
      result = subject.load_file('./src/fake.css')
      expect(result).to eq('Enter Valid path for file')
    end
  end
end
