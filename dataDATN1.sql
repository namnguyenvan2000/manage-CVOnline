use DATN_Test
go

insert into [role] ([id],[name_role])
values
(1,'Admin'),
(2,'Employer'),
(3,'Applicant');
go

insert into [account] ([email],[password],[role_id])
values
('taiAdmin@gmail.com','123',1),
('taiEmployer@gmail.com','123',2),
('taiApplicant@gmail.com','123',3),
('phucAdmin@gmail.com','123',1),
('phucEmployer@gmail.com','123',2),
('phucApplicant@gmail.com','123',3),
('triAdmin@gmail.com','123',1),
('triEmployer@gmail.com','123',2),
('triApplicant@gmail.com','123',3),
('namAdmin@gmail.com','123',1),
('namEmployer@gmail.com','123',2),
('namApplicant@gmail.com','123',3)
go

insert into [applicant] ([fullname],[address],[dateofbirth],[phone],[gender],account_id)
values 
(N'Nguyễn Minh Tài',N'Q.Gò Vấp, TPHCM','05/03/1996','099999999',0,3),
(N'Nguyễn Hoàng Phúc',N'Quận 8, TPHCM','24/01/2000','099999999',0,6),
(N'Trần Ngọc Trí',N'Quận 12, TPHCM','01/01/2003','099999999',0,9),
(N'Nguy?n Van Nam',N'Q.Gò Vấp TPHCM','02/01/2000','099999999',0,12);
go

insert into [employer] ([namecompany],[address],[introduction],[phone],[taxcode],[website],[logo],[account_id])
values
(N'FPT Telecom',N'Lô 37-39A, Ðường 19, KCX Tân Thuận, Tân Thuận Ðông, Q7',
N'Là thành viên thuộc Tập đoàn công nghệ hàng đầu Việt Nam FPT, Công ty Cổ phần Viễn thông FPT (tên gọi tắt là FPT Telecom) hiện là một trong những nhà cung cấp dịch vụ viễn thông và Internet có uy tín và được khách hàng yêu mến tại Việt Nam và khu vực.

Thành lập ngày 31/01/1997, khởi nguồn từ Trung tâm Dịch vụ Trực tuyến do 4 thành viên sáng lập cùng sản phẩm mạng Intranet đầu tiên của Việt Nam mang tên “Trí tuệ Việt Nam – TTVN”, sản phẩm được coi là đặt nền móng cho sự phát triển của Internet tại Việt Nam. Sau 20 năm hoạt động, FPT Telecom đã lớn mạnh vượt bậc với hơn 7,000 nhân viên chính thức, gần 200 văn phòng điểm giao dịch thuộc hơn 80 chi nhánh tại 59 tỉnh thành trên toàn quốc. Bên cạnh đó, Công ty đã và đang đặt dấu ấn trên trường quốc tế bằng 8 chi nhánh trải dài khắp Campuchia, cũng như việc được cấp giấy phép kinh doanh dịch vụ tại Myanmar.

Với sứ mệnh tiên phong đưa Internet đến với người dân Việt Nam và mong muốn mỗi gia đình Việt Nam đều sử dụng ít nhất một dịch vụ của FPT Telecom, đồng hành cùng phương châm “Khách hàng là trọng tâm”, chúng tôi không ngừng nỗ lực đầu tư hạ tầng, nâng cấp chất lượng sản phẩm – dịch vụ, tăng cường ứng dụng công nghệ mới để mang đến cho khách hàng những trải nghiệm sản phẩm dịch vụ vượt trội.'
,'099999999','123456789',N'fpt-telecom.net.vn','',2),

