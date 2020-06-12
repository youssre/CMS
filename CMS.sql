use CMS2;
CREATE TABLE Users(
user_id int primary key identity,
user_name varchar(50) unique,
user_password varchar(50)
);
go
CREATE TABLE account(
account_id int primary key identity,
account_user_id int,
account_name varchar(100) not null,
account_date_of_birth date,
account_creation_date datetime not null,
account_notes varchar(50),
account_type int not null,
account_phone varchar(20) not null,
foreign key (account_user_id) references Users(user_id)
);
go
CREATE TABLE reservation(
reservation_id int primary key identity,
reservation_patient_id int not null,
reservation_secretary_id int not null,
reservation_visit_date date not null,
reservation_visit_slot int not null,
reservation_date datetime not null,
foreign key (reservation_patient_id) references account(account_id),
foreign key (reservation_secretary_id) references account(account_id)
);
go
Create TABLE visits(
visit_id int primary key identity,
visit_reservation_id int not null,
visit_doctor_id int not null,
visit_reasons varchar(200),
visit_diagnosis varchar(100) not null,
visit_notes varchar(100),
visit_date date not null,
foreign key (visit_reservation_id) references reservation(reservation_id),
foreign key (visit_doctor_id) references account(account_id)
);