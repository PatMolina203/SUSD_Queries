--Student Attendance Current Year
--Pulls student attendace by day and period 

Select DISTINCT 
'ATTENDANCE.ID'=A.ID,
'ATTENDANCE.dcid'=A.DCID,
'ATTENDANCE.ADA_Value_Code'=ADA_VALUE_CODE,
'ATTENDANCE.ADA_Value_Time'=ADA_VALUE_TIME,
'ATTENDANCE.ADM_Value'=ADM_VALUE,
'ATTENDANCE.Att_Comment'=ISNULL(ATT_COMMENT,''),
'ATTENDANCE.Att_Date'=ATT_DATE,
'ATTENDANCE.Att_Flags'=ATT_FLAGS,
'ATTENDANCE.Att_Interval'=ATT_INTERVAL,
'ATTENDANCE.Att_Mode_Code'=ATT_MODE_CODE,
'ATTENDANCE.Attendance_CodeID'=ATTENDANCE_CODEID,
'ATTENDANCE.Calendar_DayID'=CALENDAR_DAYID,
'ATTENDANCE.CCID'=CCID,
'ATTENDANCE.ip_address'=A.IP_ADDRESS,
'ATTENDANCE.Lock_Reporting_YN'=LOCK_REPORTING_YN,
'ATTENDANCE.Lock_Teacher_YN'=LOCK_TEACHER_YN,
'ATTENDANCE.Parent_AttendanceID'=PARENT_ATTENDANCEID,
'ATTENDANCE.PeriodID'=PERIODID,
'ATTENDANCE.Prog_Crse_Type'=ISNULL(PROG_CRSE_TYPE,''),
'ATTENDANCE.ProgramID'=PROGRAMID,
'ATTENDANCE.SchoolID'=SCHOOLID,
'ATTENDANCE.StudentID'=STUDENTID,
'ATTENDANCE.Total_Minutes'=TOTAL_MINUTES,
'ATTENDANCE.TRANSACTION_DATE'=A.TRANSACTION_DATE

from PowerSchool.dbo.ATTENDANCE A
INNER JOIN PowerSchool.DBO.SCHOOLS S
ON A.SCHOOLID=S.SCHOOL_NUMBER AND S.SORTORDER BETWEEN 1 AND 33
WHERE 1=1
AND YEARID in (SELECT DISTINCT yearid FROM PowerSchool.dbo.Terms WHERE isyearrec=1 AND GETDATE() BETWEEN firstday AND lastday)