(N'FPT Telecom',N'Lô 37-39A, Ðường 19, KCX Tân Thuận, Tân Thuận Ðông, Q7',
N'Là thành viên thuộc Tập đoàn công nghệ hàng đầu Việt Nam FPT, Công ty Cổ phần Viễn thông FPT (tên gọi tắt là FPT Telecom) hiện là một trong những nhà cung cấp dịch vụ viễn thông và Internet có uy tín và được khách hàng yêu mến tại Việt Nam và khu vực.

Thành lập ngày 31/01/1997, khởi nguồn từ Trung tâm Dịch vụ Trực tuyến do 4 thành viên sáng lập cùng sản phẩm mạng Intranet đầu tiên của Việt Nam mang tên “Trí tuệ Việt Nam – TTVN”, sản phẩm được coi là đặt nền móng cho sự phát triển của Internet tại Việt Nam. Sau 20 năm hoạt động, FPT Telecom đã lớn mạnh vượt bậc với hơn 7,000 nhân viên chính thức, gần 200 văn phòng điểm giao dịch thuộc hơn 80 chi nhánh tại 59 tỉnh thành trên toàn quốc. Bên cạnh đó, Công ty đã và đang đặt dấu ấn trên trường quốc tế bằng 8 chi nhánh trải dài khắp Campuchia, cũng như việc được cấp giấy phép kinh doanh dịch vụ tại Myanmar.

Với sứ mệnh tiên phong đưa Internet đến với người dân Việt Nam và mong muốn mỗi gia đình Việt Nam đều sử dụng ít nhất một dịch vụ của FPT Telecom, đồng hành cùng phương châm “Khách hàng là trọng tâm”, chúng tôi không ngừng nỗ lực đầu tư hạ tầng, nâng cấp chất lượng sản phẩm – dịch vụ, tăng cường ứng dụng công nghệ mới để mang đến cho khách hàng những trải nghiệm sản phẩm dịch vụ vượt trội.'
,'099999999','123456789',N'fpt-telecom.net.vn','',5),

(N'FPT Telecom',N'Lô 37-39A, Ðường 19, KCX Tân Thuận, Tân Thuận Ðông, Q7',
N'Là thành viên thuộc Tập đoàn công nghệ hàng đầu Việt Nam FPT, Công ty Cổ phần Viễn thông FPT (tên gọi tắt là FPT Telecom) hiện là một trong những nhà cung cấp dịch vụ viễn thông và Internet có uy tín và được khách hàng yêu mến tại Việt Nam và khu vực.

Thành lập ngày 31/01/1997, khởi nguồn từ Trung tâm Dịch vụ Trực tuyến do 4 thành viên sáng lập cùng sản phẩm mạng Intranet đầu tiên của Việt Nam mang tên “Trí tuệ Việt Nam – TTVN”, sản phẩm được coi là đặt nền móng cho sự phát triển của Internet tại Việt Nam. Sau 20 năm hoạt động, FPT Telecom đã lớn mạnh vượt bậc với hơn 7,000 nhân viên chính thức, gần 200 văn phòng điểm giao dịch thuộc hơn 80 chi nhánh tại 59 tỉnh thành trên toàn quốc. Bên cạnh đó, Công ty đã và đang đặt dấu ấn trên trường quốc tế bằng 8 chi nhánh trải dài khắp Campuchia, cũng như việc được cấp giấy phép kinh doanh dịch vụ tại Myanmar.

Với sứ mệnh tiên phong đưa Internet đến với người dân Việt Nam và mong muốn mỗi gia đình Việt Nam đều sử dụng ít nhất một dịch vụ của FPT Telecom, đồng hành cùng phương châm “Khách hàng là trọng tâm”, chúng tôi không ngừng nỗ lực đầu tư hạ tầng, nâng cấp chất lượng sản phẩm – dịch vụ, tăng cường ứng dụng công nghệ mới để mang đến cho khách hàng những trải nghiệm sản phẩm dịch vụ vượt trội.'
,'099999999','123456789',N'fpt-telecom.net.vn','',8),

