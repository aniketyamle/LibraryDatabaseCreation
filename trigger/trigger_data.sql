

drop trigger trigger_name;

show triggers in library;


create trigger add_professor_as_member
after insert
on employee
for each row
insert into member (`name`,`ssn`,`campus_address`,`home_address`,`phone_no`,`card_issue_date`,`card_expiry_date`,`borrowed_count`,`member_type_id`,`member_status_id`)
values (new.name, new.ssn,new.campus_address, new.home_address,new.phone_no, new.joining_date, new.joining_date, 0, 1, 2)


-- this one works with hard coding
CREATE DEFINER = CURRENT_USER TRIGGER `library`.`add_professor_as_member`
AFTER INSERT ON `employee`
FOR EACH ROW
BEGIN
	if new.staff_position_id = 6 then
		insert into `library`.`member` (`name`,`ssn`,`campus_address`,`home_address`,`phone_no`,`card_issue_date`,`card_expiry_date`,`borrowed_count`,`member_type_id`,`member_status_id`)
		values (new.name, new.ssn,new.campus_address, new.home_address,new.phone_no, new.joining_date, new.joining_date, 0, 1, 2);
	end if;
END