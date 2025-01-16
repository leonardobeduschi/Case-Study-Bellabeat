# Case-Study-Bellabeat
Google Data Analytics Case Study: Bellabeat
> How Can a Wellness Technology Company Play It Smart?
<img src="https://bellabeat.com/wp-content/uploads/2023/09/Bellabeat-logo.jpg" alt="Bellabeat Logo" width="400"/>

## Data Analysis Process Steps: </br>
- Ask
- Prepare
- Process
- Analyze
- Share
- Act

## Description
Bellabeat is a successful small company, but they have the potential to become a larger player in the
global small device market. <br><br>
This case study aims to understand consumer behavior by analyzing smart device fitness data. The goal is to identify new business growth avenues.

## Ask
**Defining the Business Task** <br>
The primary objective is to analyze trends in smart device usage to uncover actionable insights. These insights will be used to inform Bellabeat’s marketing strategy, enabling the company to better target its customers and identify growth opportunities in the smart device market.<br><br>
**Understanding the Key Questions** <br>
To guide the analysis, the following questions will be addressed:
1. What are the trends in smart device usage?<br>
> This includes identifying patterns and behaviors related to physical activity, heart rate, sleep, and other fitness metrics tracked by smart devices. <br>
2. How could these trends apply to Bellabeat customers?<br>
> By understanding these behaviors, Bellabeat can align its products and services with the needs and preferences of its customer base.<br>
3. How could these trends influence Bellabeat's marketing strategy?<br>
> Insights derived from the data will help shape targeted marketing campaigns, highlight key product features, and position Bellabeat as a leader in the smart device market.<br>

