create database sqlproject;
use sqlproject;

CREATE table customer(customerId int primary key,
					   customerName varchar(32) not null,
                       address varchar(200) not null,
                       phone varchar(10) not null,
                       email varchar(32) not null unique);
                       
                       
INSERT into customer (customerId, customerName,address,phone,email) VALUES
(1, 'Ravi Kumar', '123 MG Road', '9876543210', 'ravi@email.com'),
(2, 'Priya Singh', '45 Park Avenue', '9123456789', 'priya@email.com'),
(3, 'John Doe', '78 Lake View', '9988776655', 'john@email.com'),
(4, 'Anil Mehra', '56 Hill Road', '9001122334', 'anil@email.com'),
(5, 'Sunita Rao', '89 River Street', '9112233445', 'sunita@email.com'),
(6, 'Meena Patel', '12 Green Lane', '9223344556', 'meena@email.com'),
(7, 'Rajesh Shah', '34 Blue Street', '9334455667', 'rajesh@email.com'),
(8, 'Kavita Joshi', '67 Red Road', '9445566778', 'kavita@email.com'),
(9, 'Amit Verma', '90 White Field', '9556677889', 'amit@email.com'),
(10, 'Neha Gupta', '21 Yellow Lane', '9667788990', 'neha@email.com');


create table meter(meterId int primary key,
					customerId int, foreign key(customerId) references customer(customerId) on delete cascade,
                    installationDate date not null,
                    lastReadingDate date not null);
                    

INSERT INTO meter (meterId, customerId, installationDate, lastReadingDate) VALUES
(101, 1, '2024-01-15', '2024-03-01'),
(102, 2, '2024-02-10', '2024-03-05'),
(103, 3, '2023-12-20', '2024-03-03'),
(104, 4, '2024-01-25', '2024-03-02'),
(105, 5, '2024-02-15', '2024-03-04'),
(106, 6, '2024-03-01', '2024-03-06'),
(107, 7, '2024-01-10', '2024-03-01'),
(108, 8, '2024-02-20', '2024-03-05'),
(109, 9, '2024-01-30', '2024-03-03'),
(110, 10, '2024-03-02', '2024-03-06');

create table electricityUsage(usageId int primary key,
								meterId int, foreign key(meterId) references meter(meterId) on delete cascade,
                                readingDate date not null,
                                usageUnits bigint check(usageUnits >= 0)
                                );


INSERT INTO electricityUsage (usageId, meterId, readingDate, usageUnits) VALUES
(201, 101, '2024-03-01', 150),
(202, 102, '2024-03-05', 220),
(203, 103, '2024-03-03', 180),
(204, 104, '2024-03-02', 210),
(205, 105, '2024-03-04', 90),
(206, 106, '2024-03-06', 250),
(207, 107, '2024-03-01', 130),
(208, 108, '2024-03-05', 300),
(209, 109, '2024-03-03', 170),
(210, 110, '2024-03-06', 200);


create table bill(billId int primary key,
					meterId int, foreign key(meterId) references meter(meterId) on delete cascade,
                    billDate date not null,
                    amountDue bigint check (amountDue >= 0),
                    dueDate date not null,
                    paid boolean default 0);
                    
                    
INSERT INTO bill (billId, meterId, billDate, amountDue, dueDate, paid) VALUES
(301, 101, '2024-03-02', 1200, '2024-03-20', 0),
(302, 102, '2024-03-06', 1800, '2024-03-25', 1),
(303, 103, '2024-03-04', 1500, '2024-03-22', 0),
(304, 104, '2024-03-03', 1700, '2024-03-21', 1),
(305, 105, '2024-03-05', 800, '2024-03-23', 0),
(306, 106, '2024-03-07', 2000, '2024-03-26', 1),
(307, 107, '2024-03-02', 1100, '2024-03-20', 0),
(308, 108, '2024-03-06', 2200, '2024-03-25', 1),
(309, 109, '2024-03-04', 1300, '2024-03-22', 0),
(310, 110, '2024-03-07', 1600, '2024-03-26', 1); 


create table payment(paymentId int primary key,
						billId int, foreign key(billId) references bill(billId) on delete cascade,
                        paymentDate date not null,
                        amountPaid bigint check (amountPaid >= 0));


INSERT INTO payment (paymentId, billId, paymentDate, amountPaid) VALUES
(401, 302, '2024-03-10', 1800),
(402, 304, '2024-03-12', 1700),
(403, 306, '2024-03-15', 2000),
(404, 308, '2024-03-18', 2200),
(405, 310, '2024-03-20', 1600),
(406, 302, '2024-03-11', 0),
(407, 304, '2024-03-13', 0),
(408, 306, '2024-03-16', 0),
(409, 308, '2024-03-19', 0),
(410, 310, '2024-03-21', 0);

-- k. Write a query to fetch the records of all the above tables.
-- select * from customer,meter,electricityUsage,bill,payment;
-- select * from customer join meter on(customer.customerId=meter.customerId) join electricityUsage on(meter.meterId = electricityUsage.meterId) join bill on(meter.meterId = bill.meterId) join payment on(payment.billId = bill.billId);

select * from customer;
select * from meter;
select * from electricityUsage;
select * from bill;
select * from payment;


-- l.  Write a query to get total electricity usage per Meter, only for meters with usage greater than 200 units. 
select meterId, sum(usageUnits) TotalUsage from electricityUsage 
group by meterId 
having TotalUsage>200;
                    

 -- m. Write a query to list all customers and their total unpaid bill amounts, ordered by amount due in descending.
 select c.customerId, c.customerName, sum(b.amountDue) as TotalDue from customer c 
 join
 meter m on(c.customerId = m.customerId) 
 join 
 Bill b on(m.meterId =b.meterId) 
 group by c.customerId,c.customerName
 order by 
TotalDue desc;


-- n. Write a query to get all bills along with payment status, sorted by BillDate in ascending.
select meterId, amountDue,billDate,
case
when paid = 1 then 'PAID'
else 'Not PAID'
end paymentStatus from bill 
order by billDate;  

-- o. Write a query to find all customers who have at least one meter installed after '2023-12-31'. 
select c.customerName, m.installationDate from customer c 
inner join 
meter m 
on(c.customerId = m.customerId and m.installationDate > '2023-12-31');                   


-- p. Write a query to show meters with their last reading date and the total usage units in descending order of usage.
select e.meterId, m.lastReadingDate, sum(usageUnits) TotalUnits from electricityUsage e 
join meter m on(e.meterId =m.meterId) 
group by e.meterId,e.ReadingDate 
order by TotalUnits desc;
 
 

                    
                    
             
                    
                    
                    
                    
                    
                    
                    