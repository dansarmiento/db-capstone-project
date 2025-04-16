-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema little_lemon_sales
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemon_sales
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon_sales` DEFAULT CHARACTER SET utf8 ;
USE `little_lemon_sales` ;

-- -----------------------------------------------------
-- Table `little_lemon_sales`.`order_delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_sales`.`order_delivery` (
  `order_delivery_id` INT NOT NULL AUTO_INCREMENT,
  `order_delivery_status` VARCHAR(100) NULL,
  PRIMARY KEY (`order_delivery_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_sales`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_sales`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_first_name` VARCHAR(100) NULL,
  `customer_last_name` VARCHAR(100) NULL,
  `customer_phone_number` VARCHAR(45) NULL,
  `customer_email` VARCHAR(100) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_sales`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_sales`.`employees` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `emp_first_name` VARCHAR(100) NULL,
  `emp_last_name` VARCHAR(100) NULL,
  `role` VARCHAR(100) NULL,
  `salary` DECIMAL(10,2) NULL,
  `emp_phone_number` VARCHAR(100) NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_sales`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_sales`.`bookings` (
  `booking_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NULL,
  `table_number` INT NULL,
  `booking_slot` VARCHAR(45) NULL,
  `bookingscol` DATETIME NULL,
  `employee_id` INT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `customer_fk_idx` (`customer_id` ASC) VISIBLE,
  INDEX `employee_fk_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `customer_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `little_lemon_sales`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `employee_fk`
    FOREIGN KEY (`employee_id`)
    REFERENCES `little_lemon_sales`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_sales`.`menu_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_sales`.`menu_items` (
  `menu_item_id` INT NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(100) NULL,
  `item_type` VARCHAR(100) NULL,
  `item_price` DECIMAL(10,2) NULL,
  PRIMARY KEY (`menu_item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_sales`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_sales`.`menu` (
  `menu_id` INT NOT NULL AUTO_INCREMENT,
  `menu_item_id` INT NULL,
  `cuisine` VARCHAR(100) NULL,
  PRIMARY KEY (`menu_id`),
  INDEX `menu_item_fk_idx` (`menu_item_id` ASC) VISIBLE,
  CONSTRAINT `menu_item_fk`
    FOREIGN KEY (`menu_item_id`)
    REFERENCES `little_lemon_sales`.`menu_items` (`menu_item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_sales`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_sales`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_delivery_id` INT NULL,
  `booking_id` INT NULL,
  `menu_id` INT NULL,
  `quantity` INT NULL,
  `bill_amount` DECIMAL(10,2) NULL,
  `orderscol` VARCHAR(45) NULL,
  PRIMARY KEY (`order_id`),
  INDEX `order_delivery_fk_idx` (`order_delivery_id` ASC) VISIBLE,
  INDEX `booking_fk_idx` (`booking_id` ASC) VISIBLE,
  INDEX `menu_fk_idx` (`menu_id` ASC) VISIBLE,
  CONSTRAINT `order_delivery_fk`
    FOREIGN KEY (`order_delivery_id`)
    REFERENCES `little_lemon_sales`.`order_delivery` (`order_delivery_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `booking_fk`
    FOREIGN KEY (`booking_id`)
    REFERENCES `little_lemon_sales`.`bookings` (`booking_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menu_fk`
    FOREIGN KEY (`menu_id`)
    REFERENCES `little_lemon_sales`.`menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
