# Which hours of the day have the highest average calorie burn across all users?
SELECT 
    FORMAT_TIMESTAMP('%H', ActivityHour) AS Hour,
    ROUND(AVG(Calories), 2) AS AverageCalories
FROM third-project-444513.bellabeat.hourly_calories
GROUP BY Hour
ORDER BY AverageCalories DESC;

---

# What is the relationship between total daily steps and calories burned?
SELECT 
    TotalSteps, 
    Calories
FROM third-project-444513.bellabeat.daily_activity
---

# What are the trends in heart rate values during the day?
SELECT 
    FORMAT_TIMESTAMP('%H', Time) AS Hour, 
    ROUND(AVG(Value), 2) AS AverageHeartRate
FROM third-project-444513.bellabeat.heart_rate
GROUP BY Hour
ORDER BY Hour;

---

# Which day of the week has the highest average calorie burn?
SELECT 
    FORMAT_DATETIME('%w', ActivityDate) AS DayOfWeek, 
    ROUND(AVG(Calories), 2) AS AverageCalories
FROM third-project-444513.bellabeat.daily_activity
GROUP BY DayOfWeek
ORDER BY AverageCalories DESC;

---

# How do step totals vary by hour of the day?
SELECT 
    FORMAT_TIMESTAMP('%H', ActivityHour) AS Hour, 
    ROUND(AVG(StepTotal), 2) AS AverageSteps
FROM third-project-444513.bellabeat.hourly_steps
GROUP BY Hour
ORDER BY Hour;

---

# What is the METs trend by minute during an average day?
SELECT 
    FORMAT_TIMESTAMP('%H:%M', ActivityMinute) AS Time, 
    ROUND(AVG(METs), 2) AS AverageMETs
FROM third-project-444513.bellabeat.minute_METs
GROUP BY Time
ORDER BY Time