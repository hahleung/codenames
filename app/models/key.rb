class Key < ApplicationRecord
  def self.create_color_set
    beginning_team = [:red, :blue].sample

    colors = {
      :red => (beginning_team == :red ? 9 : 8),
      :blue => (beginning_team == :blue ? 9 : 8),
      :black => 1,
      :white => 7
    }

    set = colors.values.zip(colors.keys).flat_map do |num, color|
      Array.new(num, color)
    end.shuffle

    [beginning_team, set]
  end

  def self.create_positions
    (1..5).to_a.repeated_permutation(2).to_a
  end

  def self.sample_words
    Word.all.sample(25)
  end

  def self.generate
    first_team, color_set = create_color_set
    positions = create_positions.shuffle
    words = sample_words

    composition = words.zip(color_set, positions)

    tiles = composition.map do |word, color, position|
      Tile.create(
        name: word.name,
        color: color,
        french_translation: word.french_translation,
        position: position
      )
    end.pluck(:id)

    Key.create(
      tiles: tiles,
      public_id: rand(999999),
      first_team: first_team
    )
  end

  def render_key
    tiles_set = tiles.map { |id| Tile.find(id) }.map do |tile|
      {
        "position": tile.position,
        "name": tile.name,
        "french_translation": tile.french_translation,
        "color": tile.color
      }
    end

    positions = Key.create_positions

    positions.map do |position|
      tiles_set.select do |tile|
        tile[:position] == position
      end.first
    end.each_slice(5).to_a
  end

  def render_params
    {
      public_id: public_id,
      first_team: first_team.capitalize
    }
  end
end
