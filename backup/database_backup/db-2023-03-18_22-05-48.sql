#
# TABLE STRUCTURE FOR: alumni_events
#

DROP TABLE IF EXISTS `alumni_events`;

CREATE TABLE `alumni_events` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `event_notification_message` text NOT NULL,
  `show_onwebsite` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: alumni_students
#

DROP TABLE IF EXISTS `alumni_students`;

CREATE TABLE `alumni_students` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `current_email` varchar(255) NOT NULL,
  `current_phone` varchar(255) NOT NULL,
  `occupation` text NOT NULL,
  `address` text NOT NULL,
  `student_id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `alumni_students_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: attendence_type
#

DROP TABLE IF EXISTS `attendence_type`;

CREATE TABLE `attendence_type` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `key_value` varchar(50) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `attendence_type` (`school_id`, `id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `attendence_type` (`school_id`, `id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 'Late With Excuse', '<b class=\"text text-warning\">E</b>', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `attendence_type` (`school_id`, `id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (2, 3, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `attendence_type` (`school_id`, `id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (2, 4, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `attendence_type` (`school_id`, `id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (2, 5, 'Holiday', 'H', 'yes', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `attendence_type` (`school_id`, `id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (2, 6, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', '2023-02-14 13:11:38', '0000-00-00');


#
# TABLE STRUCTURE FOR: book_issues
#

DROP TABLE IF EXISTS `book_issues`;

CREATE TABLE `book_issues` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `duereturn_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `is_returned` int(11) DEFAULT 0,
  `member_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `book_issues` (`school_id`, `id`, `book_id`, `duereturn_date`, `return_date`, `issue_date`, `is_returned`, `member_id`, `is_active`, `created_at`) VALUES (NULL, 1, 2, '2023-03-12', NULL, '2023-03-12', 0, 1, 'no', '2023-03-12 13:52:05');


#
# TABLE STRUCTURE FOR: books
#

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_title` varchar(100) NOT NULL,
  `book_no` varchar(50) NOT NULL,
  `isbn_no` varchar(100) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `rack_no` varchar(100) NOT NULL,
  `publish` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `perunitcost` float(10,2) DEFAULT NULL,
  `postdate` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `available` varchar(10) DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `books` (`school_id`, `id`, `book_title`, `book_no`, `isbn_no`, `subject`, `rack_no`, `publish`, `author`, `qty`, `perunitcost`, `postdate`, `description`, `available`, `is_active`, `created_at`, `updated_at`) VALUES (1, 1, 'MUHAMMAD', '232', '2324', '43534535', '435345', '3432433', '3435', 3454, '435435.00', '2023-03-12', '435435', 'yes', 'no', '2023-03-12 13:39:45', NULL);
INSERT INTO `books` (`school_id`, `id`, `book_title`, `book_no`, `isbn_no`, `subject`, `rack_no`, `publish`, `author`, `qty`, `perunitcost`, `postdate`, `description`, `available`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 'SDASFSAF', 'FFFFFFFSDFSDF', 'FSDFSD', 'FSFSDF', 'SDFSF', 'FDSFDS', 'SFSSSSSSSSSF', 12, '500.00', '2023-03-12', 'DFSFS', 'yes', 'no', '2023-03-12 13:51:38', NULL);


#
# TABLE STRUCTURE FOR: captcha
#

DROP TABLE IF EXISTS `captcha`;

CREATE TABLE `captcha` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `captcha` (`school_id`, `id`, `name`, `status`, `created_at`) VALUES (2, 1, 'userlogin', 0, '2023-02-26 10:10:19');
INSERT INTO `captcha` (`school_id`, `id`, `name`, `status`, `created_at`) VALUES (2, 2, 'login', 0, '2023-02-14 13:10:09');
INSERT INTO `captcha` (`school_id`, `id`, `name`, `status`, `created_at`) VALUES (2, 3, 'admission', 0, '2023-02-26 10:10:22');
INSERT INTO `captcha` (`school_id`, `id`, `name`, `status`, `created_at`) VALUES (2, 4, 'complain', 0, '2023-02-26 10:10:24');
INSERT INTO `captcha` (`school_id`, `id`, `name`, `status`, `created_at`) VALUES (2, 5, 'contact_us', 0, '2023-02-26 10:10:26');


#
# TABLE STRUCTURE FOR: categories
#

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `categories` (`school_id`, `id`, `category`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 'Orphan Students 2', 'no', '2023-02-16 00:25:13', NULL);
INSERT INTO `categories` (`school_id`, `id`, `category`, `is_active`, `created_at`, `updated_at`) VALUES (1, 2, 'General 1', 'no', '2023-02-16 00:24:40', NULL);


#
# TABLE STRUCTURE FOR: certificates
#

DROP TABLE IF EXISTS `certificates`;

CREATE TABLE `certificates` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certificate_name` varchar(100) NOT NULL,
  `certificate_text` text NOT NULL,
  `left_header` varchar(100) NOT NULL,
  `center_header` varchar(100) NOT NULL,
  `right_header` varchar(100) NOT NULL,
  `left_footer` varchar(100) NOT NULL,
  `right_footer` varchar(100) NOT NULL,
  `center_footer` varchar(100) NOT NULL,
  `background_image` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `created_for` tinyint(1) NOT NULL COMMENT '1 = staff, 2 = students',
  `status` tinyint(1) NOT NULL,
  `header_height` int(11) NOT NULL,
  `content_height` int(11) NOT NULL,
  `footer_height` int(11) NOT NULL,
  `content_width` int(11) NOT NULL,
  `enable_student_image` tinyint(1) NOT NULL COMMENT '0=no,1=yes',
  `enable_image_height` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `certificates` (`school_id`, `id`, `certificate_name`, `certificate_text`, `left_header`, `center_header`, `right_header`, `left_footer`, `right_footer`, `center_footer`, `background_image`, `created_at`, `updated_at`, `created_for`, `status`, `header_height`, `content_height`, `footer_height`, `content_width`, `enable_student_image`, `enable_image_height`) VALUES (2, 1, 'Sample Transfer Certificate', 'This is certify that <b>[name]</b> has born on [dob]  <br> and have following details [present_address] [guardian] [created_at] [admission_no] [roll_no] [class] [section] [gender] [admission_date] [category] [cast] [father_name] [mother_name] [religion] [email] [phone] .<br>We wish best of luck for future endeavors.', 'Reff. No.....1111111.........', 'To Whomever It May Concern', 'Date: _10__/_10__/__2019__', '.................................<br>admin', '.................................<br>principal', '.................................<br>admin', 'certificate-border-beige-ornamental-frame-for-certificate-blank-vector-illustration-2H4KK3A.jpg', '2023-03-17 05:14:55', '0000-00-00', 2, 1, 360, 400, 480, 810, 1, 230);
INSERT INTO `certificates` (`school_id`, `id`, `certificate_name`, `certificate_text`, `left_header`, `center_header`, `right_header`, `left_footer`, `right_footer`, `center_footer`, `background_image`, `created_at`, `updated_at`, `created_for`, `status`, `header_height`, `content_height`, `footer_height`, `content_width`, `enable_student_image`, `enable_image_height`) VALUES (1, 3, 'Sample Transfer Certificate', 'This is certify that <b>[name]</b> has born on [dob]  <br> and have following details [present_address] [guardian] [created_at] [admission_no] [roll_no] [class] [section] [gender] [admission_date] [category] [cast] [father_name] [mother_name] [religion] [email] [phone] .<br>We wish best of luck for future endeavors.', 'Reff. No.....1111111.........', 'To Whomever It May Concern', 'Date: _10__/_10__/__2019__', '.................................<br>admin', '.................................<br>principal', '.................................<br>admin', 'certificate-border-beige-ornamental-frame-for-certificate-blank-vector-illustration-2H4KK3A.jpg', '2023-03-17 05:14:55', '0000-00-00', 2, 1, 360, 400, 480, 810, 1, 230);


#
# TABLE STRUCTURE FOR: chat_connections
#

DROP TABLE IF EXISTS `chat_connections`;

CREATE TABLE `chat_connections` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_user_one` int(11) NOT NULL,
  `chat_user_two` int(11) NOT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_user_one` (`chat_user_one`),
  KEY `chat_user_two` (`chat_user_two`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `chat_connections_ibfk_1` FOREIGN KEY (`chat_user_one`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_connections_ibfk_2` FOREIGN KEY (`chat_user_two`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: chat_messages
#

DROP TABLE IF EXISTS `chat_messages`;

CREATE TABLE `chat_messages` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text DEFAULT NULL,
  `chat_user_id` int(11) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `time` int(11) NOT NULL,
  `is_first` int(1) DEFAULT 0,
  `is_read` int(1) NOT NULL DEFAULT 0,
  `chat_connection_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_user_id` (`chat_user_id`),
  KEY `chat_connection_id` (`chat_connection_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`chat_user_id`) REFERENCES `chat_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_messages_ibfk_2` FOREIGN KEY (`chat_connection_id`) REFERENCES `chat_connections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: chat_users
#

DROP TABLE IF EXISTS `chat_users`;

CREATE TABLE `chat_users` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(20) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `create_staff_id` int(11) DEFAULT NULL,
  `create_student_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `student_id` (`student_id`),
  KEY `create_staff_id` (`create_staff_id`),
  KEY `create_student_id` (`create_student_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `chat_users_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_users_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_users_ibfk_3` FOREIGN KEY (`create_staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `chat_users_ibfk_4` FOREIGN KEY (`create_student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `chat_users` (`school_id`, `id`, `user_type`, `staff_id`, `student_id`, `create_staff_id`, `create_student_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 'staff', 1, NULL, NULL, NULL, 0, '2023-02-14 13:10:09', NULL);


#
# TABLE STRUCTURE FOR: class_sections
#

DROP TABLE IF EXISTS `class_sections`;

CREATE TABLE `class_sections` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  KEY `section_id` (`section_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `class_sections` (`school_id`, `id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 1, 1, 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `class_sections` (`school_id`, `id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 1, 2, 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `class_sections` (`school_id`, `id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 3, 2, 1, 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `class_sections` (`school_id`, `id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 4, 3, 1, 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `class_sections` (`school_id`, `id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 5, 3, 2, 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `class_sections` (`school_id`, `id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 6, 3, 3, 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `class_sections` (`school_id`, `id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 7, 4, 1, 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `class_sections` (`school_id`, `id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 8, 4, 2, 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `class_sections` (`school_id`, `id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 9, 5, 1, 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `class_sections` (`school_id`, `id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 10, 5, 2, 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `class_sections` (`school_id`, `id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 11, 5, 3, 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `class_sections` (`school_id`, `id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 12, 5, 4, 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `class_sections` (`school_id`, `id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 13, 6, 1, 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `class_sections` (`school_id`, `id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 14, 7, 1, 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `class_sections` (`school_id`, `id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (1, 15, 8, 5, 'no', '2023-02-14 13:50:05', NULL);
INSERT INTO `class_sections` (`school_id`, `id`, `class_id`, `section_id`, `is_active`, `created_at`, `updated_at`) VALUES (1, 22, 11, 5, 'no', '2023-02-14 14:01:30', NULL);


#
# TABLE STRUCTURE FOR: class_teacher
#

DROP TABLE IF EXISTS `class_teacher`;

CREATE TABLE `class_teacher` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `class_teacher` (`school_id`, `id`, `class_id`, `staff_id`, `section_id`, `session_id`) VALUES (2, 4, 1, 4, 1, 15);


#
# TABLE STRUCTURE FOR: classes
#

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `classes` (`school_id`, `id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 'One', 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `classes` (`school_id`, `id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 'Two', 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `classes` (`school_id`, `id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (2, 3, 'Three', 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `classes` (`school_id`, `id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (2, 4, '9th', 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `classes` (`school_id`, `id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (2, 5, '10th', 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `classes` (`school_id`, `id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (2, 6, '1st Year', 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `classes` (`school_id`, `id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (2, 7, '2nd Year', 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `classes` (`school_id`, `id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 8, 'one', 'no', '2023-02-14 13:43:59', NULL);
INSERT INTO `classes` (`school_id`, `id`, `class`, `is_active`, `created_at`, `updated_at`) VALUES (1, 11, 'ONE', 'no', '2023-02-14 14:01:30', NULL);


#
# TABLE STRUCTURE FOR: complaint
#

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_type` varchar(255) NOT NULL,
  `source` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `action_taken` varchar(200) NOT NULL,
  `assigned` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `complaint` (`school_id`, `id`, `complaint_type`, `source`, `name`, `contact`, `email`, `date`, `description`, `action_taken`, `assigned`, `note`, `image`) VALUES (NULL, 1, 'Lower Eductation', '', 'unis', '465474', 'finance.panwarunion@gmail.com', '2023-02-25', 'DGRHDRXHD', 'We have taken action', 'Ali', 'fsgsz', 'id1.PNG');
INSERT INTO `complaint` (`school_id`, `id`, `complaint_type`, `source`, `name`, `contact`, `email`, `date`, `description`, `action_taken`, `assigned`, `note`, `image`) VALUES (1, 2, 'General Issues', 'News Paper', 'paid', '53463', '', '2023-02-26', '3453etfs', 'dgfsd', 'gdfhg', 'gdfgd', 'id2.png');


#
# TABLE STRUCTURE FOR: complaint_type
#

DROP TABLE IF EXISTS `complaint_type`;

CREATE TABLE `complaint_type` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_type` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `complaint_type` (`school_id`, `id`, `complaint_type`, `description`, `created_at`) VALUES (2, 1, 'Lower Eductation', '', '2023-02-25 16:51:28');
INSERT INTO `complaint_type` (`school_id`, `id`, `complaint_type`, `description`, `created_at`) VALUES (1, 2, 'General Issues', '', '2023-02-26 09:10:00');


#
# TABLE STRUCTURE FOR: content_for
#

DROP TABLE IF EXISTS `content_for`;

CREATE TABLE `content_for` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `content_id` (`content_id`),
  KEY `user_id` (`user_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `content_for_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_for_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: contents
#

DROP TABLE IF EXISTS `contents`;

CREATE TABLE `contents` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `is_public` varchar(10) DEFAULT 'No',
  `class_id` int(11) DEFAULT NULL,
  `cls_sec_id` int(10) NOT NULL,
  `file` varchar(250) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: custom_field_values
#

DROP TABLE IF EXISTS `custom_field_values`;

CREATE TABLE `custom_field_values` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belong_table_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `field_value` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_field_id` (`custom_field_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `custom_field_values_ibfk_1` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: custom_fields
#

DROP TABLE IF EXISTS `custom_fields`;

CREATE TABLE `custom_fields` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `belong_to` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `bs_column` int(10) DEFAULT NULL,
  `validation` int(11) DEFAULT 0,
  `field_values` text DEFAULT NULL,
  `show_table` varchar(100) DEFAULT NULL,
  `visible_on_table` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: department
#

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `department` (`school_id`, `id`, `department_name`, `is_active`) VALUES (2, 1, 'Administration', 'yes');
INSERT INTO `department` (`school_id`, `id`, `department_name`, `is_active`) VALUES (2, 2, 'Education/Teaching', 'yes');
INSERT INTO `department` (`school_id`, `id`, `department_name`, `is_active`) VALUES (1, 3, 'Education/Teaching', 'yes');


#
# TABLE STRUCTURE FOR: disable_reason
#

DROP TABLE IF EXISTS `disable_reason`;

CREATE TABLE `disable_reason` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `disable_reason` (`school_id`, `id`, `reason`, `created_at`) VALUES (1, 1, 'REASON A', '2023-02-16 00:35:54');
INSERT INTO `disable_reason` (`school_id`, `id`, `reason`, `created_at`) VALUES (2, 2, 'Stuck off', '2023-02-25 20:41:43');
INSERT INTO `disable_reason` (`school_id`, `id`, `reason`, `created_at`) VALUES (2, 3, 'Rules regulation  misuse', '2023-02-25 20:42:10');


#
# TABLE STRUCTURE FOR: dispatch_receive
#

DROP TABLE IF EXISTS `dispatch_receive`;

CREATE TABLE `dispatch_receive` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(50) NOT NULL,
  `to_title` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `note` varchar(500) NOT NULL,
  `from_title` varchar(200) NOT NULL,
  `date` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `dispatch_receive` (`school_id`, `id`, `reference_no`, `to_title`, `address`, `note`, `from_title`, `date`, `image`, `created_at`, `updated_at`, `type`) VALUES (2, 1, '342354', 'FSFS', 'DSAF', 'SFSF', 'TCS', '2023-02-25', 'id1.PNG', '2023-02-25 17:10:53', NULL, 'receive');
INSERT INTO `dispatch_receive` (`school_id`, `id`, `reference_no`, `to_title`, `address`, `note`, `from_title`, `date`, `image`, `created_at`, `updated_at`, `type`) VALUES (2, 3, '33', 'WAJID ALI', 'I-8 ISB', 'DASD', 'UNIS', '2023-02-25', '', '2023-02-25 17:11:25', NULL, 'dispatch');


#
# TABLE STRUCTURE FOR: email_config
#

DROP TABLE IF EXISTS `email_config`;

CREATE TABLE `email_config` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email_type` varchar(100) DEFAULT NULL,
  `smtp_server` varchar(100) DEFAULT NULL,
  `smtp_port` varchar(100) DEFAULT NULL,
  `smtp_username` varchar(100) DEFAULT NULL,
  `smtp_password` varchar(100) DEFAULT NULL,
  `ssl_tls` varchar(100) DEFAULT NULL,
  `smtp_auth` varchar(10) NOT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `email_config` (`school_id`, `id`, `email_type`, `smtp_server`, `smtp_port`, `smtp_username`, `smtp_password`, `ssl_tls`, `smtp_auth`, `is_active`, `created_at`) VALUES (2, 1, 'smtp', 'mail.isdigitalschools.com', '26', 'no-reply@isdigitalschools.com', 'ha;7lCxBA$}4', 'tls', 'true', 'yes', '2023-02-14 13:10:09');


#
# TABLE STRUCTURE FOR: enquiry
#

DROP TABLE IF EXISTS `enquiry`;

CREATE TABLE `enquiry` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `reference` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `note` text NOT NULL,
  `source` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `assigned` varchar(100) NOT NULL,
  `class` int(11) NOT NULL,
  `no_of_child` varchar(11) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `enquiry` (`school_id`, `id`, `name`, `contact`, `address`, `reference`, `date`, `description`, `follow_up_date`, `note`, `source`, `email`, `assigned`, `class`, `no_of_child`, `status`) VALUES (2, 2, 'Muhammad Younis', '03099914748', 'Here', 'Wajid Ali', '2023-02-26', 'We are gets', '2023-02-26', 'sad', 'Online Website', 'unis.panwar@gmail.com', 'as', 1, '12', 'active');


#
# TABLE STRUCTURE FOR: enquiry_type
#

DROP TABLE IF EXISTS `enquiry_type`;

CREATE TABLE `enquiry_type` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enquiry_type` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: events
#

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(200) NOT NULL,
  `event_description` varchar(300) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_type` varchar(100) NOT NULL,
  `event_color` varchar(200) NOT NULL,
  `event_for` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: exam_group_class_batch_exam_students
#

DROP TABLE IF EXISTS `exam_group_class_batch_exam_students`;

CREATE TABLE `exam_group_class_batch_exam_students` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_group_class_batch_exam_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_session_id` int(11) NOT NULL,
  `roll_no` int(6) NOT NULL DEFAULT 0,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_group_class_batch_exam_id` (`exam_group_class_batch_exam_id`),
  KEY `student_id` (`student_id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `exam_group_class_batch_exam_students_ibfk_1` FOREIGN KEY (`exam_group_class_batch_exam_id`) REFERENCES `exam_group_class_batch_exams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_group_class_batch_exam_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_group_class_batch_exam_students_ibfk_3` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `exam_group_class_batch_exam_students` (`school_id`, `id`, `exam_group_class_batch_exam_id`, `student_id`, `student_session_id`, `roll_no`, `is_active`, `created_at`, `updated_at`) VALUES (2, 37, 3, 22, 22, 100001, 0, '2023-02-26 08:06:30', NULL);
INSERT INTO `exam_group_class_batch_exam_students` (`school_id`, `id`, `exam_group_class_batch_exam_id`, `student_id`, `student_session_id`, `roll_no`, `is_active`, `created_at`, `updated_at`) VALUES (2, 38, 3, 47, 47, 100002, 0, '2023-02-26 08:06:30', NULL);
INSERT INTO `exam_group_class_batch_exam_students` (`school_id`, `id`, `exam_group_class_batch_exam_id`, `student_id`, `student_session_id`, `roll_no`, `is_active`, `created_at`, `updated_at`) VALUES (2, 39, 3, 49, 49, 100003, 0, '2023-02-26 08:06:30', NULL);
INSERT INTO `exam_group_class_batch_exam_students` (`school_id`, `id`, `exam_group_class_batch_exam_id`, `student_id`, `student_session_id`, `roll_no`, `is_active`, `created_at`, `updated_at`) VALUES (2, 40, 3, 57, 57, 100004, 0, '2023-02-26 08:06:30', NULL);


#
# TABLE STRUCTURE FOR: exam_group_class_batch_exam_subjects
#

DROP TABLE IF EXISTS `exam_group_class_batch_exam_subjects`;

CREATE TABLE `exam_group_class_batch_exam_subjects` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_group_class_batch_exams_id` int(11) DEFAULT NULL,
  `subject_id` int(10) NOT NULL,
  `date_from` date NOT NULL,
  `time_from` time NOT NULL,
  `duration` varchar(50) NOT NULL,
  `room_no` varchar(100) DEFAULT NULL,
  `max_marks` float(10,2) DEFAULT NULL,
  `min_marks` float(10,2) DEFAULT NULL,
  `credit_hours` float(10,2) DEFAULT 0.00,
  `date_to` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_group_class_batch_exams_id` (`exam_group_class_batch_exams_id`),
  KEY `subject_id` (`subject_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `exam_group_class_batch_exam_subjects_ibfk_1` FOREIGN KEY (`exam_group_class_batch_exams_id`) REFERENCES `exam_group_class_batch_exams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_group_class_batch_exam_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `exam_group_class_batch_exam_subjects` (`school_id`, `id`, `exam_group_class_batch_exams_id`, `subject_id`, `date_from`, `time_from`, `duration`, `room_no`, `max_marks`, `min_marks`, `credit_hours`, `date_to`, `is_active`, `created_at`, `updated_at`) VALUES (2, 9, 3, 1, '2023-02-25', '12:00:00', '30', '32', '100.00', '30.00', '1.00', NULL, 0, '2023-02-26 07:35:27', NULL);
INSERT INTO `exam_group_class_batch_exam_subjects` (`school_id`, `id`, `exam_group_class_batch_exams_id`, `subject_id`, `date_from`, `time_from`, `duration`, `room_no`, `max_marks`, `min_marks`, `credit_hours`, `date_to`, `is_active`, `created_at`, `updated_at`) VALUES (2, 10, 3, 2, '2023-02-26', '23:34:40', '30', '34', '100.00', '30.00', '1.00', NULL, 0, '2023-02-26 07:35:27', NULL);
INSERT INTO `exam_group_class_batch_exam_subjects` (`school_id`, `id`, `exam_group_class_batch_exams_id`, `subject_id`, `date_from`, `time_from`, `duration`, `room_no`, `max_marks`, `min_marks`, `credit_hours`, `date_to`, `is_active`, `created_at`, `updated_at`) VALUES (2, 11, 3, 3, '2023-02-27', '23:34:44', '30', '37', '100.00', '30.00', '1.00', NULL, 0, '2023-02-26 07:35:27', NULL);


#
# TABLE STRUCTURE FOR: exam_group_class_batch_exams
#

DROP TABLE IF EXISTS `exam_group_class_batch_exams`;

CREATE TABLE `exam_group_class_batch_exams` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam` varchar(250) DEFAULT NULL,
  `session_id` int(10) NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `exam_group_id` int(11) DEFAULT NULL,
  `is_publish` int(1) DEFAULT 0,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_group_id` (`exam_group_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `exam_group_class_batch_exams_ibfk_1` FOREIGN KEY (`exam_group_id`) REFERENCES `exam_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `exam_group_class_batch_exams` (`school_id`, `id`, `exam`, `session_id`, `date_from`, `date_to`, `description`, `exam_group_id`, `is_publish`, `is_active`, `created_at`, `updated_at`) VALUES (2, 3, 'FY-2020', 15, NULL, NULL, 'FYP', 3, 1, 1, '2023-02-26 07:47:57', NULL);
INSERT INTO `exam_group_class_batch_exams` (`school_id`, `id`, `exam`, `session_id`, `date_from`, `date_to`, `description`, `exam_group_id`, `is_publish`, `is_active`, `created_at`, `updated_at`) VALUES (1, 4, 'general', 26, NULL, NULL, '', 4, 0, 1, '2023-03-01 10:58:07', NULL);


#
# TABLE STRUCTURE FOR: exam_group_exam_connections
#

DROP TABLE IF EXISTS `exam_group_exam_connections`;

CREATE TABLE `exam_group_exam_connections` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_group_id` int(11) DEFAULT NULL,
  `exam_group_class_batch_exams_id` int(11) DEFAULT NULL,
  `exam_weightage` float(10,2) DEFAULT 0.00,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_group_id` (`exam_group_id`),
  KEY `exam_group_class_batch_exams_id` (`exam_group_class_batch_exams_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `exam_group_exam_connections_ibfk_1` FOREIGN KEY (`exam_group_id`) REFERENCES `exam_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_group_exam_connections_ibfk_2` FOREIGN KEY (`exam_group_class_batch_exams_id`) REFERENCES `exam_group_class_batch_exams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: exam_group_exam_results
#

DROP TABLE IF EXISTS `exam_group_exam_results`;

CREATE TABLE `exam_group_exam_results` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_group_class_batch_exam_student_id` int(11) NOT NULL,
  `exam_group_class_batch_exam_subject_id` int(11) DEFAULT NULL,
  `attendence` varchar(10) DEFAULT NULL,
  `get_marks` float(10,2) DEFAULT 0.00,
  `note` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `exam_group_student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_group_class_batch_exam_subject_id` (`exam_group_class_batch_exam_subject_id`),
  KEY `exam_group_student_id` (`exam_group_student_id`),
  KEY `exam_group_class_batch_exam_student_id` (`exam_group_class_batch_exam_student_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `exam_group_exam_results_ibfk_1` FOREIGN KEY (`exam_group_class_batch_exam_subject_id`) REFERENCES `exam_group_class_batch_exam_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_group_exam_results_ibfk_2` FOREIGN KEY (`exam_group_student_id`) REFERENCES `exam_group_students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_group_exam_results_ibfk_3` FOREIGN KEY (`exam_group_class_batch_exam_student_id`) REFERENCES `exam_group_class_batch_exam_students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `exam_group_exam_results` (`school_id`, `id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`, `exam_group_student_id`) VALUES (2, 5, 37, 9, 'present', '60.00', '', 0, '2023-02-26 07:46:28', NULL, NULL);
INSERT INTO `exam_group_exam_results` (`school_id`, `id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`, `exam_group_student_id`) VALUES (2, 6, 38, 9, 'present', '90.00', '', 0, '2023-02-26 07:46:28', NULL, NULL);
INSERT INTO `exam_group_exam_results` (`school_id`, `id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`, `exam_group_student_id`) VALUES (2, 7, 39, 9, 'present', '43.00', '', 0, '2023-02-26 07:46:28', NULL, NULL);
INSERT INTO `exam_group_exam_results` (`school_id`, `id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`, `exam_group_student_id`) VALUES (2, 8, 40, 9, 'absent', '0.00', '', 0, '2023-02-26 07:46:28', NULL, NULL);
INSERT INTO `exam_group_exam_results` (`school_id`, `id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`, `exam_group_student_id`) VALUES (2, 9, 37, 10, 'absent', '0.00', '', 0, '2023-02-26 07:47:10', NULL, NULL);
INSERT INTO `exam_group_exam_results` (`school_id`, `id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`, `exam_group_student_id`) VALUES (2, 10, 38, 10, 'absent', '0.00', '', 0, '2023-02-26 07:47:10', NULL, NULL);
INSERT INTO `exam_group_exam_results` (`school_id`, `id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`, `exam_group_student_id`) VALUES (2, 11, 39, 10, 'present', '56.00', '', 0, '2023-02-26 07:47:10', NULL, NULL);
INSERT INTO `exam_group_exam_results` (`school_id`, `id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`, `exam_group_student_id`) VALUES (2, 12, 40, 10, 'present', '33.00', '', 0, '2023-02-26 07:47:10', NULL, NULL);
INSERT INTO `exam_group_exam_results` (`school_id`, `id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`, `exam_group_student_id`) VALUES (2, 13, 37, 11, 'present', '33.00', '', 0, '2023-02-26 07:47:34', NULL, NULL);
INSERT INTO `exam_group_exam_results` (`school_id`, `id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`, `exam_group_student_id`) VALUES (2, 14, 38, 11, 'present', '54.00', '', 0, '2023-02-26 07:47:34', NULL, NULL);
INSERT INTO `exam_group_exam_results` (`school_id`, `id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`, `exam_group_student_id`) VALUES (2, 15, 39, 11, 'present', '35.00', '', 0, '2023-02-26 07:47:34', NULL, NULL);
INSERT INTO `exam_group_exam_results` (`school_id`, `id`, `exam_group_class_batch_exam_student_id`, `exam_group_class_batch_exam_subject_id`, `attendence`, `get_marks`, `note`, `is_active`, `created_at`, `updated_at`, `exam_group_student_id`) VALUES (2, 16, 40, 11, 'present', '22.00', '', 0, '2023-02-26 07:47:34', NULL, NULL);


#
# TABLE STRUCTURE FOR: exam_group_students
#

DROP TABLE IF EXISTS `exam_group_students`;

CREATE TABLE `exam_group_students` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_group_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `student_session_id` int(10) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_group_id` (`exam_group_id`),
  KEY `student_id` (`student_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `exam_group_students_ibfk_1` FOREIGN KEY (`exam_group_id`) REFERENCES `exam_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exam_group_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: exam_groups
#

DROP TABLE IF EXISTS `exam_groups`;

CREATE TABLE `exam_groups` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `exam_type` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `exam_groups` (`school_id`, `id`, `name`, `exam_type`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (2, 3, 'Final Year Exam', 'basic_system', 'FYE-2020', 0, '2023-02-26 06:49:38', NULL);
INSERT INTO `exam_groups` (`school_id`, `id`, `name`, `exam_type`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (1, 4, 'fy23', 'school_grade_system', 'ok', 0, '2023-03-01 10:57:44', NULL);


#
# TABLE STRUCTURE FOR: exam_results
#

DROP TABLE IF EXISTS `exam_results`;

CREATE TABLE `exam_results` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendence` varchar(10) NOT NULL,
  `exam_schedule_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `get_marks` float(10,2) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_schedule_id` (`exam_schedule_id`),
  KEY `student_id` (`student_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: exam_schedules
#

DROP TABLE IF EXISTS `exam_schedules`;

CREATE TABLE `exam_schedules` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `teacher_subject_id` int(11) DEFAULT NULL,
  `date_of_exam` date DEFAULT NULL,
  `start_to` varchar(50) DEFAULT NULL,
  `end_from` varchar(50) DEFAULT NULL,
  `room_no` varchar(50) DEFAULT NULL,
  `full_marks` int(11) DEFAULT NULL,
  `passing_marks` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_subject_id` (`teacher_subject_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: exams
#

DROP TABLE IF EXISTS `exams`;

CREATE TABLE `exams` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `sesion_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: expense_head
#

DROP TABLE IF EXISTS `expense_head`;

CREATE TABLE `expense_head` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_category` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `expense_head` (`school_id`, `id`, `exp_category`, `description`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES (2, 1, 'Electricity Bills', 'sasa', 'yes', 'no', '2023-02-25 16:20:00', NULL);


#
# TABLE STRUCTURE FOR: expenses
#

DROP TABLE IF EXISTS `expenses`;

CREATE TABLE `expenses` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exp_head_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `expenses` (`school_id`, `id`, `exp_head_id`, `name`, `invoice_no`, `date`, `amount`, `documents`, `note`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES (2, 2, 1, 'MEPCO', '12157130588832', '2023-02-25', '1200.00', 'uploads/school_expense/2.PNG', 'DSFS', 'yes', 'no', '2023-02-25 16:26:03', NULL);


#
# TABLE STRUCTURE FOR: fee_groups
#

DROP TABLE IF EXISTS `fee_groups`;

CREATE TABLE `fee_groups` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `is_system` int(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `fee_groups` (`school_id`, `id`, `name`, `is_system`, `description`, `is_active`, `created_at`) VALUES (1, 3, 'GENERAL 1', 0, '', 'no', '2023-02-16 00:15:41');
INSERT INTO `fee_groups` (`school_id`, `id`, `name`, `is_system`, `description`, `is_active`, `created_at`) VALUES (2, 4, 'General 2', 0, '', 'no', '2023-02-16 00:15:11');


#
# TABLE STRUCTURE FOR: fee_groups_feetype
#

DROP TABLE IF EXISTS `fee_groups_feetype`;

CREATE TABLE `fee_groups_feetype` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fee_session_group_id` int(11) DEFAULT NULL,
  `fee_groups_id` int(11) DEFAULT NULL,
  `feetype_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `fine_type` varchar(50) NOT NULL DEFAULT 'none',
  `due_date` date DEFAULT NULL,
  `fine_percentage` float(10,2) NOT NULL DEFAULT 0.00,
  `fine_amount` float(10,2) NOT NULL DEFAULT 0.00,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fee_session_group_id` (`fee_session_group_id`),
  KEY `fee_groups_id` (`fee_groups_id`),
  KEY `feetype_id` (`feetype_id`),
  KEY `session_id` (`session_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `fee_groups_feetype_ibfk_1` FOREIGN KEY (`fee_session_group_id`) REFERENCES `fee_session_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_groups_feetype_ibfk_2` FOREIGN KEY (`fee_groups_id`) REFERENCES `fee_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_groups_feetype_ibfk_3` FOREIGN KEY (`feetype_id`) REFERENCES `feetype` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_groups_feetype_ibfk_4` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `fee_groups_feetype` (`school_id`, `id`, `fee_session_group_id`, `fee_groups_id`, `feetype_id`, `session_id`, `amount`, `fine_type`, `due_date`, `fine_percentage`, `fine_amount`, `is_active`, `created_at`) VALUES (1, 6, 6, 3, 3, 15, '200.00', 'none', '2023-02-18', '0.00', '0.00', 'no', '2023-02-16 00:20:06');
INSERT INTO `fee_groups_feetype` (`school_id`, `id`, `fee_session_group_id`, `fee_groups_id`, `feetype_id`, `session_id`, `amount`, `fine_type`, `due_date`, `fine_percentage`, `fine_amount`, `is_active`, `created_at`) VALUES (2, 7, 7, 4, 1, 15, '300.00', 'none', '2023-02-18', '0.00', '0.00', 'no', '2023-02-16 00:20:38');
INSERT INTO `fee_groups_feetype` (`school_id`, `id`, `fee_session_group_id`, `fee_groups_id`, `feetype_id`, `session_id`, `amount`, `fine_type`, `due_date`, `fine_percentage`, `fine_amount`, `is_active`, `created_at`) VALUES (2, 9, 7, 4, 4, 15, '2500.00', 'none', '2023-03-01', '0.00', '0.00', 'no', '2023-02-25 18:45:16');
INSERT INTO `fee_groups_feetype` (`school_id`, `id`, `fee_session_group_id`, `fee_groups_id`, `feetype_id`, `session_id`, `amount`, `fine_type`, `due_date`, `fine_percentage`, `fine_amount`, `is_active`, `created_at`) VALUES (1, 10, 9, 3, 3, 26, '1500.00', 'percentage', '2023-03-15', '2.00', '30.00', 'no', '2023-03-01 10:53:55');


#
# TABLE STRUCTURE FOR: fee_receipt_no
#

DROP TABLE IF EXISTS `fee_receipt_no`;

CREATE TABLE `fee_receipt_no` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: fee_session_groups
#

DROP TABLE IF EXISTS `fee_session_groups`;

CREATE TABLE `fee_session_groups` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fee_groups_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fee_groups_id` (`fee_groups_id`),
  KEY `session_id` (`session_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `fee_session_groups_ibfk_1` FOREIGN KEY (`fee_groups_id`) REFERENCES `fee_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fee_session_groups_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `fee_session_groups` (`school_id`, `id`, `fee_groups_id`, `session_id`, `is_active`, `created_at`) VALUES (1, 6, 3, 15, 'no', '2023-02-16 00:20:06');
INSERT INTO `fee_session_groups` (`school_id`, `id`, `fee_groups_id`, `session_id`, `is_active`, `created_at`) VALUES (2, 7, 4, 15, 'no', '2023-02-16 00:20:38');
INSERT INTO `fee_session_groups` (`school_id`, `id`, `fee_groups_id`, `session_id`, `is_active`, `created_at`) VALUES (1, 9, 3, 26, 'no', '2023-03-01 10:53:55');


#
# TABLE STRUCTURE FOR: feecategory
#

DROP TABLE IF EXISTS `feecategory`;

CREATE TABLE `feecategory` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: feemasters
#

DROP TABLE IF EXISTS `feemasters`;

CREATE TABLE `feemasters` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `feetype_id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: fees_discounts
#

DROP TABLE IF EXISTS `fees_discounts`;

CREATE TABLE `fees_discounts` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `fees_discounts_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `fees_discounts` (`school_id`, `id`, `session_id`, `name`, `code`, `amount`, `description`, `is_active`, `created_at`) VALUES (NULL, 1, 15, 'Discount', 'DIST', '25.00', '', 'no', '2023-02-15 23:11:18');
INSERT INTO `fees_discounts` (`school_id`, `id`, `session_id`, `name`, `code`, `amount`, `description`, `is_active`, `created_at`) VALUES (2, 2, 15, 'Discount DEMO 2', 'DIST', '25.00', '', 'no', '2023-02-16 00:06:22');
INSERT INTO `fees_discounts` (`school_id`, `id`, `session_id`, `name`, `code`, `amount`, `description`, `is_active`, `created_at`) VALUES (1, 3, 15, 'DISCOUNT demo 1', 'DIS', '5.00', '', 'no', '2023-02-16 00:06:05');


#
# TABLE STRUCTURE FOR: fees_reminder
#

DROP TABLE IF EXISTS `fees_reminder`;

CREATE TABLE `fees_reminder` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reminder_type` varchar(10) DEFAULT NULL,
  `day` int(2) DEFAULT NULL,
  `is_active` int(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `fees_reminder` (`school_id`, `id`, `reminder_type`, `day`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 'before', 2, 1, '2023-02-15 23:16:47', NULL);
INSERT INTO `fees_reminder` (`school_id`, `id`, `reminder_type`, `day`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 'before', 5, 1, '2023-02-15 23:16:47', NULL);
INSERT INTO `fees_reminder` (`school_id`, `id`, `reminder_type`, `day`, `is_active`, `created_at`, `updated_at`) VALUES (2, 3, 'after', 2, 1, '2023-02-15 23:16:47', NULL);
INSERT INTO `fees_reminder` (`school_id`, `id`, `reminder_type`, `day`, `is_active`, `created_at`, `updated_at`) VALUES (2, 4, 'after', 5, 1, '2023-02-15 23:16:47', NULL);


#
# TABLE STRUCTURE FOR: feetype
#

DROP TABLE IF EXISTS `feetype`;

CREATE TABLE `feetype` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_system` int(1) NOT NULL DEFAULT 0,
  `feecategory_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `feetype` (`school_id`, `id`, `is_system`, `feecategory_id`, `type`, `code`, `is_active`, `created_at`, `updated_at`, `description`) VALUES (2, 1, 0, NULL, 'Books Fee', 'BKF', 'no', '2023-02-15 23:08:55', NULL, '');
INSERT INTO `feetype` (`school_id`, `id`, `is_system`, `feecategory_id`, `type`, `code`, `is_active`, `created_at`, `updated_at`, `description`) VALUES (NULL, 2, 1, NULL, 'Previous Session Balance', 'Previous Session Balance', 'no', '2023-02-15 23:16:31', NULL, '');
INSERT INTO `feetype` (`school_id`, `id`, `is_system`, `feecategory_id`, `type`, `code`, `is_active`, `created_at`, `updated_at`, `description`) VALUES (1, 3, 0, NULL, 'Tution', 'TU', 'no', '2023-02-16 00:05:32', NULL, '');
INSERT INTO `feetype` (`school_id`, `id`, `is_system`, `feecategory_id`, `type`, `code`, `is_active`, `created_at`, `updated_at`, `description`) VALUES (2, 4, 0, NULL, 'Tution Fee', 'TF', 'no', '2023-02-25 18:44:55', NULL, '');


#
# TABLE STRUCTURE FOR: filetypes
#

DROP TABLE IF EXISTS `filetypes`;

CREATE TABLE `filetypes` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_extension` text DEFAULT NULL,
  `file_mime` text DEFAULT NULL,
  `file_size` int(11) NOT NULL,
  `image_extension` text DEFAULT NULL,
  `image_mime` text DEFAULT NULL,
  `image_size` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `filetypes` (`school_id`, `id`, `file_extension`, `file_mime`, `file_size`, `image_extension`, `image_mime`, `image_size`, `created_at`) VALUES (2, 1, 'pdf, zip, jpg, jpeg, png, txt, 7z, gif, csv, docx, mp3, mp4, accdb, odt, ods, ppt, pptx, xlsx, wmv, jfif, apk, ppt, bmp, jpe, mdb, rar, xls, svg', 'application/pdf, image/zip, image/jpg, image/gif, image/png, image/jpeg, text/plain, application/x-zip-compressed, application/zip, image/gif, text/csv, application/vnd.openxmlformats-officedocument.wordprocessingml.document, audio/mpeg, application/msaccess, application/vnd.oasis.opendocument.text, application/vnd.oasis.opendocument.spreadsheet, application/vnd.ms-powerpoint, application/vnd.openxmlformats-officedocument.presentationml.presentation, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, video/x-ms-wmv, video/mp4, image/jpeg, application/vnd.android.package-archive, application/x-msdownload, application/vnd.ms-powerpoint, image/bmp, image/jpeg, application/msaccess, application/vnd.ms-excel, image/svg+xml', 100048576, 'jfif, png, jpe, jpeg, jpg, bmp, gif, svg', 'image/jpeg, image/png, image/jpeg, image/jpeg, image/bmp, image/gif, image/x-ms-bmp, image/svg+xml', 10048576, '2023-02-14 13:10:09');


#
# TABLE STRUCTURE FOR: follow_up
#

DROP TABLE IF EXISTS `follow_up`;

CREATE TABLE `follow_up` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enquiry_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `next_date` date NOT NULL,
  `response` text NOT NULL,
  `note` text NOT NULL,
  `followup_by` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `follow_up` (`school_id`, `id`, `enquiry_id`, `date`, `next_date`, `response`, `note`, `followup_by`) VALUES (NULL, 1, 1, '2023-02-16', '2023-02-24', 'Hello', '', 'Unis 2');
INSERT INTO `follow_up` (`school_id`, `id`, `enquiry_id`, `date`, `next_date`, `response`, `note`, `followup_by`) VALUES (2, 2, 2, '2023-02-26', '2023-02-28', 'asdafd', '', 'Unis 2');


#
# TABLE STRUCTURE FOR: front_cms_media_gallery
#

DROP TABLE IF EXISTS `front_cms_media_gallery`;

CREATE TABLE `front_cms_media_gallery` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(300) DEFAULT NULL,
  `thumb_path` varchar(300) DEFAULT NULL,
  `dir_path` varchar(300) DEFAULT NULL,
  `img_name` varchar(300) DEFAULT NULL,
  `thumb_name` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `file_type` varchar(100) NOT NULL,
  `file_size` varchar(100) NOT NULL,
  `vid_url` text NOT NULL,
  `vid_title` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: front_cms_menu_items
#

DROP TABLE IF EXISTS `front_cms_menu_items`;

CREATE TABLE `front_cms_menu_items` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `menu` varchar(100) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `ext_url` text DEFAULT NULL,
  `open_new_tab` int(11) DEFAULT 0,
  `ext_url_link` text DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `publish` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `front_cms_menu_items` (`school_id`, `id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (2, 1, 1, 'Home', 1, 0, NULL, NULL, NULL, 'home', 1, 0, NULL, 'no', '2023-02-14 13:11:38');
INSERT INTO `front_cms_menu_items` (`school_id`, `id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (2, 2, 1, 'Contact Us', 76, 0, NULL, NULL, NULL, 'contact-us', 4, 0, NULL, 'no', '2023-02-14 13:11:38');
INSERT INTO `front_cms_menu_items` (`school_id`, `id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (2, 3, 1, 'Complain', 2, 0, NULL, NULL, NULL, 'complain', 3, 0, NULL, 'no', '2023-02-14 13:11:38');
INSERT INTO `front_cms_menu_items` (`school_id`, `id`, `menu_id`, `menu`, `page_id`, `parent_id`, `ext_url`, `open_new_tab`, `ext_url_link`, `slug`, `weight`, `publish`, `description`, `is_active`, `created_at`) VALUES (2, 4, 1, 'Admission', 0, 0, '1', NULL, 'http://yourschoolurl.com/online_admission', 'admssion', 2, 0, NULL, 'no', '2023-02-14 13:11:38');


#
# TABLE STRUCTURE FOR: front_cms_menus
#

DROP TABLE IF EXISTS `front_cms_menus`;

CREATE TABLE `front_cms_menus` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(100) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `open_new_tab` int(10) NOT NULL DEFAULT 0,
  `ext_url` text NOT NULL,
  `ext_url_link` text NOT NULL,
  `publish` int(11) NOT NULL DEFAULT 0,
  `content_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `front_cms_menus` (`school_id`, `id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES (2, 1, 'Main Menu', 'main-menu', 'Main menu', 0, '', '', 0, 'default', 'no', '2023-02-14 13:10:09');
INSERT INTO `front_cms_menus` (`school_id`, `id`, `menu`, `slug`, `description`, `open_new_tab`, `ext_url`, `ext_url_link`, `publish`, `content_type`, `is_active`, `created_at`) VALUES (2, 2, 'Bottom Menu', 'bottom-menu', 'Bottom Menu', 0, '', '', 0, 'default', 'no', '2023-02-14 13:10:09');


#
# TABLE STRUCTURE FOR: front_cms_page_contents
#

DROP TABLE IF EXISTS `front_cms_page_contents`;

CREATE TABLE `front_cms_page_contents` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `front_cms_page_contents_ibfk_1` FOREIGN KEY (`page_id`) REFERENCES `front_cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: front_cms_pages
#

DROP TABLE IF EXISTS `front_cms_pages`;

CREATE TABLE `front_cms_pages` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_type` varchar(10) NOT NULL DEFAULT 'manual',
  `is_homepage` int(1) DEFAULT 0,
  `title` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `feature_image` varchar(200) NOT NULL,
  `description` longtext DEFAULT NULL,
  `publish_date` date NOT NULL,
  `publish` int(10) DEFAULT 0,
  `sidebar` int(10) DEFAULT 0,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `front_cms_pages` (`school_id`, `id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (2, 1, 'default', 1, 'Home', 'page/home', 'page', 'home', '', '', '', '', '<p><strong>Welcome to Our School&nbsp;</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>', '0000-00-00', 1, NULL, 'no', '2023-02-26 05:51:23');
INSERT INTO `front_cms_pages` (`school_id`, `id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (2, 2, 'default', 0, 'Complain', 'page/complain', 'page', 'complain', 'Complain form', '                                                                                                                                                                                    complain form                                                                                                                                                                                                                                ', 'complain form', '', '<p>[form-builder:complain]</p>', '0000-00-00', 1, NULL, 'no', '2023-02-14 13:11:38');
INSERT INTO `front_cms_pages` (`school_id`, `id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (2, 54, 'default', 0, '404 page', 'page/404-page', 'page', '404-page', '', '                                ', '', '', '<html>\r\n<head>\r\n <title></title>\r\n</head>\r\n<body>\r\n<p>404 page found</p>\r\n</body>\r\n</html>', '0000-00-00', 0, NULL, 'no', '2023-02-14 13:11:38');
INSERT INTO `front_cms_pages` (`school_id`, `id`, `page_type`, `is_homepage`, `title`, `url`, `type`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `description`, `publish_date`, `publish`, `sidebar`, `is_active`, `created_at`) VALUES (2, 76, 'default', 0, 'Contact us', 'page/contact-us', 'page', 'contact-us', '', '', '', '', '<section class=\"contact\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<h2 class=\"col-md-12 col-sm-12\">Send In Your Query</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<div class=\"col-md-12 col-sm-12\">[form-builder:contact_us]<!--./row--></div>\r\n<!--./col-md-12--></div>\r\n<!--./row--></div>\r\n<!--./container--></section>\r\n\r\n<div class=\"col-md-4 col-sm-4\">\r\n<div class=\"contact-item\"><img src=\"http://192.168.1.81/repos/smartschool/uploads/gallery/media/pin.svg\" />\r\n<h3>Our Location</h3>\r\n\r\n<p>350 Fifth Avenue, 34th floor New York NY 10118-3299 USA</p>\r\n</div>\r\n<!--./contact-item--></div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-4 col-sm-4\">\r\n<div class=\"contact-item\"><img src=\"http://192.168.1.81/repos/smartschool/uploads/gallery/media/phone.svg\" />\r\n<h3>CALL US</h3>\r\n\r\n<p>E-mail : info@abcschool.com</p>\r\n\r\n<p>Mobile : +91-9009987654</p>\r\n</div>\r\n<!--./contact-item--></div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-4 col-sm-4\">\r\n<div class=\"contact-item\"><img src=\"http://192.168.1.81/repos/smartschool/uploads/gallery/media/clock.svg\" />\r\n<h3>Working Hours</h3>\r\n\r\n<p>Mon-Fri : 9 am to 5 pm</p>\r\n\r\n<p>Sat : 9 am to 3 pm</p>\r\n</div>\r\n<!--./contact-item--></div>\r\n<!--./col-md-4-->\r\n\r\n<div class=\"col-md-12 col-sm-12\">\r\n<div class=\"mapWrapper fullwidth\"><iframe frameborder=\"0\" height=\"500\" marginheight=\"0\" marginwidth=\"0\" scrolling=\"no\" src=\"http://maps.google.com/maps?f=q&source=s_q&hl=EN&q=time+square&aq=&sll=40.716558,-73.931122&sspn=0.40438,1.056747&ie=UTF8&rq=1&ev=p&split=1&radius=33.22&hq=time+square&hnear=&ll=37.061753,-95.677185&spn=0.438347,0.769043&z=9&output=embed\" width=\"100%\"></iframe></div>\r\n</div>', '0000-00-00', 0, NULL, 'no', '2023-02-14 13:11:38');


#
# TABLE STRUCTURE FOR: front_cms_program_photos
#

DROP TABLE IF EXISTS `front_cms_program_photos`;

CREATE TABLE `front_cms_program_photos` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT NULL,
  `media_gallery_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `program_id` (`program_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `front_cms_program_photos_ibfk_1` FOREIGN KEY (`program_id`) REFERENCES `front_cms_programs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: front_cms_programs
#

DROP TABLE IF EXISTS `front_cms_programs`;

CREATE TABLE `front_cms_programs` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `event_start` date DEFAULT NULL,
  `event_end` date DEFAULT NULL,
  `event_venue` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `meta_title` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `feature_image` text NOT NULL,
  `publish_date` date NOT NULL,
  `publish` varchar(10) DEFAULT '0',
  `sidebar` int(10) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `front_cms_programs` (`school_id`, `id`, `type`, `slug`, `url`, `title`, `date`, `event_start`, `event_end`, `event_venue`, `description`, `is_active`, `created_at`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `publish_date`, `publish`, `sidebar`) VALUES (1, 6, 'notice', 'demo-programs-here', 'read/demo-programs-here', 'DEMO PROGRAMS HERE', '2023-02-16', NULL, NULL, NULL, '<p>SDSFSDF</p>', 'no', '2023-02-15 22:01:36', '', '', '', '', '0000-00-00', '0', NULL);
INSERT INTO `front_cms_programs` (`school_id`, `id`, `type`, `slug`, `url`, `title`, `date`, `event_start`, `event_end`, `event_venue`, `description`, `is_active`, `created_at`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `publish_date`, `publish`, `sidebar`) VALUES (2, 7, 'notice', 'demo-2', 'read/demo-2', 'DEMO 2', '2023-02-16', NULL, NULL, NULL, '<p>XASCDASC</p>', 'no', '2023-02-15 22:02:35', '', '', '', '', '0000-00-00', '0', 1);
INSERT INTO `front_cms_programs` (`school_id`, `id`, `type`, `slug`, `url`, `title`, `date`, `event_start`, `event_end`, `event_venue`, `description`, `is_active`, `created_at`, `meta_title`, `meta_description`, `meta_keyword`, `feature_image`, `publish_date`, `publish`, `sidebar`) VALUES (2, 8, 'events', 'asas', 'read/asas', 'asas', NULL, '2023-03-19', '2023-03-19', 'asdad', '<p>asdad</p>', 'no', '2023-03-18 21:24:22', '', '', '', '', '0000-00-00', '0', NULL);


#
# TABLE STRUCTURE FOR: front_cms_settings
#

DROP TABLE IF EXISTS `front_cms_settings`;

CREATE TABLE `front_cms_settings` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(50) DEFAULT NULL,
  `is_active_rtl` int(10) DEFAULT 0,
  `is_active_front_cms` int(11) DEFAULT 0,
  `is_active_sidebar` int(1) DEFAULT 0,
  `logo` varchar(200) DEFAULT NULL,
  `contact_us_email` varchar(100) DEFAULT NULL,
  `complain_form_email` varchar(100) DEFAULT NULL,
  `sidebar_options` text NOT NULL,
  `whatsapp_url` varchar(255) NOT NULL,
  `fb_url` varchar(200) NOT NULL,
  `twitter_url` varchar(200) NOT NULL,
  `youtube_url` varchar(200) NOT NULL,
  `google_plus` varchar(200) NOT NULL,
  `instagram_url` varchar(200) NOT NULL,
  `pinterest_url` varchar(200) NOT NULL,
  `linkedin_url` varchar(200) NOT NULL,
  `google_analytics` text DEFAULT NULL,
  `footer_text` varchar(500) DEFAULT NULL,
  `fav_icon` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `front_cms_settings` (`school_id`, `id`, `theme`, `is_active_rtl`, `is_active_front_cms`, `is_active_sidebar`, `logo`, `contact_us_email`, `complain_form_email`, `sidebar_options`, `whatsapp_url`, `fb_url`, `twitter_url`, `youtube_url`, `google_plus`, `instagram_url`, `pinterest_url`, `linkedin_url`, `google_analytics`, `footer_text`, `fav_icon`, `created_at`) VALUES (2, 1, 'material_pink', NULL, 1, 1, './uploads/school_content/logo/front_logo-63ed4e9071f2c1.41729375.jpg', '', '', '[\"news\",\"complain\"]', 'https://wa.me/923455518903', 'https://wa.me/923455518903', 'https://wa.me/923455518903', 'https://wa.me/923455518903', 'https://wa.me/923455518903', 'https://wa.me/923455518903', 'https://wa.me/923455518903', 'https://wa.me/923455518903', '', '(C) DEMO 2', './uploads/school_content/logo/front_fav_icon-63ed4eb682a895.65636187.jpg', '2023-02-15 22:03:01');
INSERT INTO `front_cms_settings` (`school_id`, `id`, `theme`, `is_active_rtl`, `is_active_front_cms`, `is_active_sidebar`, `logo`, `contact_us_email`, `complain_form_email`, `sidebar_options`, `whatsapp_url`, `fb_url`, `twitter_url`, `youtube_url`, `google_plus`, `instagram_url`, `pinterest_url`, `linkedin_url`, `google_analytics`, `footer_text`, `fav_icon`, `created_at`) VALUES (1, 2, 'material_pink', NULL, 1, 1, './uploads/school_content/logo/front_logo-63ed51511665d2.92047156.jpg', '', '', '[\"news\",\"complain\"]', 'https://wa.me/923099914748', 'https://wa.me/923099914748', 'https://wa.me/923099914748', 'https://wa.me/923099914748', 'https://wa.me/923099914748', 'https://wa.me/923099914748', 'https://wa.me/923099914748', 'https://wa.me/923099914748', '', '', NULL, '2023-02-15 21:40:59');


#
# TABLE STRUCTURE FOR: general_calls
#

DROP TABLE IF EXISTS `general_calls`;

CREATE TABLE `general_calls` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(500) NOT NULL,
  `follow_up_date` date NOT NULL,
  `call_dureation` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `call_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `general_calls` (`school_id`, `id`, `name`, `contact`, `date`, `description`, `follow_up_date`, `call_dureation`, `note`, `call_type`) VALUES (2, 1, 'wajid ali', '03024235325', '2023-02-25', 'knkn', '2023-02-25', '243232', '53465', 'Incoming');


#
# TABLE STRUCTURE FOR: grades
#

DROP TABLE IF EXISTS `grades`;

CREATE TABLE `grades` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_type` varchar(250) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `point` float(10,1) DEFAULT NULL,
  `mark_from` float(10,2) DEFAULT NULL,
  `mark_upto` float(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `grades` (`school_id`, `id`, `exam_type`, `name`, `point`, `mark_from`, `mark_upto`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (2, 3, 'basic_system', 'A', '4.0', '100.00', '90.00', 'A Plus Grade is awarded', 'no', '2023-02-26 08:47:28', NULL);
INSERT INTO `grades` (`school_id`, `id`, `exam_type`, `name`, `point`, `mark_from`, `mark_upto`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (2, 4, 'basic_system', 'A', '3.5', '90.00', '80.00', 'A grade is awarded', 'no', '2023-02-26 08:48:11', NULL);
INSERT INTO `grades` (`school_id`, `id`, `exam_type`, `name`, `point`, `mark_from`, `mark_upto`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (2, 5, 'basic_system', 'B+', '3.0', '80.00', '75.00', 'B Plus Grade awarded', 'no', '2023-02-26 08:49:04', NULL);


#
# TABLE STRUCTURE FOR: homework
#

DROP TABLE IF EXISTS `homework`;

CREATE TABLE `homework` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `session_id` int(10) NOT NULL,
  `homework_date` date NOT NULL,
  `submit_date` date NOT NULL,
  `staff_id` int(11) NOT NULL,
  `subject_group_subject_id` int(11) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `create_date` date NOT NULL,
  `evaluation_date` date NOT NULL,
  `document` varchar(200) NOT NULL,
  `created_by` int(11) NOT NULL,
  `evaluated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_group_subject_id` (`subject_group_subject_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `homework_ibfk_1` FOREIGN KEY (`subject_group_subject_id`) REFERENCES `subject_group_subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `homework` (`school_id`, `id`, `class_id`, `section_id`, `session_id`, `homework_date`, `submit_date`, `staff_id`, `subject_group_subject_id`, `subject_id`, `description`, `create_date`, `evaluation_date`, `document`, `created_by`, `evaluated_by`) VALUES (NULL, 1, 1, 1, 15, '2023-02-27', '2023-03-04', 3, 1, 0, '<p>Please submit home work</p>', '2023-02-27', '0000-00-00', '1.jfif', 3, 0);


#
# TABLE STRUCTURE FOR: homework_evaluation
#

DROP TABLE IF EXISTS `homework_evaluation`;

CREATE TABLE `homework_evaluation` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: hostel
#

DROP TABLE IF EXISTS `hostel`;

CREATE TABLE `hostel` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostel_name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `intake` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `hostel` (`school_id`, `id`, `hostel_name`, `type`, `address`, `intake`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 'RAZA HOSTEL', 'Boys', 'TOWNSHIP', 2300, 'OKAY\r\n', 'no', '2023-03-18 09:05:16', NULL);
INSERT INTO `hostel` (`school_id`, `id`, `hostel_name`, `type`, `address`, `intake`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (1, 2, 'HAIDER ALI', 'Boys', 'KAH', 22, '4', 'no', '2023-03-18 09:14:03', NULL);


#
# TABLE STRUCTURE FOR: hostel_rooms
#

DROP TABLE IF EXISTS `hostel_rooms`;

CREATE TABLE `hostel_rooms` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostel_id` int(11) DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `room_no` varchar(200) DEFAULT NULL,
  `no_of_bed` int(11) DEFAULT NULL,
  `cost_per_bed` float(10,2) DEFAULT 0.00,
  `title` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `hostel_rooms` (`school_id`, `id`, `hostel_id`, `room_type_id`, `room_no`, `no_of_bed`, `cost_per_bed`, `title`, `description`, `created_at`, `updated_at`) VALUES (2, 1, 1, 1, 'HAIDER ROOM', 4, '3600.00', NULL, 'OKAY', '2023-03-18 09:13:25', NULL);


#
# TABLE STRUCTURE FOR: id_card
#

DROP TABLE IF EXISTS `id_card`;

CREATE TABLE `id_card` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `school_name` varchar(100) NOT NULL,
  `school_address` varchar(500) NOT NULL,
  `background` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `sign_image` varchar(100) NOT NULL,
  `header_color` varchar(100) NOT NULL,
  `enable_admission_no` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_student_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_class` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_fathers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_mothers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_address` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_phone` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_dob` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_blood_group` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `status` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `id_card` (`school_id`, `id`, `title`, `school_name`, `school_address`, `background`, `logo`, `sign_image`, `header_color`, `enable_admission_no`, `enable_student_name`, `enable_class`, `enable_fathers_name`, `enable_mothers_name`, `enable_address`, `enable_phone`, `enable_dob`, `enable_blood_group`, `status`) VALUES (2, 1, 'Department of Admissions & Registrations', 'The Country School Shah Jamal', '110 Kings Street, CA  Phone: 456542 Email: ths@gmail.com', 'samplebackground12.png', 'samplelogo12.png', 'samplesign12.png', '#595959', 1, 1, 1, 1, 0, 1, 1, 1, 1, 1);
INSERT INTO `id_card` (`school_id`, `id`, `title`, `school_name`, `school_address`, `background`, `logo`, `sign_image`, `header_color`, `enable_admission_no`, `enable_student_name`, `enable_class`, `enable_fathers_name`, `enable_mothers_name`, `enable_address`, `enable_phone`, `enable_dob`, `enable_blood_group`, `status`) VALUES (1, 2, 'ESTFGE', 'QSDQWRD', 'ERFDRWQAFGT', 'background2.png', 'logo2.png', 'sign2.png', '#000000', 1, 1, 1, 1, 0, 0, 1, 1, 0, 1);


#
# TABLE STRUCTURE FOR: income
#

DROP TABLE IF EXISTS `income`;

CREATE TABLE `income` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inc_head_id` varchar(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `invoice_no` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `is_deleted` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `income` (`school_id`, `id`, `inc_head_id`, `name`, `invoice_no`, `date`, `amount`, `note`, `is_active`, `is_deleted`, `created_at`, `updated_at`, `documents`) VALUES (1, 1, '2', 'paid', '234234234', '2023-02-02', '1200', 'dsfsf', 'yes', 'no', '2023-02-25 11:37:50', NULL, 'uploads/school_income/1.PNG');
INSERT INTO `income` (`school_id`, `id`, `inc_head_id`, `name`, `invoice_no`, `date`, `amount`, `note`, `is_active`, `is_deleted`, `created_at`, `updated_at`, `documents`) VALUES (2, 3, '1', '34235', '345346536', '2023-02-09', '645456', '', 'yes', 'no', '2023-02-25 16:29:44', NULL, NULL);


#
# TABLE STRUCTURE FOR: income_head
#

DROP TABLE IF EXISTS `income_head`;

CREATE TABLE `income_head` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `income_category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `is_deleted` varchar(255) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `income_head` (`school_id`, `id`, `income_category`, `description`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES (2, 1, 'Parking Income', 'Fee 21423423423424', 'yes', 'no', '2023-02-25 16:15:33', NULL);
INSERT INTO `income_head` (`school_id`, `id`, `income_category`, `description`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES (1, 2, 'gas', 'sss', 'yes', 'no', '2023-02-25 11:37:28', NULL);


#
# TABLE STRUCTURE FOR: item
#

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `item_photo` varchar(225) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `item_store_id` int(11) DEFAULT NULL,
  `item_supplier_id` int(11) DEFAULT NULL,
  `quantity` int(100) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `item` (`school_id`, `id`, `item_category_id`, `name`, `unit`, `item_photo`, `description`, `created_at`, `updated_at`, `item_store_id`, `item_supplier_id`, `quantity`, `date`) VALUES (1, 1, 3, 'Apply', '12', NULL, 'dasdasf', '2023-03-12 14:32:57', NULL, NULL, NULL, 0, '0000-00-00');
INSERT INTO `item` (`school_id`, `id`, `item_category_id`, `name`, `unit`, `item_photo`, `description`, `created_at`, `updated_at`, `item_store_id`, `item_supplier_id`, `quantity`, `date`) VALUES (2, 2, 2, 'HONDA 127', '23', NULL, 'DSASD', '2023-03-18 08:25:38', NULL, NULL, NULL, 0, '0000-00-00');


#
# TABLE STRUCTURE FOR: item_category
#

DROP TABLE IF EXISTS `item_category`;

CREATE TABLE `item_category` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_category` varchar(255) NOT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'yes',
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `item_category` (`school_id`, `id`, `item_category`, `is_active`, `description`, `created_at`, `updated_at`) VALUES (2, 1, 'Food', 'yes', 'sdsad', '2023-03-12 14:31:26', NULL);
INSERT INTO `item_category` (`school_id`, `id`, `item_category`, `is_active`, `description`, `created_at`, `updated_at`) VALUES (2, 2, 'Bike', 'yes', 'df', '2023-03-12 14:31:36', NULL);
INSERT INTO `item_category` (`school_id`, `id`, `item_category`, `is_active`, `description`, `created_at`, `updated_at`) VALUES (1, 3, 'Fish', 'yes', '', '2023-03-12 14:32:02', NULL);


#
# TABLE STRUCTURE FOR: item_issue
#

DROP TABLE IF EXISTS `item_issue`;

CREATE TABLE `item_issue` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_type` varchar(15) DEFAULT NULL,
  `issue_to` varchar(100) DEFAULT NULL,
  `issue_by` varchar(100) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(10) NOT NULL,
  `note` text NOT NULL,
  `is_returned` int(2) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` varchar(10) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `item_category_id` (`item_category_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `item_issue_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_issue_ibfk_2` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `item_issue` (`school_id`, `id`, `issue_type`, `issue_to`, `issue_by`, `issue_date`, `return_date`, `item_category_id`, `item_id`, `quantity`, `note`, `is_returned`, `created_at`, `is_active`) VALUES (2, 1, '2', '4', 'Engr Unis  (STF546486)', '2023-03-01', '2023-03-31', 2, 2, 10, 'Okay', 1, '2023-03-18 08:33:05', 'no');


#
# TABLE STRUCTURE FOR: item_stock
#

DROP TABLE IF EXISTS `item_stock`;

CREATE TABLE `item_stock` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `symbol` varchar(10) NOT NULL DEFAULT '+',
  `store_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `purchase_price` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `attachment` varchar(250) DEFAULT NULL,
  `description` text NOT NULL,
  `is_active` varchar(10) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `store_id` (`store_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `item_stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_stock_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `item_supplier` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_stock_ibfk_3` FOREIGN KEY (`store_id`) REFERENCES `item_store` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `item_stock` (`school_id`, `id`, `item_id`, `supplier_id`, `symbol`, `store_id`, `quantity`, `purchase_price`, `date`, `attachment`, `description`, `is_active`, `created_at`) VALUES (2, 1, 2, 1, '+', 2, 23, '2300', '2023-03-31', NULL, '', 'yes', '2023-03-18 08:27:11');
INSERT INTO `item_stock` (`school_id`, `id`, `item_id`, `supplier_id`, `symbol`, `store_id`, `quantity`, `purchase_price`, `date`, `attachment`, `description`, `is_active`, `created_at`) VALUES (1, 2, 1, 2, '+', NULL, 23, '230', '2023-03-26', NULL, '', 'yes', '2023-03-18 08:28:10');


#
# TABLE STRUCTURE FOR: item_store
#

DROP TABLE IF EXISTS `item_store`;

CREATE TABLE `item_store` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_store` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `item_store` (`school_id`, `id`, `item_store`, `code`, `description`) VALUES (1, 1, 'Trasport', '221', 'Okay ');
INSERT INTO `item_store` (`school_id`, `id`, `item_store`, `code`, `description`) VALUES (2, 2, 'products', '455', '54');


#
# TABLE STRUCTURE FOR: item_supplier
#

DROP TABLE IF EXISTS `item_supplier`;

CREATE TABLE `item_supplier` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_supplier` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_person_name` varchar(255) NOT NULL,
  `contact_person_phone` varchar(255) NOT NULL,
  `contact_person_email` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `item_supplier` (`school_id`, `id`, `item_supplier`, `phone`, `email`, `address`, `contact_person_name`, `contact_person_phone`, `contact_person_email`, `description`) VALUES (2, 1, 'Muhammad Younis', '+923099914748', 'unis.panwar@gmail.com', '0.5Km Shahjamal Road Khan Garh', 'Muhammad Younis', '+923099914748', 'unis.panwar@gmail.com', 'sd');
INSERT INTO `item_supplier` (`school_id`, `id`, `item_supplier`, `phone`, `email`, `address`, `contact_person_name`, `contact_person_phone`, `contact_person_email`, `description`) VALUES (1, 2, 'ANWAR UL HASSAN', '03099914748', 'unis.panwar@gmail.com', 'UN', 'Ali Khan', '03099914748', 'ali@khan.com', 'A;O');


#
# TABLE STRUCTURE FOR: languages
#

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(50) DEFAULT NULL,
  `short_code` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `is_deleted` varchar(10) NOT NULL DEFAULT 'yes',
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 'Azerbaijan', 'az', 'az', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 'Albanian', 'sq', 'al', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 3, 'Amharic', 'am', 'am', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 4, 'English', 'en', 'us', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 5, 'Arabic', 'ar', 'sa', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 7, 'Afrikaans', 'af', 'af', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 8, 'Basque', 'eu', 'es', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 11, 'Bengali', 'bn', 'in', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 13, 'Bosnian', 'bs', 'bs', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 14, 'Welsh', 'cy', 'cy', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 15, 'Hungarian', 'hu', 'hu', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 16, 'Vietnamese', 'vi', 'vi', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 17, 'Haitian', 'ht', 'ht', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 18, 'Galician', 'gl', 'gl', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 19, 'Dutch', 'nl', 'nl', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 21, 'Greek', 'el', 'gr', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 22, 'Georgian', 'ka', 'ge', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 23, 'Gujarati', 'gu', 'in', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 24, 'Danish', 'da', 'dk', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 25, 'Hebrew', 'he', 'il', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 26, 'Yiddish', 'yi', 'il', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 27, 'Indonesian', 'id', 'id', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 28, 'Irish', 'ga', 'ga', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 29, 'Italian', 'it', 'it', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 30, 'Icelandic', 'is', 'is', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 31, 'Spanish', 'es', 'es', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 33, 'Kannada', 'kn', 'kn', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 34, 'Catalan', 'ca', 'ca', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 36, 'Chinese', 'zh', 'cn', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 37, 'Korean', 'ko', 'kr', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 38, 'Xhosa', 'xh', 'ls', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 39, 'Latin', 'la', 'it', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 40, 'Latvian', 'lv', 'lv', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 41, 'Lithuanian', 'lt', 'lt', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 43, 'Malagasy', 'mg', 'mg', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 44, 'Malay', 'ms', 'ms', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 45, 'Malayalam', 'ml', 'ml', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 46, 'Maltese', 'mt', 'mt', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 47, 'Macedonian', 'mk', 'mk', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 48, 'Maori', 'mi', 'nz', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 49, 'Marathi', 'mr', 'in', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 51, 'Mongolian', 'mn', 'mn', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 52, 'German', 'de', 'de', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 53, 'Nepali', 'ne', 'ne', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 54, 'Norwegian', 'no', 'no', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 55, 'Punjabi', 'pa', 'in', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 57, 'Persian', 'fa', 'ir', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 59, 'Portuguese', 'pt', 'pt', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 60, 'Romanian', 'ro', 'ro', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 61, 'Russian', 'ru', 'ru', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 62, 'Cebuano', 'ceb', 'ph', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 64, 'Sinhala', 'si', 'lk ', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 65, 'Slovakian', 'sk', 'sk', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 66, 'Slovenian', 'sl', 'sl', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 67, 'Swahili', 'sw', 'ke', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 68, 'Sundanese', 'su', 'sd', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 70, 'Thai', 'th', 'th', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 71, 'Tagalog', 'tl', 'tl', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 72, 'Tamil', 'ta', 'in', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 74, 'Telugu', 'te', 'in', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 75, 'Turkish', 'tr', 'tr', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 77, 'Uzbek', 'uz', 'uz', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 79, 'Urdu', 'ur', 'pk', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 80, 'Finnish', 'fi', 'fi', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 81, 'French', 'fr', 'fr', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 82, 'Hindi', 'hi', 'in', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 84, 'Czech', 'cs', 'cz', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 85, 'Swedish', 'sv', 'sv', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 86, 'Scottish', 'gd', 'gd', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 87, 'Estonian', 'et', 'et', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 88, 'Esperanto', 'eo', 'br', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 89, 'Javanese', 'jv', 'id', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 90, 'Japanese', 'ja', 'jp', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 91, 'Polish', 'pl', 'pl', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 92, 'Kurdish', 'ku', 'iq', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `languages` (`school_id`, `id`, `language`, `short_code`, `country_code`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES (2, 93, 'Lao', 'lo', 'la', 'no', 'no', '2023-02-14 13:11:38', '0000-00-00');


#
# TABLE STRUCTURE FOR: leave_types
#

DROP TABLE IF EXISTS `leave_types`;

CREATE TABLE `leave_types` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: lesson
#

DROP TABLE IF EXISTS `lesson`;

CREATE TABLE `lesson` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `subject_group_subject_id` int(11) NOT NULL,
  `subject_group_class_sections_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `subject_group_subject_id` (`subject_group_subject_id`),
  KEY `subject_group_class_sections_id` (`subject_group_class_sections_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `lesson_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lesson_ibfk_2` FOREIGN KEY (`subject_group_subject_id`) REFERENCES `subject_group_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lesson_ibfk_3` FOREIGN KEY (`subject_group_class_sections_id`) REFERENCES `subject_group_class_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `lesson` (`school_id`, `id`, `session_id`, `subject_group_subject_id`, `subject_group_class_sections_id`, `name`, `created_at`) VALUES (NULL, 1, 15, 1, 1, 'Page 1-12', '2023-02-26 05:42:26');
INSERT INTO `lesson` (`school_id`, `id`, `session_id`, `subject_group_subject_id`, `subject_group_class_sections_id`, `name`, `created_at`) VALUES (NULL, 2, 15, 1, 1, 'Page 1-12', '2023-02-26 05:42:26');


#
# TABLE STRUCTURE FOR: libarary_members
#

DROP TABLE IF EXISTS `libarary_members`;

CREATE TABLE `libarary_members` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `library_card_no` varchar(50) DEFAULT NULL,
  `member_type` varchar(50) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `libarary_members` (`school_id`, `id`, `library_card_no`, `member_type`, `member_id`, `is_active`, `created_at`) VALUES (NULL, 1, '23243', 'student', 22, 'no', '2023-03-12 13:50:44');


#
# TABLE STRUCTURE FOR: logs
#

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text DEFAULT NULL,
  `record_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `agent` varchar(50) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1072 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 1, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:13:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 2, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:13:35', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 3, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:13:45', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 4, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:13:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 5, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:14:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 6, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:14:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 7, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:14:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 8, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:14:32', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 9, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:14:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 10, 'New Record inserted On sections id 1', 1, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:15:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 11, 'New Record inserted On sections id 2', 2, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:15:52', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 12, 'New Record inserted On sections id 3', 3, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:15:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 13, 'New Record inserted On sections id 4', 4, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:16:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 14, 'New Record inserted On subject groups id 1', 1, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:16:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 15, 'New Record inserted On subject groups id 2', 2, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:16:33', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 16, 'New Record inserted On subject groups id 3', 3, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:16:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 17, 'New Record inserted On subjects id 1', 1, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:18:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 18, 'New Record inserted On subjects id 2', 2, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:18:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 19, 'New Record inserted On subjects id 3', 3, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:18:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 20, 'New Record inserted On subject groups id 1', 1, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:19:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 21, 'New Record inserted On subject groups id 4', 4, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:20:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 22, 'New Record inserted On subject groups id 5', 5, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:20:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 23, 'New Record inserted On subject groups id 6', 6, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:20:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 24, 'New Record inserted On subject groups id 7', 7, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:21:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 25, 'New Record inserted On students id 1', 1, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:23:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 26, 'New Record inserted On  student session id 1', 1, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:23:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 27, 'New Record inserted On users id 1', 1, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:23:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 28, 'New Record inserted On users id 2', 2, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:23:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 29, 'Record updated On students id 1', 1, 1, 'Update', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:23:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 30, 'Record updated On students id 1', 1, 1, 'Update', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:26:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 31, 'Record updated On  student session id 1', 1, 1, 'Update', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:26:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 32, 'Record updated On students id 1', 1, 1, 'Update', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:26:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 33, 'Record updated On permission group id 2', 2, 1, 'Update', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:27:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 34, 'Record updated On permission group id 2', 2, 1, 'Update', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:27:05', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 35, 'Record updated On  email config id 1', 1, 1, 'Update', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:27:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 36, 'New Record inserted On sms config id 1', 1, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:33:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 37, 'New Record inserted On messages id 1', 1, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 02:33:59', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 38, 'New Record inserted On messages id 2', 2, 1, 'Insert', '203.96.171.91', 'Windows 10', 'Firefox 109.0', '2023-01-27 02:36:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 39, 'New Record inserted On  student attendences id 1', 1, 1, 'Insert', '119.160.56.46', 'Android', 'Chrome 83.0.4103.106', '2023-01-27 11:32:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 40, 'New Record inserted On students id 2', 2, 1, 'Insert', '119.160.56.46', 'Android', 'Chrome 83.0.4103.106', '2023-01-27 15:52:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 41, 'New Record inserted On  student session id 2', 2, 1, 'Insert', '119.160.56.46', 'Android', 'Chrome 83.0.4103.106', '2023-01-27 15:52:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 42, 'New Record inserted On users id 3', 3, 1, 'Insert', '119.160.56.46', 'Android', 'Chrome 83.0.4103.106', '2023-01-27 15:52:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 43, 'New Record inserted On users id 4', 4, 1, 'Insert', '119.160.56.46', 'Android', 'Chrome 83.0.4103.106', '2023-01-27 15:52:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 44, 'Record updated On students id 2', 2, 1, 'Update', '119.160.56.46', 'Android', 'Chrome 83.0.4103.106', '2023-01-27 15:52:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 45, 'New Record inserted On messages id 3', 3, 1, 'Insert', '119.160.56.46', 'Android', 'Chrome 83.0.4103.106', '2023-01-27 15:57:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 46, 'Record updated On students id 2', 2, 1, 'Update', '119.160.56.46', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 18:11:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 47, 'Record updated On  student session id 2', 2, 1, 'Update', '119.160.56.46', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-27 18:11:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 48, 'Record updated On Front CMS Setting id 1', 1, 1, 'Update', '203.96.171.22', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-28 22:15:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 49, 'Record updated On Front CMS Setting id 1', 1, 1, 'Update', '203.96.171.22', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-28 22:16:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 50, 'Record updated On Front CMS Setting id 1', 1, 1, 'Update', '203.96.171.22', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-28 22:16:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 51, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.22', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-28 22:22:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 52, 'Record updated On Front CMS Setting id 1', 1, 1, 'Update', '203.96.171.22', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-28 22:33:01', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 53, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.22', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-28 22:36:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 54, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.22', 'Windows 10', 'Chrome 109.0.0.0', '2023-01-29 00:26:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 55, 'Record updated On staff id 1', 1, NULL, 'Update', '203.96.171.22', 'Windows 10', 'Firefox 109.0', '2023-01-29 00:32:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 56, 'Record updated On staff id 1', 1, NULL, 'Update', '203.96.171.22', 'Windows 10', 'Firefox 109.0', '2023-01-29 00:56:25', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 57, 'Record updated On staff id 1', 1, NULL, 'Update', '203.96.171.22', 'Windows 10', 'Firefox 109.0', '2023-01-29 01:05:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 58, 'Record updated On staff id 1', 1, NULL, 'Update', '203.96.171.22', 'Windows 10', 'Firefox 109.0', '2023-01-29 01:06:01', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 59, 'Record updated On staff id 1', 1, NULL, 'Update', '203.96.171.22', 'Windows 10', 'Firefox 109.0', '2023-01-29 01:16:38', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 60, 'Record updated On staff id 1', 1, NULL, 'Update', '203.96.171.22', 'Windows 10', 'Firefox 109.0', '2023-01-29 01:19:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 61, 'Record updated On staff id 1', 1, NULL, 'Update', '203.96.171.22', 'Windows 10', 'Firefox 109.0', '2023-01-29 01:30:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 62, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.45', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-04 18:20:33', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 63, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.45', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-04 18:24:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 64, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.45', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-04 18:24:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 65, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.45', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-04 18:25:36', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 66, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 10:31:33', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 67, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 10:32:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 68, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 10:32:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 69, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 10:32:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 70, 'New Record inserted On sms config id 2', 2, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 10:33:35', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 71, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 10:41:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 72, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 10:41:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 73, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 11:09:51', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 74, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 11:10:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 75, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 11:11:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 76, 'New Record inserted On messages id 4', 4, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 11:59:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 77, 'New Record inserted On messages id 5', 5, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:00:54', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 78, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:02:32', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 79, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 12:17:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 80, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 12:19:39', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 81, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:21:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 82, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:22:05', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 83, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:22:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 84, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:23:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 85, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:23:57', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 86, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:26:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 87, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:26:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 88, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:27:58', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 89, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:28:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 90, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:30:58', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 91, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:31:32', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 92, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:34:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 93, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:34:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 94, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:35:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 95, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:37:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 96, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:39:41', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 97, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 12:40:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 98, 'New Record inserted On messages id 6', 6, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:41:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 99, 'New Record inserted On messages id 7', 7, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:42:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 100, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 12:42:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 101, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:44:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 102, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:47:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 103, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:47:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 104, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 12:53:14', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 105, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 12:54:09', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 106, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 12:54:25', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 107, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:56:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 108, 'Record updated On  email config id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:56:32', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 109, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 12:56:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 110, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 12:56:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 111, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 12:57:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 112, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 12:58:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 113, 'Record updated On settings id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 12:59:38', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 114, 'Record updated On settings id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 17:59:52', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 115, 'Record updated On settings id 1', 1, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 18:00:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 116, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 18:00:45', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 117, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 18:02:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 118, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 18:06:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 119, 'Record updated On staff id 1', 1, NULL, 'Update', '182.185.201.43', 'Windows 10', 'Firefox 109.0', '2023-02-08 18:07:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 120, 'New Record inserted On sms config id 3', 3, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 18:26:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 121, 'Record updated On sms config id clickatell', 0, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 18:26:58', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 122, 'Record updated On sms config id clickatell', 0, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 18:30:57', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 123, 'Record updated On sms config id clickatell', 0, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 18:31:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 124, 'Record updated On sms config id clickatell', 0, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 18:32:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 125, 'Record updated On sms config id clickatell', 0, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 18:32:39', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 126, 'New Record inserted On messages id 8', 8, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 18:41:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 127, 'New Record inserted On messages id 9', 9, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 18:47:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 128, 'New Record inserted On messages id 10', 10, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 18:49:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 129, 'New Record inserted On messages id 11', 11, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 18:51:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 130, 'New Record inserted On messages id 12', 12, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 18:54:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 131, 'New Record inserted On messages id 13', 13, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 18:57:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 132, 'New Record inserted On messages id 14', 14, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:00:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 133, 'New Record inserted On messages id 15', 15, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:06:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 134, 'New Record inserted On messages id 16', 16, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:07:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 135, 'New Record inserted On messages id 17', 17, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:08:05', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 136, 'New Record inserted On messages id 18', 18, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:10:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 137, 'New Record inserted On messages id 19', 19, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:15:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 138, 'New Record inserted On messages id 20', 20, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:16:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 139, 'New Record inserted On messages id 21', 21, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:17:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 140, 'New Record inserted On messages id 22', 22, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:18:25', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 141, 'New Record inserted On messages id 23', 23, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:19:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 142, 'New Record inserted On messages id 24', 24, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:20:45', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 143, 'New Record inserted On messages id 25', 25, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:22:12', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 144, 'New Record inserted On messages id 26', 26, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:24:58', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 145, 'New Record inserted On messages id 27', 27, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:25:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 146, 'New Record inserted On messages id 28', 28, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:27:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 147, 'New Record inserted On messages id 29', 29, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:33:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 148, 'New Record inserted On messages id 30', 30, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:34:28', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 149, 'New Record inserted On messages id 31', 31, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:36:25', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 150, 'New Record inserted On messages id 32', 32, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:43:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 151, 'New Record inserted On messages id 33', 33, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:44:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 152, 'New Record inserted On messages id 34', 34, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:45:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 153, 'New Record inserted On messages id 35', 35, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:45:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 154, 'New Record inserted On messages id 36', 36, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:46:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 155, 'New Record inserted On messages id 37', 37, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:49:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 156, 'New Record inserted On messages id 38', 38, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:50:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 157, 'New Record inserted On messages id 39', 39, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:54:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 158, 'New Record inserted On messages id 40', 40, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 19:58:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 159, 'New Record inserted On messages id 41', 41, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 20:06:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 160, 'New Record inserted On messages id 42', 42, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 20:06:38', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 161, 'New Record inserted On messages id 43', 43, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 20:07:39', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 162, 'New Record inserted On messages id 44', 44, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 20:11:38', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 163, 'Record updated On sms config id clickatell', 0, 1, 'Update', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 20:14:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 164, 'New Record inserted On messages id 45', 45, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 20:14:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 165, 'New Record inserted On messages id 46', 46, 1, 'Insert', '182.185.201.43', 'Windows 10', 'Chrome 109.0.0.0', '2023-02-08 20:17:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 166, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.76', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-12 19:13:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 167, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.76', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-12 19:13:25', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 168, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.76', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-12 19:13:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 169, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.76', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-12 19:14:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 170, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.76', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-12 19:14:32', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 171, 'Record updated On settings id 1', 1, 1, 'Update', '203.96.171.76', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-12 19:14:57', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 172, 'Record updated On settings id 2', 2, 1, 'Update', '207.244.71.79', 'Windows 10', 'Firefox 109.0', '2023-02-14 11:13:12', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 173, 'Record updated On settings id 2', 2, 1, 'Update', '207.244.71.79', 'Windows 10', 'Firefox 109.0', '2023-02-14 11:13:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 174, 'Record updated On settings id 2', 2, 1, 'Update', '207.244.71.79', 'Windows 10', 'Firefox 109.0', '2023-02-14 11:16:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (2, 175, 'Record updated On settings id 2', 2, 1, 'Update', '207.244.71.79', 'Windows 10', 'Firefox 109.0', '2023-02-14 11:19:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 176, 'New Record inserted On sections id 5', 5, 1, 'Insert', '207.244.71.82', 'Windows 10', 'Firefox 109.0', '2023-02-14 18:29:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 177, 'New Record inserted On sections id 6', 6, 1, 'Insert', '207.244.71.82', 'Windows 10', 'Firefox 109.0', '2023-02-14 18:29:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 178, 'New Record inserted On sections id 7', 7, 1, 'Insert', '207.244.71.82', 'Windows 10', 'Firefox 109.0', '2023-02-14 18:29:41', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 179, 'New Record inserted On sections id 8', 8, 1, 'Insert', '207.244.71.82', 'Windows 10', 'Firefox 109.0', '2023-02-14 18:29:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 180, 'New Record inserted On sections id 9', 9, 1, 'Insert', '207.244.71.82', 'Windows 10', 'Firefox 109.0', '2023-02-14 18:29:52', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 181, 'New Record inserted On subject groups id 8', 8, 1, 'Insert', '207.244.71.82', 'Windows 10', 'Firefox 109.0', '2023-02-14 18:43:59', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 182, 'New Record inserted On subject groups id 9', 9, 1, 'Insert', '207.244.71.82', 'Windows 10', 'Firefox 109.0', '2023-02-14 18:49:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 183, 'New Record inserted On subject groups id 10', 10, 1, 'Insert', '207.244.71.82', 'Windows 10', 'Firefox 109.0', '2023-02-14 18:50:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 184, 'Record deleted On classes id 9', 9, 1, 'Delete', '207.244.71.82', 'Windows 10', 'Firefox 109.0', '2023-02-14 18:53:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 185, 'Record deleted On classes id 10', 10, 1, 'Delete', '207.244.71.82', 'Windows 10', 'Firefox 109.0', '2023-02-14 18:53:39', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 186, 'New Record inserted On subject groups id 11', 11, 1, 'Insert', '207.244.71.82', 'Windows 10', 'Firefox 109.0', '2023-02-14 19:01:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 187, 'New Record inserted On subjects id 4', 4, 1, 'Insert', '207.244.71.82', 'Windows 10', 'Firefox 109.0', '2023-02-14 19:18:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 188, 'Record deleted On subjects id 4', 4, 1, 'Delete', '207.244.71.82', 'Windows 10', 'Firefox 109.0', '2023-02-14 19:18:38', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 189, 'New Record inserted On subjects id 5', 5, 1, 'Insert', '207.244.71.82', 'Windows 10', 'Firefox 109.0', '2023-02-14 19:19:36', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 190, 'New Record inserted On subject groups id 2', 2, 1, 'Insert', '207.244.71.82', 'Windows 10', 'Firefox 109.0', '2023-02-14 19:28:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 191, 'New Record inserted On subject groups id 3', 3, 1, 'Insert', '207.244.71.82', 'Windows 10', 'Firefox 109.0', '2023-02-14 19:29:57', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 192, 'Record updated On Front CMS Setting id 1', 1, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 02:28:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 193, 'Record updated On Front CMS Setting id 1', 1, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 02:29:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 194, 'Record updated On Front CMS Setting id 1', 1, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 02:29:36', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 195, 'Record updated On Front CMS Setting id 1', 1, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 02:30:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 196, 'New Record inserted On event id 1', 1, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 02:31:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 197, 'New Record inserted On payment settings id 2', 2, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 02:38:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 198, 'Record updated On Front CMS Setting id 2', 2, 1, 'Update', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 02:40:33', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 199, 'Record updated On Front CMS Setting id 2', 2, 1, 'Update', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 02:40:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 200, 'Record updated On Front CMS Setting id 2', 2, 1, 'Update', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 02:40:59', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 201, 'New Record inserted On event id 2', 2, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 02:42:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 202, 'New Record inserted On event id 3', 3, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 02:51:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 203, 'New Record inserted On event id 4', 4, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 02:51:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 204, 'Record deleted On event title dasdas', 0, 1, 'Delete', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 02:56:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 205, 'New Record inserted On event id 5', 5, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 02:57:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 206, 'New Record inserted On event id 6', 6, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:01:36', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 207, 'New Record inserted On event id 7', 7, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 03:02:35', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 208, 'Record updated On Front CMS Setting id 1', 1, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 03:03:01', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 209, 'New Record inserted On students id 3', 3, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:15:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 210, 'New Record inserted On  student session id 3', 3, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:15:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 211, 'New Record inserted On users id 5', 5, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:15:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 212, 'New Record inserted On users id 6', 6, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:15:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 213, 'Record updated On students id 3', 3, 1, 'Update', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:15:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 214, 'New Record inserted On students id 4', 4, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:19:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 215, 'New Record inserted On  student session id 4', 4, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:19:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 216, 'New Record inserted On users id 7', 7, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:19:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 217, 'New Record inserted On users id 8', 8, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:19:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 218, 'Record updated On students id 4', 4, 1, 'Update', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:19:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 219, 'New Record inserted On students id 5', 5, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:21:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 220, 'New Record inserted On  student session id 5', 5, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:21:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 221, 'New Record inserted On users id 9', 9, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:21:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 222, 'New Record inserted On users id 10', 10, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:21:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 223, 'Record updated On students id 5', 5, 1, 'Update', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:21:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 224, 'Record updated On sms config id clickatell', 0, 1, 'Update', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:25:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 225, 'Record updated On students id 5', 5, 1, 'Update', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:31:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 226, 'Record updated On sms config id clickatell', 0, 1, 'Update', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:33:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 227, 'New Record inserted On students id 6', 6, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:35:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 228, 'New Record inserted On  student session id 6', 6, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:35:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 229, 'New Record inserted On users id 11', 11, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:35:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 230, 'New Record inserted On users id 12', 12, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:35:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 231, 'Record updated On students id 6', 6, 1, 'Update', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:35:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 232, 'New Record inserted On students id 7', 7, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:37:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 233, 'New Record inserted On  student session id 7', 7, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:37:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 234, 'New Record inserted On users id 13', 13, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:37:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 235, 'New Record inserted On users id 14', 14, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:37:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 236, 'Record updated On students id 7', 7, 1, 'Update', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:37:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 237, 'Record updated On sms config id clickatell', 0, 1, 'Update', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:45:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 238, 'New Record inserted On students id 8', 8, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:50:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 239, 'New Record inserted On  student session id 8', 8, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:50:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 240, 'New Record inserted On users id 15', 15, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:50:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 241, 'New Record inserted On users id 16', 16, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:50:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 242, 'Record updated On students id 8', 8, 1, 'Update', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:50:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 243, 'New Record inserted On messages id 47', 47, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:55:38', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 244, 'New Record inserted On  fee groups id 1', 1, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 03:56:59', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 245, 'New Record inserted On  fee groups id 2', 2, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 04:03:57', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 246, 'New Record inserted On  fee groups id 3', 3, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 04:04:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 247, 'New Record inserted On  fee groups id 4', 4, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 04:04:58', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 248, 'New Record inserted On  fee type id 1', 1, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 04:08:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 249, 'New Record inserted On  fees discounts id 1', 1, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 04:11:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 250, 'New Record inserted On  fees discounts id 2', 2, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 04:12:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 251, 'New Record inserted On  fee groups feetype id 1', 1, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 04:14:32', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 252, 'New Record inserted On  categories id 1', 1, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 04:23:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 253, 'Record updated On students id 1', 1, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 04:24:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 254, 'Record updated On  student session id 1', 1, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 04:24:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 255, 'Record updated On students id 1', 1, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 04:24:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 256, 'Record updated On  fee groups id 4', 4, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 04:30:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 257, 'New Record inserted On  fee groups feetype id 3', 3, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 05:01:28', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 258, 'New Record inserted On  fee type id 3', 3, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 05:05:32', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 259, 'New Record inserted On  fees discounts id 3', 3, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 05:05:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 260, 'Record updated On  fees discounts id 3', 3, 1, 'Update', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 05:06:05', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 261, 'Record updated On  fees discounts id 2', 2, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 05:06:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 262, 'Record updated On  fee groups id 4', 4, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 05:15:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 263, 'Record updated On  fee groups id 3', 3, 1, 'Update', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 05:15:41', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 264, 'Record deleted On fee session groups id 3', 3, 1, 'Delete', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 05:15:59', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 265, 'New Record inserted On  fee groups feetype id 4', 4, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 05:16:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 266, 'New Record inserted On  fee groups feetype id 5', 5, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 05:16:52', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 267, 'New Record inserted On  fee groups feetype id 6', 6, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 05:20:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 268, 'New Record inserted On  fee groups feetype id 7', 7, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 05:20:38', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 269, 'New Record inserted On  categories id 2', 2, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 05:24:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 270, 'Record updated On  categories id 1', 1, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 05:25:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 271, 'New Record inserted On school houses id 1', 1, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 05:30:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 272, 'New Record inserted On school houses id 2', 2, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 05:31:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 273, 'New Record inserted On disable reason id 1', 1, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 05:35:54', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 274, 'New Record inserted On disable reason id 2', 2, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 05:36:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 275, 'New Record inserted On sessions id 26', 26, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 05:50:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 276, 'Record updated On sessions id 26', 26, 1, 'Update', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 05:50:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 277, 'New Record inserted On  fee groups feetype id 8', 8, 1, 'Insert', '203.96.171.109', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-16 05:59:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 278, 'New Record inserted On students id 9', 9, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:13:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 279, 'New Record inserted On  student session id 9', 9, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:13:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 280, 'New Record inserted On users id 17', 17, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:13:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 281, 'New Record inserted On users id 18', 18, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:13:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 282, 'Record updated On students id 9', 9, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:13:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 283, 'Record updated On students id 9', 9, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:13:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 284, 'Record updated On students id 9', 9, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:13:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 285, 'Record updated On students id 9', 9, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:13:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 286, 'New Record inserted On students id 10', 10, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:18:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 287, 'New Record inserted On  student session id 10', 10, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:18:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 288, 'New Record inserted On users id 19', 19, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:18:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 289, 'New Record inserted On users id 20', 20, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:18:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 290, 'Record updated On students id 10', 10, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:18:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 291, 'Record updated On students id 10', 10, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:18:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 292, 'Record updated On students id 10', 10, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:18:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 293, 'Record updated On students id 10', 10, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:18:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 294, 'New Record inserted On students id 11', 11, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:18:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 295, 'New Record inserted On  student session id 11', 11, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:18:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 296, 'New Record inserted On users id 21', 21, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:18:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 297, 'New Record inserted On users id 22', 22, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:18:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 298, 'Record updated On students id 11', 11, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:18:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 299, 'Record updated On students id 11', 11, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:18:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 300, 'Record updated On students id 11', 11, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:18:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 301, 'Record updated On students id 11', 11, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:18:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 302, 'New Record inserted On students id 12', 12, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:19:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 303, 'New Record inserted On  student session id 12', 12, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:19:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 304, 'New Record inserted On users id 23', 23, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:19:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 305, 'New Record inserted On users id 24', 24, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:19:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 306, 'Record updated On students id 12', 12, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:19:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 307, 'Record updated On students id 12', 12, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:19:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 308, 'Record updated On students id 12', 12, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:19:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 309, 'Record updated On students id 12', 12, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:19:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 310, 'New Record inserted On students id 13', 13, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:20:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 311, 'New Record inserted On  student session id 13', 13, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:20:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 312, 'New Record inserted On users id 25', 25, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:20:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 313, 'New Record inserted On users id 26', 26, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:20:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 314, 'Record updated On students id 13', 13, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:20:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 315, 'Record updated On students id 13', 13, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:20:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 316, 'Record updated On students id 13', 13, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:20:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 317, 'Record updated On students id 13', 13, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:20:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 318, 'New Record inserted On students id 14', 14, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:21:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 319, 'New Record inserted On  student session id 14', 14, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:21:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 320, 'New Record inserted On users id 27', 27, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:21:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 321, 'New Record inserted On users id 28', 28, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:21:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 322, 'Record updated On students id 14', 14, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:21:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 323, 'Record updated On students id 14', 14, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:21:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 324, 'Record updated On students id 14', 14, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:21:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 325, 'Record updated On students id 14', 14, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:21:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 326, 'New Record inserted On students id 15', 15, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:24:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 327, 'New Record inserted On  student session id 15', 15, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:24:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 328, 'New Record inserted On users id 29', 29, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:24:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 329, 'New Record inserted On users id 30', 30, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:24:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 330, 'Record updated On students id 15', 15, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:24:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 331, 'Record updated On students id 15', 15, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:24:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 332, 'Record updated On students id 15', 15, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:24:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 333, 'Record updated On students id 15', 15, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:24:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 334, 'New Record inserted On students id 16', 16, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:25:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 335, 'New Record inserted On  student session id 16', 16, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:25:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 336, 'New Record inserted On users id 31', 31, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:25:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 337, 'New Record inserted On users id 32', 32, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:25:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 338, 'Record updated On students id 16', 16, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:25:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 339, 'Record updated On students id 16', 16, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:25:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 340, 'Record updated On students id 16', 16, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:25:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 341, 'Record updated On students id 16', 16, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:25:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 342, 'New Record inserted On students id 17', 17, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:25:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 343, 'New Record inserted On  student session id 17', 17, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:25:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 344, 'New Record inserted On users id 33', 33, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:25:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 345, 'New Record inserted On users id 34', 34, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:25:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 346, 'Record updated On students id 17', 17, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:25:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 347, 'Record updated On students id 17', 17, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:25:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 348, 'Record updated On students id 17', 17, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:25:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 349, 'Record updated On students id 17', 17, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:25:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 350, 'New Record inserted On students id 18', 18, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:27:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 351, 'New Record inserted On  student session id 18', 18, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:27:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 352, 'New Record inserted On users id 35', 35, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:27:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 353, 'New Record inserted On users id 36', 36, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:27:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 354, 'Record updated On students id 18', 18, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:27:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 355, 'Record updated On students id 18', 18, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:27:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 356, 'Record updated On students id 18', 18, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:27:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 357, 'Record updated On students id 18', 18, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:27:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 358, 'New Record inserted On students id 19', 19, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:31:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 359, 'New Record inserted On  student session id 19', 19, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:31:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 360, 'New Record inserted On users id 37', 37, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:31:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 361, 'New Record inserted On users id 38', 38, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:31:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 362, 'Record updated On students id 19', 19, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:31:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 363, 'Record updated On students id 19', 19, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:31:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 364, 'Record updated On students id 19', 19, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:31:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 365, 'Record updated On students id 19', 19, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:31:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 366, 'New Record inserted On students id 20', 20, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:33:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 367, 'New Record inserted On  student session id 20', 20, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:33:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 368, 'New Record inserted On users id 39', 39, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:33:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 369, 'New Record inserted On users id 40', 40, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:33:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 370, 'Record updated On students id 20', 20, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:33:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 371, 'Record updated On students id 20', 20, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:33:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 372, 'Record updated On students id 20', 20, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:33:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 373, 'Record updated On students id 20', 20, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:33:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 374, 'New Record inserted On students id 21', 21, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:38:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 375, 'New Record inserted On  student session id 21', 21, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:38:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 376, 'New Record inserted On users id 41', 41, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:38:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 377, 'New Record inserted On users id 42', 42, 3, 'Insert', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:38:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 378, 'Record updated On students id 21', 21, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:38:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 379, 'Record updated On students id 21', 21, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:38:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 380, 'Record updated On students id 21', 21, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:38:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 381, 'Record updated On students id 21', 21, 3, 'Update', '203.96.171.109', 'Windows 10', 'Firefox 109.0', '2023-02-16 06:38:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 382, 'New Record inserted On students id 22', 22, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:36:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 383, 'New Record inserted On  student session id 22', 22, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:36:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 384, 'New Record inserted On users id 43', 43, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:36:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 385, 'New Record inserted On users id 44', 44, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:36:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 386, 'Record updated On students id 22', 22, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:36:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 387, 'New Record inserted On students id 23', 23, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:41:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 388, 'New Record inserted On  student session id 23', 23, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:41:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 389, 'New Record inserted On users id 45', 45, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:41:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 390, 'New Record inserted On users id 46', 46, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:41:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 391, 'Record updated On students id 23', 23, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:41:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 392, 'New Record inserted On students id 24', 24, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:47:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 393, 'New Record inserted On  student session id 24', 24, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:47:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 394, 'New Record inserted On users id 47', 47, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:47:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 395, 'New Record inserted On users id 48', 48, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:47:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 396, 'Record updated On students id 24', 24, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:47:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 397, 'New Record inserted On students id 25', 25, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:48:36', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 398, 'New Record inserted On  student session id 25', 25, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:48:36', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 399, 'New Record inserted On users id 49', 49, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:48:36', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 400, 'New Record inserted On users id 50', 50, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:48:36', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 401, 'Record updated On students id 25', 25, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:48:36', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 402, 'New Record inserted On students id 26', 26, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:49:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 403, 'New Record inserted On  student session id 26', 26, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:49:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 404, 'New Record inserted On users id 51', 51, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:49:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 405, 'New Record inserted On users id 52', 52, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:49:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 406, 'Record updated On students id 26', 26, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:49:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 407, 'New Record inserted On students id 27', 27, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:50:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 408, 'New Record inserted On  student session id 27', 27, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:50:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 409, 'New Record inserted On users id 53', 53, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:50:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 410, 'New Record inserted On users id 54', 54, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:50:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 411, 'Record updated On students id 27', 27, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:50:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 412, 'New Record inserted On students id 28', 28, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:51:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 413, 'New Record inserted On  student session id 28', 28, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:51:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 414, 'New Record inserted On users id 55', 55, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:51:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 415, 'New Record inserted On users id 56', 56, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:51:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 416, 'Record updated On students id 28', 28, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:51:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 417, 'New Record inserted On students id 29', 29, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:51:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 418, 'New Record inserted On  student session id 29', 29, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:51:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 419, 'New Record inserted On users id 57', 57, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:51:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 420, 'New Record inserted On users id 58', 58, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:51:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 421, 'Record updated On students id 29', 29, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:51:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 422, 'New Record inserted On students id 30', 30, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:52:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 423, 'New Record inserted On  student session id 30', 30, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:52:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 424, 'New Record inserted On users id 59', 59, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:52:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 425, 'New Record inserted On users id 60', 60, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:52:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 426, 'Record updated On students id 30', 30, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:52:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 427, 'New Record inserted On students id 31', 31, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:53:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 428, 'New Record inserted On  student session id 31', 31, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:53:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 429, 'New Record inserted On users id 61', 61, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:53:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 430, 'New Record inserted On users id 62', 62, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:53:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 431, 'Record updated On students id 31', 31, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:53:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 432, 'New Record inserted On students id 32', 32, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:54:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 433, 'New Record inserted On  student session id 32', 32, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:54:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 434, 'New Record inserted On users id 63', 63, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:54:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 435, 'New Record inserted On users id 64', 64, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:54:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 436, 'Record updated On students id 32', 32, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:54:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 437, 'New Record inserted On students id 33', 33, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:55:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 438, 'New Record inserted On  student session id 33', 33, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:55:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 439, 'New Record inserted On users id 65', 65, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:55:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 440, 'New Record inserted On users id 66', 66, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:55:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 441, 'Record updated On students id 33', 33, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:55:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 442, 'New Record inserted On students id 34', 34, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:55:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 443, 'New Record inserted On  student session id 34', 34, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:55:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 444, 'New Record inserted On users id 67', 67, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:55:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 445, 'New Record inserted On users id 68', 68, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:55:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 446, 'Record updated On students id 34', 34, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:55:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 447, 'New Record inserted On students id 35', 35, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:57:12', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 448, 'New Record inserted On  student session id 35', 35, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:57:12', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 449, 'New Record inserted On users id 69', 69, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:57:12', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 450, 'New Record inserted On users id 70', 70, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:57:12', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 451, 'Record updated On students id 35', 35, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:57:12', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 452, 'New Record inserted On students id 36', 36, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:58:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 453, 'New Record inserted On  student session id 36', 36, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:58:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 454, 'New Record inserted On users id 71', 71, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:58:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 455, 'New Record inserted On users id 72', 72, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:58:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 456, 'Record updated On students id 36', 36, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:58:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 457, 'New Record inserted On students id 37', 37, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:59:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 458, 'New Record inserted On  student session id 37', 37, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:59:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 459, 'New Record inserted On users id 73', 73, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:59:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 460, 'New Record inserted On users id 74', 74, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:59:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 461, 'Record updated On students id 37', 37, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 12:59:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 462, 'New Record inserted On students id 38', 38, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:01:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 463, 'New Record inserted On  student session id 38', 38, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:01:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 464, 'New Record inserted On users id 75', 75, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:01:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 465, 'New Record inserted On users id 76', 76, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:01:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 466, 'Record updated On students id 38', 38, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:01:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 467, 'Record updated On students id 24', 24, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:05:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 468, 'Record updated On  student session id 24', 24, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:05:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 469, 'New Record inserted On messages id 48', 48, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:05:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 470, 'New Record inserted On messages id 49', 49, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:08:59', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 471, 'New Record inserted On messages id 50', 50, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:10:09', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 472, 'New Record inserted On messages id 51', 51, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:10:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 473, 'New Record inserted On messages id 52', 52, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:21:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 474, 'New Record inserted On messages id 53', 53, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:25:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 475, 'New Record inserted On messages id 54', 54, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:26:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 476, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:33:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 477, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:33:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 478, 'New Record inserted On messages id 55', 55, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:34:52', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 479, 'New Record inserted On students id 39', 39, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:38:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 480, 'New Record inserted On  student session id 39', 39, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:38:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 481, 'New Record inserted On users id 77', 77, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:38:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 482, 'New Record inserted On users id 78', 78, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:38:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 483, 'Record updated On students id 39', 39, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:38:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 484, 'New Record inserted On students id 40', 40, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:40:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 485, 'New Record inserted On  student session id 40', 40, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:40:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 486, 'New Record inserted On users id 79', 79, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:40:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 487, 'New Record inserted On users id 80', 80, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:40:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 488, 'Record updated On students id 40', 40, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:40:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 489, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:41:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 490, 'New Record inserted On students id 41', 41, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:42:05', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 491, 'New Record inserted On  student session id 41', 41, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:42:05', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 492, 'New Record inserted On users id 81', 81, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:42:05', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 493, 'New Record inserted On users id 82', 82, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:42:05', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 494, 'Record updated On students id 41', 41, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:42:05', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 495, 'New Record inserted On students id 42', 42, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:45:14', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 496, 'New Record inserted On  student session id 42', 42, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:45:14', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 497, 'New Record inserted On users id 83', 83, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:45:14', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 498, 'New Record inserted On users id 84', 84, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:45:14', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 499, 'Record updated On students id 42', 42, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:45:14', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 500, 'New Record inserted On students id 43', 43, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:46:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 501, 'New Record inserted On  student session id 43', 43, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:46:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 502, 'New Record inserted On users id 85', 85, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:46:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 503, 'New Record inserted On users id 86', 86, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:46:01', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 504, 'Record updated On students id 43', 43, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:46:01', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 505, 'New Record inserted On students id 44', 44, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:47:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 506, 'New Record inserted On  student session id 44', 44, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:47:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 507, 'New Record inserted On users id 87', 87, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:47:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 508, 'New Record inserted On users id 88', 88, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:47:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 509, 'Record updated On students id 44', 44, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:47:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 510, 'New Record inserted On students id 45', 45, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:48:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 511, 'New Record inserted On  student session id 45', 45, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:48:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 512, 'New Record inserted On users id 89', 89, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:48:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 513, 'New Record inserted On users id 90', 90, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:48:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 514, 'Record updated On students id 45', 45, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:48:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 515, 'New Record inserted On students id 46', 46, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:49:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 516, 'New Record inserted On  student session id 46', 46, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:49:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 517, 'New Record inserted On users id 91', 91, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:49:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 518, 'New Record inserted On users id 92', 92, 3, 'Insert', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:49:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 519, 'Record updated On students id 46', 46, 3, 'Update', '119.160.64.204', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:49:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 520, 'New Record inserted On messages id 56', 56, 3, 'Insert', '119.160.64.65', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:54:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 521, 'Record updated On students id 22', 22, 3, 'Update', '119.160.64.65', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:57:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 522, 'Record updated On  student session id 22', 22, 3, 'Update', '119.160.64.65', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:57:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 523, 'Record updated On students id 23', 23, 3, 'Update', '119.160.64.65', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:58:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 524, 'Record updated On  student session id 23', 23, 3, 'Update', '119.160.64.65', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:58:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 525, 'Record updated On students id 24', 24, 3, 'Update', '119.160.64.65', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:58:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 526, 'Record updated On  student session id 24', 24, 3, 'Update', '119.160.64.65', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:58:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 527, 'New Record inserted On messages id 57', 57, 3, 'Insert', '119.160.64.65', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 13:59:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 528, 'New Record inserted On messages id 58', 58, 3, 'Insert', '119.160.64.65', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 14:00:14', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 529, 'New Record inserted On messages id 59', 59, 3, 'Insert', '111.119.178.178', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 14:42:14', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 530, 'New Record inserted On messages id 60', 60, 3, 'Insert', '111.119.178.178', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 14:42:32', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 531, 'New Record inserted On messages id 61', 61, 3, 'Insert', '111.119.178.178', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 14:44:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 532, 'New Record inserted On students id 47', 47, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 14:48:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 533, 'New Record inserted On  student session id 47', 47, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 14:48:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 534, 'New Record inserted On users id 93', 93, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 14:48:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 535, 'New Record inserted On users id 94', 94, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 14:48:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 536, 'Record updated On students id 47', 47, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 14:48:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 537, 'New Record inserted On students id 48', 48, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 14:54:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 538, 'New Record inserted On  student session id 48', 48, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 14:54:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 539, 'New Record inserted On users id 95', 95, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 14:54:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 540, 'New Record inserted On users id 96', 96, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 14:54:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 541, 'Record updated On students id 48', 48, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 14:54:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 542, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:11:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 543, 'New Record inserted On sms config id 4', 4, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:13:05', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 544, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:15:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 545, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:15:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 546, 'New Record inserted On messages id 62', 62, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:18:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 547, 'New Record inserted On messages id 63', 63, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:20:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 548, 'New Record inserted On messages id 64', 64, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:22:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 549, 'New Record inserted On messages id 65', 65, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:23:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 550, 'New Record inserted On messages id 66', 66, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:25:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 551, 'New Record inserted On messages id 67', 67, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:28:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 552, 'New Record inserted On students id 49', 49, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:30:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 553, 'New Record inserted On  student session id 49', 49, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:30:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 554, 'New Record inserted On users id 97', 97, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:30:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 555, 'New Record inserted On users id 98', 98, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:30:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 556, 'Record updated On students id 49', 49, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:30:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 557, 'New Record inserted On students id 50', 50, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:33:20', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 558, 'New Record inserted On  student session id 50', 50, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:33:20', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 559, 'New Record inserted On users id 99', 99, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:33:20', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 560, 'New Record inserted On users id 100', 100, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:33:20', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 561, 'Record updated On students id 50', 50, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:33:20', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 562, 'New Record inserted On students id 51', 51, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:39:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 563, 'New Record inserted On  student session id 51', 51, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:39:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 564, 'New Record inserted On users id 101', 101, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:39:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 565, 'New Record inserted On users id 102', 102, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:39:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 566, 'Record updated On students id 51', 51, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:39:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 567, 'New Record inserted On students id 52', 52, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:39:59', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 568, 'New Record inserted On  student session id 52', 52, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:39:59', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 569, 'New Record inserted On users id 103', 103, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:39:59', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 570, 'New Record inserted On users id 104', 104, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:39:59', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 571, 'Record updated On students id 52', 52, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:39:59', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 572, 'New Record inserted On students id 53', 53, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:40:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 573, 'New Record inserted On  student session id 53', 53, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:40:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 574, 'New Record inserted On users id 105', 105, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:40:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 575, 'New Record inserted On users id 106', 106, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:40:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 576, 'Record updated On students id 53', 53, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:40:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 577, 'New Record inserted On students id 54', 54, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:41:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 578, 'New Record inserted On  student session id 54', 54, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:41:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 579, 'New Record inserted On users id 107', 107, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:41:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 580, 'New Record inserted On users id 108', 108, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:41:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 581, 'Record updated On students id 54', 54, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:41:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 582, 'New Record inserted On students id 55', 55, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:41:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 583, 'New Record inserted On  student session id 55', 55, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:41:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 584, 'New Record inserted On users id 109', 109, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:41:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 585, 'New Record inserted On users id 110', 110, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:41:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 586, 'Record updated On students id 55', 55, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:41:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 587, 'New Record inserted On students id 56', 56, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:42:12', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 588, 'New Record inserted On  student session id 56', 56, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:42:12', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 589, 'New Record inserted On users id 111', 111, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:42:12', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 590, 'New Record inserted On users id 112', 112, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:42:12', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 591, 'Record updated On students id 56', 56, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:42:12', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 592, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 15:52:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 593, 'Record updated On notification setting id 3', 3, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 16:04:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 594, 'Record updated On notification setting id 3', 3, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 16:13:20', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 595, 'New Record inserted On student apply leave id 1', 1, NULL, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-25 16:20:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 596, 'New Record inserted On student apply leave id 2', 2, NULL, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-25 16:21:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 597, 'Record updated On  student apply leave id 2', 2, NULL, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-25 16:21:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 598, 'New Record inserted On student apply leave id 3', 3, NULL, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-25 16:21:25', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 599, 'Record updated On  student apply leave id 3', 3, NULL, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-25 16:21:25', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 600, 'Record deleted On student apply leave id 1', 1, NULL, 'Delete', '119.160.67.238', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-25 16:22:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 601, 'Record deleted On student apply leave id 1', 1, NULL, 'Delete', '119.160.67.238', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-25 16:22:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 602, 'Record deleted On student apply leave id 3', 3, NULL, 'Delete', '119.160.67.238', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-25 16:22:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 603, 'Record deleted On student apply leave id 3', 3, NULL, 'Delete', '119.160.67.238', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-25 16:22:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 604, 'New Record inserted On  student attendences id 2', 2, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 16:24:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 605, 'New Record inserted On  student attendences id 3', 3, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 16:24:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 606, 'New Record inserted On  student attendences id 4', 4, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 16:24:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 607, 'New Record inserted On  student attendences id 5', 5, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 16:24:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 608, 'Record updated On notification setting id 4', 4, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 16:26:35', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 609, 'Record updated On  student attendences id 2', 2, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 16:27:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 610, 'Record updated On  student attendences id 3', 3, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 16:27:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 611, 'Record updated On  student attendences id 4', 4, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 16:27:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 612, 'Record updated On  student attendences id 5', 5, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 16:27:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 613, 'New Record inserted On  income head   id 1', 1, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 16:34:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 614, 'New Record inserted On  income head   id 2', 2, 1, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-25 16:37:28', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 615, 'New Record inserted On  Income   id 1', 1, 1, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-25 16:37:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 616, 'Record updated On  Income   id 1', 1, 1, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-25 16:37:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 617, 'New Record inserted On  Income   id 2', 2, 3, 'Insert', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 16:38:20', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 618, 'Record updated On  Income   id 2', 2, 3, 'Update', '119.160.67.238', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 16:38:20', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 619, 'Record deleted On  Income   id 2', 2, 3, 'Delete', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:08:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 620, 'Record updated On  income head   id 1', 1, 3, 'Update', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:14:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 621, 'Record updated On  income head   id 1', 1, 3, 'Update', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:15:33', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 622, 'New Record inserted On  expense head id 1', 1, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:19:25', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 623, 'Record updated On  expense head id 1', 1, 3, 'Update', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:20:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 624, 'New Record inserted On  expenses   id 1', 1, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:24:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 625, 'New Record inserted On  expenses   id 2', 2, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:26:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 626, 'Record updated On  expenses   id 2', 2, 3, 'Update', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:26:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 627, 'New Record inserted On  Income   id 3', 3, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:29:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 628, 'New Record inserted On students id 57', 57, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:38:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 629, 'New Record inserted On  student session id 57', 57, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:38:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 630, 'New Record inserted On users id 113', 113, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:38:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 631, 'New Record inserted On users id 114', 114, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:38:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 632, 'Record updated On students id 57', 57, 3, 'Update', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:38:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 633, 'New Record inserted On visitors purpose id 1', 1, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:47:32', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 634, 'Record updated On visitors purpose id 1', 1, 3, 'Update', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:48:14', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 635, 'New Record inserted On  complaint_type id 1', 1, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:51:28', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 636, 'New Record inserted On reference id 1', 1, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:56:09', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 637, 'New Record inserted On  Complain id 1', 1, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 16:57:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 638, 'Record updated On Complaint id 1', 1, 3, 'Update', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 21:59:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 639, 'New Record inserted On  Admission Enquiry  Postal Receive id 1', 1, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 22:07:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 640, 'New Record inserted On  Admission Enquiry  Postal Dispatch id 2', 2, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 22:08:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 641, 'New Record inserted On  Admission Enquiry  Postal Dispatch id 3', 3, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 22:11:25', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 642, 'New Record inserted On  Phone Call Log id 1', 1, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 22:14:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 643, 'New Record inserted On  visitors  id 1', 1, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 22:17:54', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 644, 'New Record inserted On source id 1', 1, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 22:18:54', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 645, 'New Record inserted On source id 2', 2, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 22:21:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 646, 'New Record inserted On  enquiry id 1', 1, 3, 'Insert', '119.160.64.71', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 22:22:39', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 647, 'New Record inserted On  fee type id 4', 4, 3, 'Insert', '119.160.67.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 23:44:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 648, 'New Record inserted On  fee groups feetype id 9', 9, 3, 'Insert', '119.160.67.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 23:45:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 649, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 23:49:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 650, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 23:52:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 651, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 23:52:41', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 652, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 23:54:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 653, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-25 23:55:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 654, 'New Record inserted On messages id 68', 68, 3, 'Insert', '39.33.180.156', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 00:02:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 655, 'New Record inserted On messages id 69', 69, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:35:57', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 656, 'New Record inserted On messages id 70', 70, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:36:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 657, 'New Record inserted On messages id 71', 71, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:36:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 658, 'Record updated On  disable reason id 2', 2, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:39:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 659, 'Record updated On students id 23', 23, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:39:54', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 660, 'Record updated On users id 45', 45, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:41:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 661, 'Record updated On  disable reason id 2', 2, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:41:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 662, 'New Record inserted On disable reason id 3', 3, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:42:10', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 663, 'Record updated On students id 23', 23, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:43:58', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 664, 'Record updated On students id 22', 22, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:44:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 665, 'Record updated On users id 43', 43, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:45:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 666, 'New Record inserted On  student attendences id 6', 6, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:47:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 667, 'New Record inserted On  student attendences id 7', 7, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:47:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 668, 'New Record inserted On  student attendences id 8', 8, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:47:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 669, 'New Record inserted On  student attendences id 9', 9, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:47:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 670, 'New Record inserted On  student attendences id 10', 10, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:48:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 671, 'New Record inserted On  student attendences id 11', 11, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:48:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 672, 'New Record inserted On  student attendences id 12', 12, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:48:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 673, 'New Record inserted On  student attendences id 13', 13, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:48:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 674, 'New Record inserted On  student attendences id 14', 14, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:53:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 675, 'New Record inserted On  student attendences id 15', 15, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:53:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 676, 'New Record inserted On  student attendences id 16', 16, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:53:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 677, 'New Record inserted On  student attendences id 17', 17, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:53:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 678, 'New Record inserted On  student attendences id 18', 18, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:58:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 679, 'New Record inserted On  student attendences id 19', 19, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:58:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 680, 'New Record inserted On  student attendences id 20', 20, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:58:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 681, 'New Record inserted On  student attendences id 21', 21, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 01:58:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 682, 'New Record inserted On  student attendences id 22', 22, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:00:36', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 683, 'New Record inserted On  student attendences id 23', 23, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:00:36', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 684, 'New Record inserted On  student attendences id 24', 24, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:00:36', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 685, 'New Record inserted On  student attendences id 25', 25, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:00:36', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 686, 'Record updated On students id 22', 22, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:02:28', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 687, 'Record updated On  student session id 22', 22, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:02:28', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 688, 'Record updated On students id 24', 24, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:02:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 689, 'Record updated On  student session id 24', 24, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:02:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 690, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:06:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 691, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:06:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 692, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:07:01', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 693, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:07:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 694, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:07:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 695, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:08:38', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 696, 'New Record inserted On  student attendences id 26', 26, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:16:45', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 697, 'New Record inserted On  student attendences id 27', 27, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:16:45', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 698, 'New Record inserted On  student attendences id 28', 28, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:16:45', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 699, 'New Record inserted On  student attendences id 29', 29, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:16:45', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 700, 'New Record inserted On  student attendences id 30', 30, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:18:52', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 701, 'New Record inserted On  student attendences id 31', 31, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:18:52', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 702, 'New Record inserted On  student attendences id 32', 32, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:18:52', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 703, 'New Record inserted On  student attendences id 33', 33, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:18:52', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 704, 'New Record inserted On  student attendences id 34', 34, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:21:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 705, 'New Record inserted On  student attendences id 35', 35, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:21:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 706, 'New Record inserted On  student attendences id 36', 36, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:21:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 707, 'New Record inserted On  student attendences id 37', 37, 3, 'Insert', '119.160.67.192', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 02:21:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 708, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.193', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 07:59:57', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 709, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.193', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 08:23:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 710, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.193', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 08:24:28', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 711, 'New Record inserted On  student attendences id 38', 38, 3, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 10:29:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 712, 'New Record inserted On  student attendences id 39', 39, 3, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 10:29:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 713, 'New Record inserted On  student attendences id 40', 40, 3, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 10:29:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 714, 'New Record inserted On  student attendences id 41', 41, 3, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 10:29:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 715, 'New Record inserted On send notification id 1', 1, 3, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 10:32:05', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 716, 'New Record inserted On send notification id 2', 2, 3, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 10:32:51', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 717, 'New Record inserted On send notification id 3', 3, 3, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 10:33:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 718, 'New Record inserted On lesson id 1', 1, 3, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 10:42:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 719, 'New Record inserted On lesson id 2', 2, 3, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 10:42:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 720, 'Record updated On  Page List id 1', 1, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 10:49:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 721, 'Record updated On  Page List id 1', 1, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 10:51:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 722, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 10:52:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 723, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 10:53:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 724, 'New Record inserted On exam groups id 1', 1, 3, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 11:04:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 725, 'New Record inserted On exam group exams name id 1', 1, 3, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 11:04:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 726, 'Record updated On  exam group exams name id 1', 1, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 11:06:19', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 727, 'Record updated On  admit cards id 1', 1, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 11:19:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 728, 'Record updated On  marksheets id 1', 1, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 11:23:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 729, 'New Record inserted On exam groups id 2', 2, 3, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 11:34:10', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 730, 'New Record inserted On exam group exams name id 2', 2, 3, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 11:44:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 731, 'Record deleted On exam groups id 2', 2, 3, 'Delete', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 11:49:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 732, 'New Record inserted On exam groups id 3', 3, 3, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 11:49:38', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 733, 'New Record inserted On exam group exams name id 3', 3, 3, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 11:53:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 734, 'Record updated On  exam group exams name id 3', 3, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 12:47:57', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 735, 'Record updated On  admit cards id 1', 1, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 12:57:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 736, 'Record updated On  admit cards id 1', 1, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 13:05:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 737, 'Record updated On  admit cards id 1', 1, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 13:10:32', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 738, 'Record updated On  admit cards id 1', 1, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 13:12:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 739, 'Record updated On  marksheets id 1', 1, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 13:32:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 740, 'Record updated On  marksheets id 1', 1, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 13:36:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 741, 'New Record inserted On grades id 1', 1, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 13:42:54', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 742, 'Record updated On grades id 1', 1, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 13:43:09', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 743, 'New Record inserted On grades id 2', 2, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 13:46:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 744, 'New Record inserted On grades id 3', 3, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 13:47:28', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 745, 'New Record inserted On grades id 4', 4, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 13:48:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 746, 'New Record inserted On grades id 5', 5, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 13:49:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 747, 'New Record inserted On  enquiry id 2', 2, 3, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 14:04:57', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 748, 'New Record inserted On visitors purpose id 2', 2, 1, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 14:05:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 749, 'Record updated On visitors purpose id 2', 2, 1, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 14:06:01', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 750, 'New Record inserted On source id 3', 3, 1, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 14:06:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 751, 'New Record inserted On reference id 2', 2, 1, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 14:06:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 752, 'New Record inserted On  complaint_type id 2', 2, 1, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 14:10:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 753, 'New Record inserted On  Complain id 2', 2, 1, 'Insert', '119.160.67.164', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 14:10:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 754, 'Record updated On  enquiry id 2', 2, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 14:11:36', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 755, 'Record updated On  enquiry id 2', 2, 3, 'Update', '119.160.67.164', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 14:11:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 756, 'New Record inserted On  online exam id 1', 1, 3, 'Insert', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 14:22:12', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 757, 'New Record inserted On  questions id 1', 1, 3, 'Insert', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 14:25:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 758, 'New Record inserted On  onlineexam questions id 1', 1, 3, 'Insert', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 14:27:12', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 759, 'New Record inserted On  online exam id 2', 2, 1, 'Insert', '119.160.64.223', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 14:35:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 760, 'New Record inserted On  onlineexam questions id 2', 2, 1, 'Insert', '119.160.64.223', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 14:36:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 761, 'Record deleted On  onlineexam questions id 2', 2, 1, 'Delete', '119.160.64.223', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 14:39:01', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 762, 'Record deleted On  onlineexam questions id 1', 1, 3, 'Delete', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 14:42:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 763, 'New Record inserted On  questions id 2', 2, 1, 'Insert', '119.160.64.223', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 14:50:35', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 764, 'New Record inserted On  onlineexam questions id 3', 3, 1, 'Insert', '119.160.64.223', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 14:51:57', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 765, 'New Record inserted On  onlineexam questions id 4', 4, 3, 'Insert', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:00:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 766, 'Record updated On  online exam id 1', 1, 3, 'Update', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:01:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 767, 'Record updated On  online exam id 1', 1, 3, 'Update', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:01:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 768, 'Record updated On  online exam id 1', 1, 3, 'Update', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:01:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 769, 'Record updated On  online exam id 1', 1, 3, 'Update', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:02:32', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 770, 'Record updated On  online exam id 1', 1, 3, 'Update', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:02:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 771, 'Record updated On  online exam id 1', 1, 3, 'Update', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:04:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 772, 'Record updated On  online exam id 1', 1, 3, 'Update', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:04:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 773, 'Record deleted On  onlineexam questions id 4', 4, 3, 'Delete', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:05:39', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 774, 'New Record inserted On  onlineexam questions id 5', 5, 3, 'Insert', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:05:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 775, 'New Record inserted On  onlineexam questions id 6', 6, 3, 'Insert', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:06:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 776, 'Record deleted On  onlineexam questions id 6', 6, 3, 'Delete', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:06:04', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 777, 'New Record inserted On  onlineexam questions id 7', 7, 3, 'Insert', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:06:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 778, 'Record updated On  online exam id 1', 1, 3, 'Update', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:08:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 779, 'New Record inserted On student edit fields id 1', 1, 3, 'Insert', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:11:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 780, 'New Record inserted On student edit fields id 2', 2, 3, 'Insert', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:11:19', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 781, 'New Record inserted On student edit fields id 3', 3, 3, 'Insert', '119.160.64.223', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 15:11:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 782, 'Record updated On students id 22', 22, NULL, 'Update', '119.160.64.223', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 15:12:19', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 783, 'Record updated On students id 22', 22, NULL, 'Update', '119.160.64.223', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 15:12:19', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 784, 'New Record inserted On  questions id 3', 3, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 19:44:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 785, 'Record deleted On  online exam id 1', 1, 3, 'Delete', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 19:44:59', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 786, 'New Record inserted On  online exam id 3', 3, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 19:45:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 787, 'New Record inserted On  onlineexam questions id 8', 8, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 19:46:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 788, 'Record updated On  online exam id 3', 3, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 19:50:19', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 789, 'Record updated On  online exam id 3', 3, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 19:50:19', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 790, 'Record updated On  online exam id 3', 3, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 19:50:45', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 791, 'Record updated On  online exam id 3', 3, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 20:04:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 792, 'Record updated On  online exam id 3', 3, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 20:04:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 793, 'Record updated On  online exam id 3', 3, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 20:04:41', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 794, 'Record updated On staff id 3', 3, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 20:31:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 795, 'Record updated On staff id 3', 3, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 20:31:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 796, 'Record updated On staff id 3', 3, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 20:31:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 797, 'Record updated On staff id 3', 3, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 20:31:39', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 798, 'Record updated On staff id 3', 3, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 20:31:39', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 799, 'Record updated On staff id 3', 3, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 20:31:39', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 800, 'Record updated On staff id 3', 3, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 20:33:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 801, 'Record updated On staff id 3', 3, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 20:33:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 802, 'New Record inserted On staff payslip id 1', 1, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:13:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 803, 'New Record inserted On payslip allowance id 1', 1, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:13:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 804, 'New Record inserted On payslip allowance id 2', 2, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:13:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 805, 'Record updated On staff payslip id 1', 1, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:13:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 806, 'New Record inserted On department id 1', 1, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:23:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 807, 'New Record inserted On  staff designation id 1', 1, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:27:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 808, 'New Record inserted On  staff designation id 2', 2, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:27:32', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 809, 'New Record inserted On  staff designation id 3', 3, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:27:38', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 810, 'New Record inserted On  staff designation id 4', 4, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:27:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 811, 'New Record inserted On  staff designation id 5', 5, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:27:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 812, 'New Record inserted On  staff designation id 6', 6, 1, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 21:34:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 813, 'Record deleted On staff designation id 6', 6, 1, 'Delete', '119.160.67.41', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 21:34:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 814, 'New Record inserted On  staff designation id 7', 7, 1, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 21:35:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 815, 'New Record inserted On department id 2', 2, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:36:05', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 816, 'New Record inserted On department id 3', 3, 1, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-26 21:36:32', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 817, 'Record updated On staff id 4', 4, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:52:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 818, 'Record updated On staff id 4', 4, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:58:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 819, 'Record updated On staff id 4', 4, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:58:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 820, 'Record updated On staff id 4', 4, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:58:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 821, 'Record updated On staff id 4', 4, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:59:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 822, 'Record updated On staff id 4', 4, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 21:59:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 823, 'New Record inserted On class teacher id 1', 1, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 22:08:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 824, 'Record updated On staff id 4', 4, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 22:17:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 825, 'Record updated On staff id 4', 4, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 22:17:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 826, 'Record updated On settings id 2', 2, 3, 'Update', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 22:42:49', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 827, 'New Record inserted On class teacher id 2', 2, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 22:45:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 828, 'New Record inserted On class teacher id 3', 3, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 22:51:51', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 829, 'New Record inserted On class teacher id 4', 4, 3, 'Insert', '119.160.67.41', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-26 22:53:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 830, 'New Record inserted On  subject timetable id 1', 1, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 00:48:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 831, 'New Record inserted On topic id 1', 1, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 00:50:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 832, 'Record updated On  topic id 1', 1, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 00:54:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 833, 'New Record inserted On messages id 72', 72, 4, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-27 01:01:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 834, 'New Record inserted On messages id 73', 73, 4, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 92.0.4515.131', '2023-02-27 01:03:35', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 835, 'New Record inserted On contents id 1', 1, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 01:20:38', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 836, 'Record updated On  contents id 1', 1, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 01:20:38', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 837, 'New Record inserted On contents id 2', 2, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 01:23:57', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 838, 'Record updated On  contents id 2', 2, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 01:23:57', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 839, 'New Record inserted On homework id 1', 1, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 01:27:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 840, 'Record updated On homework id 1', 1, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 01:27:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 841, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 01:30:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 842, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 01:31:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 843, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 01:33:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 844, 'New Record inserted On messages id 74', 74, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 01:35:54', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 845, 'New Record inserted On messages id 75', 75, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 01:37:13', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 846, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 01:38:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 847, 'New Record inserted On messages id 76', 76, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 01:38:28', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 848, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 01:50:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 849, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 02:07:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 850, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 02:07:33', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 851, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 02:08:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 852, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 02:17:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 853, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 02:17:52', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 854, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 02:22:35', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 855, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 02:26:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 856, 'Record updated On students id 22', 22, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 02:43:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 857, 'Record updated On  student session id 22', 22, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 02:43:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 858, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:08:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 859, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:11:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 860, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:13:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 861, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:14:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 862, 'New Record inserted On  student attendences id 42', 42, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:15:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 863, 'New Record inserted On  student attendences id 43', 43, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:15:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 864, 'New Record inserted On  student attendences id 44', 44, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:15:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 865, 'New Record inserted On  student attendences id 45', 45, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:15:18', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 866, 'New Record inserted On  student attendences id 46', 46, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:17:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 867, 'New Record inserted On  student attendences id 47', 47, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:17:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 868, 'New Record inserted On  student attendences id 48', 48, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:17:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 869, 'New Record inserted On  student attendences id 49', 49, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:17:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 870, 'New Record inserted On  student attendences id 1', 1, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:18:39', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 871, 'New Record inserted On  student attendences id 2', 2, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:18:39', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 872, 'New Record inserted On  student attendences id 3', 3, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:18:39', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 873, 'New Record inserted On  student attendences id 4', 4, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:18:39', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 874, 'New Record inserted On messages id 77', 77, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:20:12', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 875, 'New Record inserted On messages id 78', 78, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:20:39', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 876, 'New Record inserted On messages id 79', 79, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:21:30', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 877, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:22:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 878, 'New Record inserted On messages id 80', 80, 3, 'Insert', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:22:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 879, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:22:38', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 880, 'Record updated On  student attendences id 1', 1, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:23:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 881, 'Record updated On  student attendences id 2', 2, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:23:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 882, 'Record updated On  student attendences id 3', 3, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:23:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 883, 'Record updated On  student attendences id 4', 4, 3, 'Update', '119.160.64.228', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 04:23:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 884, 'Record updated On notification setting id 1', 1, 3, 'Update', '119.160.64.230', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 16:12:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 885, 'Record updated On notification setting id 2', 2, 3, 'Update', '119.160.64.230', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 16:13:41', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 886, 'Record updated On notification setting id 3', 3, 3, 'Update', '119.160.64.230', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 16:16:01', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 887, 'Record updated On notification setting id 3', 3, 3, 'Update', '119.160.64.230', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 16:22:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 888, 'Record updated On notification setting id 3', 3, 3, 'Update', '119.160.64.230', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 16:23:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 889, 'New Record inserted On messages id 81', 81, 3, 'Insert', '119.160.64.230', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 16:24:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 890, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.230', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 16:24:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 891, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.230', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 17:19:54', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 892, 'Record updated On sms config id clickatell', 0, 3, 'Update', '119.160.64.230', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 17:19:54', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 893, 'New Record inserted On messages id 82', 82, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 18:11:41', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 894, 'New Record inserted On messages id 83', 83, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 18:47:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 895, 'Record updated On students id 22', 22, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 19:21:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 896, 'Record updated On  student session id 22', 22, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 19:21:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 897, 'Record updated On students id 22', 22, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 19:22:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 898, 'Record updated On  student session id 22', 22, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 19:22:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 899, 'Record updated On notification setting id 3', 3, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 19:40:46', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 900, 'Record updated On notification setting id 3', 3, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 19:43:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 901, 'New Record inserted On students id 58', 58, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:00:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 902, 'New Record inserted On  student session id 58', 58, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:00:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 903, 'New Record inserted On users id 115', 115, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:00:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 904, 'New Record inserted On users id 116', 116, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:00:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 905, 'Record updated On students id 58', 58, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:00:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 906, 'New Record inserted On  student attendences id 5', 5, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:02:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 907, 'Record updated On  student attendences id 1', 1, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:02:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 908, 'Record updated On  student attendences id 2', 2, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:02:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 909, 'Record updated On  student attendences id 3', 3, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:02:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 910, 'Record updated On  student attendences id 4', 4, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:02:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 911, 'Record updated On settings id 1', 1, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:04:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 912, 'Record updated On students id 47', 47, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:46:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 913, 'Record updated On  student session id 47', 47, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:46:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 914, 'Record updated On students id 47', 47, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:46:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 915, 'Record updated On  student session id 47', 47, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:46:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 916, 'Record updated On students id 47', 47, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:46:54', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 917, 'Record updated On  student session id 47', 47, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:46:54', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 918, 'Record updated On students id 49', 49, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:47:20', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 919, 'Record updated On  student session id 49', 49, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:47:20', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 920, 'New Record inserted On  student attendences id 6', 6, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:47:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 921, 'New Record inserted On  student attendences id 7', 7, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:47:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 922, 'New Record inserted On  student attendences id 8', 8, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:47:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 923, 'New Record inserted On  student attendences id 9', 9, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:47:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 924, 'New Record inserted On  student attendences id 10', 10, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:47:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 925, 'New Record inserted On  student attendences id 11', 11, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:49:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 926, 'New Record inserted On  student attendences id 12', 12, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:49:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 927, 'New Record inserted On  student attendences id 13', 13, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:49:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 928, 'New Record inserted On  student attendences id 14', 14, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:49:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 929, 'New Record inserted On  student attendences id 15', 15, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:49:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 930, 'Record updated On notification setting id 4', 4, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:51:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 931, 'New Record inserted On  student attendences id 16', 16, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:52:10', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 932, 'New Record inserted On  student attendences id 17', 17, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:52:10', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 933, 'New Record inserted On  student attendences id 18', 18, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:52:10', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 934, 'New Record inserted On  student attendences id 19', 19, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:52:10', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 935, 'New Record inserted On  student attendences id 20', 20, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:52:10', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 936, 'New Record inserted On  student attendences id 21', 21, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:53:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 937, 'New Record inserted On  student attendences id 22', 22, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:53:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 938, 'New Record inserted On  student attendences id 23', 23, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:53:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 939, 'New Record inserted On  student attendences id 24', 24, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:53:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 940, 'New Record inserted On  student attendences id 25', 25, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:53:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 941, 'Record updated On students id 57', 57, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:55:05', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 942, 'Record updated On  student session id 57', 57, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:55:05', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 943, 'New Record inserted On students id 59', 59, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:58:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 944, 'New Record inserted On  student session id 59', 59, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:58:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 945, 'New Record inserted On users id 117', 117, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:58:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 946, 'New Record inserted On users id 118', 118, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:58:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 947, 'Record updated On students id 59', 59, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 21:58:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 948, 'Record updated On students id 22', 22, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 22:06:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 949, 'Record updated On  student session id 22', 22, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 22:06:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 950, 'Record updated On students id 22', 22, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 22:06:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 951, 'Record updated On  id card id 1', 1, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 22:08:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 952, 'Record updated On  id card id 1', 1, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 22:09:32', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 953, 'Record updated On students id 22', 22, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 22:14:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 954, 'Record updated On  student session id 22', 22, 3, 'Update', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 22:14:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 955, 'New Record inserted On messages id 84', 84, 3, 'Insert', '119.160.64.68', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 22:16:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 956, 'New Record inserted On messages id 85', 85, 3, 'Insert', '39.33.225.189', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 22:22:31', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 957, 'Record updated On notification setting id 4', 4, 3, 'Update', '39.33.225.189', 'Windows 10', 'Chrome 110.0.0.0', '2023-02-27 22:31:51', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 958, 'Record updated On students id 22', 22, 3, 'Update', '119.160.67.140', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 11:12:20', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 959, 'Record updated On  student session id 22', 22, 3, 'Update', '119.160.67.140', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 11:12:20', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 960, 'New Record inserted On sms config id 5', 5, 1, 'Insert', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:34:45', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 961, 'Record updated On settings id 1', 1, 1, 'Update', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:35:28', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 962, 'Record updated On settings id 1', 1, 1, 'Update', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:36:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 963, 'Record updated On settings id 1', 1, 1, 'Update', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:36:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 964, 'Record updated On settings id 1', 1, 1, 'Update', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:37:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 965, 'New Record inserted On students id 60', 60, 1, 'Insert', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:39:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 966, 'New Record inserted On  student session id 60', 60, 1, 'Insert', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:39:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 967, 'New Record inserted On users id 119', 119, 1, 'Insert', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:39:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 968, 'New Record inserted On users id 120', 120, 1, 'Insert', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:39:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 969, 'Record updated On students id 60', 60, 1, 'Update', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:39:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 970, 'Record updated On students id 60', 60, 1, 'Update', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:41:33', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 971, 'Record updated On  student session id 60', 60, 1, 'Update', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:41:33', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 972, 'Record updated On staff id 3', 3, NULL, 'Update', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:50:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 973, 'New Record inserted On  fee groups feetype id 10', 10, 1, 'Insert', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:53:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 974, 'Record updated On settings id 1', 1, 1, 'Update', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:54:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 975, 'New Record inserted On  student attendences id 26', 26, 1, 'Insert', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:56:00', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 976, 'New Record inserted On exam groups id 4', 4, 1, 'Insert', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:57:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 977, 'New Record inserted On exam group exams name id 4', 4, 1, 'Insert', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 15:58:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 978, 'New Record inserted On transport route id 1', 1, 1, 'Insert', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 16:01:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 979, 'New Record inserted On vehicles id 1', 1, 1, 'Insert', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 16:02:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 980, 'New Record inserted On vehicle routes id 1', 1, 1, 'Insert', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 16:02:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 981, 'Record updated On students id 60', 60, 1, 'Update', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 16:03:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 982, 'Record updated On  student session id 60', 60, 1, 'Update', '119.160.64.39', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-01 16:03:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 983, 'New Record inserted On  student attendences id 27', 27, 3, 'Insert', '198.16.66.197', 'Windows 10', 'Firefox 110.0', '2023-03-07 15:44:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 984, 'New Record inserted On  student attendences id 28', 28, 3, 'Insert', '198.16.66.197', 'Windows 10', 'Firefox 110.0', '2023-03-07 15:44:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 985, 'New Record inserted On  student attendences id 29', 29, 3, 'Insert', '198.16.66.197', 'Windows 10', 'Firefox 110.0', '2023-03-07 15:44:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 986, 'New Record inserted On  student attendences id 30', 30, 3, 'Insert', '198.16.66.197', 'Windows 10', 'Firefox 110.0', '2023-03-07 15:44:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 987, 'New Record inserted On  student attendences id 31', 31, 3, 'Insert', '198.16.66.197', 'Windows 10', 'Firefox 110.0', '2023-03-07 15:44:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 988, 'New Record inserted On  student attendences id 32', 32, 3, 'Insert', '198.16.66.197', 'Windows 10', 'Firefox 110.0', '2023-03-07 15:44:27', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 989, 'Record updated On students id 49', 49, 3, 'Update', '111.119.185.46', 'Android', 'Chrome 110.0.0.0', '2023-03-08 23:28:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 990, 'Record updated On  student session id 49', 49, 3, 'Update', '111.119.185.46', 'Android', 'Chrome 110.0.0.0', '2023-03-08 23:28:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 991, 'New Record inserted On messages id 86', 86, 3, 'Insert', '111.119.185.46', 'Android', 'Chrome 110.0.0.0', '2023-03-08 23:30:43', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 992, 'New Record inserted On messages id 87', 87, 3, 'Insert', '111.119.185.46', 'Android', 'Chrome 110.0.0.0', '2023-03-08 23:33:07', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 993, 'New Record inserted On contents id 5', 5, 1, 'Insert', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 17:57:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 994, 'Record updated On  contents id 5', 5, 1, 'Update', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 17:57:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 995, 'New Record inserted On contents id 6', 6, 1, 'Insert', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 18:00:09', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 996, 'Record updated On  contents id 6', 6, 1, 'Update', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 18:00:09', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 997, 'New Record inserted On contents id 7', 7, 1, 'Insert', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 18:02:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 998, 'Record updated On  contents id 7', 7, 1, 'Update', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 18:02:17', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 999, 'New Record inserted On contents id 8', 8, 3, 'Insert', '198.16.66.196', 'Windows 10', 'Firefox 110.0', '2023-03-12 18:18:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1000, 'Record updated On  contents id 8', 8, 3, 'Update', '198.16.66.196', 'Windows 10', 'Firefox 110.0', '2023-03-12 18:18:48', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1001, 'Record deleted On contents id 7', 7, 1, 'Delete', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 18:19:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1002, 'Record deleted On contents id 8', 8, 3, 'Delete', '198.16.66.196', 'Windows 10', 'Firefox 110.0', '2023-03-12 18:25:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1003, 'New Record inserted On books id 1', 1, 1, 'Insert', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 18:39:45', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1004, 'New Record inserted On books id 2', 2, 3, 'Insert', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 18:50:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1005, 'New Record inserted On libarary members id 1', 1, 3, 'Insert', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 18:50:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1006, 'Record updated On books id 2', 2, 3, 'Update', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 18:51:38', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1007, 'New Record inserted On book issues id 1', 1, 3, 'Insert', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 18:52:05', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1008, 'New Record inserted On item supplier id 1', 1, 3, 'Insert', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 19:15:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1009, 'New Record inserted On item store id 1', 1, 1, 'Insert', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 19:25:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1010, 'New Record inserted On item category id 1', 1, 3, 'Insert', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 19:31:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1011, 'New Record inserted On item category id 2', 2, 3, 'Insert', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 19:31:36', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1012, 'New Record inserted On item category id 3', 3, 1, 'Insert', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 19:32:02', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1013, 'New Record inserted On item id 1', 1, 1, 'Insert', '203.96.171.61', 'Windows 10', 'Chrome 110.0.0.0', '2023-03-12 19:32:57', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1014, 'Record updated On  certificates id 1', 1, 3, 'Update', '111.119.187.47', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 09:53:23', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1015, 'Record updated On  certificates id 1', 1, 3, 'Update', '111.119.187.47', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 10:09:33', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1016, 'Record updated On  certificates id 1', 1, 3, 'Update', '111.119.187.47', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 10:14:55', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1017, 'Record updated On students id 49', 49, 3, 'Update', '111.119.187.47', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 10:16:54', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1018, 'Record updated On  student session id 49', 49, 3, 'Update', '111.119.187.47', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 10:16:54', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1019, 'New Record inserted On messages id 88', 88, 3, 'Insert', '111.119.187.47', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-17 10:17:26', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1020, 'New Record inserted On item supplier id 2', 2, 1, 'Insert', '111.119.187.43', 'Windows 10', 'Firefox 111.0', '2023-03-18 10:03:14', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1021, 'New Record inserted On item store id 2', 2, 3, 'Insert', '111.119.187.43', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 10:03:45', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1022, 'New Record inserted On item id 2', 2, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 13:25:38', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1023, 'New Record inserted On item stock id 1', 1, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 13:27:11', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1024, 'New Record inserted On item stock id 2', 2, 1, 'Insert', '111.119.187.58', 'Windows 10', 'Firefox 111.0', '2023-03-18 13:28:10', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1025, 'New Record inserted On item issue id 1', 1, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 13:33:05', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1026, 'Record deleted On transport route id 1', 1, 3, 'Delete', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 13:34:06', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1027, 'New Record inserted On transport route id 2', 2, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 13:36:34', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1028, 'New Record inserted On transport route id 3', 3, 1, 'Insert', '111.119.187.58', 'Windows 10', 'Firefox 111.0', '2023-03-18 13:37:28', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1029, 'New Record inserted On vehicles id 2', 2, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 13:40:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1030, 'New Record inserted On vehicle routes id 2', 2, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 13:44:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1031, 'New Record inserted On vehicle routes id 3', 3, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 13:50:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1032, 'New Record inserted On vehicle routes id 4', 4, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 13:55:33', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1033, 'New Record inserted On hostel id 1', 1, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 14:05:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1034, 'New Record inserted On room types id 1', 1, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 14:08:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1035, 'New Record inserted On hostel rooms id 1', 1, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 14:13:25', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1036, 'New Record inserted On hostel id 2', 2, 1, 'Insert', '111.119.187.58', 'Windows 10', 'Firefox 111.0', '2023-03-18 14:14:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1037, 'New Record inserted On room types id 2', 2, 1, 'Insert', '111.119.187.58', 'Windows 10', 'Firefox 111.0', '2023-03-18 14:14:20', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1038, 'New Record inserted On certificates id 2', 2, 1, 'Insert', '111.119.187.58', 'Windows 10', 'Firefox 111.0', '2023-03-18 14:39:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1039, 'Record deleted On certificates id 2', 2, 1, 'Delete', '111.119.187.58', 'Windows 10', 'Firefox 111.0', '2023-03-18 14:39:35', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1040, 'New Record inserted On id card id 2', 2, 1, 'Insert', '111.119.187.58', 'Windows 10', 'Firefox 111.0', '2023-03-18 14:52:51', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1041, 'Record updated On  id card id 2', 2, 1, 'Update', '111.119.187.58', 'Windows 10', 'Firefox 111.0', '2023-03-18 14:52:57', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1042, 'Record updated On permission group id 28', 28, 3, 'Update', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 15:07:57', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1043, 'Record updated On permission group id 28', 28, 3, 'Update', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 15:08:24', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1044, 'Record updated On students id 22', 22, 3, 'Update', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 15:10:52', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1045, 'Record updated On  student session id 22', 22, 3, 'Update', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 15:10:52', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1046, 'New Record inserted On messages id 89', 89, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 15:11:42', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1047, 'New Record inserted On  student attendences id 33', 33, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 15:15:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1048, 'New Record inserted On  student attendences id 34', 34, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 15:15:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1049, 'New Record inserted On  student attendences id 35', 35, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 15:15:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1050, 'New Record inserted On  student attendences id 36', 36, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 15:15:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1051, 'New Record inserted On  student attendences id 37', 37, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 15:15:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1052, 'New Record inserted On  student attendences id 38', 38, 3, 'Insert', '111.119.187.58', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-18 15:15:15', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1053, 'New Record inserted On event id 8', 8, 3, 'Insert', '111.119.191.45', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:24:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1054, 'Record deleted On sessions id 25', 25, 3, 'Delete', '121.91.38.71', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:36:56', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1055, 'Record deleted On sessions id 24', 24, 3, 'Delete', '121.91.38.71', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:37:03', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1056, 'Record deleted On sessions id 23', 23, 3, 'Delete', '121.91.38.71', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:37:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1057, 'Record deleted On sessions id 22', 22, 3, 'Delete', '121.91.38.71', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:37:12', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1058, 'Record deleted On sessions id 21', 21, 3, 'Delete', '121.91.38.71', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:37:16', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1059, 'Record deleted On sessions id 20', 20, 3, 'Delete', '121.91.38.71', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:37:21', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1060, 'Record deleted On sessions id 19', 19, 3, 'Delete', '121.91.38.71', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:37:25', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1061, 'Record deleted On sessions id 18', 18, 3, 'Delete', '121.91.38.71', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:37:29', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1062, 'Record deleted On sessions id 16', 16, 3, 'Delete', '121.91.38.71', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:37:40', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1063, 'Record deleted On sessions id 14', 14, 3, 'Delete', '121.91.38.71', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:37:44', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1064, 'Record deleted On sessions id 13', 13, 3, 'Delete', '121.91.38.71', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:37:47', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1065, 'Record deleted On sessions id 11', 11, 3, 'Delete', '121.91.38.71', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:37:50', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1066, 'Record deleted On sessions id 7', 7, 3, 'Delete', '121.91.38.71', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:37:53', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1067, 'Record updated On sessions id 15', 15, 3, 'Update', '121.91.38.71', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:38:22', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1068, 'New Record inserted On payment settings id 11', 11, 1, 'Insert', '121.91.38.71', 'Windows 10', 'Firefox 111.0', '2023-03-19 02:42:54', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1069, 'New Record inserted On payment settings id 12', 12, 1, 'Insert', '121.91.38.71', 'Windows 10', 'Firefox 111.0', '2023-03-19 02:43:37', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1070, 'New Record inserted On payment settings id 13', 13, 3, 'Insert', '121.91.38.71', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:50:08', NULL);
INSERT INTO `logs` (`school_id`, `id`, `message`, `record_id`, `user_id`, `action`, `ip_address`, `platform`, `agent`, `time`, `created_at`) VALUES (NULL, 1071, 'Record updated On settings id 2', 2, 3, 'Update', '121.91.38.71', 'Windows 10', 'Chrome 111.0.0.0', '2023-03-19 02:58:10', NULL);


#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `send_mail` varchar(10) DEFAULT '0',
  `send_sms` varchar(10) DEFAULT '0',
  `is_group` varchar(10) DEFAULT '0',
  `is_individual` varchar(10) DEFAULT '0',
  `is_class` int(10) NOT NULL DEFAULT 0,
  `group_list` text DEFAULT NULL,
  `user_list` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 1, 'FJFJTF', '<p>GFFHGFJ</p>\r\n', '1', '0', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"1\",\"email\":\"unis.panwar@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"03099914748\"}]', '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 2, 'vngv', 'gjfvgj', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"1\",\"email\":\"unis.panwar@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"03099914748\",\"app_key\":\"\"}]', '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 3, 'Report', 'Salam', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 4, 'asdD', '<p>SADSAD</p>\r\n', '1', '0', '0', '0', 1, NULL, '[{\"user_id\":\"1\",\"email\":\"unis.panwar@gmail.com\",\"mobileno\":\"03099914748\"}]', '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 5, 'ASDAS', '<p>SADAD</p>\r\n', '1', '0', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"1\",\"email\":\"unis.panwar@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"03099914748\"}]', '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 6, 'asdafdwsf', '<p>sadfafsadfasfsafasfg</p>\r\n', '1', '0', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"1\",\"email\":\"unis.panwar@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"03099914748\"}]', '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 7, 'asdafdwsf', '<p>sadfafsadfasfsafasfg</p>\r\n', '1', '0', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"1\",\"email\":\"unis.panwar@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"03099914748\"}]', '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 8, 'Unis', 'Test', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"1\",\"email\":\"unis.panwar@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"03099914748\",\"app_key\":\"\"}]', '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 9, 'ASDF', 'SDFSADFSDSAD', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 10, 'sdr', 'sdfsf', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 11, 'sdr', 'sdfsf', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 12, 'sdr', 'sdfsf', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 13, 'sdr', 'sdfsf', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 14, 'sdaws', 'ewsaqfr', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 15, 'sdfsf', 'sfdsf', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 16, 'asdas', 'sdfsaf', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 17, 'asdas', 'sdfsaf', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 18, 'ASDFSA', 'DFASF', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 19, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 20, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 21, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 22, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 23, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 24, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 25, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 26, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 27, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 28, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 29, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 30, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 31, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 32, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 33, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 34, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 35, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 36, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 37, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 38, 'asdsafd', 'sadfwsa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 39, 'dsfdfs', 'fdsfs', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 40, 'asdasd', 'asda', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 41, 'dfgdsew', 'sdfged', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 42, 'dfgdsew', 'sdfged', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 43, 'dfgdsew', 'sdfged', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 44, 'dfgdsew', 'sdfged', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 45, 'sdfsd', 'sdf', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (2, 46, 'sdfsd', 'sdfSDFSAF', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-14 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 47, 'DAA', 'saS', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-16 03:55:38', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 48, 'sdfsdf', 'xdvd', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"24\",\"email\":\"\",\"guardianEmail\":\"\",\"mobileno\":\"03464786119\",\"app_key\":\"\"}]', '2023-02-25 13:05:55', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 49, 'wadad', 'asda', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"24\",\"email\":\"\",\"guardianEmail\":\"\",\"mobileno\":\"03464786119\",\"app_key\":\"\"}]', '2023-02-25 13:08:59', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 50, 'sdsd', 'sdasd', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"24\",\"email\":\"\",\"guardianEmail\":\"\",\"mobileno\":\"03464786119\",\"app_key\":\"\"}]', '2023-02-25 13:10:09', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 51, 'asad', 'sadsa', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"24\",\"email\":\"\",\"guardianEmail\":\"\",\"mobileno\":\"03464786119\",\"app_key\":\"\"}]', '2023-02-25 13:10:43', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 52, 'asssssssssss', 'sdsada', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"24\",\"email\":\"\",\"guardianEmail\":\"\",\"mobileno\":\"03464786119\",\"app_key\":\"\"}]', '2023-02-25 13:21:37', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 53, 'saasd', 'sdss', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"24\",\"email\":\"\",\"guardianEmail\":\"\",\"mobileno\":\"03464786119\",\"app_key\":\"\"}]', '2023-02-25 13:25:06', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 54, 'sdd', 'dszs', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"24\",\"email\":\"\",\"guardianEmail\":\"\",\"mobileno\":\"03464786119\",\"app_key\":\"\"}]', '2023-02-25 13:26:30', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 55, 'zxzx', 'zxz\\x', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"24\",\"email\":\"\",\"guardianEmail\":\"\",\"mobileno\":\"03464786119\",\"app_key\":\"\"}]', '2023-02-25 13:34:52', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 56, 'sdfs', 'fdsdf', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-25 13:54:42', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 57, 'sdfsdf', 'sdfds', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-25 13:59:17', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 58, 'xzczxc', 'zxzc', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-25 14:00:14', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 59, 'sdsa', 'sddsf', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-25 14:42:14', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 60, 'scsc', 'czxcz', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-25 14:42:32', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 61, 'asda', 'sda', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-25 14:44:18', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 62, 'cfszf', 'zfszfa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-25 15:18:24', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 63, 'cfszf', 'zfszfa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-25 15:20:55', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 64, 'cfszf', 'zfszfa', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-25 15:22:27', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 65, 'serfrwt', 'salam', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-25 15:23:30', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 66, 'ok', 'ok', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-25 15:25:23', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 67, 'sds', 'qurat', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"24\",\"email\":\"\",\"guardianEmail\":\"\",\"mobileno\":\"+923464786119\",\"app_key\":\"\"}]', '2023-02-25 15:28:17', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 68, 'Hello Body', '<p>Ksy han ap log</p>\r\n', '1', '0', '1', '0', 0, '[]', NULL, '2023-02-26 00:02:31', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 69, 'Kal School Off Hogha', '<p>Notification sb ko dia ja raha h k kal school off hoga</p>\r\n', '1', '0', '1', '0', 0, '[]', NULL, '2023-02-26 01:35:57', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 70, 'Kal School Off Hogha', '<p>Notification sb ko dia ja raha h k kal school off hoga</p>\r\n', '1', '0', '1', '0', 0, '[]', NULL, '2023-02-26 01:36:16', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 71, 'Kal School Off Hogha', '<p>Notification sb ko dia ja raha h k kal school off hoga</p>\r\n', '1', '0', '1', '0', 0, '[]', NULL, '2023-02-26 01:36:53', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 72, 'Assalam o Alikum Class , Ap log ksy  han', '<p>Umeed hy ap thek hn gy</p>\r\n', '1', '0', '1', '0', 0, '[]', NULL, '2023-02-27 01:01:29', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 73, 'Test by teacher', '<p>Muhammad younis</p>\r\n', '1', '0', '0', '0', 1, NULL, '[{\"user_id\":\"22\",\"email\":\"unis.panwar@gmail.com\",\"mobileno\":\"+923009728916\"},{\"user_id\":\"47\",\"email\":\"finance.panwarunion@gmail.com\",\"mobileno\":\"03464786119\"},{\"user_id\":\"49\",\"email\":\"\",\"mobileno\":\"03464786119\"},{\"user_id\":\"57\",\"email\":\"wajidaliit11@gmail.com\",\"mobileno\":\"+923443841964\"}]', '2023-02-27 01:03:35', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 74, 'Test SMS', 'Hello', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-27 01:35:54', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 75, 'Salam', 'Hello', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-27 01:37:13', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 76, 'Salam', 'Hello', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-27 01:38:28', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 77, 'Test', 'Helo', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-27 04:20:12', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 78, 'Test', 'Helo', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-27 04:20:39', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 79, 'Test', 'Helo', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-27 04:21:30', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 80, 'sdad', 'dasdasdas', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-27 04:22:26', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 81, 'Hi', 'Ok', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-27 16:24:22', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 82, 'Salam', 'sasas', '0', '1', '1', '0', 0, '[]', NULL, '2023-02-27 18:11:41', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 83, 'sms', 'We have received Fees Amount Rs.300.00 for MUHAMMAD YOUNIS Panwar Class One Section A against General 2 Books Fee BKF Raseed ID is 28 . Thank You', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"22\",\"email\":\"unis.panwar@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"+923099914748\",\"app_key\":\"eggOnsUbv8k:APA91bHTxbsXg6-HC2WaXl83xE38thwqoPvxt4uaXNpKAunam4RolZTGVQc_YCtuD8T7MOl8q9MOxAYNqhKhAJlTZaVTRgjkemS1-2S2VEsGSM_vK_OGbkPV041c7ThaQ22e5pWcT1JW\"}]', '2023-02-27 18:47:34', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 84, 'misi', 'Mehvish whatsapp p unblock kro , bat krna h , ma unis hn', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"22\",\"email\":\"unis.panwar@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"+923042625224\",\"app_key\":\"eggOnsUbv8k:APA91bHTxbsXg6-HC2WaXl83xE38thwqoPvxt4uaXNpKAunam4RolZTGVQc_YCtuD8T7MOl8q9MOxAYNqhKhAJlTZaVTRgjkemS1-2S2VEsGSM_vK_OGbkPV041c7ThaQ22e5pWcT1JW\"}]', '2023-02-27 22:16:16', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 85, 'unis', 'Whatsapp p on hona . ma unis hon', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"22\",\"email\":\"unis.panwar@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"+923042625224\",\"app_key\":\"eggOnsUbv8k:APA91bHTxbsXg6-HC2WaXl83xE38thwqoPvxt4uaXNpKAunam4RolZTGVQc_YCtuD8T7MOl8q9MOxAYNqhKhAJlTZaVTRgjkemS1-2S2VEsGSM_vK_OGbkPV041c7ThaQ22e5pWcT1JW\"}]', '2023-02-27 22:22:31', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 86, 'Mis', 'Mishi bat suno . Unblock kro Whatsapp p', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"49\",\"email\":\"\",\"guardianEmail\":\"\",\"mobileno\":\"+923042625224\",\"app_key\":\"\"}]', '2023-03-08 23:30:43', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 87, 'Mishi', 'Ma unis hn. Jaldi unblock kro', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"49\",\"email\":\"\",\"guardianEmail\":\"\",\"mobileno\":\"+923042625224\",\"app_key\":\"\"}]', '2023-03-08 23:33:07', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 88, 'Hello', 'Pakistan', '0', '1', '1', '0', 0, '[]', NULL, '2023-03-17 10:17:26', NULL);
INSERT INTO `messages` (`school_id`, `id`, `title`, `message`, `send_mail`, `send_sms`, `is_group`, `is_individual`, `is_class`, `group_list`, `user_list`, `created_at`, `updated_at`) VALUES (NULL, 89, 'dfsdf', 'Test MESSAGE', '0', '1', '0', '1', 0, NULL, '[{\"category\":\"student\",\"user_id\":\"22\",\"email\":\"unis.panwar@gmail.com\",\"guardianEmail\":\"\",\"mobileno\":\"+923146506159\",\"app_key\":\"\"}]', '2023-03-18 15:11:42', NULL);


#
# TABLE STRUCTURE FOR: migrations
#

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `school_id` int(200) DEFAULT NULL,
  `version` bigint(20) NOT NULL,
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: multi_class_students
#

DROP TABLE IF EXISTS `multi_class_students`;

CREATE TABLE `multi_class_students` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `multi_class_students_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `multi_class_students_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: notification_roles
#

DROP TABLE IF EXISTS `notification_roles`;

CREATE TABLE `notification_roles` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_notification_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `send_notification_id` (`send_notification_id`),
  KEY `role_id` (`role_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `notification_roles_ibfk_1` FOREIGN KEY (`send_notification_id`) REFERENCES `send_notification` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notification_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `notification_roles` (`school_id`, `id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES (NULL, 1, 1, 7, 0, '2023-02-26 05:32:05');
INSERT INTO `notification_roles` (`school_id`, `id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES (NULL, 2, 2, 1, 0, '2023-02-26 05:32:51');
INSERT INTO `notification_roles` (`school_id`, `id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES (NULL, 3, 2, 2, 0, '2023-02-26 05:32:51');
INSERT INTO `notification_roles` (`school_id`, `id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES (NULL, 4, 2, 3, 0, '2023-02-26 05:32:51');
INSERT INTO `notification_roles` (`school_id`, `id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES (NULL, 5, 2, 4, 0, '2023-02-26 05:32:51');
INSERT INTO `notification_roles` (`school_id`, `id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES (NULL, 6, 2, 6, 0, '2023-02-26 05:32:51');
INSERT INTO `notification_roles` (`school_id`, `id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES (NULL, 7, 2, 7, 0, '2023-02-26 05:32:51');
INSERT INTO `notification_roles` (`school_id`, `id`, `send_notification_id`, `role_id`, `is_active`, `created_at`) VALUES (NULL, 8, 3, 7, 0, '2023-02-26 05:33:46');


#
# TABLE STRUCTURE FOR: notification_setting
#

DROP TABLE IF EXISTS `notification_setting`;

CREATE TABLE `notification_setting` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  `is_mail` varchar(10) DEFAULT '0',
  `is_sms` varchar(10) DEFAULT '0',
  `is_notification` int(11) NOT NULL DEFAULT 0,
  `display_notification` int(11) NOT NULL DEFAULT 0,
  `display_sms` int(11) NOT NULL DEFAULT 1,
  `template` longtext NOT NULL,
  `variables` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (2, 1, 'student_admission', '1', '1', 0, 0, 1, 'Dear Applicant , Your Admission is confirmed in {{class}} , Section {{section}} , Your Admission Number is {admission_no}}. Thank you', '{{student_name}} {{class}}  {{section}}  {{admission_no}}  {{roll_no}}  {{admission_date}}   {{mobileno}}  {{email}}  {{dob}}  {{guardian_name}}  {{guardian_relation}}  {{guardian_phone}}  {{father_name}}  {{father_phone}}  {{blood_group}}  {{mother_name}}  {{gender}} {{guardian_email}} {{current_session_name}} ', '2023-02-27 11:12:53');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (2, 2, 'exam_result', '1', '1', 1, 1, 1, 'Dear {{student_name}}   your {{exam}} result has been published. Kindly check Student App, and login at Portal.', '{{student_name}} {{exam_roll_no}} {{exam}}', '2023-02-27 11:13:41');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (2, 3, 'fee_submission', '1', '1', 1, 1, 1, 'We have received Fees Amount {{fee_amount}} for  {{student_name}}  Class  {{class}}  Section {{section}}  \r\nagainst  {{fee_group_name}} {{type}} {{code}} Raseed ID is {{invoice_id}}  . Thank You', '{{student_name}} {{class}} {{section}} {{fine_type}} {{fine_percentage}} {{fine_amount}} {{fee_group_name}} {{type}} {{code}} {{email}} {{contact_no}} {{invoice_id}} {{sub_invoice_id}} {{due_date}} {{amount}} {{fee_amount}}', '2023-02-27 14:43:26');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (2, 4, 'absent_attendence', '1', '1', 1, 1, 1, 'Absent Notice :{{student_name}}  was absent on date   {{date}}', '{{student_name}} {{mobileno}} {{email}} {{father_name}} {{father_phone}} {{father_occupation}} {{mother_name}} {{mother_phone}} {{guardian_name}} {{guardian_phone}} {{guardian_occupation}} {{guardian_email}} {{date}} {{current_session_name}}             {{time_from}} {{time_to}} {{subject_name}} {{subject_code}} {{subject_type}}  ', '2023-02-27 17:31:51');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (2, 5, 'login_credential', '1', '1', 0, 0, 1, 'Hello {{display_name}} your login details for Url: {{url}} Username: {{username}}  Password: {{password}}', '{{url}} {{display_name}} {{username}} {{password}}', '2023-02-14 13:11:38');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (2, 6, 'homework', '1', '1', 1, 1, 1, 'New Homework has been created for \r\n{{student_name}} at\r\n\r\n\r\n\r\n{{homework_date}} for the class {{class}} {{section}} {{subject}}. kindly submit your\r\n\r\n\r\n homework before {{submit_date}} .Thank you', '{{homework_date}} {{submit_date}} {{class}} {{section}} {{subject}} {{student_name}}', '2023-02-14 13:11:38');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (2, 7, 'fees_reminder', '1', '1', 1, 1, 1, 'Dear parents, please pay fee amount Rs.{{due_amount}} of {{fee_type}} before {{due_date}} for {{student_name}}  from smart school (ignore if you already paid)', '{{fee_type}}{{fee_code}}{{due_date}}{{student_name}}{{school_name}}{{fee_amount}}{{due_amount}}{{deposit_amount}} ', '2023-02-14 13:11:38');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (2, 8, 'forgot_password', '1', '0', 0, 0, 0, 'Dear  {{name}} , \r\n    Recently a request was submitted to reset password for your account. If you didn\'t make the request, just ignore this email. Otherwise you can reset your password using this link <a href=\'{{resetPassLink}}\'>Click here to reset your password</a>,\r\nif you\'re having trouble clicking the password reset button, copy and paste the URL below into your web browser. your username {{username}}\r\n{{resetPassLink}}\r\n Regards,\r\n {{school_name}}', '{{school_name}}{{name}}{{username}}{{resetPassLink}} ', '2023-02-14 13:11:38');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (2, 9, 'online_examination_publish_exam', '1', '1', 1, 1, 1, 'A new exam {{exam_title}} has been created for  duration: {{time_duration}} min, which will be available from:  {{exam_from}} to  {{exam_to}}.', '{{exam_title}} {{exam_from}} {{exam_to}} {{time_duration}} {{attempt}} {{passing_percentage}}', '2023-02-14 13:11:38');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (2, 10, 'online_examination_publish_result', '1', '1', 1, 1, 1, 'Exam {{exam_title}} result has been declared which was conducted between  {{exam_from}} to   {{exam_to}}, for more details, please check your student portal.', '{{exam_title}} {{exam_from}} {{exam_to}} {{time_duration}} {{attempt}} {{passing_percentage}}', '2023-02-14 13:11:38');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (1, 11, 'student_admission', '1', '1', 0, 0, 1, 'Dear Applicant , Your Admission is confirmed in {{class}} , Section {{section}} , Your Admission Number is {admission_no}}. Thank you', '{{student_name}} {{class}}  {{section}}  {{admission_no}}  {{roll_no}}  {{admission_date}}   {{mobileno}}  {{email}}  {{dob}}  {{guardian_name}}  {{guardian_relation}}  {{guardian_phone}}  {{father_name}}  {{father_phone}}  {{blood_group}}  {{mother_name}}  {{gender}} {{guardian_email}} {{current_session_name}} ', '2023-02-27 11:12:53');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (1, 12, 'exam_result', '1', '1', 1, 1, 1, 'Dear {{student_name}}   your {{exam}} result has been published. Kindly check Student App, and login at Portal.', '{{student_name}} {{exam_roll_no}} {{exam}}', '2023-02-27 11:13:41');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (1, 13, 'fee_submission', '1', '1', 1, 1, 1, 'We have received Fees Amount {{fee_amount}} for  {{student_name}}  Class  {{class}}  Section {{section}}  \r\nagainst  {{fee_group_name}} {{type}} {{code}} Raseed ID is {{invoice_id}}  . Thank You', '{{student_name}} {{class}} {{section}} {{fine_type}} {{fine_percentage}} {{fine_amount}} {{fee_group_name}} {{type}} {{code}} {{email}} {{contact_no}} {{invoice_id}} {{sub_invoice_id}} {{due_date}} {{amount}} {{fee_amount}}', '2023-02-27 14:43:26');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (1, 14, 'absent_attendence', '1', '1', 1, 1, 1, 'Absent Notice :{{student_name}}  was absent on date   {{date}}', '{{student_name}} {{mobileno}} {{email}} {{father_name}} {{father_phone}} {{father_occupation}} {{mother_name}} {{mother_phone}} {{guardian_name}} {{guardian_phone}} {{guardian_occupation}} {{guardian_email}} {{date}} {{current_session_name}}             {{time_from}} {{time_to}} {{subject_name}} {{subject_code}} {{subject_type}}  ', '2023-02-27 17:31:51');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (1, 15, 'login_credential', '1', '1', 0, 0, 1, 'Hello {{display_name}} your login details for Url: {{url}} Username: {{username}}  Password: {{password}}', '{{url}} {{display_name}} {{username}} {{password}}', '2023-02-14 13:11:38');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (1, 16, 'homework', '1', '1', 1, 1, 1, 'New Homework has been created for \r\n{{student_name}} at\r\n\r\n\r\n\r\n{{homework_date}} for the class {{class}} {{section}} {{subject}}. kindly submit your\r\n\r\n\r\n homework before {{submit_date}} .Thank you', '{{homework_date}} {{submit_date}} {{class}} {{section}} {{subject}} {{student_name}}', '2023-02-14 13:11:38');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (1, 17, 'fees_reminder', '1', '1', 1, 1, 1, 'Dear parents, please pay fee amount Rs.{{due_amount}} of {{fee_type}} before {{due_date}} for {{student_name}}  from smart school (ignore if you already paid)', '{{fee_type}}{{fee_code}}{{due_date}}{{student_name}}{{school_name}}{{fee_amount}}{{due_amount}}{{deposit_amount}} ', '2023-02-14 13:11:38');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (1, 18, 'forgot_password', '1', '0', 0, 0, 0, 'Dear  {{name}} , \r\n    Recently a request was submitted to reset password for your account. If you didn\'t make the request, just ignore this email. Otherwise you can reset your password using this link <a href=\'{{resetPassLink}}\'>Click here to reset your password</a>,\r\nif you\'re having trouble clicking the password reset button, copy and paste the URL below into your web browser. your username {{username}}\r\n{{resetPassLink}}\r\n Regards,\r\n {{school_name}}', '{{school_name}}{{name}}{{username}}{{resetPassLink}} ', '2023-02-14 13:11:38');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (1, 19, 'online_examination_publish_exam', '1', '1', 1, 1, 1, 'A new exam {{exam_title}} has been created for  duration: {{time_duration}} min, which will be available from:  {{exam_from}} to  {{exam_to}}.', '{{exam_title}} {{exam_from}} {{exam_to}} {{time_duration}} {{attempt}} {{passing_percentage}}', '2023-02-14 13:11:38');
INSERT INTO `notification_setting` (`school_id`, `id`, `type`, `is_mail`, `is_sms`, `is_notification`, `display_notification`, `display_sms`, `template`, `variables`, `created_at`) VALUES (1, 20, 'online_examination_publish_result', '1', '1', 1, 1, 1, 'Exam {{exam_title}} result has been declared which was conducted between  {{exam_from}} to   {{exam_to}}, for more details, please check your student portal.', '{{exam_title}} {{exam_from}} {{exam_to}} {{time_duration}} {{attempt}} {{passing_percentage}}', '2023-02-14 13:11:38');


#
# TABLE STRUCTURE FOR: online_admissions
#

DROP TABLE IF EXISTS `online_admissions`;

CREATE TABLE `online_admissions` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admission_no` varchar(100) DEFAULT NULL,
  `roll_no` varchar(100) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `rte` varchar(20) NOT NULL DEFAULT 'No',
  `image` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `cast` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `route_id` int(11) NOT NULL,
  `school_house_id` int(11) DEFAULT NULL,
  `blood_group` varchar(200) NOT NULL,
  `vehroute_id` int(11) NOT NULL,
  `hostel_room_id` int(11) NOT NULL,
  `adhar_no` varchar(100) DEFAULT NULL,
  `samagra_id` varchar(100) DEFAULT NULL,
  `bank_account_no` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(100) DEFAULT NULL,
  `guardian_is` varchar(100) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_phone` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_phone` varchar(100) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_relation` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(100) DEFAULT NULL,
  `guardian_occupation` varchar(150) NOT NULL,
  `guardian_address` text DEFAULT NULL,
  `guardian_email` varchar(100) NOT NULL,
  `father_pic` varchar(200) NOT NULL,
  `mother_pic` varchar(200) NOT NULL,
  `guardian_pic` varchar(200) NOT NULL,
  `is_enroll` int(255) DEFAULT 0,
  `previous_school` text DEFAULT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `note` varchar(200) NOT NULL,
  `measurement_date` date DEFAULT NULL,
  `app_key` text DEFAULT NULL,
  `document` text DEFAULT NULL,
  `disable_at` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_section_id` (`class_section_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `online_admissions_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: onlineexam
#

DROP TABLE IF EXISTS `onlineexam`;

CREATE TABLE `onlineexam` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam` text DEFAULT NULL,
  `attempt` int(11) NOT NULL,
  `exam_from` datetime DEFAULT NULL,
  `exam_to` datetime DEFAULT NULL,
  `is_quiz` int(11) NOT NULL DEFAULT 0,
  `auto_publish_date` datetime DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `duration` time NOT NULL,
  `passing_percentage` float NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `publish_result` int(11) NOT NULL DEFAULT 0,
  `is_active` varchar(1) DEFAULT '0',
  `is_marks_display` int(11) NOT NULL DEFAULT 0,
  `is_neg_marking` int(11) NOT NULL DEFAULT 0,
  `is_random_question` int(11) NOT NULL DEFAULT 0,
  `is_rank_generated` int(1) NOT NULL DEFAULT 0,
  `publish_exam_notification` int(1) NOT NULL,
  `publish_result_notification` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `onlineexam_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `onlineexam` (`school_id`, `id`, `exam`, `attempt`, `exam_from`, `exam_to`, `is_quiz`, `auto_publish_date`, `time_from`, `time_to`, `duration`, `passing_percentage`, `description`, `session_id`, `publish_result`, `is_active`, `is_marks_display`, `is_neg_marking`, `is_random_question`, `is_rank_generated`, `publish_exam_notification`, `publish_result_notification`, `created_at`, `updated_at`) VALUES (1, 2, 'Online Exam', 1, '2023-02-26 01:34:00', '2023-02-27 01:34:00', 0, '2023-02-26 01:34:00', NULL, NULL, '23:59:00', '30', 'Here is online Exam', 15, 1, '1', 1, 1, 1, 0, 0, 0, '2023-02-26 09:35:29', NULL);
INSERT INTO `onlineexam` (`school_id`, `id`, `exam`, `attempt`, `exam_from`, `exam_to`, `is_quiz`, `auto_publish_date`, `time_from`, `time_to`, `duration`, `passing_percentage`, `description`, `session_id`, `publish_result`, `is_active`, `is_marks_display`, `is_neg_marking`, `is_random_question`, `is_rank_generated`, `publish_exam_notification`, `publish_result_notification`, `created_at`, `updated_at`) VALUES (2, 3, 'Online Exam', 4, '2023-02-26 18:45:00', '2023-02-26 18:51:00', 0, NULL, NULL, NULL, '06:52:00', '40', 'Test Purpose', 15, 1, '1', 0, 0, 1, 0, 1, 1, '2023-02-26 15:04:41', NULL);


#
# TABLE STRUCTURE FOR: onlineexam_attempts
#

DROP TABLE IF EXISTS `onlineexam_attempts`;

CREATE TABLE `onlineexam_attempts` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `onlineexam_student_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `onlineexam_student_id` (`onlineexam_student_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `onlineexam_attempts_ibfk_1` FOREIGN KEY (`onlineexam_student_id`) REFERENCES `onlineexam_students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: onlineexam_questions
#

DROP TABLE IF EXISTS `onlineexam_questions`;

CREATE TABLE `onlineexam_questions` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `onlineexam_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `marks` float(10,2) NOT NULL DEFAULT 0.00,
  `neg_marks` float(10,2) DEFAULT 0.00,
  `is_active` varchar(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `onlineexam_id` (`onlineexam_id`),
  KEY `question_id` (`question_id`),
  KEY `session_id` (`session_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `onlineexam_questions_ibfk_1` FOREIGN KEY (`onlineexam_id`) REFERENCES `onlineexam` (`id`) ON DELETE CASCADE,
  CONSTRAINT `onlineexam_questions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `onlineexam_questions_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `onlineexam_questions` (`school_id`, `id`, `question_id`, `onlineexam_id`, `session_id`, `marks`, `neg_marks`, `is_active`, `created_at`, `updated_at`) VALUES (2, 8, 3, 3, NULL, '1.00', '0.25', '0', '2023-02-26 14:46:00', NULL);


#
# TABLE STRUCTURE FOR: onlineexam_student_results
#

DROP TABLE IF EXISTS `onlineexam_student_results`;

CREATE TABLE `onlineexam_student_results` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `onlineexam_student_id` int(11) NOT NULL,
  `onlineexam_question_id` int(11) NOT NULL,
  `select_option` longtext DEFAULT NULL,
  `marks` float(10,2) NOT NULL DEFAULT 0.00,
  `remark` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `onlineexam_student_id` (`onlineexam_student_id`),
  KEY `onlineexam_question_id` (`onlineexam_question_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `onlineexam_student_results_ibfk_1` FOREIGN KEY (`onlineexam_student_id`) REFERENCES `onlineexam_students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `onlineexam_student_results_ibfk_2` FOREIGN KEY (`onlineexam_question_id`) REFERENCES `onlineexam_questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: onlineexam_students
#

DROP TABLE IF EXISTS `onlineexam_students`;

CREATE TABLE `onlineexam_students` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `onlineexam_id` int(11) DEFAULT NULL,
  `student_session_id` int(11) DEFAULT NULL,
  `is_attempted` int(1) NOT NULL DEFAULT 0,
  `rank` int(1) DEFAULT 0,
  `quiz_attempted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `onlineexam_id` (`onlineexam_id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `onlineexam_students_ibfk_1` FOREIGN KEY (`onlineexam_id`) REFERENCES `onlineexam` (`id`) ON DELETE CASCADE,
  CONSTRAINT `onlineexam_students_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: payment_settings
#

DROP TABLE IF EXISTS `payment_settings`;

CREATE TABLE `payment_settings` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(200) NOT NULL,
  `api_username` varchar(200) DEFAULT NULL,
  `api_secret_key` varchar(200) NOT NULL,
  `salt` varchar(200) NOT NULL,
  `api_publishable_key` varchar(200) NOT NULL,
  `api_password` varchar(200) DEFAULT NULL,
  `api_signature` varchar(200) DEFAULT NULL,
  `api_email` varchar(200) DEFAULT NULL,
  `paypal_demo` varchar(100) NOT NULL,
  `account_no` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `gateway_mode` int(11) NOT NULL COMMENT '0 Testing, 1 live',
  `paytm_website` varchar(255) NOT NULL,
  `paytm_industrytype` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `payment_settings` (`school_id`, `id`, `payment_type`, `api_username`, `api_secret_key`, `salt`, `api_publishable_key`, `api_password`, `api_signature`, `api_email`, `paypal_demo`, `account_no`, `is_active`, `gateway_mode`, `paytm_website`, `paytm_industrytype`, `created_at`, `updated_at`) VALUES (NULL, 11, 'paypal', 'unis.panwar1@gmail.com', '', '', '', '123', '656', NULL, 'TRUE', '', 'no', 0, '', '', '2023-03-18 21:43:39', NULL);
INSERT INTO `payment_settings` (`school_id`, `id`, `payment_type`, `api_username`, `api_secret_key`, `salt`, `api_publishable_key`, `api_password`, `api_signature`, `api_email`, `paypal_demo`, `account_no`, `is_active`, `gateway_mode`, `paytm_website`, `paytm_industrytype`, `created_at`, `updated_at`) VALUES (NULL, 12, 'jazzcash', NULL, '45454', '', '', '555', NULL, NULL, '', '', 'no', 0, '', '', '2023-03-18 21:50:13', NULL);
INSERT INTO `payment_settings` (`school_id`, `id`, `payment_type`, `api_username`, `api_secret_key`, `salt`, `api_publishable_key`, `api_password`, `api_signature`, `api_email`, `paypal_demo`, `account_no`, `is_active`, `gateway_mode`, `paytm_website`, `paytm_industrytype`, `created_at`, `updated_at`) VALUES (NULL, 13, 'billplz', NULL, 'dasdasd', '', '', NULL, NULL, 'sdasdas', '', '', 'yes', 0, '', '', '2023-03-18 21:50:13', NULL);


#
# TABLE STRUCTURE FOR: payslip_allowance
#

DROP TABLE IF EXISTS `payslip_allowance`;

CREATE TABLE `payslip_allowance` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payslip_id` int(11) NOT NULL,
  `allowance_type` varchar(200) NOT NULL,
  `amount` float NOT NULL,
  `staff_id` int(11) NOT NULL,
  `cal_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `payslip_allowance` (`school_id`, `id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES (2, 1, 1, 'Salary', '25000', 3, 'positive');
INSERT INTO `payslip_allowance` (`school_id`, `id`, `payslip_id`, `allowance_type`, `amount`, `staff_id`, `cal_type`) VALUES (2, 2, 1, 'Fule', '1200', 3, 'negative');


#
# TABLE STRUCTURE FOR: permission_category
#

DROP TABLE IF EXISTS `permission_category`;

CREATE TABLE `permission_category` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perm_group_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) DEFAULT NULL,
  `enable_view` int(11) DEFAULT 0,
  `enable_add` int(11) DEFAULT 0,
  `enable_edit` int(11) DEFAULT 0,
  `enable_delete` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 1, 1, 'Student', 'student', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 2, 1, 'Import Student', 'import_student', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 3, 1, 'Student Categories', 'student_categories', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 4, 1, 'Student Houses', 'student_houses', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 5, 2, 'Collect Fees', 'collect_fees', 1, 1, 0, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 6, 2, 'Fees Carry Forward', 'fees_carry_forward', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 7, 2, 'Fees Master', 'fees_master', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 8, 2, 'Fees Group', 'fees_group', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 9, 3, 'Income', 'income', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 10, 3, 'Income Head', 'income_head', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 11, 3, 'Search Income', 'search_income', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 12, 4, 'Expense', 'expense', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 13, 4, 'Expense Head', 'expense_head', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 14, 4, 'Search Expense', 'search_expense', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 15, 5, 'Student / Period Attendance', 'student_attendance', 1, 1, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 20, 6, 'Marks Grade', 'marks_grade', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 21, 7, 'Class Timetable', 'class_timetable', 1, 0, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 23, 7, 'Subject', 'subject', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 24, 7, 'Class', 'class', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 25, 7, 'Section', 'section', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 26, 7, 'Promote Student', 'promote_student', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 27, 8, 'Upload Content', 'upload_content', 1, 1, 0, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 28, 9, 'Books List', 'books', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 29, 9, 'Issue Return', 'issue_return', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 30, 9, 'Add Staff Member', 'add_staff_member', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 31, 10, 'Issue Item', 'issue_item', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 32, 10, 'Add Item Stock', 'item_stock', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 33, 10, 'Add Item', 'item', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 34, 10, 'Item Store', 'store', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 35, 10, 'Item Supplier', 'supplier', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 37, 11, 'Routes', 'routes', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 38, 11, 'Vehicle', 'vehicle', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 39, 11, 'Assign Vehicle', 'assign_vehicle', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 40, 12, 'Hostel', 'hostel', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 41, 12, 'Room Type', 'room_type', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 42, 12, 'Hostel Rooms', 'hostel_rooms', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 43, 13, 'Notice Board', 'notice_board', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 44, 13, 'Email', 'email', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 46, 13, 'Email / SMS Log', 'email_sms_log', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 53, 15, 'Languages', 'languages', 0, 1, 0, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 54, 15, 'General Setting', 'general_setting', 1, 0, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 55, 15, 'Session Setting', 'session_setting', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 56, 15, 'Notification Setting', 'notification_setting', 1, 0, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 57, 15, 'SMS Setting', 'sms_setting', 1, 0, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 58, 15, 'Email Setting', 'email_setting', 1, 0, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 59, 15, 'Front CMS Setting', 'front_cms_setting', 1, 0, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 60, 15, 'Payment Methods', 'payment_methods', 1, 0, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 61, 16, 'Menus', 'menus', 1, 1, 0, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 62, 16, 'Media Manager', 'media_manager', 1, 1, 0, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 63, 16, 'Banner Images', 'banner_images', 1, 1, 0, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 64, 16, 'Pages', 'pages', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 65, 16, 'Gallery', 'gallery', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 66, 16, 'Event', 'event', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 67, 16, 'News', 'notice', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 68, 2, 'Fees Group Assign', 'fees_group_assign', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 69, 2, 'Fees Type', 'fees_type', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 70, 2, 'Fees Discount', 'fees_discount', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 71, 2, 'Fees Discount Assign', 'fees_discount_assign', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 73, 2, 'Search Fees Payment', 'search_fees_payment', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 74, 2, 'Search Due Fees', 'search_due_fees', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 77, 7, 'Assign Class Teacher', 'assign_class_teacher', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 78, 17, 'Admission Enquiry', 'admission_enquiry', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 79, 17, 'Follow Up Admission Enquiry', 'follow_up_admission_enquiry', 1, 1, 0, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 80, 17, 'Visitor Book', 'visitor_book', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 81, 17, 'Phone Call Log', 'phone_call_log', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 82, 17, 'Postal Dispatch', 'postal_dispatch', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 83, 17, 'Postal Receive', 'postal_receive', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 84, 17, 'Complain', 'complaint', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 85, 17, 'Setup Font Office', 'setup_font_office', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 86, 18, 'Staff', 'staff', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 87, 18, 'Disable Staff', 'disable_staff', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 88, 18, 'Staff Attendance', 'staff_attendance', 1, 1, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 90, 18, 'Staff Payroll', 'staff_payroll', 1, 1, 0, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 93, 19, 'Homework', 'homework', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 94, 19, 'Homework Evaluation', 'homework_evaluation', 1, 1, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 96, 20, 'Student Certificate', 'student_certificate', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 97, 20, 'Generate Certificate', 'generate_certificate', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 98, 20, 'Student ID Card', 'student_id_card', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 99, 20, 'Generate ID Card', 'generate_id_card', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 102, 21, 'Calendar To Do List', 'calendar_to_do_list', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 104, 10, 'Item Category', 'item_category', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 106, 22, 'Quick Session Change', 'quick_session_change', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 107, 1, 'Disable Student', 'disable_student', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 108, 18, ' Approve Leave Request', 'approve_leave_request', 1, 0, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 109, 18, 'Apply Leave', 'apply_leave', 1, 1, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 110, 18, 'Leave Types ', 'leave_types', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 111, 18, 'Department', 'department', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 112, 18, 'Designation', 'designation', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 113, 22, 'Fees Collection And Expense Monthly Chart', 'fees_collection_and_expense_monthly_chart', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 114, 22, 'Fees Collection And Expense Yearly Chart', 'fees_collection_and_expense_yearly_chart', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 115, 22, 'Monthly Fees Collection Widget', 'Monthly fees_collection_widget', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 116, 22, 'Monthly Expense Widget', 'monthly_expense_widget', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 117, 22, 'Student Count Widget', 'student_count_widget', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 118, 22, 'Staff Role Count Widget', 'staff_role_count_widget', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 122, 5, 'Attendance By Date', 'attendance_by_date', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 123, 9, 'Add Student', 'add_student', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 126, 15, 'User Status', 'user_status', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 127, 18, 'Can See Other Users Profile', 'can_see_other_users_profile', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 128, 1, 'Student Timeline', 'student_timeline', 0, 1, 0, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 129, 18, 'Staff Timeline', 'staff_timeline', 0, 1, 0, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 130, 15, 'Backup', 'backup', 1, 1, 0, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 131, 15, 'Restore', 'restore', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 134, 1, 'Disable Reason', 'disable_reason', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 135, 2, 'Fees Reminder', 'fees_reminder', 1, 0, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 136, 5, 'Approve Leave', 'approve_leave', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 137, 6, 'Exam Group', 'exam_group', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 141, 6, 'Design Admit Card', 'design_admit_card', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 142, 6, 'Print Admit Card', 'print_admit_card', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 143, 6, 'Design Marksheet', 'design_marksheet', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 144, 6, 'Print Marksheet', 'print_marksheet', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 145, 7, 'Teachers Timetable', 'teachers_time_table', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 146, 14, 'Student Report', 'student_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 147, 14, 'Guardian Report', 'guardian_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 148, 14, 'Student History', 'student_history', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 149, 14, 'Student Login Credential Report', 'student_login_credential_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 150, 14, 'Class Subject Report', 'class_subject_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 151, 14, 'Admission Report', 'admission_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 152, 14, 'Sibling Report', 'sibling_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 153, 14, 'Homework Evaluation Report', 'homehork_evaluation_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 154, 14, 'Student Profile', 'student_profile', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 155, 14, 'Fees Statement', 'fees_statement', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 156, 14, 'Balance Fees Report', 'balance_fees_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 157, 14, 'Fees Collection Report', 'fees_collection_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 158, 14, 'Online Fees Collection Report', 'online_fees_collection_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 159, 14, 'Income Report', 'income_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 160, 14, 'Expense Report', 'expense_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 161, 14, 'PayRoll Report', 'payroll_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 162, 14, 'Income Group Report', 'income_group_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 163, 14, 'Expense Group Report', 'expense_group_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 164, 14, 'Attendance Report', 'attendance_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 165, 14, 'Staff Attendance Report', 'staff_attendance_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 174, 14, 'Transport Report', 'transport_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 175, 14, 'Hostel Report', 'hostel_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 176, 14, 'Audit Trail Report', 'audit_trail_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 177, 14, 'User Log', 'user_log', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 178, 14, 'Book Issue Report', 'book_issue_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 179, 14, 'Book Due Report', 'book_due_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 180, 14, 'Book Inventory Report', 'book_inventory_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 181, 14, 'Stock Report', 'stock_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 182, 14, 'Add Item Report', 'add_item_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 183, 14, 'Issue Item Report', 'issue_item_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 185, 23, 'Online Examination', 'online_examination', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 186, 23, 'Question Bank', 'question_bank', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 187, 6, 'Exam Result', 'exam_result', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 188, 7, 'Subject Group', 'subject_group', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 189, 18, 'Teachers Rating', 'teachers_rating', 1, 0, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 190, 22, 'Fees Awaiting Payment Widegts', 'fees_awaiting_payment_widegts', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 191, 22, 'Conveted Leads Widegts', 'conveted_leads_widegts', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 192, 22, 'Fees Overview Widegts', 'fees_overview_widegts', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 193, 22, 'Enquiry Overview Widegts', 'enquiry_overview_widegts', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 194, 22, 'Library Overview Widegts', 'book_overview_widegts', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 195, 22, 'Student Today Attendance Widegts', 'today_attendance_widegts', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 196, 6, 'Marks Import', 'marks_import', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 197, 14, 'Student Attendance Type Report', 'student_attendance_type_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 198, 14, 'Exam Marks Report', 'exam_marks_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 200, 14, 'Online Exam Wise Report', 'online_exam_wise_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 201, 14, 'Online Exams Report', 'online_exams_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 202, 14, 'Online Exams Attempt Report', 'online_exams_attempt_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 203, 14, 'Online Exams Rank Report', 'online_exams_rank_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 204, 14, 'Staff Report', 'staff_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 205, 6, 'Exam', 'exam', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 207, 6, 'Exam Publish', 'exam_publish', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 208, 6, 'Link Exam', 'link_exam', 1, 0, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 210, 6, 'Assign / View student', 'exam_assign_view_student', 1, 0, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 211, 6, 'Exam Subject', 'exam_subject', 1, 0, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 212, 6, 'Exam Marks', 'exam_marks', 1, 0, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 213, 15, 'Language Switcher', 'language_switcher', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 214, 23, 'Add Questions in Exam ', 'add_questions_in_exam', 1, 0, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 215, 15, 'Custom Fields', 'custom_fields', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 216, 15, 'System Fields', 'system_fields', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 217, 13, 'SMS', 'sms', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 219, 14, 'Student / Period Attendance Report', 'student_period_attendance_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 220, 14, 'Biometric Attendance Log', 'biometric_attendance_log', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 221, 14, 'Book Issue Return Report', 'book_issue_return_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 222, 23, 'Assign / View Student', 'online_assign_view_student', 1, 0, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 223, 14, 'Rank Report', 'rank_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 224, 25, 'Chat', 'chat', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 226, 22, 'Income Donut Graph', 'income_donut_graph', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 227, 22, 'Expense Donut Graph', 'expense_donut_graph', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 228, 9, 'Import Book', 'import_book', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 229, 22, 'Staff Present Today Widegts', 'staff_present_today_widegts', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 230, 22, 'Student Present Today Widegts', 'student_present_today_widegts', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 231, 26, 'Multi Class Student', 'multi_class_student', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 232, 27, 'Online Admission', 'online_admission', 1, 0, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 233, 15, 'Print Header Footer', 'print_header_footer', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 234, 28, 'Manage Alumni', 'manage_alumni', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 235, 28, 'Events', 'events', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 236, 29, 'Manage Lesson Plan', 'manage_lesson_plan', 1, 1, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 237, 29, 'Manage Syllabus Status', 'manage_syllabus_status', 1, 0, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 238, 29, 'Lesson', 'lesson', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 239, 29, 'Topic', 'topic', 1, 1, 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 240, 14, 'Syllabus Status Report', 'syllabus_status_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 241, 14, 'Teacher Syllabus Status Report', 'teacher_syllabus_status_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 242, 14, 'Alumni Report', 'alumni_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 243, 15, 'Student Profile Update', 'student_profile_update', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 244, 14, 'Student Gender Ratio Report', 'student_gender_ratio_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 245, 14, 'Student Teacher Ratio Report', 'student_teacher_ratio_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 246, 14, 'Daily Attendance Report', 'daily_attendance_report', 1, 0, 0, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_category` (`school_id`, `id`, `perm_group_id`, `name`, `short_code`, `enable_view`, `enable_add`, `enable_edit`, `enable_delete`, `created_at`) VALUES (2, 247, 23, 'Import Question', 'import_question', 1, 0, 0, 0, '2023-02-14 13:11:38');


#
# TABLE STRUCTURE FOR: permission_group
#

DROP TABLE IF EXISTS `permission_group`;

CREATE TABLE `permission_group` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `is_active` int(11) DEFAULT 0,
  `system` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 1, 'Student Information', 'student_information', 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 2, 'Fees Collection', 'fees_collection', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 3, 'Income', 'income', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 4, 'Expense', 'expense', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 5, 'Student Attendance', 'student_attendance', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 6, 'Examination', 'examination', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 7, 'Academics', 'academics', 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 8, 'Download Center', 'download_center', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 9, 'Library', 'library', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 10, 'Inventory', 'inventory', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 11, 'Transport', 'transport', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 12, 'Hostel', 'hostel', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 13, 'Communicate', 'communicate', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 14, 'Reports', 'reports', 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 15, 'System Settings', 'system_settings', 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 16, 'Front CMS', 'front_cms', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 17, 'Front Office', 'front_office', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 18, 'Human Resource', 'human_resource', 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 19, 'Homework', 'homework', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 20, 'Certificate', 'certificate', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 21, 'Calendar To Do List', 'calendar_to_do_list', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 22, 'Dashboard and Widgets', 'dashboard_and_widgets', 1, 1, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 23, 'Online Examination', 'online_examination', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 25, 'Chat', 'chat', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 26, 'Multi Class', 'multi_class', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 27, 'Online Admission', 'online_admission', 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 28, 'Alumni', 'alumni', 1, 0, '2023-03-18 10:08:24');
INSERT INTO `permission_group` (`school_id`, `id`, `name`, `short_code`, `is_active`, `system`, `created_at`) VALUES (2, 29, 'Lesson Plan', 'lesson_plan', 1, 0, '2023-02-14 13:11:38');


#
# TABLE STRUCTURE FOR: permission_student
#

DROP TABLE IF EXISTS `permission_student`;

CREATE TABLE `permission_student` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `short_code` varchar(100) NOT NULL,
  `system` int(11) NOT NULL,
  `student` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 1, 'Fees', 'fees', 0, 1, 1, 2, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 2, 'Class Timetable', 'class_timetable', 1, 1, 1, 7, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 3, 'Homework', 'homework', 0, 1, 1, 19, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 4, 'Download Center', 'download_center', 0, 1, 1, 8, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 5, 'Attendance', 'attendance', 0, 1, 1, 5, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 7, 'Examinations', 'examinations', 0, 1, 1, 6, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 8, 'Notice Board', 'notice_board', 0, 1, 1, 13, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 11, 'Library', 'library', 0, 1, 1, 9, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 12, 'Transport Routes', 'transport_routes', 0, 1, 1, 11, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 13, 'Hostel Rooms', 'hostel_rooms', 0, 1, 1, 12, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 14, 'Calendar To Do List', 'calendar_to_do_list', 0, 1, 1, 21, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 15, 'Online Examination', 'online_examination', 0, 1, 1, 23, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 16, 'Teachers Rating', 'teachers_rating', 0, 1, 1, 0, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 17, 'Chat', 'chat', 0, 1, 1, 25, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 18, 'Multi Class', 'multi_class', 1, 1, 1, 26, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 19, 'Lesson Plan', 'lesson_plan', 0, 1, 1, 29, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 20, 'Syllabus Status', 'syllabus_status', 0, 1, 1, 29, '2023-02-14 13:11:38');
INSERT INTO `permission_student` (`school_id`, `id`, `name`, `short_code`, `system`, `student`, `parent`, `group_id`, `created_at`) VALUES (2, 23, 'Apply Leave', 'apply_leave', 0, 1, 1, 0, '2023-02-14 13:11:38');


#
# TABLE STRUCTURE FOR: print_headerfooter
#

DROP TABLE IF EXISTS `print_headerfooter`;

CREATE TABLE `print_headerfooter` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `print_type` varchar(255) NOT NULL,
  `header_image` varchar(255) NOT NULL,
  `footer_content` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `entry_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `print_headerfooter` (`school_id`, `id`, `print_type`, `header_image`, `footer_content`, `created_by`, `entry_date`) VALUES (2, 1, 'staff_payslip', 'header_image.jpg', 'This payslip is computer generated hence no signature is required.', 3, '2023-02-15 23:29:17');
INSERT INTO `print_headerfooter` (`school_id`, `id`, `print_type`, `header_image`, `footer_content`, `created_by`, `entry_date`) VALUES (2, 2, 'student_receipt', 'header_image.jpg', 'This receipt is computer generated hence no signature is required.', 3, '2023-02-15 23:28:52');


#
# TABLE STRUCTURE FOR: question_answers
#

DROP TABLE IF EXISTS `question_answers`;

CREATE TABLE `question_answers` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: question_options
#

DROP TABLE IF EXISTS `question_options`;

CREATE TABLE `question_options` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: questions
#

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `question_type` varchar(100) NOT NULL,
  `level` varchar(10) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `opt_a` text DEFAULT NULL,
  `opt_b` text DEFAULT NULL,
  `opt_c` text DEFAULT NULL,
  `opt_d` text DEFAULT NULL,
  `opt_e` text DEFAULT NULL,
  `correct` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `questions` (`school_id`, `id`, `staff_id`, `subject_id`, `question_type`, `level`, `class_id`, `section_id`, `class_section_id`, `question`, `opt_a`, `opt_b`, `opt_c`, `opt_d`, `opt_e`, `correct`, `created_at`, `updated_at`) VALUES (2, 1, 3, 1, 'descriptive', 'high', 1, 1, NULL, 'When Pakistan came in existance? who is founder of pakistan', '', '', '', '', '', '', '2023-02-26 09:41:55', NULL);
INSERT INTO `questions` (`school_id`, `id`, `staff_id`, `subject_id`, `question_type`, `level`, `class_id`, `section_id`, `class_section_id`, `question`, `opt_a`, `opt_b`, `opt_c`, `opt_d`, `opt_e`, `correct`, `created_at`, `updated_at`) VALUES (1, 2, 1, 5, 'singlechoice', 'medium', 11, 5, NULL, 'Who is founder of Pakistan?', 'Alama Iqbal', 'Qauid Azam', 'Sir Syyed', 'Tariq Jameel', 'Nusrat', 'opt_b', '2023-02-26 09:50:35', NULL);
INSERT INTO `questions` (`school_id`, `id`, `staff_id`, `subject_id`, `question_type`, `level`, `class_id`, `section_id`, `class_section_id`, `question`, `opt_a`, `opt_b`, `opt_c`, `opt_d`, `opt_e`, `correct`, `created_at`, `updated_at`) VALUES (2, 3, 3, 2, 'singlechoice', 'low', 1, 1, NULL, 'Who made Pakistan?', 'Wajid Ali', 'Luqman', 'Javed', 'Unis', 'None', 'opt_a', '2023-02-26 14:44:47', NULL);


#
# TABLE STRUCTURE FOR: read_notification
#

DROP TABLE IF EXISTS `read_notification`;

CREATE TABLE `read_notification` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `read_notification` (`school_id`, `id`, `student_id`, `parent_id`, `staff_id`, `notification_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 1, NULL, NULL, 1, 1, 'no', '2023-02-26 08:55:35', NULL);
INSERT INTO `read_notification` (`school_id`, `id`, `student_id`, `parent_id`, `staff_id`, `notification_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 2, NULL, NULL, 1, 2, 'no', '2023-02-26 08:55:41', NULL);
INSERT INTO `read_notification` (`school_id`, `id`, `student_id`, `parent_id`, `staff_id`, `notification_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 3, NULL, NULL, 1, 3, 'no', '2023-02-26 08:55:43', NULL);
INSERT INTO `read_notification` (`school_id`, `id`, `student_id`, `parent_id`, `staff_id`, `notification_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 4, 22, NULL, NULL, 2, 'no', '2023-02-26 10:03:20', NULL);


#
# TABLE STRUCTURE FOR: reference
#

DROP TABLE IF EXISTS `reference`;

CREATE TABLE `reference` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `reference` (`school_id`, `id`, `reference`, `description`) VALUES (2, 1, 'Wajid Ali', 'Professor at UEDGK');
INSERT INTO `reference` (`school_id`, `id`, `reference`, `description`) VALUES (1, 2, 'Arshad Mehmood', '');


#
# TABLE STRUCTURE FOR: roles
#

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `is_system` int(1) NOT NULL DEFAULT 0,
  `is_superadmin` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `roles` (`school_id`, `id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (2, 1, 'Admin', NULL, 0, 1, 0, '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `roles` (`school_id`, `id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (2, 2, 'Teacher', NULL, 0, 1, 0, '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `roles` (`school_id`, `id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (2, 3, 'Accountant', NULL, 0, 1, 0, '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `roles` (`school_id`, `id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (2, 4, 'Librarian', NULL, 0, 1, 0, '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `roles` (`school_id`, `id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (2, 6, 'Receptionist', NULL, 0, 1, 0, '2023-02-14 13:11:38', '0000-00-00');
INSERT INTO `roles` (`school_id`, `id`, `name`, `slug`, `is_active`, `is_system`, `is_superadmin`, `created_at`, `updated_at`) VALUES (2, 7, 'Super Admin', NULL, 0, 1, 1, '2023-02-14 13:11:38', '0000-00-00');


#
# TABLE STRUCTURE FOR: roles_permissions
#

DROP TABLE IF EXISTS `roles_permissions`;

CREATE TABLE `roles_permissions` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `perm_cat_id` int(11) DEFAULT NULL,
  `can_view` int(11) DEFAULT NULL,
  `can_add` int(11) DEFAULT NULL,
  `can_edit` int(11) DEFAULT NULL,
  `can_delete` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1474 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 10, 1, 17, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 11, 1, 78, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 23, 1, 12, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 24, 1, 13, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 26, 1, 15, 1, 1, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 28, 1, 19, 1, 1, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 30, 1, 76, 1, 1, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 31, 1, 21, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 32, 1, 22, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 34, 1, 24, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 43, 1, 32, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 44, 1, 33, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 45, 1, 34, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 46, 1, 35, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 47, 1, 104, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 48, 1, 37, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 49, 1, 38, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 58, 1, 52, 1, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 61, 1, 55, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 67, 1, 61, 1, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 68, 1, 62, 1, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 69, 1, 63, 1, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 70, 1, 64, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 71, 1, 65, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 72, 1, 66, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 73, 1, 67, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 74, 1, 79, 1, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 75, 1, 80, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 76, 1, 81, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 78, 1, 83, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 79, 1, 84, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 80, 1, 85, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 87, 1, 92, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 94, 1, 82, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 120, 1, 39, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 156, 1, 9, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 157, 1, 10, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 159, 1, 40, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 160, 1, 41, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 161, 1, 42, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 169, 1, 27, 1, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 178, 1, 54, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 179, 1, 56, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 180, 1, 57, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 181, 1, 58, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 182, 1, 59, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 183, 1, 60, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 190, 1, 105, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 199, 1, 75, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 201, 1, 14, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 203, 1, 16, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 204, 1, 26, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 206, 1, 29, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 207, 1, 30, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 208, 1, 31, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 215, 1, 50, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 216, 1, 51, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 222, 1, 1, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 227, 1, 91, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 230, 10, 53, 0, 1, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 231, 10, 54, 0, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 232, 10, 55, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 233, 10, 56, 0, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 235, 10, 58, 0, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 236, 10, 59, 0, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 239, 10, 1, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 241, 10, 3, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 242, 10, 2, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 243, 10, 4, 1, 0, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 245, 10, 107, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 246, 10, 5, 1, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 247, 10, 7, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 248, 10, 68, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 249, 10, 69, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 250, 10, 70, 1, 0, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 251, 10, 72, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 252, 10, 73, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 253, 10, 74, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 254, 10, 75, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 255, 10, 9, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 256, 10, 10, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 257, 10, 11, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 258, 10, 12, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 259, 10, 13, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 260, 10, 14, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 261, 10, 15, 1, 1, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 262, 10, 16, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 263, 10, 17, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 264, 10, 19, 1, 1, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 265, 10, 20, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 266, 10, 76, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 267, 10, 21, 1, 1, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 268, 10, 22, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 269, 10, 23, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 270, 10, 24, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 271, 10, 25, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 272, 10, 26, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 273, 10, 77, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 274, 10, 27, 1, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 275, 10, 28, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 276, 10, 29, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 277, 10, 30, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 278, 10, 31, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 279, 10, 32, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 280, 10, 33, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 281, 10, 34, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 282, 10, 35, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 283, 10, 104, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 284, 10, 37, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 285, 10, 38, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 286, 10, 39, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 287, 10, 40, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 288, 10, 41, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 289, 10, 42, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 290, 10, 43, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 291, 10, 44, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 292, 10, 46, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 293, 10, 50, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 294, 10, 51, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 295, 10, 60, 0, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 296, 10, 61, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 297, 10, 62, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 298, 10, 63, 1, 1, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 299, 10, 64, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 300, 10, 65, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 301, 10, 66, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 302, 10, 67, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 303, 10, 78, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 307, 1, 126, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 310, 1, 119, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 311, 1, 120, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 315, 1, 123, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 317, 1, 124, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 320, 1, 47, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 321, 1, 121, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 369, 1, 102, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 372, 10, 79, 1, 1, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 373, 10, 80, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 374, 10, 81, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 375, 10, 82, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 376, 10, 83, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 377, 10, 84, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 378, 10, 85, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 379, 10, 86, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 380, 10, 87, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 381, 10, 88, 1, 1, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 382, 10, 89, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 383, 10, 90, 1, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 384, 10, 91, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 385, 10, 108, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 386, 10, 109, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 387, 10, 110, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 388, 10, 111, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 389, 10, 112, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 390, 10, 127, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 391, 10, 93, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 392, 10, 94, 1, 1, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 394, 10, 95, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 395, 10, 102, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 396, 10, 106, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 397, 10, 113, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 398, 10, 114, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 399, 10, 115, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 400, 10, 116, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 401, 10, 117, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 402, 10, 118, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 434, 1, 125, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 435, 1, 96, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 445, 1, 48, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 446, 1, 49, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 461, 1, 97, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 462, 1, 95, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 464, 1, 86, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 474, 1, 130, 1, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 476, 1, 131, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 479, 2, 47, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 480, 2, 105, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 482, 2, 119, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 483, 2, 120, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 486, 2, 16, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 493, 2, 22, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 504, 2, 95, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 513, 3, 72, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 517, 3, 75, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 527, 3, 89, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 529, 3, 91, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 549, 3, 124, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 557, 6, 82, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 558, 6, 83, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 559, 6, 84, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 575, 6, 44, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 576, 6, 46, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 578, 6, 102, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 594, 3, 125, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 595, 3, 48, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 596, 3, 49, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 617, 2, 17, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 618, 2, 19, 1, 1, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 620, 2, 76, 1, 1, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 622, 2, 121, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 625, 1, 28, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 628, 6, 22, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 634, 4, 102, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 662, 1, 138, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 663, 1, 139, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 664, 1, 140, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 669, 1, 145, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 677, 1, 153, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 690, 1, 166, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 691, 1, 167, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 692, 1, 168, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 693, 1, 170, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 694, 1, 172, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 695, 1, 173, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 720, 1, 216, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 728, 1, 185, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 729, 1, 186, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 730, 1, 214, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 732, 1, 198, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 733, 1, 199, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 734, 1, 200, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 735, 1, 201, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 736, 1, 202, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 737, 1, 203, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 739, 1, 218, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 743, 1, 218, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 747, 1, 2, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 748, 1, 3, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 749, 1, 4, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 751, 1, 128, 0, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 752, 1, 132, 1, 0, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 754, 1, 134, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 755, 1, 5, 1, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 756, 1, 6, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 757, 1, 7, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 758, 1, 8, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 760, 1, 68, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 761, 1, 69, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 762, 1, 70, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 763, 1, 71, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 764, 1, 72, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 765, 1, 73, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 766, 1, 74, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 768, 1, 11, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 769, 1, 122, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 771, 1, 136, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 772, 1, 20, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 773, 1, 137, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 774, 1, 141, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 775, 1, 142, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 776, 1, 143, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 777, 1, 144, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 778, 1, 187, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 779, 1, 196, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 781, 1, 207, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 782, 1, 208, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 783, 1, 210, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 784, 1, 211, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 785, 1, 212, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 786, 1, 205, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 787, 1, 222, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 788, 1, 77, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 789, 1, 188, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 790, 1, 23, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 791, 1, 25, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 792, 1, 127, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 794, 1, 88, 1, 1, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 795, 1, 90, 1, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 796, 1, 108, 1, 0, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 797, 1, 109, 1, 1, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 798, 1, 110, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 799, 1, 111, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 800, 1, 112, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 801, 1, 129, 0, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 802, 1, 189, 1, 0, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 806, 2, 133, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 810, 2, 1, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 813, 1, 133, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 817, 1, 93, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 825, 1, 87, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 829, 1, 94, 1, 1, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 836, 1, 146, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 837, 1, 147, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 838, 1, 148, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 839, 1, 149, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 840, 1, 150, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 841, 1, 151, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 842, 1, 152, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 843, 1, 154, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 862, 1, 155, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 863, 1, 156, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 864, 1, 157, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 874, 1, 158, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 875, 1, 159, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 876, 1, 160, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 878, 1, 162, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 879, 1, 163, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 882, 1, 164, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 884, 1, 165, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 886, 1, 197, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 887, 1, 219, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 889, 1, 220, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 932, 1, 204, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 933, 1, 221, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 934, 1, 178, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 935, 1, 179, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 936, 1, 161, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 937, 1, 180, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 938, 1, 181, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 939, 1, 182, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 940, 1, 183, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 941, 1, 174, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 943, 1, 176, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 944, 1, 177, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 945, 1, 53, 0, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 946, 1, 215, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 947, 1, 213, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 974, 1, 224, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 979, 1, 225, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 982, 2, 225, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1026, 1, 135, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1031, 1, 228, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1083, 1, 175, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1086, 1, 43, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1087, 1, 44, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1088, 1, 46, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1089, 1, 217, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1090, 1, 98, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1091, 1, 99, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1092, 1, 223, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1103, 2, 205, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1105, 2, 23, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1106, 2, 24, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1107, 2, 25, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1108, 2, 77, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1123, 3, 8, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1125, 3, 69, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1126, 3, 70, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1130, 3, 9, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1131, 3, 10, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1134, 3, 35, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1135, 3, 104, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1140, 3, 41, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1141, 3, 42, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1142, 3, 43, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1151, 3, 87, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1152, 3, 88, 1, 1, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1153, 3, 90, 1, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1154, 3, 108, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1155, 3, 109, 1, 1, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1156, 3, 110, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1157, 3, 111, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1158, 3, 112, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1159, 3, 127, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1160, 3, 129, 0, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1161, 3, 102, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1162, 3, 106, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1163, 3, 113, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1164, 3, 114, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1165, 3, 115, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1166, 3, 116, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1167, 3, 117, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1168, 3, 118, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1171, 2, 142, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1172, 2, 144, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1179, 2, 212, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1183, 2, 148, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1184, 2, 149, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1185, 2, 150, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1186, 2, 151, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1187, 2, 152, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1188, 2, 153, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1189, 2, 154, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1190, 2, 197, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1191, 2, 198, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1192, 2, 199, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1193, 2, 200, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1194, 2, 201, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1195, 2, 202, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1196, 2, 203, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1197, 2, 219, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1198, 2, 223, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1201, 2, 230, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1204, 2, 214, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1206, 2, 224, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1208, 2, 2, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1211, 2, 145, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1214, 2, 3, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1216, 2, 4, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1218, 2, 128, 0, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1220, 3, 135, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1231, 3, 190, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1232, 3, 192, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1233, 3, 226, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1234, 3, 227, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1235, 3, 224, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1236, 2, 15, 1, 1, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1239, 2, 122, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1240, 2, 136, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1242, 6, 217, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1243, 6, 224, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1245, 2, 20, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1248, 2, 141, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1250, 2, 187, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1252, 2, 207, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1253, 2, 208, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1255, 2, 210, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1256, 2, 211, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1257, 2, 21, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1259, 2, 188, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1260, 2, 27, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1262, 2, 43, 0, 1, 1, 1, '2023-02-26 20:06:49');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1266, 2, 146, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1267, 2, 147, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1269, 2, 164, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1271, 2, 109, 1, 1, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1272, 2, 93, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1273, 2, 94, 1, 1, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1277, 2, 196, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1279, 2, 185, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1280, 2, 186, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1281, 2, 222, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1283, 3, 5, 1, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1284, 3, 6, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1285, 3, 7, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1286, 3, 68, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1287, 3, 71, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1288, 3, 73, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1289, 3, 74, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1290, 3, 11, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1291, 3, 12, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1292, 3, 13, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1294, 3, 14, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1295, 3, 31, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1297, 3, 37, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1298, 3, 38, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1299, 3, 39, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1300, 3, 40, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1301, 3, 44, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1302, 3, 46, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1303, 3, 217, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1304, 3, 155, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1305, 3, 156, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1306, 3, 157, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1307, 3, 158, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1308, 3, 159, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1309, 3, 160, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1313, 3, 161, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1314, 3, 162, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1315, 3, 163, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1316, 3, 164, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1317, 3, 165, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1318, 3, 174, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1319, 3, 175, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1320, 3, 181, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1321, 3, 86, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1322, 4, 28, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1324, 4, 29, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1325, 4, 30, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1326, 4, 123, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1327, 4, 228, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1328, 4, 43, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1332, 4, 44, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1333, 4, 46, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1334, 4, 217, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1335, 4, 178, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1336, 4, 179, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1337, 4, 180, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1338, 4, 221, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1339, 4, 86, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1341, 4, 106, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1342, 1, 107, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1343, 4, 117, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1344, 4, 194, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1348, 4, 230, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1350, 6, 1, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1351, 6, 21, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1352, 6, 23, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1353, 6, 24, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1354, 6, 25, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1355, 6, 77, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1356, 6, 188, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1357, 6, 43, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1358, 6, 78, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1360, 6, 79, 1, 1, 0, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1361, 6, 80, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1362, 6, 81, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1363, 6, 85, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1364, 6, 86, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1365, 6, 106, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1366, 6, 117, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1394, 1, 106, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1395, 1, 113, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1396, 1, 114, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1397, 1, 115, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1398, 1, 116, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1399, 1, 117, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1400, 1, 118, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1402, 1, 191, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1403, 1, 192, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1404, 1, 193, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1405, 1, 194, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1406, 1, 195, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1408, 1, 227, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1410, 1, 226, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1411, 1, 229, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1412, 1, 230, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1413, 1, 190, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1414, 2, 174, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1415, 2, 175, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1418, 2, 232, 1, 0, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1419, 2, 231, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1420, 1, 231, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1421, 1, 232, 1, 0, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1422, 3, 32, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1423, 3, 33, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1424, 3, 34, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1425, 3, 182, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1426, 3, 183, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1427, 3, 189, 1, 0, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1428, 3, 229, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1429, 3, 230, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1430, 4, 213, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1432, 4, 224, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1433, 4, 195, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1434, 4, 229, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1436, 6, 213, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1437, 6, 191, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1438, 6, 193, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1439, 6, 230, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1440, 2, 106, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1441, 2, 107, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1442, 2, 134, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1443, 1, 233, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1444, 2, 86, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1445, 3, 233, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1446, 1, 234, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1447, 1, 235, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1448, 1, 236, 1, 1, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1449, 1, 237, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1450, 1, 238, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1451, 1, 239, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1452, 2, 236, 1, 1, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1453, 2, 237, 1, 0, 1, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1454, 2, 238, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1455, 2, 239, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1456, 2, 240, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1457, 2, 241, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1458, 1, 240, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1459, 1, 241, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1460, 1, 242, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1461, 2, 242, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1462, 3, 242, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1463, 6, 242, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1464, 1, 243, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1465, 1, 109, 1, 1, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1466, 1, 108, 1, 1, 1, 1, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1467, 1, 244, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1468, 1, 245, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1469, 1, 246, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1470, 1, 247, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (2, 1472, 2, 247, 1, 0, 0, 0, '2023-02-14 13:10:09');
INSERT INTO `roles_permissions` (`school_id`, `id`, `role_id`, `perm_cat_id`, `can_view`, `can_add`, `can_edit`, `can_delete`, `created_at`) VALUES (NULL, 1473, 2, 137, 1, 1, 1, 1, '2023-02-26 20:11:59');


#
# TABLE STRUCTURE FOR: room_types
#

DROP TABLE IF EXISTS `room_types`;

CREATE TABLE `room_types` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_type` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `room_types` (`school_id`, `id`, `room_type`, `description`, `created_at`, `updated_at`) VALUES (2, 1, 'ROOM 2', 'ZAINAB ALI KAHAN\r\n', '2023-03-18 09:08:03', NULL);
INSERT INTO `room_types` (`school_id`, `id`, `room_type`, `description`, `created_at`, `updated_at`) VALUES (1, 2, 'FURNISHED', '', '2023-03-18 09:14:20', NULL);


#
# TABLE STRUCTURE FOR: sch_settings
#

DROP TABLE IF EXISTS `sch_settings`;

CREATE TABLE `sch_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(200) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `biometric` int(11) DEFAULT 0,
  `biometric_device` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `languages` varchar(500) NOT NULL,
  `dise_code` varchar(50) DEFAULT NULL,
  `date_format` varchar(50) NOT NULL,
  `time_format` varchar(255) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `currency_symbol` varchar(50) NOT NULL,
  `is_rtl` varchar(10) DEFAULT 'disabled',
  `is_duplicate_fees_invoice` int(1) DEFAULT 0,
  `timezone` varchar(30) DEFAULT 'UTC',
  `session_id` int(11) DEFAULT NULL,
  `cron_secret_key` varchar(100) NOT NULL,
  `currency_place` varchar(50) NOT NULL DEFAULT 'before_number',
  `class_teacher` varchar(100) NOT NULL,
  `start_month` varchar(40) NOT NULL,
  `attendence_type` int(10) NOT NULL DEFAULT 0,
  `image` varchar(100) DEFAULT NULL,
  `admin_logo` varchar(255) NOT NULL,
  `admin_small_logo` varchar(255) NOT NULL,
  `theme` varchar(200) NOT NULL DEFAULT 'default.jpg',
  `fee_due_days` int(3) DEFAULT 0,
  `adm_auto_insert` int(1) NOT NULL DEFAULT 1,
  `adm_prefix` varchar(50) NOT NULL DEFAULT 'ssadm19/20',
  `adm_start_from` varchar(11) NOT NULL,
  `adm_no_digit` int(10) NOT NULL DEFAULT 6,
  `adm_update_status` int(11) NOT NULL DEFAULT 0,
  `staffid_auto_insert` int(11) NOT NULL DEFAULT 1,
  `staffid_prefix` varchar(100) NOT NULL DEFAULT 'staffss/19/20',
  `staffid_start_from` varchar(50) NOT NULL,
  `staffid_no_digit` int(11) NOT NULL DEFAULT 6,
  `staffid_update_status` int(11) NOT NULL DEFAULT 0,
  `is_active` varchar(255) DEFAULT 'no',
  `online_admission` int(1) DEFAULT 0,
  `is_blood_group` int(10) NOT NULL DEFAULT 1,
  `is_student_house` int(10) NOT NULL DEFAULT 1,
  `roll_no` int(11) NOT NULL DEFAULT 1,
  `category` int(11) NOT NULL,
  `religion` int(11) NOT NULL DEFAULT 1,
  `cast` int(11) NOT NULL DEFAULT 1,
  `mobile_no` int(11) NOT NULL DEFAULT 1,
  `student_email` int(11) NOT NULL DEFAULT 1,
  `admission_date` int(11) NOT NULL DEFAULT 1,
  `lastname` int(11) NOT NULL,
  `middlename` int(11) NOT NULL DEFAULT 1,
  `student_photo` int(11) NOT NULL DEFAULT 1,
  `student_height` int(11) NOT NULL DEFAULT 1,
  `student_weight` int(11) NOT NULL DEFAULT 1,
  `measurement_date` int(11) NOT NULL DEFAULT 1,
  `father_name` int(11) NOT NULL DEFAULT 1,
  `father_phone` int(11) NOT NULL DEFAULT 1,
  `father_occupation` int(11) NOT NULL DEFAULT 1,
  `father_pic` int(11) NOT NULL DEFAULT 1,
  `mother_name` int(11) NOT NULL DEFAULT 1,
  `mother_phone` int(11) NOT NULL DEFAULT 1,
  `mother_occupation` int(11) NOT NULL DEFAULT 1,
  `mother_pic` int(11) NOT NULL DEFAULT 1,
  `guardian_name` int(1) NOT NULL,
  `guardian_relation` int(11) NOT NULL DEFAULT 1,
  `guardian_phone` int(1) NOT NULL,
  `guardian_email` int(11) NOT NULL DEFAULT 1,
  `guardian_pic` int(11) NOT NULL DEFAULT 1,
  `guardian_occupation` int(1) NOT NULL,
  `guardian_address` int(11) NOT NULL DEFAULT 1,
  `current_address` int(11) NOT NULL DEFAULT 1,
  `permanent_address` int(11) NOT NULL DEFAULT 1,
  `route_list` int(11) NOT NULL DEFAULT 1,
  `hostel_id` int(11) NOT NULL DEFAULT 1,
  `bank_account_no` int(11) NOT NULL DEFAULT 1,
  `ifsc_code` int(1) NOT NULL,
  `bank_name` int(1) NOT NULL,
  `national_identification_no` int(11) NOT NULL DEFAULT 1,
  `local_identification_no` int(11) NOT NULL DEFAULT 1,
  `rte` int(11) NOT NULL DEFAULT 1,
  `previous_school_details` int(11) NOT NULL DEFAULT 1,
  `student_note` int(11) NOT NULL DEFAULT 1,
  `upload_documents` int(11) NOT NULL DEFAULT 1,
  `staff_designation` int(11) NOT NULL DEFAULT 1,
  `staff_department` int(11) NOT NULL DEFAULT 1,
  `staff_last_name` int(11) NOT NULL DEFAULT 1,
  `staff_father_name` int(11) NOT NULL DEFAULT 1,
  `staff_mother_name` int(11) NOT NULL DEFAULT 1,
  `staff_date_of_joining` int(11) NOT NULL DEFAULT 1,
  `staff_phone` int(11) NOT NULL DEFAULT 1,
  `staff_emergency_contact` int(11) NOT NULL DEFAULT 1,
  `staff_marital_status` int(11) NOT NULL DEFAULT 1,
  `staff_photo` int(11) NOT NULL DEFAULT 1,
  `staff_current_address` int(11) NOT NULL DEFAULT 1,
  `staff_permanent_address` int(11) NOT NULL DEFAULT 1,
  `staff_qualification` int(11) NOT NULL DEFAULT 1,
  `staff_work_experience` int(11) NOT NULL DEFAULT 1,
  `staff_note` int(11) NOT NULL DEFAULT 1,
  `staff_epf_no` int(11) NOT NULL DEFAULT 1,
  `staff_basic_salary` int(11) NOT NULL DEFAULT 1,
  `staff_contract_type` int(11) NOT NULL DEFAULT 1,
  `staff_work_shift` int(11) NOT NULL DEFAULT 1,
  `staff_work_location` int(11) NOT NULL DEFAULT 1,
  `staff_leaves` int(11) NOT NULL DEFAULT 1,
  `staff_account_details` int(11) NOT NULL DEFAULT 1,
  `staff_social_media` int(11) NOT NULL DEFAULT 1,
  `staff_upload_documents` int(11) NOT NULL DEFAULT 1,
  `mobile_api_url` tinytext NOT NULL,
  `app_primary_color_code` varchar(20) DEFAULT NULL,
  `app_secondary_color_code` varchar(20) DEFAULT NULL,
  `app_logo` varchar(250) DEFAULT NULL,
  `student_profile_edit` int(1) NOT NULL DEFAULT 0,
  `start_week` varchar(10) NOT NULL,
  `my_question` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `host` text DEFAULT NULL,
  `is_activated` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `lang_id` (`lang_id`),
  KEY `session_id` (`session_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `sch_settings` (`id`, `school_id`, `name`, `biometric`, `biometric_device`, `email`, `phone`, `address`, `lang_id`, `languages`, `dise_code`, `date_format`, `time_format`, `currency`, `currency_symbol`, `is_rtl`, `is_duplicate_fees_invoice`, `timezone`, `session_id`, `cron_secret_key`, `currency_place`, `class_teacher`, `start_month`, `attendence_type`, `image`, `admin_logo`, `admin_small_logo`, `theme`, `fee_due_days`, `adm_auto_insert`, `adm_prefix`, `adm_start_from`, `adm_no_digit`, `adm_update_status`, `staffid_auto_insert`, `staffid_prefix`, `staffid_start_from`, `staffid_no_digit`, `staffid_update_status`, `is_active`, `online_admission`, `is_blood_group`, `is_student_house`, `roll_no`, `category`, `religion`, `cast`, `mobile_no`, `student_email`, `admission_date`, `lastname`, `middlename`, `student_photo`, `student_height`, `student_weight`, `measurement_date`, `father_name`, `father_phone`, `father_occupation`, `father_pic`, `mother_name`, `mother_phone`, `mother_occupation`, `mother_pic`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_email`, `guardian_pic`, `guardian_occupation`, `guardian_address`, `current_address`, `permanent_address`, `route_list`, `hostel_id`, `bank_account_no`, `ifsc_code`, `bank_name`, `national_identification_no`, `local_identification_no`, `rte`, `previous_school_details`, `student_note`, `upload_documents`, `staff_designation`, `staff_department`, `staff_last_name`, `staff_father_name`, `staff_mother_name`, `staff_date_of_joining`, `staff_phone`, `staff_emergency_contact`, `staff_marital_status`, `staff_photo`, `staff_current_address`, `staff_permanent_address`, `staff_qualification`, `staff_work_experience`, `staff_note`, `staff_epf_no`, `staff_basic_salary`, `staff_contract_type`, `staff_work_shift`, `staff_work_location`, `staff_leaves`, `staff_account_details`, `staff_social_media`, `staff_upload_documents`, `mobile_api_url`, `app_primary_color_code`, `app_secondary_color_code`, `app_logo`, `student_profile_edit`, `start_week`, `my_question`, `created_at`, `updated_at`, `host`, `is_activated`) VALUES (1, 2, 'Muslim Public School Multan', 0, '', 'unis.panwar@gmail.com', '03099914748', '1.5Km shah Jamal Road Khan Garh', 4, '[\"4\",\"79\"]', '3335', 'm/d/Y', '12-hour', 'PEN', 'Rs.', 'disabled', 0, 'Asia/Karachi', 26, 'veSQjt0qRa775KwAR8xocvJz1', 'after_number', 'yes', '4', 0, '1.jpg', '1.jpg', '1.jpg', 'blue.jpg', 30, 1, 'STD', '0001', 4, 1, 1, 'STF', '0001', 4, 1, 'no', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'https://demo2.isdigitalschools.com/api/', '#424242', '#eeeeee', '1.jpg', 1, 'Monday', 1, '2023-03-01 10:54:50', NULL, 'demo1.isdigitalschools.com', 0);
INSERT INTO `sch_settings` (`id`, `school_id`, `name`, `biometric`, `biometric_device`, `email`, `phone`, `address`, `lang_id`, `languages`, `dise_code`, `date_format`, `time_format`, `currency`, `currency_symbol`, `is_rtl`, `is_duplicate_fees_invoice`, `timezone`, `session_id`, `cron_secret_key`, `currency_place`, `class_teacher`, `start_month`, `attendence_type`, `image`, `admin_logo`, `admin_small_logo`, `theme`, `fee_due_days`, `adm_auto_insert`, `adm_prefix`, `adm_start_from`, `adm_no_digit`, `adm_update_status`, `staffid_auto_insert`, `staffid_prefix`, `staffid_start_from`, `staffid_no_digit`, `staffid_update_status`, `is_active`, `online_admission`, `is_blood_group`, `is_student_house`, `roll_no`, `category`, `religion`, `cast`, `mobile_no`, `student_email`, `admission_date`, `lastname`, `middlename`, `student_photo`, `student_height`, `student_weight`, `measurement_date`, `father_name`, `father_phone`, `father_occupation`, `father_pic`, `mother_name`, `mother_phone`, `mother_occupation`, `mother_pic`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_email`, `guardian_pic`, `guardian_occupation`, `guardian_address`, `current_address`, `permanent_address`, `route_list`, `hostel_id`, `bank_account_no`, `ifsc_code`, `bank_name`, `national_identification_no`, `local_identification_no`, `rte`, `previous_school_details`, `student_note`, `upload_documents`, `staff_designation`, `staff_department`, `staff_last_name`, `staff_father_name`, `staff_mother_name`, `staff_date_of_joining`, `staff_phone`, `staff_emergency_contact`, `staff_marital_status`, `staff_photo`, `staff_current_address`, `staff_permanent_address`, `staff_qualification`, `staff_work_experience`, `staff_note`, `staff_epf_no`, `staff_basic_salary`, `staff_contract_type`, `staff_work_shift`, `staff_work_location`, `staff_leaves`, `staff_account_details`, `staff_social_media`, `staff_upload_documents`, `mobile_api_url`, `app_primary_color_code`, `app_secondary_color_code`, `app_logo`, `student_profile_edit`, `start_week`, `my_question`, `created_at`, `updated_at`, `host`, `is_activated`) VALUES (2, 2, 'The Country School Shah Jamal', 0, '', 'unis.panwar2@gmail.com', '03099914748', '1.5Km shah Jamal Road Khan Garh', 4, '[\"4\",\"79\"]', '3335', 'm/d/Y', '12-hour', 'PKR', 'Rs.', 'disabled', 1, 'Asia/Karachi', 15, '1sgtvfspCEE8JuqNSMaSQxmGD', 'after_number', 'yes', '4', 0, '2.png', '2.png', '2.png', 'blue.jpg', 30, 1, 'STD', '0001', 4, 1, 1, 'STF', '0001', 4, 1, 'no', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'https://demo2.isdigitalschools.com/api/', '#424242', '#eeeeee', '2.png', 1, 'Monday', 1, '2023-03-18 22:01:48', NULL, 'demo2.isdigitalschools.com', 0);


#
# TABLE STRUCTURE FOR: school_houses
#

DROP TABLE IF EXISTS `school_houses`;

CREATE TABLE `school_houses` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_name` varchar(200) NOT NULL,
  `description` varchar(400) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `school_houses` (`school_id`, `id`, `house_name`, `description`, `is_active`) VALUES (1, 1, 'HOUSE 1', 'here', 'yes');
INSERT INTO `school_houses` (`school_id`, `id`, `house_name`, `description`, `is_active`) VALUES (2, 2, 'HOUSE 2', '', 'yes');


#
# TABLE STRUCTURE FOR: sections
#

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `sections` (`school_id`, `id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 'A', 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `sections` (`school_id`, `id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 'B', 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `sections` (`school_id`, `id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES (2, 3, 'C', 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `sections` (`school_id`, `id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES (2, 4, 'D', 'no', '2023-02-14 13:10:09', NULL);
INSERT INTO `sections` (`school_id`, `id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES (1, 5, 'A', 'no', '2023-02-14 13:29:26', NULL);
INSERT INTO `sections` (`school_id`, `id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES (1, 6, 'B', 'no', '2023-02-14 13:29:34', NULL);
INSERT INTO `sections` (`school_id`, `id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES (1, 7, 'C', 'no', '2023-02-14 13:29:41', NULL);
INSERT INTO `sections` (`school_id`, `id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES (1, 8, 'E', 'no', '2023-02-14 13:29:46', NULL);
INSERT INTO `sections` (`school_id`, `id`, `section`, `is_active`, `created_at`, `updated_at`) VALUES (1, 9, 'F', 'no', '2023-02-14 13:29:52', NULL);


#
# TABLE STRUCTURE FOR: send_notification
#

DROP TABLE IF EXISTS `send_notification`;

CREATE TABLE `send_notification` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `message` text DEFAULT NULL,
  `visible_student` varchar(10) NOT NULL DEFAULT 'no',
  `visible_staff` varchar(10) NOT NULL DEFAULT 'no',
  `visible_parent` varchar(10) NOT NULL DEFAULT 'no',
  `created_by` varchar(60) DEFAULT NULL,
  `created_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `send_notification` (`school_id`, `id`, `title`, `publish_date`, `date`, `message`, `visible_student`, `visible_staff`, `visible_parent`, `created_by`, `created_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 'sad', '2023-02-10', '2023-02-24', '<p>dasdasd<b>asdasdasd</b></p><p><b></b></p><blockquote><b>dsadasda</b></blockquote><p></p>', 'No', 'Yes', 'No', 'Super Admin', 3, 'no', '2023-02-26 05:32:05', NULL);
INSERT INTO `send_notification` (`school_id`, `id`, `title`, `publish_date`, `date`, `message`, `visible_student`, `visible_staff`, `visible_parent`, `created_by`, `created_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 'sdadad', '2023-02-26', '2023-02-26', '<p>asdadad<b>adsasdasdad</b></p>', 'Yes', 'Yes', 'Yes', 'Super Admin', 3, 'no', '2023-02-26 05:32:51', NULL);
INSERT INTO `send_notification` (`school_id`, `id`, `title`, `publish_date`, `date`, `message`, `visible_student`, `visible_staff`, `visible_parent`, `created_by`, `created_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 3, 'dsadasd', '2023-02-25', '2023-02-25', '<p>asdsadsadasd</p>', 'No', 'Yes', 'No', 'Super Admin', 3, 'no', '2023-02-26 05:33:46', NULL);


#
# TABLE STRUCTURE FOR: sessions
#

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` varchar(60) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `sessions` (`school_id`, `id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (2, 15, '2023-24', 'no', '2023-03-18 21:38:22', '0000-00-00');
INSERT INTO `sessions` (`school_id`, `id`, `session`, `is_active`, `created_at`, `updated_at`) VALUES (1, 26, '2023-24', 'no', '2023-02-16 00:50:48', NULL);


#
# TABLE STRUCTURE FOR: sms_config
#

DROP TABLE IF EXISTS `sms_config`;

CREATE TABLE `sms_config` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `api_id` varchar(100) NOT NULL,
  `authkey` varchar(100) NOT NULL,
  `senderid` text NOT NULL,
  `contact` text DEFAULT NULL,
  `username` text DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'disabled',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `sms_config` (`school_id`, `id`, `type`, `name`, `api_id`, `authkey`, `senderid`, `contact`, `username`, `url`, `password`, `is_active`, `created_at`, `updated_at`) VALUES (2, 4, 'clickatell', '', '48de3bcbf901edc67c3d4422832bbc45f81b9545', '', '1', '101285829552105', 'EAAKgDUiuCVsBAIQQrcQ7GU2UFpDbFDHnvBOWdpLzSa34BicD451wik9JDdQgVVs6iZBnhuPufKjri8aO1zbg2WFhaPDHtVT1lWzEZBe8brQQK0FisZC9ui93cbS5JobrANXm7xfzLf2WPfenllZCjD6prXKoozmeAUMyItZCkaEAeJggUqI4AEUN5c4m9vHVFamIJnqVnJAZDZD', 'sms ', NULL, 'enabled', '2023-02-27 11:24:53', NULL);
INSERT INTO `sms_config` (`school_id`, `id`, `type`, `name`, `api_id`, `authkey`, `senderid`, `contact`, `username`, `url`, `password`, `is_active`, `created_at`, `updated_at`) VALUES (1, 5, 'clickatell', '', '48de3bcbf901edc67c3d4422832bbc45f81b9545', '', '1', '101285829552105', 'EAAKgDUiuCVsBAIQQrcQ7GU2UFpDbFDHnvBOWdpLzSa34BicD451wik9JDdQgVVs6iZBnhuPufKjri8aO1zbg2WFhaPDHtVT1lWzEZBe8brQQK0FisZC9ui93cbS5JobrANXm7xfzLf2WPfenllZCjD6prXKoozmeAUMyItZCkaEAeJggUqI4AEUN5c4m9vHVFamIJnqVnJAZDZD', 'sms ', NULL, 'enabled', '2023-03-01 10:34:45', NULL);


#
# TABLE STRUCTURE FOR: source
#

DROP TABLE IF EXISTS `source`;

CREATE TABLE `source` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `source` (`school_id`, `id`, `source`, `description`) VALUES (2, 2, 'Online Website', 'DFSDF');
INSERT INTO `source` (`school_id`, `id`, `source`, `description`) VALUES (1, 3, 'News Paper', 'news paper');


#
# TABLE STRUCTURE FOR: staff
#

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(200) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `department` int(11) DEFAULT 0,
  `designation` int(11) DEFAULT 0,
  `qualification` varchar(200) NOT NULL,
  `work_exp` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `father_name` varchar(200) NOT NULL,
  `mother_name` varchar(200) NOT NULL,
  `contact_no` varchar(200) NOT NULL,
  `emergency_contact_no` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `marital_status` varchar(100) NOT NULL,
  `date_of_joining` date NOT NULL,
  `date_of_leaving` date NOT NULL,
  `local_address` varchar(300) NOT NULL,
  `permanent_address` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `password` varchar(250) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `account_title` varchar(200) NOT NULL,
  `bank_account_no` varchar(200) NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `ifsc_code` varchar(200) NOT NULL,
  `bank_branch` varchar(100) NOT NULL,
  `payscale` varchar(200) NOT NULL,
  `basic_salary` varchar(200) NOT NULL,
  `epf_no` varchar(200) NOT NULL,
  `contract_type` varchar(100) NOT NULL,
  `shift` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `linkedin` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `resume` varchar(200) NOT NULL,
  `joining_letter` varchar(200) NOT NULL,
  `resignation_letter` varchar(200) NOT NULL,
  `other_document_name` varchar(200) NOT NULL,
  `other_document_file` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `verification_code` varchar(100) NOT NULL,
  `disable_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `staff` (`school_id`, `id`, `employee_id`, `lang_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `disable_at`) VALUES (1, 1, '9000', 4, 0, 0, '', '', 'UNis1', '', '', '', '', '', 'unis.panwar1@gmail.com', '2020-01-01', '', '0000-00-00', '0000-00-00', '', '', '', '', '$2y$10$9id42eBJm4XKmJ0bXcjH/equ.qNt5rT.aACR1ZHXgm/bf78SzIb4G', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 1, 'Q2p6bjdkdWtneHJrNmFURnhBRUU2T3haOHArQ0JLazdGK2hLbGM4Tll0Zz0=', NULL);
INSERT INTO `staff` (`school_id`, `id`, `employee_id`, `lang_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `disable_at`) VALUES (2, 3, '546485', 4, 0, 0, '', '', 'Waqar Younis', '', '', '', '', '', 'unis.panwar2@gmail.com', '2020-01-01', '', '0000-00-00', '0000-00-00', '', '', '', '3.jpg', '$2y$10$9id42eBJm4XKmJ0bXcjH/equ.qNt5rT.aACR1ZHXgm/bf78SzIb4G', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, 'Qjh3dWh5QUNoOEI1dG9qWm05SmN4ZG1EdXRUUjFvRVVML3NhN3lGejhSND0=', NULL);
INSERT INTO `staff` (`school_id`, `id`, `employee_id`, `lang_id`, `department`, `designation`, `qualification`, `work_exp`, `name`, `surname`, `father_name`, `mother_name`, `contact_no`, `emergency_contact_no`, `email`, `dob`, `marital_status`, `date_of_joining`, `date_of_leaving`, `local_address`, `permanent_address`, `note`, `image`, `password`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `ifsc_code`, `bank_branch`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document_name`, `other_document_file`, `user_id`, `is_active`, `verification_code`, `disable_at`) VALUES (2, 4, 'STF546486', 0, 2, 2, '', '', 'Engr Unis', '', '', '', '', '', 'younis.muhammad@microrage.com', '2023-02-17', '', '0000-00-00', '0000-00-00', '', '', '', '4.png', '$2y$10$8iEONpg/zb9/u6hCi1UcaOPUifUoYtF.HS8ywzsdxGwEdzUDYkAmi', 'Male', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Other Document', '', 0, 1, '', NULL);


#
# TABLE STRUCTURE FOR: staff_attendance
#

DROP TABLE IF EXISTS `staff_attendance`;

CREATE TABLE `staff_attendance` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `staff_id` int(11) NOT NULL,
  `staff_attendance_type_id` int(11) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_staff_attendance_staff` (`staff_id`),
  KEY `FK_staff_attendance_staff_attendance_type` (`staff_attendance_type_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `FK_staff_attendance_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_staff_attendance_staff_attendance_type` FOREIGN KEY (`staff_attendance_type_id`) REFERENCES `staff_attendance_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: staff_attendance_type
#

DROP TABLE IF EXISTS `staff_attendance_type`;

CREATE TABLE `staff_attendance_type` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `key_value` varchar(200) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `staff_attendance_type` (`school_id`, `id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 'Present', '<b class=\"text text-success\">P</b>', 'yes', '2023-02-14 13:10:09', '0000-00-00');
INSERT INTO `staff_attendance_type` (`school_id`, `id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 'Late', '<b class=\"text text-warning\">L</b>', 'yes', '2023-02-14 13:10:09', '0000-00-00');
INSERT INTO `staff_attendance_type` (`school_id`, `id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (2, 3, 'Absent', '<b class=\"text text-danger\">A</b>', 'yes', '2023-02-14 13:10:09', '0000-00-00');
INSERT INTO `staff_attendance_type` (`school_id`, `id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (2, 4, 'Half Day', '<b class=\"text text-warning\">F</b>', 'yes', '2023-02-14 13:10:09', '0000-00-00');
INSERT INTO `staff_attendance_type` (`school_id`, `id`, `type`, `key_value`, `is_active`, `created_at`, `updated_at`) VALUES (2, 5, 'Holiday', 'H', 'yes', '2023-02-14 13:10:09', '0000-00-00');


#
# TABLE STRUCTURE FOR: staff_designation
#

DROP TABLE IF EXISTS `staff_designation`;

CREATE TABLE `staff_designation` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(200) NOT NULL,
  `is_active` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `staff_designation` (`school_id`, `id`, `designation`, `is_active`) VALUES (2, 1, 'Principal', 'yes');
INSERT INTO `staff_designation` (`school_id`, `id`, `designation`, `is_active`) VALUES (2, 2, 'SST', 'yes');
INSERT INTO `staff_designation` (`school_id`, `id`, `designation`, `is_active`) VALUES (2, 3, 'EST', 'yes');
INSERT INTO `staff_designation` (`school_id`, `id`, `designation`, `is_active`) VALUES (2, 4, 'PST', 'yes');
INSERT INTO `staff_designation` (`school_id`, `id`, `designation`, `is_active`) VALUES (2, 5, 'OT', 'yes');
INSERT INTO `staff_designation` (`school_id`, `id`, `designation`, `is_active`) VALUES (1, 7, 'Principal', 'yes');


#
# TABLE STRUCTURE FOR: staff_id_card
#

DROP TABLE IF EXISTS `staff_id_card`;

CREATE TABLE `staff_id_card` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `school_address` varchar(255) NOT NULL,
  `background` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `sign_image` varchar(100) NOT NULL,
  `header_color` varchar(100) NOT NULL,
  `enable_staff_role` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_id` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_department` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_designation` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_fathers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_mothers_name` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_date_of_joining` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_permanent_address` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_dob` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `enable_staff_phone` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  `status` tinyint(1) NOT NULL COMMENT '0=disable,1=enable',
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `staff_id_card` (`school_id`, `id`, `title`, `school_name`, `school_address`, `background`, `logo`, `sign_image`, `header_color`, `enable_staff_role`, `enable_staff_id`, `enable_staff_department`, `enable_designation`, `enable_name`, `enable_fathers_name`, `enable_mothers_name`, `enable_date_of_joining`, `enable_permanent_address`, `enable_staff_dob`, `enable_staff_phone`, `status`) VALUES (2, 1, 'Sample Staff ID Card', 'Sant Merry', 'Near Ukhari square', 'background1.png', 'logo1.png', 'sign1.png', '#9b1818', 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `staff_id_card` (`school_id`, `id`, `title`, `school_name`, `school_address`, `background`, `logo`, `sign_image`, `header_color`, `enable_staff_role`, `enable_staff_id`, `enable_staff_department`, `enable_designation`, `enable_name`, `enable_fathers_name`, `enable_mothers_name`, `enable_date_of_joining`, `enable_permanent_address`, `enable_staff_dob`, `enable_staff_phone`, `status`) VALUES (1, 2, 'Sample Staff ID Card', 'Sant Merry', 'Near Ukhari square', 'background1.png', 'logo1.png', 'sign1.png', '#9b1818', 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1);


#
# TABLE STRUCTURE FOR: staff_leave_details
#

DROP TABLE IF EXISTS `staff_leave_details`;

CREATE TABLE `staff_leave_details` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `alloted_leave` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_staff_leave_details_staff` (`staff_id`),
  KEY `FK_staff_leave_details_leave_types` (`leave_type_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `FK_staff_leave_details_leave_types` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_staff_leave_details_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: staff_leave_request
#

DROP TABLE IF EXISTS `staff_leave_request`;

CREATE TABLE `staff_leave_request` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `leave_days` int(11) NOT NULL,
  `employee_remark` varchar(200) NOT NULL,
  `admin_remark` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `applied_by` varchar(200) NOT NULL,
  `document_file` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_staff_leave_request_staff` (`staff_id`),
  KEY `FK_staff_leave_request_leave_types` (`leave_type_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `FK_staff_leave_request_leave_types` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`),
  CONSTRAINT `FK_staff_leave_request_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: staff_payroll
#

DROP TABLE IF EXISTS `staff_payroll`;

CREATE TABLE `staff_payroll` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basic_salary` int(11) NOT NULL,
  `pay_scale` varchar(200) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `is_active` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: staff_payslip
#

DROP TABLE IF EXISTS `staff_payslip`;

CREATE TABLE `staff_payslip` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `basic` float NOT NULL,
  `total_allowance` float NOT NULL,
  `total_deduction` float NOT NULL,
  `leave_deduction` int(11) NOT NULL,
  `tax` varchar(200) NOT NULL,
  `net_salary` float NOT NULL,
  `status` varchar(100) NOT NULL,
  `month` varchar(200) NOT NULL,
  `year` varchar(200) NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `payment_date` date NOT NULL,
  `remark` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_staff_payslip_staff` (`staff_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `FK_staff_payslip_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `staff_payslip` (`school_id`, `id`, `staff_id`, `basic`, `total_allowance`, `total_deduction`, `leave_deduction`, `tax`, `net_salary`, `status`, `month`, `year`, `payment_mode`, `payment_date`, `remark`) VALUES (2, 1, 3, '0', '25000', '1200', 0, '0', '23800', 'paid', 'January', '2023', 'cash', '2023-02-26', 'Paid');


#
# TABLE STRUCTURE FOR: staff_rating
#

DROP TABLE IF EXISTS `staff_rating`;

CREATE TABLE `staff_rating` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `rate` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 decline, 1 Approve',
  `entrydt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_staff_rating_staff` (`staff_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `FK_staff_rating_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: staff_roles
#

DROP TABLE IF EXISTS `staff_roles`;

CREATE TABLE `staff_roles` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `staff_id` (`staff_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `FK_staff_roles_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_staff_roles_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `staff_roles` (`school_id`, `id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (1, 1, 7, 1, 0, '2023-02-15 21:37:29', NULL);
INSERT INTO `staff_roles` (`school_id`, `id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 7, 3, 0, '2023-02-13 13:33:10', NULL);
INSERT INTO `staff_roles` (`school_id`, `id`, `role_id`, `staff_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 3, 2, 4, 0, '2023-02-26 16:52:46', NULL);


#
# TABLE STRUCTURE FOR: staff_timeline
#

DROP TABLE IF EXISTS `staff_timeline`;

CREATE TABLE `staff_timeline` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(300) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_staff_timeline_staff` (`staff_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `FK_staff_timeline_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: student_applyleave
#

DROP TABLE IF EXISTS `student_applyleave`;

CREATE TABLE `student_applyleave` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_session_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `apply_date` date NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `docs` text NOT NULL,
  `reason` text NOT NULL,
  `approve_by` int(11) NOT NULL,
  `request_type` int(11) NOT NULL COMMENT '0 student,1 staff',
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `student_applyleave` (`school_id`, `id`, `student_session_id`, `from_date`, `to_date`, `apply_date`, `status`, `created_at`, `docs`, `reason`, `approve_by`, `request_type`) VALUES (NULL, 2, 24, '2023-02-01', '2023-02-23', '2023-02-25', 1, '2023-02-25 11:23:31', '2.PNG', 'ok', 3, 0);
INSERT INTO `student_applyleave` (`school_id`, `id`, `student_session_id`, `from_date`, `to_date`, `apply_date`, `status`, `created_at`, `docs`, `reason`, `approve_by`, `request_type`) VALUES (NULL, 4, 22, '2023-02-26', '2023-02-26', '2023-02-26', 1, '2023-02-26 05:28:12', '', 'ggg', 3, 0);


#
# TABLE STRUCTURE FOR: student_attendences
#

DROP TABLE IF EXISTS `student_attendences`;

CREATE TABLE `student_attendences` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_session_id` int(11) DEFAULT NULL,
  `biometric_attendence` int(1) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `attendence_type_id` int(11) DEFAULT NULL,
  `remark` varchar(200) NOT NULL,
  `biometric_device_data` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `attendence_type_id` (`attendence_type_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 21, 58, 0, '2023-02-27', 4, '', NULL, 'no', '2023-02-27 16:53:42', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 22, 57, 0, '2023-02-27', 4, '', NULL, 'no', '2023-02-27 16:53:42', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 23, 49, 0, '2023-02-27', 4, '', NULL, 'no', '2023-02-27 16:53:42', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 24, 47, 0, '2023-02-27', 4, '', NULL, 'no', '2023-02-27 16:53:42', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 25, 22, 0, '2023-02-27', 4, '', NULL, 'no', '2023-02-27 16:53:42', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (1, 26, 60, 0, '2023-03-01', 4, '', NULL, 'no', '2023-03-01 10:56:00', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 27, 59, 0, '2023-03-07', 4, '', NULL, 'no', '2023-03-07 10:44:27', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 28, 58, 0, '2023-03-07', 4, '', NULL, 'no', '2023-03-07 10:44:27', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 29, 57, 0, '2023-03-07', 4, '', NULL, 'no', '2023-03-07 10:44:27', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 30, 49, 0, '2023-03-07', 4, '', NULL, 'no', '2023-03-07 10:44:27', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 31, 47, 0, '2023-03-07', 4, '', NULL, 'no', '2023-03-07 10:44:27', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 32, 22, 0, '2023-03-07', 4, '', NULL, 'no', '2023-03-07 10:44:27', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 33, 59, 0, '2023-03-18', 4, '', NULL, 'no', '2023-03-18 10:15:15', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 34, 58, 0, '2023-03-18', 4, '', NULL, 'no', '2023-03-18 10:15:15', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 35, 57, 0, '2023-03-18', 4, '', NULL, 'no', '2023-03-18 10:15:15', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 36, 49, 0, '2023-03-18', 4, '', NULL, 'no', '2023-03-18 10:15:15', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 37, 47, 0, '2023-03-18', 4, '', NULL, 'no', '2023-03-18 10:15:15', NULL);
INSERT INTO `student_attendences` (`school_id`, `id`, `student_session_id`, `biometric_attendence`, `date`, `attendence_type_id`, `remark`, `biometric_device_data`, `is_active`, `created_at`, `updated_at`) VALUES (2, 38, 22, 0, '2023-03-18', 4, '', NULL, 'no', '2023-03-18 10:15:15', NULL);


#
# TABLE STRUCTURE FOR: student_doc
#

DROP TABLE IF EXISTS `student_doc`;

CREATE TABLE `student_doc` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `doc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `student_doc` (`school_id`, `id`, `student_id`, `title`, `doc`) VALUES (NULL, 1, 5, 'ok', '1.jpg');
INSERT INTO `student_doc` (`school_id`, `id`, `student_id`, `title`, `doc`) VALUES (NULL, 2, 22, 'new', 'Screenshot_20230226-093955.jpg');
INSERT INTO `student_doc` (`school_id`, `id`, `student_id`, `title`, `doc`) VALUES (NULL, 3, 22, 'new', 'Screenshot_20230226-093955.jpg');
INSERT INTO `student_doc` (`school_id`, `id`, `student_id`, `title`, `doc`) VALUES (NULL, 4, 22, 'new', 'Screenshot_20230226-093955.jpg');


#
# TABLE STRUCTURE FOR: student_edit_fields
#

DROP TABLE IF EXISTS `student_edit_fields`;

CREATE TABLE `student_edit_fields` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `student_edit_fields` (`school_id`, `id`, `name`, `status`, `created_at`) VALUES (NULL, 1, 'firstname', 1, '2023-02-26 10:11:13');
INSERT INTO `student_edit_fields` (`school_id`, `id`, `name`, `status`, `created_at`) VALUES (NULL, 2, 'student_photo', 1, '2023-02-26 10:11:19');
INSERT INTO `student_edit_fields` (`school_id`, `id`, `name`, `status`, `created_at`) VALUES (NULL, 3, 'current_address', 1, '2023-02-26 10:11:31');


#
# TABLE STRUCTURE FOR: student_fees
#

DROP TABLE IF EXISTS `student_fees`;

CREATE TABLE `student_fees` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_session_id` int(11) DEFAULT NULL,
  `feemaster_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `amount_discount` float(10,2) NOT NULL,
  `amount_fine` float(10,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `payment_mode` varchar(50) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: student_fees_deposite
#

DROP TABLE IF EXISTS `student_fees_deposite`;

CREATE TABLE `student_fees_deposite` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_fees_master_id` int(11) DEFAULT NULL,
  `fee_groups_feetype_id` int(11) DEFAULT NULL,
  `amount_detail` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_fees_master_id` (`student_fees_master_id`),
  KEY `fee_groups_feetype_id` (`fee_groups_feetype_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `student_fees_deposite` (`school_id`, `id`, `student_fees_master_id`, `fee_groups_feetype_id`, `amount_detail`, `is_active`, `created_at`) VALUES (2, 64, 5, 7, '{\"1\":{\"amount\":\"300\",\"date\":\"2023-03-19\",\"amount_discount\":\"0\",\"amount_fine\":\"0\",\"description\":\" Collected By: Waqar Younis(546485)\",\"payment_mode\":\"Cash\",\"received_by\":\"3\",\"inv_no\":1}}', 'no', '2023-03-18 21:29:20');


#
# TABLE STRUCTURE FOR: student_fees_discounts
#

DROP TABLE IF EXISTS `student_fees_discounts`;

CREATE TABLE `student_fees_discounts` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_session_id` int(11) DEFAULT NULL,
  `fees_discount_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'assigned',
  `payment_id` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `fees_discount_id` (`fees_discount_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `student_fees_discounts` (`school_id`, `id`, `student_session_id`, `fees_discount_id`, `status`, `payment_id`, `description`, `is_active`, `created_at`) VALUES (NULL, 1, 47, 2, 'assigned', '', '', 'no', '2023-02-25 11:17:25');
INSERT INTO `student_fees_discounts` (`school_id`, `id`, `student_session_id`, `fees_discount_id`, `status`, `payment_id`, `description`, `is_active`, `created_at`) VALUES (NULL, 2, 49, 2, 'assigned', NULL, NULL, 'no', '2023-02-25 11:15:21');


#
# TABLE STRUCTURE FOR: student_fees_master
#

DROP TABLE IF EXISTS `student_fees_master`;

CREATE TABLE `student_fees_master` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_system` int(1) NOT NULL DEFAULT 0,
  `student_session_id` int(11) DEFAULT NULL,
  `fee_session_group_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT 0.00,
  `is_active` varchar(10) NOT NULL DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `fee_session_group_id` (`fee_session_group_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `student_fees_master` (`school_id`, `id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (NULL, 1, 1, 1, 2, '500.00', 'no', '2023-02-15 23:16:31');
INSERT INTO `student_fees_master` (`school_id`, `id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (NULL, 2, 0, 1, 1, '0.00', 'no', '2023-02-15 23:27:00');
INSERT INTO `student_fees_master` (`school_id`, `id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (2, 3, 0, 1, 7, '0.00', 'no', '2023-02-16 00:21:26');
INSERT INTO `student_fees_master` (`school_id`, `id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (1, 4, 0, 8, 6, '0.00', 'no', '2023-02-16 00:22:29');
INSERT INTO `student_fees_master` (`school_id`, `id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (2, 5, 0, 22, 7, '0.00', 'no', '2023-02-25 11:00:18');
INSERT INTO `student_fees_master` (`school_id`, `id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (2, 6, 0, 23, 7, '0.00', 'no', '2023-02-25 11:00:18');
INSERT INTO `student_fees_master` (`school_id`, `id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (2, 7, 0, 47, 7, '0.00', 'no', '2023-02-25 11:00:18');
INSERT INTO `student_fees_master` (`school_id`, `id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (2, 8, 0, 49, 7, '0.00', 'no', '2023-02-25 11:00:18');
INSERT INTO `student_fees_master` (`school_id`, `id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (2, 9, 0, 24, 7, '0.00', 'no', '2023-02-25 11:14:21');
INSERT INTO `student_fees_master` (`school_id`, `id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (2, 10, 0, 57, 7, '0.00', 'no', '2023-02-25 18:45:35');
INSERT INTO `student_fees_master` (`school_id`, `id`, `is_system`, `student_session_id`, `fee_session_group_id`, `amount`, `is_active`, `created_at`) VALUES (1, 11, 0, 60, 9, '0.00', 'no', '2023-03-18 21:41:14');


#
# TABLE STRUCTURE FOR: student_session
#

DROP TABLE IF EXISTS `student_session`;

CREATE TABLE `student_session` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `route_id` int(11) NOT NULL,
  `hostel_room_id` int(11) NOT NULL,
  `vehroute_id` int(10) DEFAULT NULL,
  `transport_fees` float(10,2) NOT NULL DEFAULT 0.00,
  `fees_discount` float(10,2) NOT NULL DEFAULT 0.00,
  `is_active` varchar(255) DEFAULT 'no',
  `is_alumni` int(11) NOT NULL,
  `default_login` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `student_id` (`student_id`),
  KEY `class_id` (`class_id`),
  KEY `section_id` (`section_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `student_session_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_session_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_session_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_session_ibfk_4` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `student_session` (`school_id`, `id`, `session_id`, `student_id`, `class_id`, `section_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (NULL, 22, 15, 22, 1, 1, 0, 0, NULL, '0.00', '0.00', 'no', 0, 0, '2023-02-25 07:36:21', NULL);
INSERT INTO `student_session` (`school_id`, `id`, `session_id`, `student_id`, `class_id`, `section_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (NULL, 23, 15, 23, 1, 1, 0, 0, NULL, '0.00', '0.00', 'no', 0, 0, '2023-02-25 07:41:13', NULL);
INSERT INTO `student_session` (`school_id`, `id`, `session_id`, `student_id`, `class_id`, `section_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (NULL, 24, 15, 24, 1, 2, 0, 0, NULL, '0.00', '0.00', 'no', 0, 0, '2023-02-25 07:47:04', NULL);
INSERT INTO `student_session` (`school_id`, `id`, `session_id`, `student_id`, `class_id`, `section_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (NULL, 47, 15, 47, 1, 1, 0, 0, NULL, '0.00', '0.00', 'no', 0, 0, '2023-02-25 09:48:08', NULL);
INSERT INTO `student_session` (`school_id`, `id`, `session_id`, `student_id`, `class_id`, `section_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (NULL, 49, 15, 49, 1, 1, 0, 0, NULL, '0.00', '0.00', 'no', 0, 0, '2023-02-25 10:30:40', NULL);
INSERT INTO `student_session` (`school_id`, `id`, `session_id`, `student_id`, `class_id`, `section_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (NULL, 57, 15, 57, 1, 1, 0, 0, NULL, '0.00', '0.00', 'no', 0, 0, '2023-02-25 16:38:48', NULL);
INSERT INTO `student_session` (`school_id`, `id`, `session_id`, `student_id`, `class_id`, `section_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (NULL, 58, 15, 58, 1, 1, 0, 0, NULL, '0.00', '0.00', 'no', 0, 0, '2023-02-27 16:00:55', NULL);
INSERT INTO `student_session` (`school_id`, `id`, `session_id`, `student_id`, `class_id`, `section_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (NULL, 59, 15, 59, 1, 1, 0, 0, NULL, '0.00', '0.00', 'no', 0, 0, '2023-02-27 16:58:37', NULL);
INSERT INTO `student_session` (`school_id`, `id`, `session_id`, `student_id`, `class_id`, `section_id`, `route_id`, `hostel_room_id`, `vehroute_id`, `transport_fees`, `fees_discount`, `is_active`, `is_alumni`, `default_login`, `created_at`, `updated_at`) VALUES (NULL, 60, 26, 60, 11, 5, 0, 0, NULL, '0.00', '0.00', 'no', 0, 0, '2023-03-01 10:39:23', NULL);


#
# TABLE STRUCTURE FOR: student_sibling
#

DROP TABLE IF EXISTS `student_sibling`;

CREATE TABLE `student_sibling` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `sibling_student_id` int(11) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: student_subject_attendances
#

DROP TABLE IF EXISTS `student_subject_attendances`;

CREATE TABLE `student_subject_attendances` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_session_id` int(11) DEFAULT NULL,
  `subject_timetable_id` int(11) DEFAULT NULL,
  `attendence_type_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `attendence_type_id` (`attendence_type_id`),
  KEY `student_session_id` (`student_session_id`),
  KEY `subject_timetable_id` (`subject_timetable_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `student_subject_attendances_ibfk_1` FOREIGN KEY (`attendence_type_id`) REFERENCES `attendence_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_subject_attendances_ibfk_2` FOREIGN KEY (`student_session_id`) REFERENCES `student_session` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_subject_attendances_ibfk_3` FOREIGN KEY (`subject_timetable_id`) REFERENCES `subject_timetable` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: student_timeline
#

DROP TABLE IF EXISTS `student_timeline`;

CREATE TABLE `student_timeline` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `timeline_date` date NOT NULL,
  `description` varchar(200) NOT NULL,
  `document` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `student_timeline` (`school_id`, `id`, `student_id`, `title`, `timeline_date`, `description`, `document`, `status`, `date`) VALUES (2, 1, 1, '156', '2023-01-27', '', '', 'yes', '2023-01-27');
INSERT INTO `student_timeline` (`school_id`, `id`, `student_id`, `title`, `timeline_date`, `description`, `document`, `status`, `date`) VALUES (2, 2, 1, 'kjhiol', '2023-01-27', '', '', 'yes', '2023-01-27');
INSERT INTO `student_timeline` (`school_id`, `id`, `student_id`, `title`, `timeline_date`, `description`, `document`, `status`, `date`) VALUES (2, 3, 1, 'kjhiol', '2023-01-27', '', '', 'yes', '2023-01-27');


#
# TABLE STRUCTURE FOR: students
#

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `admission_no` varchar(100) DEFAULT NULL,
  `roll_no` varchar(100) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `rte` varchar(20) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `cast` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `route_id` int(11) NOT NULL,
  `school_house_id` int(11) NOT NULL,
  `blood_group` varchar(200) NOT NULL,
  `vehroute_id` int(11) NOT NULL,
  `hostel_room_id` int(11) NOT NULL,
  `adhar_no` varchar(100) DEFAULT NULL,
  `samagra_id` varchar(100) DEFAULT NULL,
  `bank_account_no` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(100) DEFAULT NULL,
  `guardian_is` varchar(100) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_phone` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_phone` varchar(100) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_relation` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(100) DEFAULT NULL,
  `guardian_occupation` varchar(150) NOT NULL,
  `guardian_address` text DEFAULT NULL,
  `guardian_email` varchar(100) DEFAULT NULL,
  `father_pic` varchar(200) NOT NULL,
  `mother_pic` varchar(200) NOT NULL,
  `guardian_pic` varchar(200) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `previous_school` text DEFAULT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `measurement_date` date NOT NULL,
  `dis_reason` int(11) NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  `dis_note` text NOT NULL,
  `app_key` text DEFAULT NULL,
  `parent_app_key` text DEFAULT NULL,
  `disable_at` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `students` (`school_id`, `id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (2, 22, 44, 'STD20001', '1', '2023-02-25', 'MUHAMMAD YOUNIS', NULL, 'Panwar', 'No', 'uploads/student_images/22.jpg', '+923146506159', 'unis.panwar@gmail.com', NULL, NULL, NULL, '', '', '2023-02-24', 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', 'father', 'allah wasya', '+923099914748', 'o', '', '', '', 'allah wasya', 'Father', '923146506159', 'o', '', 'unis.panwar@gmail.com', '', '', '', 'yes', '', '', '', '2023-02-25', 3, '', '', NULL, NULL, '2023-02-26', '2023-03-18 10:10:52', NULL);
INSERT INTO `students` (`school_id`, `id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (2, 23, 46, 'STD20002', '2', '2023-02-25', 'MUHAMMAD NUMAN', NULL, 'Panwar', 'No', 'uploads/student_images/default_male.jpg', '+923009728916', 'unis.panwar2@gmail.com', NULL, NULL, NULL, '', '', '2023-02-24', 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', 'father', 'allah wasya', '03009728916', 'o', '', '', '', 'allah wasya', 'Father', '03009728916', 'o', '', '', '', '', '', 'no', '', '', '', '2023-02-25', 3, '', 'disabled', NULL, NULL, '2023-02-26', '2023-02-25 20:43:58', NULL);
INSERT INTO `students` (`school_id`, `id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (2, 24, 48, 'STD20003', '3', '2023-02-25', 'Qurat Ul Ain', NULL, '', 'No', 'uploads/student_images/default_female.jpg', '+923464786119', '', NULL, NULL, NULL, '', '', '2023-02-16', 'Female', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', 'father', 'ABDUL Sattar', '03464786119', 'army', '', '', '', 'ABDUL Sattar', 'Father', '03009728916', 'army', '', 'unis.panwar@gmail.com', '', '', '', 'yes', '', '', '', '2023-02-25', 0, '', '', NULL, NULL, '0000-00-00', '2023-02-25 21:02:56', NULL);
INSERT INTO `students` (`school_id`, `id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (2, 47, 94, 'STD20004', '4', '2023-02-25', 'SHAZAD', NULL, 'IQBAL', 'No', 'uploads/student_images/default_male.jpg', '+923464786119', 'finance.panwarunion@gmail.com', NULL, NULL, NULL, '', '', '2023-02-21', 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', 'father', 'IQBAL', '03464786119', '', '', '', '', 'IQBAL', 'Father', '+923464786119', '', '', 'finance.panwarunion@gmail.com', '', '', '', 'yes', '', '', '', '2023-02-25', 0, '', '', NULL, NULL, '0000-00-00', '2023-02-27 16:46:54', NULL);
INSERT INTO `students` (`school_id`, `id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (2, 49, 98, 'STD20006', '4', '2023-02-25', 'Anwar Ur Hassan', NULL, '', 'No', 'uploads/student_images/default_male.jpg', '+923099914748', '', NULL, NULL, NULL, '', '', '2023-02-02', 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', 'father', 'abc', '+923099914748', 's', '', '', '', 'abc', 'Father', '+923464786119', 's', '', '', '', '', '', 'yes', '', '', '', '2023-02-25', 0, '', '', NULL, NULL, '0000-00-00', '2023-03-17 05:16:54', NULL);
INSERT INTO `students` (`school_id`, `id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (2, 57, 114, 'STD20007', '4', '2023-02-25', 'wajid Ali', NULL, '', 'No', 'uploads/student_images/default_male.jpg', '+923443841964', 'wajidaliit11@gmail.com', NULL, NULL, NULL, '', '', '2023-02-25', 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', 'father', 'Wahid Baksh', '03009728916', '', '', '', '', 'Wahid Baksh', 'Father', '+923443841964', '', '', '', '', '', '', 'yes', '', '', '', '2023-02-25', 0, '', '', NULL, NULL, '0000-00-00', '2023-02-27 16:55:05', NULL);
INSERT INTO `students` (`school_id`, `id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (2, 58, 116, 'STD20008', '3123', '2023-02-27', 'AZAM ALI', NULL, 'Khan', 'No', 'uploads/student_images/default_male.jpg', '+923099914748', '', NULL, NULL, NULL, '', '', '2023-02-16', 'Male', '', '', '', 0, 0, '', 0, 0, '', '', '', '', '', 'father', '', '', '', '', '', '', 'Zafar', 'Father', '+923099914748', '', '', '', '', '', '', 'yes', '', '', '', '2023-02-27', 0, '', '', NULL, NULL, '0000-00-00', '2023-02-27 16:00:55', NULL);
INSERT INTO `students` (`school_id`, `id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (2, 59, 118, 'STD20009', '343', '2023-02-27', 'Jamal Ali Khan', NULL, 'Munawar Hassan', 'No', 'uploads/student_images/default_male.jpg', '+923099914748', '', NULL, NULL, NULL, '', '', '2023-02-21', 'Male', '', '', '1', 0, 0, '', 0, 0, '', '', '', '', '', 'father', 'ALI', '+923099914748', '', '', '', '', 'ALI', 'Father', '+923099914748', '', '', '', '', '', '', 'yes', '', '', '', '2023-02-27', 0, '', '', NULL, NULL, '0000-00-00', '2023-02-27 16:58:37', NULL);
INSERT INTO `students` (`school_id`, `id`, `parent_id`, `admission_no`, `roll_no`, `admission_date`, `firstname`, `middlename`, `lastname`, `rte`, `image`, `mobileno`, `email`, `state`, `city`, `pincode`, `religion`, `cast`, `dob`, `gender`, `current_address`, `permanent_address`, `category_id`, `route_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `adhar_no`, `samagra_id`, `bank_account_no`, `bank_name`, `ifsc_code`, `guardian_is`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `previous_school`, `height`, `weight`, `measurement_date`, `dis_reason`, `note`, `dis_note`, `app_key`, `parent_app_key`, `disable_at`, `created_at`, `updated_at`) VALUES (1, 60, 120, 'STD10001', '11', '2023-03-01', 'Ajmal Khan', NULL, '', NULL, 'uploads/student_images/default_male.jpg', '+923099914748', 'younis.muhammad@microrage.com', NULL, NULL, NULL, '', '', '2023-03-21', 'Male', '', '', '', 0, 0, '', 1, 0, '', '', '', '', '', 'father', 'Ali Khan', '+923099914748', '', '', '', '', 'Ali Khan', 'Father', '+923099914748', '', '', '', '', '', '', 'yes', '', '', '', '2023-03-01', 0, '', '', 'eggOnsUbv8k:APA91bHTxbsXg6-HC2WaXl83xE38thwqoPvxt4uaXNpKAunam4RolZTGVQc_YCtuD8T7MOl8q9MOxAYNqhKhAJlTZaVTRgjkemS1-2S2VEsGSM_vK_OGbkPV041c7ThaQ22e5pWcT1JW', NULL, '0000-00-00', '2023-03-12 11:09:35', NULL);


#
# TABLE STRUCTURE FOR: subject_group_class_sections
#

DROP TABLE IF EXISTS `subject_group_class_sections`;

CREATE TABLE `subject_group_class_sections` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_group_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_section_id` (`class_section_id`),
  KEY `subject_group_id` (`subject_group_id`),
  KEY `session_id` (`session_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `subject_group_class_sections_ibfk_1` FOREIGN KEY (`class_section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_group_class_sections_ibfk_2` FOREIGN KEY (`subject_group_id`) REFERENCES `subject_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_group_class_sections_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `subject_group_class_sections` (`school_id`, `id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 1, 1, 15, NULL, 0, '2023-02-14 13:11:38', NULL);
INSERT INTO `subject_group_class_sections` (`school_id`, `id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 1, 2, 15, NULL, 0, '2023-02-14 13:11:38', NULL);
INSERT INTO `subject_group_class_sections` (`school_id`, `id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 3, 2, 22, 15, NULL, 0, '2023-02-14 14:28:17', NULL);
INSERT INTO `subject_group_class_sections` (`school_id`, `id`, `subject_group_id`, `class_section_id`, `session_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 4, 3, 22, 15, NULL, 0, '2023-02-14 14:29:57', NULL);


#
# TABLE STRUCTURE FOR: subject_group_subjects
#

DROP TABLE IF EXISTS `subject_group_subjects`;

CREATE TABLE `subject_group_subjects` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_group_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `subject_group_id` (`subject_group_id`),
  KEY `session_id` (`session_id`),
  KEY `subject_id` (`subject_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `subject_group_subjects_ibfk_1` FOREIGN KEY (`subject_group_id`) REFERENCES `subject_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_group_subjects_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_group_subjects_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `subject_group_subjects` (`school_id`, `id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (2, 1, 1, 15, 1, '2023-02-14 13:11:38');
INSERT INTO `subject_group_subjects` (`school_id`, `id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (2, 2, 1, 15, 2, '2023-02-14 13:11:38');
INSERT INTO `subject_group_subjects` (`school_id`, `id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (2, 3, 1, 15, 3, '2023-02-14 13:11:38');
INSERT INTO `subject_group_subjects` (`school_id`, `id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (NULL, 4, 2, 15, 5, '2023-02-14 14:28:17');
INSERT INTO `subject_group_subjects` (`school_id`, `id`, `subject_group_id`, `session_id`, `subject_id`, `created_at`) VALUES (NULL, 5, 3, 15, 5, '2023-02-14 14:29:57');


#
# TABLE STRUCTURE FOR: subject_groups
#

DROP TABLE IF EXISTS `subject_groups`;

CREATE TABLE `subject_groups` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `subject_groups_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `subject_groups` (`school_id`, `id`, `name`, `description`, `session_id`, `created_at`) VALUES (2, 1, 'Under Middle', '', 15, '2023-02-14 13:10:09');
INSERT INTO `subject_groups` (`school_id`, `id`, `name`, `description`, `session_id`, `created_at`) VALUES (1, 2, 'Under Middle', 'ASDWSAF', 15, '2023-02-14 14:28:17');
INSERT INTO `subject_groups` (`school_id`, `id`, `name`, `description`, `session_id`, `created_at`) VALUES (1, 3, 'Under Middle2', 'ASDASFD', 15, '2023-02-14 14:29:57');


#
# TABLE STRUCTURE FOR: subject_syllabus
#

DROP TABLE IF EXISTS `subject_syllabus`;

CREATE TABLE `subject_syllabus` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_for` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_from` varchar(255) NOT NULL,
  `time_to` varchar(255) NOT NULL,
  `presentation` text NOT NULL,
  `attachment` text NOT NULL,
  `lacture_youtube_url` varchar(255) NOT NULL,
  `lacture_video` varchar(255) NOT NULL,
  `sub_topic` text NOT NULL,
  `teaching_method` text NOT NULL,
  `general_objectives` text NOT NULL,
  `previous_knowledge` text NOT NULL,
  `comprehensive_questions` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `session_id` (`session_id`),
  KEY `created_by` (`created_by`),
  KEY `created_for` (`created_for`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `subject_syllabus_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_syllabus_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_syllabus_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_syllabus_ibfk_4` FOREIGN KEY (`created_for`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `subject_syllabus` (`school_id`, `id`, `topic_id`, `session_id`, `created_by`, `created_for`, `date`, `time_from`, `time_to`, `presentation`, `attachment`, `lacture_youtube_url`, `lacture_video`, `sub_topic`, `teaching_method`, `general_objectives`, `previous_knowledge`, `comprehensive_questions`, `status`, `created_at`) VALUES (NULL, 1, 1, 15, 4, 4, '2023-02-27', '11:47 PM', '12:48 PM', '', '', '', '', 'Ap ki life  maka kaise thi', '', '', '', '', 0, '2023-02-26 19:57:37');


#
# TABLE STRUCTURE FOR: subject_timetable
#

DROP TABLE IF EXISTS `subject_timetable`;

CREATE TABLE `subject_timetable` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(20) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `subject_group_id` int(11) DEFAULT NULL,
  `subject_group_subject_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `time_from` varchar(20) DEFAULT NULL,
  `time_to` varchar(20) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `room_no` varchar(20) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  KEY `section_id` (`section_id`),
  KEY `subject_group_id` (`subject_group_id`),
  KEY `subject_group_subject_id` (`subject_group_subject_id`),
  KEY `staff_id` (`staff_id`),
  KEY `session_id` (`session_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `subject_timetable_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_timetable_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_timetable_ibfk_3` FOREIGN KEY (`subject_group_id`) REFERENCES `subject_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_timetable_ibfk_4` FOREIGN KEY (`subject_group_subject_id`) REFERENCES `subject_group_subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_timetable_ibfk_5` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_timetable_ibfk_6` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `subject_timetable` (`school_id`, `id`, `day`, `class_id`, `section_id`, `subject_group_id`, `subject_group_subject_id`, `staff_id`, `time_from`, `time_to`, `start_time`, `end_time`, `room_no`, `session_id`, `created_at`) VALUES (2, 1, 'Monday', 1, 1, 1, 1, 4, '11:47 PM', '12:48 PM', '23:47:00', '12:48:00', '321', 15, '2023-02-26 19:48:11');


#
# TABLE STRUCTURE FOR: subjects
#

DROP TABLE IF EXISTS `subjects`;

CREATE TABLE `subjects` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `subjects` (`school_id`, `id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 'English', 'ENG', 'theory', 'no', '2023-02-14 13:11:38', NULL);
INSERT INTO `subjects` (`school_id`, `id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 'URDU', 'UR', 'theory', 'no', '2023-02-14 13:11:38', NULL);
INSERT INTO `subjects` (`school_id`, `id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (2, 3, 'MATH', 'MTH', 'theory', 'no', '2023-02-14 13:11:38', NULL);
INSERT INTO `subjects` (`school_id`, `id`, `name`, `code`, `type`, `is_active`, `created_at`, `updated_at`) VALUES (1, 5, 'URDU', 'URDU', 'theory', 'no', '2023-02-14 14:19:36', NULL);


#
# TABLE STRUCTURE FOR: submit_assignment
#

DROP TABLE IF EXISTS `submit_assignment`;

CREATE TABLE `submit_assignment` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `homework_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `docs` varchar(225) NOT NULL,
  `file_name` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: teacher_subjects
#

DROP TABLE IF EXISTS `teacher_subjects`;

CREATE TABLE `teacher_subjects` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_section_id` (`class_section_id`),
  KEY `session_id` (`session_id`),
  KEY `subject_id` (`subject_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: template_admitcards
#

DROP TABLE IF EXISTS `template_admitcards`;

CREATE TABLE `template_admitcards` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template` varchar(250) DEFAULT NULL,
  `heading` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `left_logo` varchar(200) DEFAULT NULL,
  `right_logo` varchar(200) DEFAULT NULL,
  `exam_name` varchar(200) DEFAULT NULL,
  `school_name` varchar(200) DEFAULT NULL,
  `exam_center` varchar(200) DEFAULT NULL,
  `sign` varchar(200) DEFAULT NULL,
  `background_img` varchar(200) DEFAULT NULL,
  `is_name` int(1) NOT NULL DEFAULT 1,
  `is_father_name` int(1) NOT NULL DEFAULT 1,
  `is_mother_name` int(1) NOT NULL DEFAULT 1,
  `is_dob` int(1) NOT NULL DEFAULT 1,
  `is_admission_no` int(1) NOT NULL DEFAULT 1,
  `is_roll_no` int(1) NOT NULL DEFAULT 1,
  `is_address` int(1) NOT NULL DEFAULT 1,
  `is_gender` int(1) NOT NULL DEFAULT 1,
  `is_photo` int(11) NOT NULL,
  `is_class` int(11) NOT NULL DEFAULT 0,
  `is_section` int(11) NOT NULL DEFAULT 0,
  `content_footer` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `template_admitcards` (`school_id`, `id`, `template`, `heading`, `title`, `left_logo`, `right_logo`, `exam_name`, `school_name`, `exam_center`, `sign`, `background_img`, `is_name`, `is_father_name`, `is_mother_name`, `is_dob`, `is_admission_no`, `is_roll_no`, `is_address`, `is_gender`, `is_photo`, `is_class`, `is_section`, `content_footer`, `created_at`, `updated_at`) VALUES (2, 1, 'Sample Roll  Number Slip', 'The Country School Shah Jamal', 'Department of Examination ', '7059f87484a7c9c7224128ecfcbca204.png', '0ce37d54a4394a072d15ebefaacbc221.png', 'Final Year Exam', 'The Country School Shah Jamal', 'Exam Building - Iqbal Campus', '925096fa455b3c993c6b3f3ab7b4c321.jpg', '719d34f7c528a31e6cc79c30958da22c.jfif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'This is computer generated Roll Number Slip, error are correction accepted', '2023-02-26 08:12:44', NULL);
INSERT INTO `template_admitcards` (`school_id`, `id`, `template`, `heading`, `title`, `left_logo`, `right_logo`, `exam_name`, `school_name`, `exam_center`, `sign`, `background_img`, `is_name`, `is_father_name`, `is_mother_name`, `is_dob`, `is_admission_no`, `is_roll_no`, `is_address`, `is_gender`, `is_photo`, `is_class`, `is_section`, `content_footer`, `created_at`, `updated_at`) VALUES (1, 2, 'Roll  Number Slip 2', 'The Country School Shah Jamal', 'Department of Examination ', '7059f87484a7c9c7224128ecfcbca204.png', '0ce37d54a4394a072d15ebefaacbc221.png', 'Final Year Exam', 'The Country School Shah Jamal', 'Exam Building - Iqbal Campus', '925096fa455b3c993c6b3f3ab7b4c321.jpg', '719d34f7c528a31e6cc79c30958da22c.jfif', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'This is computer generated Roll Number Slip, error are correction accepted', '2023-02-26 08:15:30', NULL);


#
# TABLE STRUCTURE FOR: template_marksheets
#

DROP TABLE IF EXISTS `template_marksheets`;

CREATE TABLE `template_marksheets` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template` varchar(200) DEFAULT NULL,
  `heading` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `left_logo` varchar(200) DEFAULT NULL,
  `right_logo` varchar(200) DEFAULT NULL,
  `exam_name` varchar(200) DEFAULT NULL,
  `school_name` varchar(200) DEFAULT NULL,
  `exam_center` varchar(200) DEFAULT NULL,
  `left_sign` varchar(200) DEFAULT NULL,
  `middle_sign` varchar(200) DEFAULT NULL,
  `right_sign` varchar(200) DEFAULT NULL,
  `exam_session` int(1) DEFAULT 1,
  `is_name` int(1) DEFAULT 1,
  `is_father_name` int(1) DEFAULT 1,
  `is_mother_name` int(1) DEFAULT 1,
  `is_dob` int(1) DEFAULT 1,
  `is_admission_no` int(1) DEFAULT 1,
  `is_roll_no` int(1) DEFAULT 1,
  `is_photo` int(11) DEFAULT 1,
  `is_division` int(1) NOT NULL DEFAULT 1,
  `is_customfield` int(1) NOT NULL,
  `background_img` varchar(200) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `is_class` int(11) NOT NULL DEFAULT 0,
  `is_section` int(11) NOT NULL DEFAULT 0,
  `content` text DEFAULT NULL,
  `content_footer` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `template_marksheets` (`school_id`, `id`, `template`, `heading`, `title`, `left_logo`, `right_logo`, `exam_name`, `school_name`, `exam_center`, `left_sign`, `middle_sign`, `right_sign`, `exam_session`, `is_name`, `is_father_name`, `is_mother_name`, `is_dob`, `is_admission_no`, `is_roll_no`, `is_photo`, `is_division`, `is_customfield`, `background_img`, `date`, `is_class`, `is_section`, `content`, `content_footer`, `created_at`, `updated_at`) VALUES (2, 1, 'Result Card', 'The Country School Shah Jamal', 'Department of Certificates & Awards', '6b36162aca994b2ffe4168f7ad5fe53d.png', '18da67364cfe9c241fa6aabe16882466.png', 'Internal Examination Department ', 'The Country School Shah Jamal', 'Habib Campus. Exam Hall Room 1-6 ', '3dd835abf6bf3fedf9f226dfad759174.png', '6bd8233a5fe59a90738827476860fbc2.png', 'f43e527f60246dbdd1d3a4f018e46c42.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '6b0a4525fbec18eebcb7f7cf6c8b4c96.jpeg', '02/26/2023', 1, 1, '', 'This result is information only. This is computer generated  result , errors and omissions are accepted ,  ', '2023-02-26 08:36:02', NULL);


#
# TABLE STRUCTURE FOR: timetables
#

DROP TABLE IF EXISTS `timetables`;

CREATE TABLE `timetables` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_subject_id` int(20) DEFAULT NULL,
  `day_name` varchar(50) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `end_time` varchar(50) DEFAULT NULL,
  `room_no` varchar(50) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

#
# TABLE STRUCTURE FOR: topic
#

DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `complete_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `lesson_id` (`lesson_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `topic_ibfk_2` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `topic` (`school_id`, `id`, `session_id`, `lesson_id`, `name`, `status`, `complete_date`, `created_at`) VALUES (NULL, 1, 15, 1, 'Hazoor Akram ki life mubarak', 1, '2023-02-23', '2023-02-26 19:54:23');


#
# TABLE STRUCTURE FOR: transport_route
#

DROP TABLE IF EXISTS `transport_route`;

CREATE TABLE `transport_route` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_title` varchar(100) DEFAULT NULL,
  `no_of_vehicle` int(11) DEFAULT NULL,
  `fare` float(10,2) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` varchar(255) DEFAULT 'no',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `transport_route` (`school_id`, `id`, `route_title`, `no_of_vehicle`, `fare`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 'Khan Garh to Shah Jamal', NULL, '1200.00', NULL, 'no', '2023-03-18 08:36:34', NULL);
INSERT INTO `transport_route` (`school_id`, `id`, `route_title`, `no_of_vehicle`, `fare`, `note`, `is_active`, `created_at`, `updated_at`) VALUES (1, 3, 'Multan to Peshawar', NULL, '3000.00', NULL, 'no', '2023-03-18 08:37:28', NULL);


#
# TABLE STRUCTURE FOR: userlog
#

DROP TABLE IF EXISTS `userlog`;

CREATE TABLE `userlog` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `class_section_id` int(11) DEFAULT NULL,
  `ipaddress` varchar(100) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  `login_datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 1, 'unis.panwar@gmail.com', '', NULL, '203.96.171.91', 'Chrome 109.0.0.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 2, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.91', 'Chrome 109.0.0.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 3, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.91', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 4, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.91', 'Chrome 109.0.0.0, Android', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 5, 'unis.panwar@gmail.com', 'Super Admin', NULL, '182.185.142.30', 'Chrome 109.0.0.0, Android', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 6, 'unis.panwar@gmail.com', 'Super Admin', NULL, '119.160.56.46', 'Chrome 83.0.4103.106, Android', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 7, 'unis.panwar@gmail.com', 'Super Admin', NULL, '119.160.56.46', 'Chrome 83.0.4103.106, Android', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 8, 'unis.panwar@gmail.com', 'Super Admin', NULL, '182.185.142.30', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 9, 'unis.panwar@gmail.com', 'Super Admin', NULL, '119.160.56.46', 'Chrome 109.0.0.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 10, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.73', 'Chrome 109.0.0.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 11, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.22', 'Chrome 109.0.0.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 12, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.22', 'Chrome 109.0.0.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 13, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.22', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 14, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.41', 'Chrome 109.0.0.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 15, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.41', 'Chrome 109.0.0.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 16, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.143', 'Chrome 109.0.0.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 17, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.231', 'Chrome 109.0.0.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 18, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.45', 'Chrome 109.0.0.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 19, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.45', 'Chrome 109.0.0.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 20, 'unis.panwar@gmail.com', 'Super Admin', NULL, '182.185.201.43', 'Chrome 109.0.0.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 21, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.0', 'Chrome 109.0.0.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 22, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.76', 'Chrome 110.0.0.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 23, 'unis.panwar@gmail.com', 'Super Admin', NULL, '162.210.194.37', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 24, 'unis.panwar@gmail.com', 'Super Admin', NULL, '162.210.194.37', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 25, 'unis.panwar2@gmail.com', '', NULL, '162.210.194.37', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 26, 'unis.panwar@gmail.com', 'Super Admin', NULL, '162.210.194.37', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 27, 'unis.panwar@gmail.com', 'Super Admin', NULL, '162.210.194.37', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 28, 'unis.panwar2@gmail.com', '', NULL, '162.210.194.37', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 29, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '162.210.194.37', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 30, 'unis.panwar@gmail.com', 'Super Admin', NULL, '162.210.194.37', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 31, 'unis.panwar@gmail.com', 'Super Admin', NULL, '162.210.194.37', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 32, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '162.210.194.37', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 33, 'unis.panwar@gmail.com', 'Super Admin', NULL, '207.244.71.79', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 34, 'unis.panwar@gmail.com', 'Super Admin', NULL, '207.244.71.79', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 35, 'unis.panwar@gmail.com', 'Super Admin', NULL, '207.244.71.79', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 36, 'unis.panwar@gmail.com', 'Super Admin', NULL, '207.244.71.79', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 37, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '207.244.71.79', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 38, 'unis.panwar@gmail.com', 'Super Admin', NULL, '207.244.71.79', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 39, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '207.244.71.79', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 40, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '207.244.71.79', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 41, 'unis.panwar@gmail.com', 'Super Admin', NULL, '207.244.71.79', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 42, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '207.244.71.79', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 43, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '207.244.71.79', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 44, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '207.244.71.79', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 45, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '207.244.71.79', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 46, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '207.244.71.82', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 47, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '207.244.71.82', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 48, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '207.244.71.82', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 49, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '207.244.71.82', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (2, 50, 'unis.panwar@gmail.com', 'Super Admin', NULL, '207.244.71.82', 'Firefox 109.0, Windows 10', '2023-02-14 13:11:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 51, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '182.185.185.162', 'Chrome 109.0.0.0, Windows 10', '2023-02-14 19:32:35');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 52, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.145', 'Firefox 109.0, Windows 10', '2023-02-14 23:45:49');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 53, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '203.96.171.145', 'Firefox 109.0, Windows 10', '2023-02-14 23:47:35');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 54, 'unis.panwar@gmail.com', 'Super Admin', NULL, '203.96.171.145', 'Firefox 109.0, Windows 10', '2023-02-14 23:47:48');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 55, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '203.96.171.145', 'Firefox 109.0, Windows 10', '2023-02-14 23:48:23');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 56, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '203.96.171.145', 'Firefox 109.0, Windows 10', '2023-02-14 23:48:48');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 57, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '203.96.171.109', 'Firefox 109.0, Windows 10', '2023-02-16 02:27:55');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 58, 'unis.panwar1@gmail.com', 'Super Admin', NULL, '203.96.171.109', 'Chrome 110.0.0.0, Windows 10', '2023-02-16 02:37:37');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 59, 'unis.panwar1@gmail.com', 'Super Admin', NULL, '203.96.171.109', 'Chrome 110.0.0.0, Windows 10', '2023-02-16 03:12:08');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 60, 'parent5', 'parent', NULL, '203.96.171.109', 'Chrome 110.0.0.0, Windows 10', '2023-02-16 03:29:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 61, 'unis.panwar1@gmail.com', 'Super Admin', NULL, '203.96.171.109', 'Chrome 110.0.0.0, Windows 10', '2023-02-16 03:31:34');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 62, 'parent24', 'parent', NULL, '119.160.67.238', 'Chrome 92.0.4515.131, Windows 10', '2023-02-25 16:19:52');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 63, 'unis.panwar1@gmail.com', 'Super Admin', NULL, '119.160.67.238', 'Chrome 92.0.4515.131, Windows 10', '2023-02-25 16:36:49');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 64, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '39.43.247.57', 'Chrome 110.0.0.0, Android', '2023-02-25 20:33:14');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 65, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '111.119.178.178', 'Chrome 110.0.0.0, Windows 10', '2023-02-25 20:59:22');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 66, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '119.160.67.193', 'Chrome 110.0.0.0, Windows 10', '2023-02-26 06:52:15');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 67, 'unis.panwar1@gmail.com', 'Super Admin', NULL, '119.160.67.164', 'Chrome 92.0.4515.131, Windows 10', '2023-02-26 13:55:28');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 68, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '119.160.64.223', 'Chrome 110.0.0.0, Windows 10', '2023-02-26 14:59:42');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 69, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '119.160.67.41', 'Chrome 110.0.0.0, Windows 10', '2023-02-26 19:15:04');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 70, 'unis.panwar1@gmail.com', 'Super Admin', NULL, '119.160.67.41', 'Chrome 92.0.4515.131, Windows 10', '2023-02-26 21:29:39');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 71, 'younis.muhammad@microrage.com', 'Teacher', NULL, '119.160.67.41', 'Chrome 92.0.4515.131, Windows 10', '2023-02-26 21:56:19');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 72, 'younis.muhammad@microrage.com', 'Teacher', NULL, '119.160.67.41', 'Chrome 92.0.4515.131, Windows 10', '2023-02-26 22:00:15');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 73, 'unis.panwar1@gmail.com', 'Super Admin', NULL, '119.160.67.41', 'Chrome 92.0.4515.131, Windows 10', '2023-02-26 22:07:46');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 74, 'younis.muhammad@microrage.com', 'Teacher', NULL, '119.160.67.41', 'Chrome 92.0.4515.131, Windows 10', '2023-02-26 22:12:23');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 75, 'unis.panwar1@gmail.com', 'Super Admin', NULL, '119.160.64.228', 'Chrome 92.0.4515.131, Windows 10', '2023-02-27 00:37:23');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 76, 'younis.muhammad@microrage.com', 'Teacher', NULL, '119.160.64.228', 'Chrome 92.0.4515.131, Windows 10', '2023-02-27 00:56:00');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 77, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '119.160.64.230', 'Chrome 110.0.0.0, Windows 10', '2023-02-27 16:10:37');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 78, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '119.160.67.140', 'Chrome 110.0.0.0, Windows 10', '2023-03-01 11:11:16');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 79, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '39.33.146.244', 'Chrome 110.0.0.0, Windows 10', '2023-03-01 15:28:25');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 80, 'unis.panwar1@gmail.com', 'Super Admin', NULL, '39.33.146.244', 'Chrome 110.0.0.0, Windows 10', '2023-03-01 15:32:10');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 81, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '119.160.64.39', 'Chrome 110.0.0.0, Windows 10', '2023-03-01 15:50:39');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 82, 'unis.panwar1@gmail.com', 'Super Admin', NULL, '119.160.67.19', 'Chrome 110.0.0.0, Windows 10', '2023-03-01 18:37:36');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 83, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '119.160.67.19', 'Chrome 110.0.0.0, Windows 10', '2023-03-01 19:25:15');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 84, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '111.119.187.16', 'Chrome 110.0.0.0, Android', '2023-03-05 13:38:38');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 85, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '111.119.187.16', 'Chrome 110.0.0.0, Android', '2023-03-05 13:42:39');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 86, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '103.255.4.24', 'Firefox 110.0, Windows 10', '2023-03-05 13:43:32');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 87, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '111.119.187.57', 'Firefox 110.0, Windows 10', '2023-03-07 14:25:58');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 88, 'unis.panwar1@gmail.com', 'Super Admin', NULL, '111.119.187.57', 'Chrome 110.0.0.0, Windows 10', '2023-03-07 14:26:41');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 89, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '203.96.171.136', 'Chrome 110.0.0.0, Android', '2023-03-08 23:26:37');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 90, 'unis.panwar1@gmail.com', 'Super Admin', NULL, '182.178.224.99', 'Chrome 110.0.0.0, Windows 10', '2023-03-12 15:08:42');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 91, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '198.16.66.196', 'Firefox 110.0, Windows 10', '2023-03-12 16:05:07');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 92, 'unis.panwar1@gmail.com', 'Super Admin', NULL, '198.16.66.196', 'Firefox 110.0, Windows 10', '2023-03-12 18:27:12');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 93, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '203.96.171.61', 'Chrome 110.0.0.0, Windows 10', '2023-03-12 18:49:30');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 94, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '111.119.187.47', 'Chrome 111.0.0.0, Windows 10', '2023-03-17 09:50:57');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 95, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '111.119.187.43', 'Chrome 111.0.0.0, Windows 10', '2023-03-18 09:46:09');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 96, 'unis.panwar1@gmail.com', 'Super Admin', NULL, '111.119.187.43', 'Firefox 111.0, Windows 10', '2023-03-18 10:00:31');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 97, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '111.119.187.58', 'Chrome 111.0.0.0, Windows 10', '2023-03-18 13:23:36');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 98, 'unis.panwar1@gmail.com', 'Super Admin', NULL, '111.119.187.58', 'Firefox 111.0, Windows 10', '2023-03-18 13:27:49');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 99, 'unis.panwar2@gmail.com', 'Super Admin', NULL, '103.255.5.55', 'Chrome 111.0.0.0, Windows 10', '2023-03-19 02:04:55');
INSERT INTO `userlog` (`school_id`, `id`, `user`, `role`, `class_section_id`, `ipaddress`, `user_agent`, `login_datetime`) VALUES (NULL, 100, 'unis.panwar1@gmail.com', 'Super Admin', NULL, '103.255.5.55', 'Firefox 111.0, Windows 10', '2023-03-19 02:05:39');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `childs` text NOT NULL,
  `role` varchar(30) NOT NULL,
  `verification_code` varchar(200) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `is_active` varchar(255) DEFAULT 'yes',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 1, 1, 'std1', 's8pl7y', '', 'student', 'cEJqQ29xaExxa1dLNDhrTkJIOEdoeHc5YWJCTmdYbUxJS201NXUrdndjST0=', 0, 'yes', '2023-02-14 13:10:09', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 2, 0, 'parent1', 'f81n35', '1', 'parent', '', 0, 'yes', '2023-02-14 13:10:09', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 3, 2, 'std2', 'podz63', '', 'student', '', 0, 'yes', '2023-02-14 13:10:09', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (2, 4, 0, 'parent2', 'hik293', '2', 'parent', '', 0, 'yes', '2023-02-14 13:10:09', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 5, 3, 'std3', '42arje', '', 'student', '', 0, 'yes', '2023-02-15 22:15:17', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 6, 0, 'parent3', 'h46xz5', '3', 'parent', '', 0, 'yes', '2023-02-15 22:15:17', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 7, 4, 'std4', 'xontu2', '', 'student', '', 0, 'yes', '2023-02-15 22:19:48', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 8, 0, 'parent4', 'kl9oh2', '4', 'parent', '', 0, 'yes', '2023-02-15 22:19:48', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 9, 5, 'std5', 'sns0rm', '', 'student', '', 4, 'yes', '2023-02-15 22:31:20', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 10, 0, 'parent5', '11vwvr', '5', 'parent', '', 0, 'yes', '2023-02-15 22:21:53', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 11, 6, 'std6', 'rq520v', '', 'student', '', 0, 'yes', '2023-02-15 22:35:17', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 12, 0, 'parent6', 'knbxsm', '6', 'parent', '', 0, 'yes', '2023-02-15 22:35:17', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 13, 7, 'std7', 'hbvkuw', '', 'student', '', 0, 'yes', '2023-02-15 22:37:44', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 14, 0, 'parent7', '8l9o8s', '7', 'parent', '', 0, 'yes', '2023-02-15 22:37:44', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 15, 8, 'std8', 'brrc1v', '', 'student', '', 0, 'yes', '2023-02-15 22:50:24', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 16, 0, 'parent8', '96dwge', '8', 'parent', '', 0, 'yes', '2023-02-15 22:50:24', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 17, 9, 'std9', 'o1s5tr', '', 'student', '', 0, 'yes', '2023-02-16 01:13:46', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 18, 0, 'parent9', '9h0e47', '9', 'parent', '', 0, 'yes', '2023-02-16 01:13:46', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 19, 10, 'std10', '9zin72', '', 'student', '', 0, 'yes', '2023-02-16 01:18:11', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 20, 0, 'parent10', 'awy2ek', '10', 'parent', '', 0, 'yes', '2023-02-16 01:18:11', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 21, 11, 'std11', 'u7flgh', '', 'student', '', 0, 'yes', '2023-02-16 01:18:42', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 22, 0, 'parent11', 'xv7hy5', '11', 'parent', '', 0, 'yes', '2023-02-16 01:18:42', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 23, 12, 'std12', '6yvipq', '', 'student', '', 0, 'yes', '2023-02-16 01:19:13', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 24, 0, 'parent12', '7rbzx9', '12', 'parent', '', 0, 'yes', '2023-02-16 01:19:13', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 25, 13, 'std13', 'pjy1g4', '', 'student', '', 0, 'yes', '2023-02-16 01:20:46', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 26, 0, 'parent13', '5x08h3', '13', 'parent', '', 0, 'yes', '2023-02-16 01:20:46', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 27, 14, 'std14', '5hv1p9', '', 'student', '', 0, 'yes', '2023-02-16 01:21:47', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 28, 0, 'parent14', 's9mfl8', '14', 'parent', '', 0, 'yes', '2023-02-16 01:21:47', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 29, 15, 'std15', 'rcru3j', '', 'student', '', 0, 'yes', '2023-02-16 01:24:34', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 30, 0, 'parent15', 'jbytlx', '15', 'parent', '', 0, 'yes', '2023-02-16 01:24:34', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 31, 16, 'std16', 'hudiqj', '', 'student', '', 0, 'yes', '2023-02-16 01:25:04', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 32, 0, 'parent16', 'aw9sf1', '16', 'parent', '', 0, 'yes', '2023-02-16 01:25:04', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 33, 17, 'std17', 'us5lgi', '', 'student', '', 0, 'yes', '2023-02-16 01:25:22', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 34, 0, 'parent17', 'isn0e0', '17', 'parent', '', 0, 'yes', '2023-02-16 01:25:22', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 35, 18, 'std18', 'k3f9we', '', 'student', '', 0, 'yes', '2023-02-16 01:27:49', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 36, 0, 'parent18', 'zhhmz6', '18', 'parent', '', 0, 'yes', '2023-02-16 01:27:49', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 37, 19, 'std19', '5ylhjn', '', 'student', '', 0, 'yes', '2023-02-16 01:31:53', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 38, 0, 'parent19', '3ui3h8', '19', 'parent', '', 0, 'yes', '2023-02-16 01:31:53', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 39, 20, 'std20', '8nkl9z', '', 'student', '', 0, 'yes', '2023-02-16 01:33:43', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 40, 0, 'parent20', 'u8kj11', '20', 'parent', '', 0, 'yes', '2023-02-16 01:33:43', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 41, 21, 'std21', '1hazhv', '', 'student', '', 0, 'yes', '2023-02-16 01:38:31', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 42, 0, 'parent21', '89qmws', '21', 'parent', '', 0, 'yes', '2023-02-16 01:38:31', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 43, 22, 'std22', 'Younis786@', '', 'student', '', 0, 'yes', '2023-02-26 09:55:43', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 44, 0, 'parent22', '3qe0cm', '22', 'parent', '', 0, 'yes', '2023-02-25 07:36:21', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 45, 23, 'std23', 'xpbnzm', '', 'student', '', 0, 'yes', '2023-02-25 07:41:13', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 46, 0, 'parent23', '9j8azd', '23', 'parent', '', 0, 'yes', '2023-02-25 07:41:13', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 47, 24, 'std24', '74ajwq', '', 'student', '', 0, 'yes', '2023-02-25 07:47:04', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 48, 0, 'parent24', '1acgr4', '24', 'parent', '', 0, 'yes', '2023-02-25 07:47:04', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 49, 25, 'std25', '1f2dhb', '', 'student', '', 0, 'yes', '2023-02-25 07:48:36', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 50, 0, 'parent25', 'qs648y', '25', 'parent', '', 0, 'yes', '2023-02-25 07:48:36', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 51, 26, 'std26', 'gyxuvn', '', 'student', '', 0, 'yes', '2023-02-25 07:49:27', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 52, 0, 'parent26', 't81nzr', '26', 'parent', '', 0, 'yes', '2023-02-25 07:49:27', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 53, 27, 'std27', 'jw518w', '', 'student', '', 0, 'yes', '2023-02-25 07:50:23', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 54, 0, 'parent27', 'fzwoj5', '27', 'parent', '', 0, 'yes', '2023-02-25 07:50:23', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 55, 28, 'std28', 'pv2mfu', '', 'student', '', 0, 'yes', '2023-02-25 07:51:16', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 56, 0, 'parent28', 'f97b2f', '28', 'parent', '', 0, 'yes', '2023-02-25 07:51:16', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 57, 29, 'std29', 'y4n511', '', 'student', '', 0, 'yes', '2023-02-25 07:51:29', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 58, 0, 'parent29', '2veue6', '29', 'parent', '', 0, 'yes', '2023-02-25 07:51:29', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 59, 30, 'std30', '3269wj', '', 'student', '', 0, 'yes', '2023-02-25 07:52:18', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 60, 0, 'parent30', 'jnkzl5', '30', 'parent', '', 0, 'yes', '2023-02-25 07:52:18', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 61, 31, 'std31', 'p2pm1w', '', 'student', '', 0, 'yes', '2023-02-25 07:53:44', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 62, 0, 'parent31', 'kombe9', '31', 'parent', '', 0, 'yes', '2023-02-25 07:53:44', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 63, 32, 'std32', 'y0visd', '', 'student', '', 0, 'yes', '2023-02-25 07:54:13', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 64, 0, 'parent32', 'hqla5i', '32', 'parent', '', 0, 'yes', '2023-02-25 07:54:13', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 65, 33, 'std33', 'ixjdd2', '', 'student', '', 0, 'yes', '2023-02-25 07:55:21', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 66, 0, 'parent33', 'xpbqa6', '33', 'parent', '', 0, 'yes', '2023-02-25 07:55:21', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 67, 34, 'std34', 'immkg3', '', 'student', '', 0, 'yes', '2023-02-25 07:55:50', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 68, 0, 'parent34', '9rxshh', '34', 'parent', '', 0, 'yes', '2023-02-25 07:55:50', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 69, 35, 'std35', 'h6sy6v', '', 'student', '', 0, 'yes', '2023-02-25 07:57:12', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 70, 0, 'parent35', 's3fmr5', '35', 'parent', '', 0, 'yes', '2023-02-25 07:57:12', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 71, 36, 'std36', 'xhf34q', '', 'student', '', 0, 'yes', '2023-02-25 07:58:07', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 72, 0, 'parent36', '1pblqw', '36', 'parent', '', 0, 'yes', '2023-02-25 07:58:07', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 73, 37, 'std37', 'fdts9n', '', 'student', '', 0, 'yes', '2023-02-25 07:59:23', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 74, 0, 'parent37', 'wtgf4u', '37', 'parent', '', 0, 'yes', '2023-02-25 07:59:23', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 75, 38, 'std38', 'gyf6iq', '', 'student', '', 0, 'yes', '2023-02-25 08:01:48', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 76, 0, 'parent38', 'n9k4c1', '38', 'parent', '', 0, 'yes', '2023-02-25 08:01:48', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 77, 39, 'std39', 'yzihvd', '', 'student', '', 0, 'yes', '2023-02-25 08:38:53', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 78, 0, 'parent39', 'lyj82x', '39', 'parent', '', 0, 'yes', '2023-02-25 08:38:53', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 79, 40, 'std40', 'vi4qho', '', 'student', '', 0, 'yes', '2023-02-25 08:40:03', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 80, 0, 'parent40', 'jf4gb2', '40', 'parent', '', 0, 'yes', '2023-02-25 08:40:03', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 81, 41, 'std41', 'skgn46', '', 'student', '', 0, 'yes', '2023-02-25 08:42:05', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 82, 0, 'parent41', 'pi03t0', '41', 'parent', '', 0, 'yes', '2023-02-25 08:42:05', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 83, 42, 'std42', 'kcma4j', '', 'student', '', 0, 'yes', '2023-02-25 08:45:14', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 84, 0, 'parent42', 'b2fx50', '42', 'parent', '', 0, 'yes', '2023-02-25 08:45:14', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 85, 43, 'std43', '1z1rqa', '', 'student', '', 0, 'yes', '2023-02-25 08:46:00', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 86, 0, 'parent43', 'esg99e', '43', 'parent', '', 0, 'yes', '2023-02-25 08:46:00', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 87, 44, 'std44', 'vq65kz', '', 'student', '', 0, 'yes', '2023-02-25 08:47:07', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 88, 0, 'parent44', '3ccbtb', '44', 'parent', '', 0, 'yes', '2023-02-25 08:47:07', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 89, 45, 'std45', 'um7emp', '', 'student', '', 0, 'yes', '2023-02-25 08:48:30', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 90, 0, 'parent45', '32vf1b', '45', 'parent', '', 0, 'yes', '2023-02-25 08:48:30', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 91, 46, 'std46', 'jrda22', '', 'student', '', 0, 'yes', '2023-02-25 08:49:21', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 92, 0, 'parent46', 'ceigqf', '46', 'parent', '', 0, 'yes', '2023-02-25 08:49:21', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 93, 47, 'std47', 'jbowiq', '', 'student', '', 0, 'yes', '2023-02-25 09:48:08', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 94, 0, 'parent47', 'q9ef41', '47', 'parent', '', 0, 'yes', '2023-02-25 09:48:08', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 95, 48, 'std48', 'rfnpbg', '', 'student', '', 0, 'yes', '2023-02-25 09:54:30', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 96, 0, 'parent48', '7goo7u', '48', 'parent', '', 0, 'yes', '2023-02-25 09:54:30', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 97, 49, 'std49', 'upgvah', '', 'student', '', 0, 'yes', '2023-02-25 10:30:40', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 98, 0, 'parent49', 'wvhzoa', '49', 'parent', '', 0, 'yes', '2023-02-25 10:30:40', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 99, 50, 'std50', 'zfs18i', '', 'student', '', 0, 'yes', '2023-02-25 10:33:20', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 100, 0, 'parent50', 'bp35wr', '50', 'parent', '', 0, 'yes', '2023-02-25 10:33:20', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 101, 51, 'std51', 'abijkw', '', 'student', '', 0, 'yes', '2023-02-25 10:39:17', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 102, 0, 'parent51', 'hn1127', '51', 'parent', '', 0, 'yes', '2023-02-25 10:39:17', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 103, 52, 'std52', 'xs4ooj', '', 'student', '', 0, 'yes', '2023-02-25 10:39:59', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 104, 0, 'parent52', 'w2jxd9', '52', 'parent', '', 0, 'yes', '2023-02-25 10:39:59', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 105, 53, 'std53', 'o5k3fa', '', 'student', '', 0, 'yes', '2023-02-25 10:40:44', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 106, 0, 'parent53', '3fbafe', '53', 'parent', '', 0, 'yes', '2023-02-25 10:40:44', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 107, 54, 'std54', 'dhug4r', '', 'student', '', 0, 'yes', '2023-02-25 10:41:04', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 108, 0, 'parent54', '9otm28', '54', 'parent', '', 0, 'yes', '2023-02-25 10:41:04', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 109, 55, 'std55', '7whjxt', '', 'student', '', 0, 'yes', '2023-02-25 10:41:47', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 110, 0, 'parent55', '7my7jx', '55', 'parent', '', 0, 'yes', '2023-02-25 10:41:47', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 111, 56, 'std56', '8icbzd', '', 'student', '', 0, 'yes', '2023-02-25 10:42:12', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 112, 0, 'parent56', '9k2q0o', '56', 'parent', '', 0, 'yes', '2023-02-25 10:42:12', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 113, 57, 'std57', 'alu37j', '', 'student', '', 0, 'yes', '2023-02-25 16:38:48', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 114, 0, 'parent57', 'aakzwl', '57', 'parent', '', 0, 'yes', '2023-02-25 16:38:48', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 115, 58, 'std58', 'u9ug9g', '', 'student', '', 0, 'yes', '2023-02-27 16:00:55', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 116, 0, 'parent58', 'mriq71', '58', 'parent', '', 0, 'yes', '2023-02-27 16:00:55', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 117, 59, 'std59', 'cqdbnr', '', 'student', '', 0, 'yes', '2023-02-27 16:58:37', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 118, 0, 'parent59', 'rklgcf', '59', 'parent', '', 0, 'yes', '2023-02-27 16:58:37', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 119, 60, 'std60', 'umoiu4', '', 'student', '', 0, 'yes', '2023-03-01 10:39:23', NULL);
INSERT INTO `users` (`school_id`, `id`, `user_id`, `username`, `password`, `childs`, `role`, `verification_code`, `lang_id`, `is_active`, `created_at`, `updated_at`) VALUES (NULL, 120, 0, 'parent60', 'tl2tt8', '60', 'parent', '', 0, 'yes', '2023-03-01 10:39:23', NULL);


#
# TABLE STRUCTURE FOR: users_authentication
#

DROP TABLE IF EXISTS `users_authentication`;

CREATE TABLE `users_authentication` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expired_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `users_authentication` (`school_id`, `id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES (NULL, 1, 43, 'MwNgNwNANA', '2024-02-26 03:24:46', NULL, NULL);
INSERT INTO `users_authentication` (`school_id`, `id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES (NULL, 2, 43, 'MwNwOQMTANw', '2024-02-26 03:25:07', NULL, NULL);
INSERT INTO `users_authentication` (`school_id`, `id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES (NULL, 3, 43, 'NwNQNANgMw', '2024-02-26 03:27:39', NULL, NULL);
INSERT INTO `users_authentication` (`school_id`, `id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES (NULL, 4, 43, 'OAOQNgMgOA', '2024-02-26 03:30:21', NULL, NULL);
INSERT INTO `users_authentication` (`school_id`, `id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES (NULL, 5, 43, 'NwOQOANwMg', '2024-02-26 03:32:10', NULL, NULL);
INSERT INTO `users_authentication` (`school_id`, `id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES (NULL, 6, 43, 'MTAOQOANgMg', '2024-02-26 03:36:38', NULL, NULL);
INSERT INTO `users_authentication` (`school_id`, `id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES (NULL, 11, 43, 'NwMQNANANw', '2024-02-26 04:14:29', NULL, '2023-02-26');
INSERT INTO `users_authentication` (`school_id`, `id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES (NULL, 13, 43, 'MTAMTANAOQ', '2024-02-26 04:20:50', NULL, '2023-02-26');
INSERT INTO `users_authentication` (`school_id`, `id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES (NULL, 16, 43, 'NwNAOAMQNg', '2024-02-26 04:25:11', NULL, '2023-02-26');
INSERT INTO `users_authentication` (`school_id`, `id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES (NULL, 17, 43, 'OQMwMTAOANg', '2024-02-26 04:57:02', NULL, '2023-02-26');
INSERT INTO `users_authentication` (`school_id`, `id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES (NULL, 22, 43, 'MwMQNQOANQ', '2024-02-26 05:18:01', NULL, '2023-02-26');
INSERT INTO `users_authentication` (`school_id`, `id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES (NULL, 24, 43, 'MwNwMwOQMQ', '2024-02-26 05:21:06', NULL, '2023-02-26');
INSERT INTO `users_authentication` (`school_id`, `id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES (NULL, 25, 43, 'NwNgMTAMwNA', '2024-02-26 05:21:38', NULL, '2023-02-26');
INSERT INTO `users_authentication` (`school_id`, `id`, `users_id`, `token`, `expired_at`, `created_at`, `updated_at`) VALUES (NULL, 32, 119, 'MgMQNANQMw', '2024-03-17 21:51:41', NULL, '2023-03-18');


#
# TABLE STRUCTURE FOR: vehicle_routes
#

DROP TABLE IF EXISTS `vehicle_routes`;

CREATE TABLE `vehicle_routes` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `vehicle_routes` (`school_id`, `id`, `route_id`, `vehicle_id`, `created_at`) VALUES (2, 4, 2, 2, '2023-03-18 08:55:33');


#
# TABLE STRUCTURE FOR: vehicles
#

DROP TABLE IF EXISTS `vehicles`;

CREATE TABLE `vehicles` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_no` varchar(20) DEFAULT NULL,
  `vehicle_model` varchar(100) NOT NULL DEFAULT 'None',
  `manufacture_year` varchar(4) DEFAULT NULL,
  `driver_name` varchar(50) DEFAULT NULL,
  `driver_licence` varchar(50) NOT NULL DEFAULT 'None',
  `driver_contact` varchar(20) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `vehicles` (`school_id`, `id`, `vehicle_no`, `vehicle_model`, `manufacture_year`, `driver_name`, `driver_licence`, `driver_contact`, `note`, `created_at`) VALUES (2, 2, 'LEP-4218', '2018', '2018', 'USAMA TAHIR', 'OKAY', '03099914748', 'OKAY', '2023-03-18 08:40:37');


#
# TABLE STRUCTURE FOR: visitors_book
#

DROP TABLE IF EXISTS `visitors_book`;

CREATE TABLE `visitors_book` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(100) DEFAULT NULL,
  `purpose` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(12) NOT NULL,
  `id_proof` varchar(50) NOT NULL,
  `no_of_pepple` int(11) NOT NULL,
  `date` date NOT NULL,
  `in_time` varchar(20) NOT NULL,
  `out_time` varchar(20) NOT NULL,
  `note` text NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `visitors_book` (`school_id`, `id`, `source`, `purpose`, `name`, `email`, `contact`, `id_proof`, `no_of_pepple`, `date`, `in_time`, `out_time`, `note`, `image`) VALUES (2, 1, NULL, 'Interview for Jobs', 'unis', NULL, '03099914748', '3230499191087', 0, '2023-02-25', '09:15 AM', '09:15 AM', 'dsfs', 'id1.PNG');


#
# TABLE STRUCTURE FOR: visitors_purpose
#

DROP TABLE IF EXISTS `visitors_purpose`;

CREATE TABLE `visitors_purpose` (
  `school_id` int(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitors_purpose` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `visitors_purpose` (`school_id`, `id`, `visitors_purpose`, `description`) VALUES (2, 1, 'Interview for Jobs', 'For job visit\r\n');
INSERT INTO `visitors_purpose` (`school_id`, `id`, `visitors_purpose`, `description`) VALUES (1, 2, 'Job Seeker', 'Job seeker');


