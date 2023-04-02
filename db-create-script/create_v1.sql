-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8 ;
USE `library` ;

-- -----------------------------------------------------
-- Table `library`.`book_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`book_category` (
  `id` INT NOT NULL,
  `book_category` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`book_category` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`author` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `author_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`subject_area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`subject_area` (
  `id` INT NOT NULL,
  `subject_area` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`subject_area` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`binding`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`binding` (
  `id` INT NOT NULL,
  `bind_type` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`bind_type` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`lang`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`lang` (
  `id` INT NOT NULL,
  `language_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`language_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`book` (
  `isbn` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(8000) NULL,
  `book_category_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  `subject_area_id` INT NOT NULL,
  `binding_id` INT NOT NULL,
  `lang_id` INT NOT NULL,
  PRIMARY KEY (`isbn`),
  INDEX `fk_book_book_type1_idx` (`book_category_id` ASC),
  INDEX `fk_book_author1_idx` (`author_id` ASC),
  INDEX `fk_book_subject_area1_idx` (`subject_area_id` ASC),
  INDEX `fk_book_binding1_idx` (`binding_id` ASC),
  INDEX `fk_book_lang1_idx` (`lang_id` ASC),
  CONSTRAINT `fk_book_book_category1`
    FOREIGN KEY (`book_category_id`)
    REFERENCES `library`.`book_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_author1`
    FOREIGN KEY (`author_id`)
    REFERENCES `library`.`author` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_subject_area1`
    FOREIGN KEY (`subject_area_id`)
    REFERENCES `library`.`subject_area` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_binding1`
    FOREIGN KEY (`binding_id`)
    REFERENCES `library`.`binding` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_lang1`
    FOREIGN KEY (`lang_id`)
    REFERENCES `library`.`lang` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`book_for_lending`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`book_for_lending` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `loan_count` INT NULL,
  `available_count` INT NULL,
  `book_isbn` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lent_book1_idx` (`book_isbn` ASC),
  CONSTRAINT `fk_lent_book1`
    FOREIGN KEY (`book_isbn`)
    REFERENCES `library`.`book` (`isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`member_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`member_type` (
  `id` INT NOT NULL,
  `member_type` VARCHAR(45) NULL,
  `borrowing_period_limit` TINYINT NULL,
  `grace_period` TINYINT NULL,
  `book_limit` TINYINT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`member_type` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`member_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`member_status` (
  `id` INT NOT NULL,
  `member_status` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`member_status` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`member` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_name` VARCHAR(45) NULL,
  `ssn` VARCHAR(45) NOT NULL,
  `campus_address` VARCHAR(45) NOT NULL,
  `home_address` VARCHAR(45) NOT NULL,
  `phone_no` VARCHAR(45) NULL,
  `card_issue_date` DATE NULL,
  `card_expiry_date` DATE NULL,
  `borrowed_count` INT NULL,
  `member_type_id` INT NOT NULL,
  `member_status_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `ssn_UNIQUE` (`ssn` ASC),
  INDEX `fk_member_member_type1_idx` (`member_type_id` ASC),
  INDEX `fk_member_member_status1_idx` (`member_status_id` ASC),
  CONSTRAINT `fk_member_member_type1`
    FOREIGN KEY (`member_type_id`)
    REFERENCES `library`.`member_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_member_status1`
    FOREIGN KEY (`member_status_id`)
    REFERENCES `library`.`member_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`reason`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`reason` (
  `id` INT NOT NULL,
  `reason` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`reason` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`interested_to_acquire`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`interested_to_acquire` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `book_isbn` INT NOT NULL,
  `reason_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_interested_to_acquire_book_idx` (`book_isbn` ASC),
  INDEX `fk_interested_to_acquire_reason1_idx` (`reason_id` ASC),
  CONSTRAINT `fk_interested_to_acquire_book`
    FOREIGN KEY (`book_isbn`)
    REFERENCES `library`.`book` (`isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_interested_to_acquire_reason1`
    FOREIGN KEY (`reason_id`)
    REFERENCES `library`.`reason` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`book_member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`book_member` (
  `book_isbn` INT NOT NULL,
  `member_id` INT NOT NULL,
  `date_of_borrowing` DATE NULL,
  `last_date_to_return` DATE NULL,
  `date_of_return` DATE NULL,
  PRIMARY KEY (`book_isbn`, `member_id`),
  INDEX `fk_book_has_member_member1_idx` (`member_id` ASC),
  INDEX `fk_book_has_member_book1_idx` (`book_isbn` ASC),
  CONSTRAINT `fk_book_has_member_book1`
    FOREIGN KEY (`book_isbn`)
    REFERENCES `library`.`book` (`isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_has_member_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `library`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`staff_position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`staff_position` (
  `id` INT NOT NULL,
  `staff_position` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`staff_position` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `ssn` VARCHAR(45) NULL,
  `campus_address` VARCHAR(45) NULL,
  `home_address` VARCHAR(45) NULL,
  `phone_no` VARCHAR(45) NULL,
  `joining_date` DATE NULL,
  `staff_position_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `ssn_UNIQUE` (`ssn` ASC),
  INDEX `fk_employee_staff_position1_idx` (`staff_position_id` ASC),
  CONSTRAINT `fk_employee_staff_position1`
    FOREIGN KEY (`staff_position_id`)
    REFERENCES `library`.`staff_position` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
USE `library`;

DELIMITER $$
USE `library`$$
CREATE DEFINER = CURRENT_USER TRIGGER `library`.`add_professor_as_member`
AFTER INSERT ON `employee`
FOR EACH ROW

BEGIN

	if new.staff_position_id = (select sp.id from staff_position as sp where sp.staff_position = 'professor') then
		insert into `library`.`member` (`member_name`,`ssn`,`campus_address`,`home_address`,`phone_no`,`card_issue_date`,`card_expiry_date`,`borrowed_count`,`member_type_id`,`member_status_id`)
		values (new.name, new.ssn,new.campus_address, new.home_address,new.phone_no, new.joining_date, (select adddate(new.joining_date, interval 4 year)), 0, 2, 1);
	end if;
END$$


DELIMITER ;
