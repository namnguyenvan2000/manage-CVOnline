use DATN_Test
go

insert into role(id,name_role)
values
(1,'Admin'),
(2,'Employer'),
(3,'Applicant');
go


insert into account (email,password,role_id)
values
('tai@gmail.com','123',1),
('phuc@gmail.com','123',2),
('tri@gmail.com','123',2),
('vnam@gmail.com','123',3),
('hnam@gmail.com','123',3);
go

insert into applicant(fullname,[address],dateofbirth,phone,gender,account_id)
values
(N'Nguyen Hoang Phuc',N'Q8, THCM','24/01/2000','099999999',0,2),
(N'Tran Ngoc Tri',N'Q8, THCM','0101/2024','099999999',0,3)
go

insert into employer (namecompany,[address],introduction,phone,taxcode,website,account_id)
values 
(N'FPT company',N'Thien Ho Duong, Q.GoVap',N'abc','0999999999','123456789',N'Fpt.com',4),
(N'Viettel company',N'Thien Ho Duong, Q.GoVap',N'abc','0999999999','123456789','Viettel.com',5);
go

insert into job_posting(major_name,job_title,job_location,[status],job_posting_date,dealine,employer_id)
values
(N'Java Develope Web',N'Dev web',N'Bình Thạnh',N'Còn hạn','01/01/2024','02/01/2024',1),
(N'Java Develope Web',N'Dev web',N'Bình Thạnh',N'Hết hạn','01/01/2024','02/01/2024',2),
(N'Java Develope Web',N'Dev web',N'Bình Thạnh',N'đủ số lượng','01/01/2024','02/01/2024',1);
go

insert into job_detail(job_description,job_requirements,job_type,experience,quanlity,salary,benefits,job_posting_id)
values
(N'Công Ty mới',N'Không yêu cầu',N'Remote',N'Manual','05','20000000',N'Team Buidling',1),
(N'Công Ty mới',N'Không yêu cầu',N'Onside',N'Manual','05','20000000',N'Team Buidling',2),
(N'Công Ty mới',N'Không yêu cầu',N'Onside',N'Manual','05','20000000',N'Team Buidling',3);
go


insert into cv(creation_date,pdffile,applicant_id,job_posting_id)
values
(N'Đại Học',N'Junior',N'CCNA',N'English',N'Code Java, Springboot, Spring MVC','01/01/2024',1,1),
(N'Đại Học',N'Junior',N'CCNA',N'English',N'Code Java, Springboot, Spring MVC','01/01/2024',2,2);
go