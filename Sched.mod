//Parameter
int numEmployee = 8; //Total number ofemployeess
int numShift = 3; //Number of shift in a day
int numDay = 6; //Number of working days of a week
 
range employee = 1..numEmployee;
range shift = 1..numShift;
range day = 1..numDay;
 
tuple DayShift {
int day;
int shift;
}
{DayShift} DayShiftSet =...;
int a[DayShiftSet][employee] =...;
 
//Decision varibales 
dvar boolean x[DayShiftSet][employee];
dvar boolean y[employee];
 
//Objective function
minimize sum(i in employee) y[i]; 
 
subject to {
Constraint_1: //Total employees assigned to work less than total number of employees
	0.0000001 <= sum (i in employee) (y[i]);
  	sum (i in employee) (y[i]) <= 8;
     
Constraint_2: //Each shift must have at least 4 to 5 people
forall (<k,j> in DayShiftSet) { 
   		sum (i in employee) x[<k,j>][i] >= 4;
   		sum (i in employee) x[<k,j>][i] <= 5;
   		} 	

Constraint_3: //Employee only assigned to work only if they are available
forall (<k,j> in DayShiftSet, i in employee) {
  		a[<k,j>][i] == 0 => x[<k,j>][i] == 0;
  		} 

Constraint_4: //Each employee must work at least 3 shifts a week, at most 16 shifts
forall (i in employee) {
		sum(j in shift, k in day) x[<k,j>][i] >= 3;
  		sum(j in shift, k in day) x[<k,j>][i] <= 16;
  		}  

Constraint_5: //If the employee i is used then Yi = 1
forall (<k,j> in DayShiftSet, i in employee) {
  		y[i] >= x[<k,j>][i];
  		}
  		
 forall (i in employee) {
  		y[i] <= sum(<k,j> in DayShiftSet)x[<k,j>][i];
  		} 
 }  
