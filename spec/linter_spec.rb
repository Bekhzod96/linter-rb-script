require './lib//test.rb'

RSpec.describe Test do
  let(:subject) { Test.new('./src/style1.css') }

  context '#init_test' do
    it 'instance of Test class created' do
      expect(subject).not_to be_a NilClass
    end
  end

  context '#check_multi_declartion' do
    it 'multiple rule applied' do
      subject.errors = []
      subject.check_multi_declartion({ 'margin' => 2, 'padding' => 1 })
      expect(subject.errors).to eq(['0: Unexpected multi declaration of margin'])
    end
    it '!multiple rule applied' do
      subject.errors = []
      subject.check_multi_declartion({ 'margin' => 1, 'padding' => 1 })
      expect(subject.errors).to eq([])
    end
  end

  context '#upload_file' do
    it 'other file should be uploaded' do
      result = subject.load_file('./src/style1.css')
      expect(result).to eq(["main {\n", "  width: 95%;\n", "  \n",
                            "  min-width: 1250px;\n", "  margin: 0 auto;\n", '}'])
    end
    it 'Enter valid address' do
      result = subject.load_file('./src/fake.css')
      expect(result).to eq('Enter Valid path for file')
    end
  end

  context '#error_collector' do
    it 'adds error to the array' do
      subject.run_test
      expect(subject.errors).to eq(['2: Unexpected empty line in rule body'])
    end
  end

  context '#run_test' do
    it 'run_test working' do
      test = Test.new('./src/test.css')
      res = test.run_test
      expect(res).to eq(["1: Expected single space before '{'",
                         '2: Expected indentation of 2 spaces'])
    end
  end
end
