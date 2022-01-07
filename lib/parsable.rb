
module Parsable
  @game_teams_path = ./data/game_teams.csv

  def parse(csv)
    CSV.read csv, headers: true, header_converters: :symbol
  end


  def filter_by_header(csv, header)
    parse(csv).map do |row|
      row[header]
    end
  end

  def criteria_filter(csv, header, criteria)
    result = []
    parse(csv).filter do |row|
      result << row if row[header] == criteria
    end
  end

  def get_key_value(csv, header)
    output = parse(csv).group_by do |row|
      row[header]
    end
  end

  def hash_by(csv, header_to_key)
      parse(csv).group_by do |row|
      row[header_to_key]
    end
  end

  def count_hashed_by(csv, header_to_key, specific_key, counted_value)
  hashed = hash_by(csv, header_to_key)
  select_team = hashed.select {|k,v| k == specific_key }
  count = 0
  select_team.each do |key, value|
    value.map do |row|
      count += 1 if row[3] == counted_value
    end
    return count
  end
  end

  def count_wins(specific_key)
    count_hashed_by(@game_teams_path, :team_id, specific_key, "WIN")
  end

  def count_losses(specific_key)
    count_hashed_by(@game_teams_path, :team_id, specific_key, "LOSS")
  end

  def count_ties(specific_key)
    count_hashed_by(@game_teams_path, :team_id, specific_key, "TIE")
  end

end


# tally = prices.count do |price|
#       price - price.floor == 0
#     end
#     expect(tally).to eq(2)
