import bcrypt
import pymysql

# Database connection parameters
host = 'localhost'  # Replace with your MySQL host
user = 'root'  # Replace with your MySQL user
password = 'Shagun@#123'  # Replace with your MySQL password
database = 'shagun'

super_email = input("Enter email for super admin : ")
super_password = input("Enter password for super admin : ")

password_hash = bcrypt.hashpw(super_password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
print(password_hash)
# SQL statements for table creation
table_queries = [
    """
    CREATE TABLE `bank_details` (
 `id` int(11)  AUTO_INCREMENT,
 `uid` varchar(255) ,
 `bank_name` varchar(255) ,
 `bank_logo` varchar(255) ,
 `ifsc_code` varchar(255) ,
 `account_holder_name` varchar(255) ,
 `account_number` varchar(255) ,
 `status` tinyint(1) ,
 `created_on` timestamp  DEFAULT current_timestamp(),
 `added_by` varchar(255) ,
 `modified_on` datetime ,
 `modified_by` varchar(255) ,
 PRIMARY KEY (`id`),
 UNIQUE KEY `uc_bank_name_account_number` (`bank_name`,`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `bank_list` (
 `id` int(11)  AUTO_INCREMENT,
 `bank_name` varchar(255) ,
 `bank_logo` varchar(255) ,
 `status` tinyint(1) ,
 `created_on` timestamp  DEFAULT current_timestamp(),
 `created_by` varchar(255) DEFAULT NULL,
 `updated_by` varchar(255) DEFAULT NULL,
 `updated_on` datetime DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `delivery_vendors` (
 `id` int(11)  AUTO_INCREMENT,
 `delivery_vendor_name` varchar(255) ,
 `city` int(255) ,
 `address` varchar(255) ,
 `lat_lng` varchar(255) ,
 `status` tinyint(1)  DEFAULT 1,
 `gst_no` varchar(255) ,
 `delivery_vendor_owner` varchar(255) ,
 `contact_number` varchar(255) ,
 `created_by` varchar(255) ,
 `created_on` timestamp  DEFAULT current_timestamp(),
 `updated_by` varchar(255) ,
 `updated_on` datetime ,
 PRIMARY KEY (`id`),
 UNIQUE KEY `unique_phone` (`contact_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    """ 
    CREATE TABLE `django_session` (
 `session_key` varchar(40) ,
 `session_data` longtext ,
 `expire_date` datetime(6) ,
 PRIMARY KEY (`session_key`),
 KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    """ 
    CREATE TABLE `event` (
 `id` int(11)  AUTO_INCREMENT,
 `created_by_uid` varchar(255) ,
 `event_type_id` int(11) ,
 `city_id` int(11) ,
 `address_line1` varchar(255) ,
 `address_line2` varchar(255) ,
 `event_lat_lng` varchar(255) ,
 `created_on` datetime ,
 `sub_events` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  CHECK (json_valid(`sub_events`)),
 `event_date` datetime ,
 `event_note` varchar(255) ,
 `event_admin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin  CHECK (json_valid(`event_admin`)),
 `is_approved` tinyint(1)  DEFAULT 0,
 `approved_by` varchar(255) ,
 `printer_id` int(11) ,
 `approved_date_time` datetime ,
 `status` tinyint(1)  DEFAULT 0,
 `delivery_fee` double ,
 `delivery_address` varchar(255) ,
 `updated_by` varchar(255) DEFAULT NULL,
 `updated_on` datetime DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `events_type` (
 `id` int(11)  AUTO_INCREMENT,
 `event_type_name` varchar(255) ,
 `status` tinyint(1) DEFAULT 1,
 `created_by` varchar(255) ,
 `created_on` datetime DEFAULT NULL,
 `updated_by` varchar(255) DEFAULT NULL,
 `updated_on` datetime DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `event_admin_invite` (
 `id` int(11) ,
 `invited_by` varchar(255) ,
 `invited_to` varchar(255) ,
 `event_id` int(11) ,
 `status` tinyint(1)  DEFAULT 0,
 `created_at` int(11) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `event_guest_invite` (
 `id` int(11)  AUTO_INCREMENT,
 `invited_by` varchar(255) ,
 `invited_to` varchar(255) ,
 `event_id` int(11) ,
 `status` tinyint(1)  DEFAULT 0,
 `created_at` timestamp  DEFAULT current_timestamp(),
 `invite_message` varchar(500) ,
 PRIMARY KEY (`id`),
 UNIQUE KEY `unique_invite` (`invited_by`,`invited_to`,`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `greeting_cards` (
 `id` int(11)  AUTO_INCREMENT,
 `card_name` varchar(255) ,
 `card_image_url` varchar(255) ,
 `card_price` double ,
 `printer_id` int(11) ,
 `created_on` timestamp  DEFAULT current_timestamp(),
 `status` tinyint(1)  DEFAULT 1,
 `created_by` varchar(255) DEFAULT NULL,
 `updated_by` varchar(255) DEFAULT NULL,
 `updated_on` datetime DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `locations` (
 `id` int(11)  AUTO_INCREMENT,
 `city_name` varchar(255) ,
 `status` tinyint(1) DEFAULT 1,
 `created_by` varchar(255) ,
 `created_on` datetime DEFAULT NULL,
 `updated_by` varchar(255) DEFAULT NULL,
 `updated_on` datetime DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `notification` (
 `id` int(11)  AUTO_INCREMENT,
 `uid` varchar(255) ,
 `type` varchar(255) ,
 `title` text ,
 `message` text ,
 `created_on` timestamp  DEFAULT current_timestamp(),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `order_status` (
 `id` int(11)  AUTO_INCREMENT,
 `transaction_id` int(11) ,
 `status` int(11) ,
 `created_on` timestamp  DEFAULT current_timestamp(),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `printer` (
 `id` int(11)  AUTO_INCREMENT,
 `store_name` varchar(255) ,
 `city` int(11) ,
 `address` varchar(255) ,
 `email` varchar(255) ,
 `status` tinyint(1) DEFAULT 1,
 `gst_no` varchar(255) ,
 `store_owner` varchar(255) ,
 `contact_number` varchar(255) ,
 `printer_user_name` varchar(255) ,
 `printer_password` varchar(255) ,
 `created_by` varchar(255) DEFAULT NULL,
 `created_on` datetime DEFAULT NULL,
 `updated_by` varchar(255) DEFAULT NULL,
 `updated_on` datetime DEFAULT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `uk_printer_user_name` (`printer_user_name`),
 UNIQUE KEY `unique_email` (`email`),
 UNIQUE KEY `unique_contact_number` (`contact_number`),
 UNIQUE KEY `unique_printer_user_name` (`printer_user_name`),
 KEY `idx_printer_user_name` (`printer_user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    """
    CREATE TABLE `print_jobs` (
 `id` int(11)  AUTO_INCREMENT,
 `transaction_id` varchar(255) ,
 `printer_id` varchar(255) ,
 `card_id` varchar(255) ,
 `status` tinyint(1) ,
 `created_on` timestamp  DEFAULT current_timestamp(),
 `last_modified` datetime ,
 `billing_amount` double ,
 `event_id` int(11) ,
 `wish` longtext ,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    """
    CREATE TABLE `settlements` (
 `id` int(11)  AUTO_INCREMENT,
 `transaction_id` int(11) ,
 `event_id` int(11) ,
 `receiver_bank_id` int(11) ,
 `created_on` timestamp  DEFAULT current_timestamp(),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    """
    CREATE TABLE `transaction_history` (
 `id` int(11)  AUTO_INCREMENT,
 `sender_uid` varchar(255) ,
 `receiver_uid` varchar(255) ,
 `transaction_amount` double ,
 `shagun_amount` double ,
 `greeting_card_id` int(11) ,
 `transaction_fee` double ,
 `delivery_fee` double ,
 `transaction_id` varchar(255) ,
 `payment_status` varchar(255) ,
 `event_id` int(11) ,
 `status` tinyint(1) ,
 `is_settled` tinyint(1) DEFAULT 0,
 `reciever_bank_id` varchar(255) ,
 `created_on` timestamp  DEFAULT current_timestamp(),
 `gifter_name` varchar(255) ,
 `greeting_card_price` double ,
 `settled_by` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    """
    CREATE TABLE `users` (
 `id` int(11)  AUTO_INCREMENT,
 `uid` varchar(255) ,
 `name` varchar(255) ,
 `email` varchar(255) ,
 `phone` varchar(255) ,
 `auth_type` varchar(255) ,
 `kyc` tinyint(1)  DEFAULT 0,
 `profile_pic` varchar(255)  DEFAULT 'http://cdn.onlinewebfonts.com/svg/img_504768.png',
 `created_on` timestamp  DEFAULT current_timestamp(),
 `status` tinyint(1) DEFAULT 1,
 `role` tinyint(1) ,
 `fcm_token` varchar(255) ,
 `city` varchar(255) ,
 `password` varchar(255) DEFAULT NULL,
 `created_by` varchar(255) ,
 `updated_by` varchar(255) ,
 `updated_on` datetime ,
 PRIMARY KEY (`id`),
 UNIQUE KEY `unique_uid` (`uid`),
 UNIQUE KEY `unique_phone` (`phone`),
 UNIQUE KEY `unique_email` (`email`),
 KEY `idx_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    """
    CREATE TABLE `user_callback_request` (
 `id` int(11)  AUTO_INCREMENT,
 `uid` varchar(255) ,
 `type` varchar(255) ,
 `status` tinyint(1)  DEFAULT 0,
 `completed_by` varchar(255) ,
 `created_on` timestamp  DEFAULT current_timestamp(),
 `event_date` date DEFAULT NULL,
 `event_type` varchar(255) DEFAULT NULL,
 `city` int(11) ,
 `selected_reason` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    """
    CREATE TABLE `user_kyc` (
 `id` int(11)  AUTO_INCREMENT,
 `uid` varchar(255) ,
 `full_name` varchar(255) ,
 `dob` varchar(255) ,
 `gender` varchar(255) ,
 `address_line1` varchar(255) ,
 `address_line2` varchar(255) ,
 `city` varchar(255) ,
 `state` varchar(255) ,
 `postcode` varchar(255) ,
 `country` varchar(255) ,
 `identification_proof1` varchar(255) ,
 `identification_proof2` varchar(255) ,
 `identification_number1` varchar(255) ,
 `identification_number2` varchar(255) ,
 `identification_doc1` varchar(255) ,
 `identification_doc2` varchar(255) ,
 `verification_status` tinyint(1) ,
 `created_on` timestamp  DEFAULT current_timestamp(),
 `created_by` varchar(255) ,
 `updated_by` varchar(255) ,
 `updated_on` datetime ,
 `approved_by` varchar(255) ,
 `approved_on` datetime ,
 PRIMARY KEY (`id`),
 UNIQUE KEY `idx_uid` (`uid`),
 UNIQUE KEY `Identification Number1` (`identification_number1`),
 UNIQUE KEY `Identification Number2` (`identification_number2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `version_details` (
 `id` int(11)  AUTO_INCREMENT,
 `app_name` varchar(255) ,
 `min_version` varchar(255) ,
 `latest_version` varchar(255) ,
 `platform` varchar(255) ,
 `created` timestamp  DEFAULT current_timestamp(),
 `updated` datetime ,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    f"""
    INSERT INTO `users` (`uid`, `name`, `email`, `phone`, `auth_type`, `kyc`, `profile_pic`, `created_on`, 
    `status`, `role`, `fcm_token`, `city`, `password`) VALUES ('{super_email}', 'Shagun Admin', 
    '{super_email}', '1234567890', '', '0', 'images/profile_pic/profile.png', '2023-09-15 14:21:59', '1', '1', '', 
    'Bangalore', '{password_hash}');
    """
]

try:
    # Connect to the database
    connection = pymysql.connect(
        host=host,
        user=user,
        password=password,
        database=database,
    )

    # Create a cursor object
    cursor = connection.cursor()

    # Execute the table creation queries
    for query in table_queries:
        cursor.execute(query)
        connection.commit()

except pymysql.Error as e:
    print(f"Error: {e}")
