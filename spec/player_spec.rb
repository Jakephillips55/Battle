require 'player'

describe Player do
  subject(:shaun) {Player.new('Shaun') }
  subject(:jake) {Player.new('Jake') }

  describe '#name' do
    it 'returns the name' do
      expect(shaun.name).to eq 'Shaun'
      expect(jake.name).to eq 'Jake'
    end
  end

  describe '#hp' do
    it 'checks the default hp' do
      expect(Player::DEFAULT_HP).to eq 100
    end

  describe '#dmg'
    it 'gives damages to the player by 10' do
      expect{ shaun.dmg }.to change { shaun.hp }.by(-10)
    end
  end

  # describe '#attack' do
  #   it 'attacks player and gives damages' do
  #     expect(jake).to receive(:dmg)
  #     shaun.attack(jake)
  #   end
  # end

end
