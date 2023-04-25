


Select Distinct
s.STUDENT_NUMBER as student_number,s.STUDENT_WEB_ID+'@susd12.org' as student_email

From PowerSchool.dbo.students s
WHERE 1=1
AND S.ENROLL_STATUS=0