(N'FPT Telecom',N'Lô 37-39A, Ðường 19, KCX Tân Thuận, Tân Thuận Ðông, Q7',
N'Là thành viên thuộc Tập đoàn công nghệ hàng đầu Việt Nam FPT, Công ty Cổ phần Viễn thông FPT (tên gọi tắt là FPT Telecom) hiện là một trong những nhà cung cấp dịch vụ viễn thông và Internet có uy tín và được khách hàng yêu mến tại Việt Nam và khu vực.

Thành lập ngày 31/01/1997, khởi nguồn từ Trung tâm Dịch vụ Trực tuyến do 4 thành viên sáng lập cùng sản phẩm mạng Intranet đầu tiên của Việt Nam mang tên “Trí tuệ Việt Nam – TTVN”, sản phẩm được coi là đặt nền móng cho sự phát triển của Internet tại Việt Nam. Sau 20 năm hoạt động, FPT Telecom đã lớn mạnh vượt bậc với hơn 7,000 nhân viên chính thức, gần 200 văn phòng điểm giao dịch thuộc hơn 80 chi nhánh tại 59 tỉnh thành trên toàn quốc. Bên cạnh đó, Công ty đã và đang đặt dấu ấn trên trường quốc tế bằng 8 chi nhánh trải dài khắp Campuchia, cũng như việc được cấp giấy phép kinh doanh dịch vụ tại Myanmar.

Với sứ mệnh tiên phong đưa Internet đến với người dân Việt Nam và mong muốn mỗi gia đình Việt Nam đều sử dụng ít nhất một dịch vụ của FPT Telecom, đồng hành cùng phương châm “Khách hàng là trọng tâm”, chúng tôi không ngừng nỗ lực đầu tư hạ tầng, nâng cấp chất lượng sản phẩm – dịch vụ, tăng cường ứng dụng công nghệ mới để mang đến cho khách hàng những trải nghiệm sản phẩm dịch vụ vượt trội.'
,'099999999','123456789',N'fpt-telecom.net.vn','',11)
go


insert into [job_posting] ([job_title],[job_location],[major_name],[job_posting_date],[dealine],[status],[employer_id])
values
(N'Lập Trình Viên Java',N'Hà Nội',N'Công Nghệ Thông Tin','01/01/2024','01/30/2024',N'Hết hạn',1),
(N'Business Analyst - Chuyên Gia Phân Tích Nghiệp Vụ Hệ Thống CoreBanking T24/CLIM',N'Hà Nội',N'Công Nghệ Thông Tin','01/01/2024','01/30/2024',N'Hết hạn',2),
(N'Front End Developer (VueJS, Javascript, HTML) ',N'Hà Nội',N'Công Nghệ Thông Tin','06/01/2024','07/30/2024',N'Còn hạn',3),
(N'Backend Developer',N'Hồ Chí Minh',N'Công Nghệ Thông Tin','06/01/2024','08/27/2024',N'Ðủ số lượng',4);
go



insert into [job_detail] ([job_requirements],[job_vacancy],[job_description],[job_type],[quanlity],[experience],[benefits],[salary],[job_posting_id])
values 
(N'Tốt nghiệp Đại học các chuyên ngành CNTT, Khoa học máy tính,... Ưu tiên ứng viên tốt nghiệp các trường Bách Khoa, Học viện kỹ thuật quân sự, Học viện Bưu chính, ĐH Công nghệ-ĐH Quốc gia Hà Nội, Đại học FPT hoặc các trường ĐH quốc tế.
Level Senior yêu cầu có 4++ năm kinh nghiệm phát triển phần mềm trở lên với ngôn ngữ JAVA, có kinh nghiệm với các framework như Spring, Quarkus, ZK.
Level Junior yêu cầu có 2++ năm kinh nghiệm phát triển phần mềm trở lên với ngôn ngữ JAVA, có kinh nghiệm với các framework như Spring, Quarkus, ZK.
Có kinh nghiệm làm việc với một trong các Database Oracle, MariaDB, Postgre, MongoDB, Redis, ElasticSearch.
Có kinh nghiệm làm việc với một trong các hệ thống Message Queue (Kafka, RabbitMQ, MQTT)
Có hiểu biết về thiết kế hệ thống, design pattern, OOP là một lợi thế.
Sử dụng thành thạo các công cụ quản lý code như SVN, Github.
Có kiến thức triển khai cơ bản hệ thống trên hệ điều hành Linux.
Có khả năng làm việc độc lập và làm việc nhóm, chịu được áp lực cao.
Có khả năng tư duy logic và nghiên cứu công nghệ mới
Có khả năng đọc hiểu tài liệu tiếng Anh chuyên ngành.',
N'Senior',
N'Xây dựng các module lõi cho nền tảng Logistics thế hệ mới của ViettelPost.
Tối ưu hóa các nghiệp vụ, thuật toán, kiến trúc để nâng cao chất lượng sản phẩm.
Làm việc trực tiếp với các đội nghiệp vụ để thực thi sản phẩm theo đúng yêu cầu. Tư vấn ngược lại cho đội nghiệp vụ để thông minh hóa quy trình.
Xây dựng các sản phẩm mới phục vụ hàng triệu người dùng của ViettelPost'
,N'Toàn thời gian','2',N'2 năm',
N'1. Chế độ về lương thưởng, thu nhập
2. Chương trình chăm sóc sức khỏe
3. Đào tạo, phát triển
4. Hoạt động tập thể hấp dẫn, phong phú',
N'35M - 55M',1),

