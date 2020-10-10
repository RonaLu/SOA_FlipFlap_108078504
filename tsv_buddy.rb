# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    tsv_line = tsv.split("\n")
    keys = tsv_line[0].split("\t")
    @data = tsv_line[1..-1].map do |line|
      values = line.chomp.split("\t")
      keys.zip(values).to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    @data.join("\n") + "\n"
  end
end
