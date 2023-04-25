


select distinct 
sc.ABBREVIATION as 'School',
s.STUDENT_NUMBER,
s.LASTFIRST,
DOB=convert(VARCHAR (10),s.DOB,101) ,
s.GRADE_LEVEL,
'EntryDate'=convert(VARCHAR (10),s.ENTRYDATE,101),
s.ENTRYCODE,
S.ENROLL_STATUS

from PowerSchool.dbo.students s
inner join PowerSchool.dbo.SCHOOLS sc
on s.SCHOOLID=sc.SCHOOL_NUMBER
where 1=1
and s.ENTRYDATE>='2022-10-01'
and s.ENTRYCODE in ('e3','e6')
and s.GRADE_LEVEL not in ('-2','-1')
and NOT EXISTS(SELECT * FROM PowerSchool.DBO.REENROLLMENTS R
        WHERE 1=1 AND S.ID=R.STUDENTID)

        ORDER BY S.ENROLL_STATUS ASC,SC.ABBREVIATION