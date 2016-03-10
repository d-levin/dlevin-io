-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`users` ;

CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(50) NOT NULL,
  `password` CHAR(40) NOT NULL,
  `salt` BINARY(16) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `mydb`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`categories` ;

-- add unique on name
CREATE TABLE IF NOT EXISTS `mydb`.`categories` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_categories_users` INT(10) UNIQUE UNSIGNED NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_categories_users_idx` (`fk_categories_users` ASC),
  CONSTRAINT `fk_categories_users`
    FOREIGN KEY (`fk_categories_users`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `mydb`.`items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`items` ;

CREATE TABLE IF NOT EXISTS `mydb`.`items` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NULL,
  `img_url` VARCHAR(45) NULL,
  `weight_g` DECIMAL(10) NULL DEFAULT 0,
  `fk_items_categories` INT UNSIGNED NULL,
  `fk_items_users` INT(10) UNSIGNED NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_items_categories_idx` (`fk_items_categories` ASC),
  INDEX `fk_items_users_idx` (`fk_items_users` ASC),
  CONSTRAINT `fk_items_categories`
    FOREIGN KEY (`fk_items_categories`)
    REFERENCES `mydb`.`categories` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_items_users`
    FOREIGN KEY (`fk_items_users`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `mydb`.`lists`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`lists` ;

CREATE TABLE IF NOT EXISTS `mydb`.`lists` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(50) NULL,
  `fk_lists_users` INT(10) UNSIGNED NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lists_users_idx` (`fk_lists_users` ASC),
  CONSTRAINT `fk_lists_users`
    FOREIGN KEY (`fk_lists_users`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `mydb`.`lists_items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`lists_items` ;

CREATE TABLE IF NOT EXISTS `mydb`.`lists_items` (
  `fk_lists_items_lists` INT UNSIGNED NOT NULL,
  `fk_lists_items_items` INT UNSIGNED NULL,
  PRIMARY KEY (`fk_lists_items_lists`),
  INDEX `fk_lists_items_items_idx` (`fk_lists_items_items` ASC),
  CONSTRAINT `fk_lists_items_lists`
    FOREIGN KEY (`fk_lists_items_lists`)
    REFERENCES `mydb`.`lists` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_lists_items_items`
    FOREIGN KEY (`fk_lists_items_items`)
    REFERENCES `mydb`.`items` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);