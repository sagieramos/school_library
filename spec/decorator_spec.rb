require_relative '../modules/decorator'
require_relative '../modules/nameable'

RSpec.describe BaseDecorator do
  let(:nameable) { Nameable.new }
  let(:base_decorator) { BaseDecorator.new(nameable) }

  describe '#initialize' do
    it 'creates a new BaseDecorator with the given Nameable object' do
      expect(base_decorator.instance_variable_get(:@nameable)).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'delegates the correct_name method to the underlying Nameable object' do
      allow(nameable).to receive(:correct_name).and_return('Original Name')
      expect(base_decorator.correct_name).to eq('Original Name')
    end
  end
end

RSpec.describe CapitalizeDecorator do
  let(:nameable) { Nameable.new }
  let(:capitalize_decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the correct_name method of the underlying Nameable object' do
      allow(nameable).to receive(:correct_name).and_return('original name')
      expect(capitalize_decorator.correct_name).to eq('Original name')
    end
  end
end

RSpec.describe TrimmerDecorator do
  let(:nameable) { Nameable.new }
  let(:trimmer_decorator) { TrimmerDecorator.new(nameable) }

  describe '#correct_name' do
    it 'trims the correct_name method of the underlying Nameable object to the first 10 characters' do
      allow(nameable).to receive(:correct_name).and_return('Long Name Example')
      expect(trimmer_decorator.correct_name).to eq('Long Name')
    end
  end
end
