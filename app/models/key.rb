class Key < ApplicationRecord
  def self.create_color_set
    beginning_team = [:red, :blue].sample
    colors = {
      :red => (beginning_team == :red ? 9 : 8),
      :blue => (beginning_team == :blue ? 9 : 8),
      :black => 1,
      :white => 7
    }

    colors.values.zip(colors.keys).flat_map do |num, color|
      Array.new(num, color)
    end.shuffle
  end

  def self.create_positions
    (1..5).to_a.repeated_permutation(2).to_a.shuffle
  end

  def self.sample_words
    Word.all.pluck(:name).sample(25)
  end

  def self.generate
    color_set = create_color_set
    positions = create_positions
    words = sample_words

    composition = words.zip(color_set, positions)

    tiles = composition.map do |word, color, position|
      Tile.create(
        name: word,
        color: color,
        position: position
      )
    end.pluck(:id)

    Key.create tiles: tiles
  end
end
