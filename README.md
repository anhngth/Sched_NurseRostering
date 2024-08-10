# Sched_NurseRostering

CPLEX implementation to schedule workforce for a Coffee shop in university

The mathematical model constructed in this case is similar to Nurse Rostering Problem. Both problems involve assigning one specific workforce (nurse and part-time employee) to shifts while considering constraints such as the number of employees required in a shift and minimum/maximum working hours.

The following characteristics is considered:
- Consider which day in a week needed to be scheduled;
-	The part-time employee can work many consecutive shifts and days without any obligation;
-	Consider the availability of employees. The employees will input their free time first, then they will be scheduled based on their timetable. If they are not available, they will not be assigned to work.