## Prepare
The project utilizes publicly available Fitbit Fitness Tracker Data sourced from Kaggle. This dataset was collected in 2016 through an online survey distributed via Amazon Mechanical Turk. Thirty individuals consented to share their fitness tracker data, which includes daily activity, step counts, and heart rate information. The data is stored in 11 separate CSV files and organized in a wide format, making it accessible for analysis.<br>
Data source: [Kaggle Dataset](https://www.kaggle.com/datasets/arashnic/fitbit)<br>

The Fitbit Fitness Tracker Data, collected in 2016 from 30 participants via Amazon Mechanical Turk, has several limitations that hinder its reliability for drawing broader conclusions:
- Data Age: 7 years old, making it outdated due to technological advancements and changing lifestyles.
- Small Sample Size: 30 participants is insufficient to represent the general female population.
- Data Source: Amazon Mechanical Turk may introduce biases in participant demographics and motivations.
- Missing Information: Lacks crucial data on age, gender, health conditions, and lifestyle factors.
- Data Completeness: Potential inaccuracies and incompleteness due to self-reporting and device limitations.

<br>These limitations, assessed using the ROCCC criteria (Reliability, Originality, Comprehensiveness, Currency, Cited), suggest that the data should be used with caution and further validated with more recent and comprehensive datasets.

## Process
The data analysis process involves a series of steps to ensure data quality and prepare it for effective analysis. Key tasks include checking for errors, selecting appropriate tools for data manipulation, transforming the data into a usable format, and meticulously documenting all cleaning procedures. This rigorous approach ensures data integrity and provides a clear audit trail for future reference and collaboration.
<br> 
> I used Python for this step
- Import libraries
```{python}
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
```
- Import datasets
```{python}
daily_activity = pd.read_csv("/content/bellabeat/dailyActivity_merged.csv")
heart_rate = pd.read_csv("/content/bellabeat/heartrate_seconds_merged.csv")
hourly_calories = pd.read_csv("/content/bellabeat/hourlyCalories_merged.csv")
hourly_intensities = pd.read_csv("/content/bellabeat/hourlyIntensities_merged.csv")
hourly_steps = pd.read_csv("/content/bellabeat/hourlySteps_merged.csv")
minute_calories = pd.read_csv("/content/bellabeat/minuteCaloriesNarrow_merged.csv")
minute_intensities = pd.read_csv("/content/bellabeat/minuteIntensitiesNarrow_merged.csv")
minute_METs = pd.read_csv("/content/bellabeat/minuteMETsNarrow_merged.csv")
minute_sleep = pd.read_csv("/content/bellabeat/minuteSleep_merged.csv")
minute_steps = pd.read_csv("/content/bellabeat/minuteStepsNarrow_merged.csv")
weight = pd.read_csv("/content/bellabeat/weightLogInfo_merged.csv")
```
- Put all the datasets in a list along with their names, to work on them iteratively.
```{python}
datasets = [
    ("daily_activity", daily_activity),
    ("heart_rate", heart_rate),
    ("hourly_calories", hourly_calories),
    ("hourly_intensities", hourly_intensities),
    ("hourly_steps", hourly_steps),
    ("minute_calories", minute_calories),
    ("minute_intensities", minute_intensities),
    ("minute_METs", minute_METs),
    ("minute_sleep", minute_sleep),
    ("minute_steps", minute_steps),
    ("weight", weight)
]
```
- Analyze each dataset
```{python}
daily_activity.head()
```
|index|Id|ActivityDate|TotalSteps|TotalDistance|TrackerDistance|LoggedActivitiesDistance|VeryActiveDistance|ModeratelyActiveDistance|LightActiveDistance|SedentaryActiveDistance|VeryActiveMinutes|FairlyActiveMinutes|LightlyActiveMinutes|SedentaryMinutes|Calories|
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|0|1503960366|3/25/2016|11004|7\.1100001335144|7\.1100001335144|0\.0|2\.5699999332428|0\.46000000834465|4\.07000017166138|0\.0|33|12|205|804|1819|
|1|1503960366|3/26/2016|17609|11\.5500001907349|11\.5500001907349|0\.0|6\.92000007629395|0\.730000019073486|3\.91000008583069|0\.0|89|17|274|588|2154|
|2|1503960366|3/27/2016|12736|8\.52999973297119|8\.52999973297119|0\.0|4\.65999984741211|0\.159999996423721|3\.71000003814697|0\.0|56|5|268|605|1944|
|3|1503960366|3/28/2016|13231|8\.93000030517578|8\.93000030517578|0\.0|3\.19000005722046|0\.790000021457672|4\.94999980926514|0\.0|39|20|224|1080|1932|
|4|1503960366|3/29/2016|12041|7\.84999990463257|7\.84999990463257|0\.0|2\.16000008583069|1\.0900000333786|4\.6100001335144|0\.0|28|28|243|763|1886|
<br>

```{python}
heart_rate.head()
```
|index|Id|Time|Value|
|---|---|---|---|
|0|2022484408|4/1/2016 7:54:00 AM|93|
|1|2022484408|4/1/2016 7:54:05 AM|91|
|2|2022484408|4/1/2016 7:54:10 AM|96|
|3|2022484408|4/1/2016 7:54:15 AM|98|
|4|2022484408|4/1/2016 7:54:20 AM|100|
<br>

```{python}
hourly_calories.head()
```
|index|Id|ActivityHour|Calories|
|---|---|---|---|
|0|1503960366|3/12/2016 12:00:00 AM|48|
|1|1503960366|3/12/2016 1:00:00 AM|48|
|2|1503960366|3/12/2016 2:00:00 AM|48|
|3|1503960366|3/12/2016 3:00:00 AM|48|
|4|1503960366|3/12/2016 4:00:00 AM|48|
<br>

```{python}
hourly_intensities.head()
```
|index|Id|ActivityHour|TotalIntensity|AverageIntensity|
|---|---|---|---|---|
|0|1503960366|3/12/2016 12:00:00 AM|0|0\.0|
|1|1503960366|3/12/2016 1:00:00 AM|0|0\.0|
|2|1503960366|3/12/2016 2:00:00 AM|0|0\.0|
|3|1503960366|3/12/2016 3:00:00 AM|0|0\.0|
|4|1503960366|3/12/2016 4:00:00 AM|0|0\.0|
<br>

```{python}
hourly_steps.head()
```
|index|Id|ActivityHour|StepTotal|
|---|---|---|---|
|0|1503960366|3/12/2016 12:00:00 AM|0|
|1|1503960366|3/12/2016 1:00:00 AM|0|
|2|1503960366|3/12/2016 2:00:00 AM|0|
|3|1503960366|3/12/2016 3:00:00 AM|0|
|4|1503960366|3/12/2016 4:00:00 AM|0|
<br>

```{python}
minute_calories.head()
```
|index|Id|ActivityMinute|Calories|
|---|---|---|---|
|0|1503960366|3/12/2016 12:00:00 AM|0\.797299981117249|
|1|1503960366|3/12/2016 12:01:00 AM|0\.797299981117249|
|2|1503960366|3/12/2016 12:02:00 AM|0\.797299981117249|
|3|1503960366|3/12/2016 12:03:00 AM|0\.797299981117249|
|4|1503960366|3/12/2016 12:04:00 AM|0\.797299981117249|
<br>

```{python}
minute_intensities.head()
```
|index|Id|ActivityMinute|Intensity|
|---|---|---|---|
|0|1503960366|3/12/2016 12:00:00 AM|0|
|1|1503960366|3/12/2016 12:01:00 AM|0|
|2|1503960366|3/12/2016 12:02:00 AM|0|
|3|1503960366|3/12/2016 12:03:00 AM|0|
|4|1503960366|3/12/2016 12:04:00 AM|0|
<br>

```{python}
minute_METs.head()
```
|index|Id|ActivityMinute|METs|
|---|---|---|---|
|0|1503960366|3/12/2016 12:00:00 AM|10|
|1|1503960366|3/12/2016 12:01:00 AM|10|
|2|1503960366|3/12/2016 12:02:00 AM|10|
|3|1503960366|3/12/2016 12:03:00 AM|10|
|4|1503960366|3/12/2016 12:04:00 AM|10|
<br>

```{python}
minute_sleep.head()
```
|index|Id|date|value|logId|
|---|---|---|---|---|
|0|1503960366|3/13/2016 2:39:30 AM|1|11114919637|
|1|1503960366|3/13/2016 2:40:30 AM|1|11114919637|
|2|1503960366|3/13/2016 2:41:30 AM|1|11114919637|
|3|1503960366|3/13/2016 2:42:30 AM|1|11114919637|
|4|1503960366|3/13/2016 2:43:30 AM|1|11114919637|
<br>

```{python}
minute_steps.head()
```
|index|Id|ActivityMinute|Steps|
|---|---|---|---|
|0|1503960366|3/12/2016 12:00:00 AM|0|
|1|1503960366|3/12/2016 12:01:00 AM|0|
|2|1503960366|3/12/2016 12:02:00 AM|0|
|3|1503960366|3/12/2016 12:03:00 AM|0|
|4|1503960366|3/12/2016 12:04:00 AM|0|
<br>

```{python}
weight.head()
```
|index|Id|Date|WeightKg|WeightPounds|Fat|BMI|IsManualReport|LogId|
|---|---|---|---|---|---|---|---|---|
|0|1503960366|4/5/2016 11:59:59 PM|53\.2999992370605|117\.506384062611|22\.0|22\.9699993133545|true|1459900799000|
|1|1927972279|4/10/2016 6:33:26 PM|129\.600006103516|285\.719105247709|NaN|46\.1699981689453|false|1460313206000|
|2|2347167796|4/3/2016 11:59:59 PM|63\.4000015258789|139\.773077589277|10\.0|24\.7700004577637|true|1459727999000|
|3|2873212765|4/6/2016 11:59:59 PM|56\.7000007629395|125\.002104340889|NaN|21\.4500007629395|true|1459987199000|
|4|2873212765|4/7/2016 11:59:59 PM|57\.2000007629395|126\.104415651814|NaN|21\.6499996185303|true|1460073599000|
<br>

### Clean the data
- Search which data has duplicate values
  ```{python}
  for name, df in datasets:
  df[df.duplicated()]
  ```
- Search the total of null values in the dataset
  ```{python}
  for name, df in datasets:
  df.isnull().sum()
  ```
- Clean each table
  ```{python}
  for name, df in datasets:
  print(f"Cleaning dataset: {name}")

  # remove duplicates
  df.drop_duplicates(inplace=True)

  # remove rows with N/A values
  df.isnull().sum()
  df.dropna(inplace=True)

  print(f"{name} cleaned succesfully!\n")
  ```
- Preview the cleaned dataset
  ```{python}
  for name, df in datasets:
  print(f"Preview of cleaned dataset {name}")
  print(df.head())
  ```
- Changing the format of the date values to work with them in the analysis process
  ```{python}
  heart_rate["Time"] = pd.to_datetime(heart_rate ["Time"], format='%m/%d/%Y %I:%M:%S %p')
  hourly_calories["ActivityHour"] = pd.to_datetime(hourly_calories ["ActivityHour"], format='%m/%d/%Y %I:%M:%S %p')
  hourly_intensities["ActivityHour"] = pd.to_datetime(hourly_intensities ["ActivityHour"], format='%m/%d/%Y %I:%M:%S %p')
  hourly_steps["ActivityHour"] = pd.to_datetime(hourly_steps ["ActivityHour"], format='%m/%d/%Y %I:%M:%S %p')
  minute_calories["ActivityMinute"] = pd.to_datetime(minute_calories ["ActivityMinute"], format='%m/%d/%Y %I:%M:%S %p')
  minute_intensities["ActivityMinute"] = pd.to_datetime(minute_intensities ["ActivityMinute"], format='%m/%d/%Y %I:%M:%S %p')
  minute_METs["ActivityMinute"] = pd.to_datetime(minute_METs ["ActivityMinute"], format='%m/%d/%Y %I:%M:%S %p')
  minute_sleep["date"] = pd.to_datetime(minute_sleep ["date"], format='%m/%d/%Y %I:%M:%S %p')
  minute_steps["ActivityMinute"] = pd.to_datetime(minute_steps ["ActivityMinute"], format='%m/%d/%Y %I:%M:%S %p')
  weight["Date"] = pd.to_datetime(weight ["Date"], format='%m/%d/%Y %I:%M:%S %p')
  ```
- Saving the cleaned version of the datasets
  ```{python}
  for name, df in datasets:
  df.to_csv(f"{name}_cleaned.csv", index = False)
  print(f"Dataset {name} saved as {name}_cleaned.csv")
  ```

## Analyze
The analysis phase focuses on extracting meaningful insights from the prepared data. This involves organizing and formatting the data for analysis, performing calculations, and identifying trends and relationships within the data. By aggregating and structuring the data effectively, analysts can uncover unexpected patterns and insights that can be used to address specific business questions and inform decision-making. <br>
> I used SQL for this step

> Which hours of the day have the highest average calorie burn across all users?
  ```sql
  SELECT
    FORMAT_TIMESTAMP('%H', ActivityHour) AS Hour,
    ROUND(AVG(Calories), 2) AS AverageCalories
  FROM third-project-444513.bellabeat.hourly_calories
  GROUP BY Hour
  ORDER BY AverageCalories DESC;
  ```

| Hour | AverageCalories  |
|------|------------------|
| 19   | 116.33           |
| 18   | 115.16           |
| 12   | 113.58           |
| 17   | 112.3            |
| 14   | 111.43           |
| 16   | 110.27           |
| 13   | 108.55           |
| 11   | 108.23           |
| 10   | 106.39           |

![Image](https://github.com/user-attachments/assets/1b13f094-1da7-41e3-98f1-d7ee825f5625)
<br>

Conclusions:
- The calorie burn peaks around the early evening hours (19:00 - 20:00), which suggests that users tend to engage in physical activities or exercise during this time.
- Lunchtime (12:00 - 14:00) also shows higher calorie burn, possibly due to midday workouts or movement.
- Early morning hours (05:00 - 08:00) and late-night hours (22:00 - 03:00) exhibit significantly lower calorie burn, aligning with typical rest or sleep periods.
<br>

 > What is the relationship between total daily steps and calories burned?
  ```sql
  SELECT
    FORMAT_TIMESTAMP('%H', Time) AS Hour,
    ROUND(AVG(Value), 2) AS AverageHeartRate
  FROM third-project-444513.bellabeat.heart_rate
  GROUP BY Hour
  ORDER BY Hour;
  ```

| TotalSteps | Calories  |
|------------|-----------|
| 20237      | 4029      |
| 8046       | 2925      |
| 15392      | 2733      |
| 10005      | 2458      |
| 10226      | 1524      |
| 8426       | 2360      |
| 12116      | 3357      |
| 14002      | 3597      |
| 11306      | 2086      |

![Image](https://github.com/user-attachments/assets/62ea3e20-297b-49c5-b75c-9e998b2ba5da)
<br>

Conclusions:
- The data suggests a positive correlation: as total steps increase, calorie burn generally increases as well.
- However, there are anomalies where fewer steps result in higher calorie burns, likely due to activities that are intense but don’t involve walking (e.g., weightlifting or cycling).
 <br>

> What are the trends in heart rate values during the day?
  ```sql
  SELECT
    FORMAT_TIMESTAMP('%H', Time) AS Hour,
    ROUND(AVG(Value), 2) AS AverageHeartRate
  FROM third-project-444513.bellabeat.heart_rate
  GROUP BY Hour
  ORDER BY Hour;
  ```

| Hour | AverageHeartRate  |
|------|-------------------|
| 00   | 70.18             |
| 01   | 69.0              |
| 02   | 66.23             |
| 03   | 63.61             |
| 04   | 62.64             |
| 05   | 64.11             |
| 06   | 73.86             |
| 07   | 76.8              |
| 08   | 78.97             |

![Image](https://github.com/user-attachments/assets/72e99f58-21e5-470a-9e66-a094ec240a82)
<br>

Conclusions:
- Heart rate values are lowest during the early morning hours (02:00 - 05:00), indicating restful sleep.
- Heart rates increase after 06:00, peaking mid-morning (10:00 - 12:00) and again in the late afternoon (16:00 - 19:00), reflecting periods of increased physical activity or stress.
- Evening hours (20:00 - 23:00) show a gradual decline in heart rate, consistent with relaxation or winding down for the day.
<br>

> Which day of the week has the highest average calorie burn?
  ```sql
  SELECT
    FORMAT_DATETIME('%w', ActivityDate) AS DayOfWeek,
    ROUND(AVG(Calories), 2) AS AverageCalories
  FROM third-project-444513.bellabeat.daily_activity
  GROUP BY DayOfWeek
  ORDER BY AverageCalories DESC;
  ```

| DayOfWeek | AverageCalories  |
|-----------|------------------|
| 3         | 2377.46          |
| 5         | 2313.55          |
| 4         | 2297.81          |
| 6         | 2277.59          |
| 1         | 2252.87          |
| 0         | 2167.6           |
| 2         | 1742.42          |

![Image](https://github.com/user-attachments/assets/39d85796-f978-4b94-b477-6cbfdb5cbdcd)
<br>

Conclusions:
- Wednesday (Day 3) has the highest average calorie burn, followed closely by Friday (Day 5) and Thursday (Day 4).
- Tuesday (Day 2) shows the lowest calorie burn, possibly indicating a midweek lull in physical activity.
- Weekend days (Saturday and Sunday) don’t exhibit the highest values, which may reflect reduced physical activity despite more free time.
<br>

> How do step totals vary by hour of the day?
  ```sql
  SELECT
    FORMAT_TIMESTAMP('%H', ActivityHour) AS Hour,
    ROUND(AVG(StepTotal), 2) AS AverageSteps
  FROM third-project-444513.bellabeat.hourly_steps
  GROUP BY Hour
  ORDER BY Hour;
  ```
| Hour | AverageSteps  |
|------|---------------|
| 00   | 44.42         |
| 01   | 20.48         |
| 02   | 10.59         |
| 03   | 7.31          |
| 04   | 9.76          |
| 05   | 26.11         |
| 06   | 120.16        |
| 07   | 267.12        |
| 08   | 365.6         |

![Image](https://github.com/user-attachments/assets/58f80509-d14d-4e8b-b83b-31effafef14b)
<br>

Conclusions:
- Step totals are minimal during the night (00:00 - 05:00), as expected during sleep.
- Steps begin to increase early morning (06:00 - 08:00), peaking around late morning to early afternoon (10:00 - 14:00).
- Evening hours (18:00 - 19:00) also see high step counts, possibly due to post-work walks or exercise.
- A dip is observed late in the evening (20:00 onwards) as users wind down.
<br>

> What is the METs trend by minute during an average day?
  ```sql
  SELECT
    FORMAT_TIMESTAMP('%H:%M', ActivityMinute) AS Time,
    ROUND(AVG(METs), 2) AS AverageMETs
  FROM third-project-444513.bellabeat.minute_METs
  GROUP BY Time
  ORDER BY Time;
  ```

| Time  | AverageMETs  |
|-------|--------------|
| 00:00 | 11.48        |
| 00:01 | 11.31        |
| 00:02 | 11.18        |
| 00:03 | 11.12        |
| 00:04 | 10.85        |
| 00:05 | 11.07        |
| 00:06 | 11.16        |
| 00:07 | 11.14        |
| 00:08 | 11.21        |

![Image](https://github.com/user-attachments/assets/06d43b64-9c2d-4fc6-99c9-22f234a62d6e)
<br>

Conclusions: 
- METs values show a slight decrease minute-by-minute in the early data (00:00 - 00:09).
- This could be due to transitioning into rest or lower activity levels post-midnight.
- To capture a full trend, extending the query for a complete 24-hour period would provide better insights into METs variations during the day.
<br>


## Share
> Power BI

![Image](https://github.com/user-attachments/assets/34f11331-418e-4fe8-9c59-f9a8e7ba8fac)
<br>


## Act
In the final section of this case study, we synthesize insights and provide actionable recommendations based on the analysis. By examining trends in user activity and behavior, we can highlight opportunities to align Bellabeat’s offerings with user needs and preferences.
<br><br>
**Key Observations**<br>
- Calorie Burn Patterns: Peaks in the early evening (19:00–20:00) suggest users are most active post-work, while lunchtime (12:00–14:00) also shows higher calorie burn.
- Activity Levels: Users spend significant portions of their day sedentary, with lower activity levels correlated to poorer sleep quality.
- Workout and Sleep Trends: Tuesdays are the most popular workout day, and Saturdays are when users get the most sleep.
- Weight Management: Few users report weight-related data, but the average BMI falls in the overweight range. <br><br>

**Actionable Recommendations**

1. Promote Evening Fitness
- Campaigns: Develop marketing content encouraging evening workouts to align with user behavior.
- Features: Introduce reminders or challenges tailored for post-work activity.

2. Encourage Movement During the Day
- Alerts: Implement notifications to prompt movement during sedentary periods.
- Stress Management: Offer guided breathing exercises or relaxation techniques to balance sedentary habits.

3. Enhance Sleep Tracking
- Insights: Provide detailed sleep quality analytics and bedtime reminders.
- Recommendations: Deliver personalized tips, such as adjusting routines or increasing daily physical activity to improve sleep.

4. Leverage Workout and Sleep Trends
- Tuesday Workouts: Create challenges or fitness programs tailored for Tuesdays to maintain motivation.
- Saturday Sleep: Offer tips and tools to help users carry quality sleep habits into the rest of the week.

5. Focus on Weight Management
- Meal Tracking: Integrate a food diary for comprehensive calorie balance monitoring.
- Personalization: Provide tailored exercise and meal recommendations based on user preferences and goals.
- Community Support: Introduce social features such as group challenges or forums to foster engagement.
