DROP TABLE Customer CASCADE;
DROP TABLE SCHEDULE CASCADE;
DROP TABLE Flight CASCADE;
DROP TABLE Plane CASCADE;
DROP TABLE Technician CASCADE;
DROP TABLE Repairs CASCADE;
DROP TABLE Pilot CASCADE;
DROP TABLE Uses CASCADE;
DROP TABLE Reservation CASCADE;
DROP TABLE Waitlisted CASCADE;
DROP TABLE Reserved CASCADE;
DROP TABLE Confirmed CASCADE;
DROP TABLE Repair_request CASCADE;
DROP TABLE Has CASCADE;

CREATE TABLE Flight(
		flight_num CHAR(11) NOT NULL,
		cost INTEGER,
		num_sold INTEGER,
		num_stops INTEGER,
		actual_arrival_date DATE,
		actual_arrival_time CHAR(5),
		actual_depart_date DATE,
		actual_depart_time CHAR(5),
		source CHAR(11),
		destination CHAR(11),
		PRIMARY KEY(flight_num)
);

CREATE TABLE Schedule(
		flight_num CHAR(11) NOT NULL,
		day DATE,
		depart_time CHAR(5),
		arrive_time CHAR(5),
		PRIMARY KEY(flight_num),
		FOREIGN KEY(flight_num) REFERENCES Flight(flight_num) ON DELETE CASCADE
);

CREATE TABLE Plane(
		pid CHAR(11) NOT NULL,
		make CHAR(11),
		model CHAR(11),
		age INTEGER,
		num_seats INTEGER,
		PRIMARY KEY(pid)
);

CREATE TABLE Technician(
		techID CHAR(11) NOT NULL,
		PRIMARY KEY(techid)
);

CREATE TABLE Customer(
		cid CHAR(11) NOT NULL,
		first_name CHAR(11) NOT NULL,
		last_name CHAR(11) NOT NULL,
		gender CHAR (11),
		date_of_birth DATE,
		address CHAR (22),
		contact_num CHAR (11),
		ZIP_code CHAR(10),
		PRIMARY KEY(cid)
);

CREATE TABLE Pilot(
		pilotid CHAR(11) NOT NULL,
		name CHAR(11) NOT NULL,
		nationality CHAR(11) NOT NULL,
		PRIMARY KEY(pilotID)
);

CREATE TABLE Reservation(
		Rnum CHAR(11) NOT NULL,
		PRIMARY KEY(Rnum)
);

CREATE TABLE Waitlisted(
		Rnum CHAR(11) NOT NULL,
		PRIMARY KEY(Rnum),
		FOREIGN KEY(Rnum) REFERENCES Reservation(Rnum)
);

CREATE TABLE Confirmed(
		Rnum CHAR(11) NOT NULL,
		PRIMARY KEY(Rnum),
		FOREIGN KEY(Rnum) REFERENCES Reservation(Rnum)
);

CREATE TABLE Reserved(
		Rnum CHAR(11) NOT NULL,
		PRIMARY KEY(Rnum),
		FOREIGN KEY(Rnum) REFERENCES Reservation(Rnum)
);

CREATE TABLE Repairs(
		pid CHAR(11) NOT NULL,
		techID CHAR(11) NOT NULL,
		repair_date DATE NOT NULL,
		repair_code CHAR(11) NOT NULL,
		PRIMARY KEY(pid, techID),
		FOREIGN KEY(pid) REFERENCES Plane(pid) ON DELETE CASCADE,
		FOREIGN KEY(techid) REFERENCES Technician(techid) ON DELETE NO ACTION
);

CREATE TABLE Uses(
		pid CHAR(11) NOT NULL,
		flight_num CHAR(11) NOT NULL,
		pilotid CHAR(11) NOT NULL,
		PRIMARY KEY(pid, flight_num, pilotid),
		FOREIGN KEY(pid) REFERENCES Plane(pid) ON DELETE CASCADE,
		FOREIGN KEY(flight_num) REFERENCES Flight(flight_num) ON DELETE CASCADE,
		FOREIGN KEY(pilotid) REFERENCES Pilot(pilotID) ON DELETE CASCADE
);

CREATE TABLE Has(
		cid CHAR(11) NOT NULL,
		Rnum CHAR(11) NOT NULL,
		flight_num CHAR(11) NOT NULL,
		PRIMARY KEY(cid, Rnum, flight_num),
		FOREIGN KEY(cid) REFERENCES Customer(cid) ON DELETE CASCADE,
		FOREIGN KEY(Rnum) REFERENCES Reservation(Rnum) ON DELETE CASCADE,
		FOREIGN KEY(flight_num) REFERENCES FLIGHT (flight_num) ON DELETE CASCADE
);

CREATE TABLE Repair_request(
		pilotid CHAR(11) NOT NULL,
		pid CHAR(11) NOT NULL,
		techID CHAR(11) NOT NULL,
		repairReq_id CHAR(11) NOT NULL,
		PRIMARY KEY(pilotid, pid, techID),
		FOREIGN KEY(pilotid) REFERENCES Pilot(pilotid) ON DELETE CASCADE,
		FOREIGN KEY(pid) REFERENCES Plane(pid) ON DELETE CASCADE,
		FOREIGN KEY(techID) REFERENCES Technician(techID) ON DELETE CASCADE
);


