def grade_report(grades)
  raise ArgumentError unless grades.is_a? String
  return "No results has been given" if grades.empty?

  grades_count = {
    Green: 0,
  }
  grade_array = grades.split(",")

  grades_count.each do |key, value|
    grade_array.each do |grade|
      if key.to_s == grade
        grades_count[key] += 1
      end
    end 
  end

  return "Green: #{grades_count[:Green]}\n"
end