(N'Ít nhất 05 năm kinh nghiệm ở vị trí BA CoreBanking T24 hoặc BA CLIMS
Có kinh nghiệp về nghiệp vụ Ngân hàng (Tài khoản, Thanh toán, Tiền gửi, Tiền vay, Nguồn vốn, Thanh toán quốc tế, ...).
Kinh nghiệm xây dựng các kịch bản kiểm thử, kế hoạch kiểm thử hoàn chỉnh cho một dự án phần mềm.
Kinh nghiệm và am hiểu về quy trình phát triển phần mềm.',N'Senior',
N'Trực tiếp thực hiện tư vấn và phân tích các yêu cầu phát triển từ đơn vị nghiệp vụ, đảm bảo chuyển đổi đầy đủ và hiệu quả các yêu cầu của đơn vị nghiệp vụ thành các yêu cầu phát triển ứng dụng với Hệ thống CLIMS hoặc CoreBanking T24
Trao đổi với bộ phận phát triển để thiết kế giải pháp cho các yêu cầu này. Xây dựng đặc tả chi tiết về yêu cầu theo ngôn ngữ phù hợp với lập trình viên; đảm bảo yêu cầu phát triển là rõ ràng và khả thi về mặt công nghệ.
Tham gia phối hợp với đơn vị nghiệp vụ kiểm tra kết quả phát triển, đảm bảo ứng dụng đáp ứng yêu cầu đã thống nhất với đơn vị nghiệp vụ.
Đưa ra khuyến nghị về cải tiến và sử dụng công nghệ mới để nâng cao hiệu suất và khả năng của hệ thống.
Phối hợp với nhân sự level 1 và 2 để hỗ trợ người dùng trong các hoạt động hàng ngày, đảm bảo các vấn đề của người dùng được xử lý nhanh nhất có thể, đáp ứng nhu cầu công việc của họ.',
N'Toàn thời gian','2',N'5 năm',
N'Lương và phúc lợi hấp dẫn
Co hội phát triển nghề nghiệp hấp dẫn
Môi trường làm việc năng động','1,500 - 2,200 USD',2),

(N'Có ít nhất 1 năm kinh nghiệm (Ưu tiên kinh nghiệm cao)
Có kinh nghiệm phát triển ứng dụng web/mobile
Có thể phát triển HTML, CSS, Javascript, jQuery
Có thể phát triển dựa trên SPA (Vue.js, Vuex)
Có kinh nghiệm với các công cụ cộng tác như Git, Jira và Confluence
Hiểu và sử dụng CI/CD
Tốt nghiệp đại học trở lên
Giao tiếp Tiếng anh ở mức trung bình (TOEIC trên 550 và các chứng chỉ tương tự hoặc tự tin giao tiếp tiếng anh)
Ưu tiên: Hiểu về Back-End
Sử dụng được Typescript
Có kinh nghiệm UI/UX
Có kinh nghiệm với biểu đồ javascript ( Echarts, Chart.js...).',N'Fresher',
N'LG CNS Việt Nam đang tìm kiếm các lập trình viên Front-end đủ tiêu chuẩn tham gia vào các dự án của công ty. Bạn sẽ phát triển trong việc phát triển ứng dụng web trong các lĩnh vực khác nhau, chẳng hạn như các dự án về Data, Machine learning / Data Learning, AI, Logistic và các solution hiện có của công ty

Nhiệm vụ:

Đảm bảo hiệu suất, chất lượng và khả năng đáp ứng tốt nhất có thể của các ứng dụng ở phía Front-end
Tham gia lập trình các ứng dụng web
Phối hợp cùng team dự án Việt Nam và Hàn Quốc để đảm bảo tiến độ.
Trao đổi chi tiết khi phỏng vấn','Toàn th?i gian','10',N'Không yêu cầu kinh nghiệm',
N'Lương, thưởng sẽ được thảo luận sau khi thông qua CV & Phỏng vấn
Review đánh giá năng lực hàng năm và điều chỉnh tăng lương theo hiệu quả công việc
Phụ cấp chứng chỉ ngoại ngữ tiếng hàn (TOPIK)
Chăm sóc sức khỏe: Khám sức khỏe định kỳ hàng năm, Bảo hiểm sức khỏe cao cấp
Điều kiện làm việc thoải mái và thời gian làm việc linh hoạt
Cơ hội phát triển nghề nghiệp tốt với các dự án thú vị và đầy thử thách;
Các khóa đào tạo tiếng Anh, tiếng Hàn, kỹ thuật, kỹ năng mềm;
Cơ hội học các khóa học đặc biệt của LG CNS, công nghệ mới và bảo mật
Quà tặng, thưởng vào các dịp lễ, tết (30/4-1/5, 2/9, tết v.v)
Các hoạt động ngoài trời với sự hỗ trợ của công ty: câu lạc bộ thể thao, team building, tiệc happy hour, sinh nhật, du lịch, sự kiện nhân viên và gia đình, v.v.
Thời gian làm việc: 8 tiếng từ T2 - T6 (8:00- 12:/ 13:00 - 17:00)',N'Thoả thuận',3),

(N'Bachelor’s degree in Computer Science, Engineering, or a related field (or equivalent experience).
Minimum of 3 years of professional experience as a Backend Developer, with a focus on NodeJS.
Experience with Java is a plus.
Proficiency in JavaScript/TypeScript and asynchronous programming.
Experience with databases (SQL and NoSQL), web servers (e.g., Apache, Nginx), and RESTful API design.
Familiarity with front-end technologies (HTML5, CSS3, JavaScript).
Understanding of code versioning tools, such as Git.
Strong analytical and problem-solving skills.
Excellent communication and collaboration abilities.
English: writing & reading.',N'junior',
N'Design, develop, and maintain server-side architecture using NodeJS.
Build reusable code and libraries for future use.
Optimize applications for maximum speed and scalability.
Implement security and data protection measures.
Collaborate with other team members and stakeholders.
Conduct code reviews and provide constructive feedback.
Stay up-to-date with emerging technologies and industry trends.',N'Toàn thời gian',N'3 năm',
N'Successful candidates will be able to sign a labor contract immediately, no need to go through a probationary period;
Salary shall be discussed during the interview;
Monthly working allowance when working at client of office (if any);
5 working days per week (Monday-Friday), extent flexible working hours;
Friendly, professional and open working environment;
Premium Heath Care Insurance 24/7 for Key Person;
Company Trip and Events, Birthday Party, Year End Party;
Labor Contract, Social insurance as Labor Law;
Training courses: Technical skills, Japanese;
Professional and Flexible Working Environment.',N'20 - 40 triệu',4)
go

