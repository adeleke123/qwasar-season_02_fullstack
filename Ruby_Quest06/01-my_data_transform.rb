require 'date'

def my_data_transform(csv_content)
  rows = csv_content.split("\n")
  headers = rows.shift.split(",")

  email_col = headers.index("Email")
  age_col = headers.index("Age")
  order_at_col = headers.index("Order At")

  transformed_rows = rows.map do |row|
    cols = row.split(",")
    email_provider = cols[email_col].split("@")[1]
    age = cols[age_col].to_i
    order_time = DateTime.parse(cols[order_at_col], '%Y-%m-%d %H:%M:%S')

    case age
    when 1..20
      age_group = "1->20"
    when 21..40
      age_group = "21->40"
    when 41..65
      age_group = "41->65"
    else
      age_group = "66->99"
    end

    case order_time.hour
    when 6..11
      order_time_group = "morning"
    when 12..17
      order_time_group = "afternoon"
    else
      order_time_group = "evening"
    end

    cols[email_col] = email_provider
    cols[age_col] = age_group
    cols[order_at_col] = order_time_group

    cols.join(",")
  end

  [headers.join(","), *transformed_rows]
end
