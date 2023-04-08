require 'json'

def my_data_process(param_1)
  # Split the header and data rows
  header = param_1[0].split(',')
  data = param_1[1..-1]

  # Create a hash of hash to store the results
  results = Hash.new { |h, k| h[k] = Hash.new(0) }

  # Process each row of data
  data.each do |row|
    values = row.split(',')
    header.each_with_index do |column, index|
      # Skip columns to be discarded
      next if ["FirstName", "LastName", "UserName", "Coffee Quantity"].include?(column)
      results[column][values[index]] += 1
    end
  end

  # Convert the results to a JSON string
  JSON.generate(results)
end
