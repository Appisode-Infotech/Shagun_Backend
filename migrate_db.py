import bcrypt
import pymysql

# Database connection parameters
host = 'localhost'  # Replace with your MySQL host
user = 'root'  # Replace with your MySQL user
password = ''  # Replace with your MySQL password
database = 'shagun'

password_hash = bcrypt.hashpw('admin@#123'.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
print(password_hash)

# Create a database connection
conn = pymysql.connect(host=host, user=user, password=password, database=database)

# Create a cursor object
cursor = conn.cursor()

# SQL statements to create tables
create_table_queries = [
    """
CREATE TABLE `bank_details` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `uid` varchar(255) NOT NULL DEFAULT '',
 `bank_name` varchar(255) NOT NULL DEFAULT '',
 `bank_logo` varchar(255) DEFAULT NULL,
 `ifsc_code` varchar(255) NOT NULL DEFAULT '',
 `account_holder_name` varchar(255) NOT NULL DEFAULT '',
 `account_number` varchar(255) NOT NULL DEFAULT '',
 `status` tinyint(1) NOT NULL DEFAULT 0,
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 `added_by` varchar(255) NOT NULL DEFAULT '',
 `modified_on` datetime NOT NULL DEFAULT current_timestamp(),
 `modified_by` varchar(255) NOT NULL DEFAULT '',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """

CREATE TABLE `bank_list` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `bank_name` varchar(255) NOT NULL DEFAULT '',
 `bank_logo` varchar(255) NOT NULL DEFAULT '',
 `status` tinyint(1) NOT NULL DEFAULT 0,
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """
    CREATE TABLE `delivery_vendors` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `delivery_vendor_name` varchar(255) NOT NULL DEFAULT '',
 `city` int(255) NOT NULL DEFAULT 0,
 `address` varchar(255) NOT NULL DEFAULT '',
 `lat_lng` varchar(255) NOT NULL DEFAULT '',
 `status` tinyint(1) NOT NULL DEFAULT 1,
 `gst_no` varchar(255) NOT NULL DEFAULT '',
 `delivery_vendor_owner` varchar(255) NOT NULL DEFAULT '',
 `contact_number` varchar(255) NOT NULL DEFAULT '',
 `created_by` varchar(255) NOT NULL DEFAULT '',
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """
    CREATE TABLE `django_session` (
 `session_key` varchar(40) NOT NULL DEFAULT '',
 `session_data` longtext NOT NULL,
 `expire_date` datetime(6) NOT NULL,
 PRIMARY KEY (`session_key`),
 KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """
    CREATE TABLE `event` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `created_by_uid` varchar(255) NOT NULL DEFAULT '',
 `event_type_id` int(11) NOT NULL DEFAULT 0,
 `city_id` int(11) NOT NULL DEFAULT 0,
 `address_line1` varchar(255) NOT NULL DEFAULT '',
 `address_line2` varchar(255) NOT NULL DEFAULT '',
 `event_lat_lng` varchar(255) NOT NULL DEFAULT '',
 `created_on` datetime NOT NULL DEFAULT current_timestamp(),
 `sub_events` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`sub_events`)),
 `event_date` datetime NOT NULL,
 `event_note` varchar(255) NOT NULL DEFAULT '',
 `event_admin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`event_admin`)),
 `is_approved` tinyint(1) NOT NULL DEFAULT 0,
 `approved_by` int(11) NOT NULL DEFAULT 0,
 `printer_id` int(11) NOT NULL DEFAULT 0,
 `approved_date_time` datetime NULL DEFAULT NULL,
 `status` tinyint(1) NOT NULL DEFAULT 0,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """
    CREATE TABLE `events_type` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `event_type_name` varchar(255) NOT NULL DEFAULT '',
 `status` tinyint(1) DEFAULT 1,
 `created_by` varchar(255) NOT NULL DEFAULT '',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
""",
    """
    CREATE TABLE `event_admin_invite` (
 `id` int(11) NOT NULL,
 `invited_by` varchar(255) NOT NULL DEFAULT '',
 `invited_to` varchar(255) NOT NULL DEFAULT '',
 `event_id` int(11) NOT NULL DEFAULT 0,
 `status` tinyint(1) NOT NULL DEFAULT 0,
 `created_at` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
""",
    """CREATE TABLE `event_guest_invite` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `invited_by` varchar(255) NOT NULL DEFAULT '',
 `invited_to` varchar(255) NOT NULL DEFAULT '',
 `event_id` int(11) NOT NULL DEFAULT 0,
 `status` tinyint(1) NOT NULL DEFAULT 0,
 `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
""",
    """CREATE TABLE `greeting_cards` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `card_name` varchar(255) NOT NULL DEFAULT '',
 `card_image_url` varchar(255) NOT NULL DEFAULT '',
 `card_price` double NOT NULL DEFAULT 0,
 `printer_id` int(11) NOT NULL DEFAULT 0,
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 `status` tinyint(1) NOT NULL DEFAULT 1,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
""",
    """
    CREATE TABLE `locations` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `city_name` varchar(255) NOT NULL DEFAULT '',
 `status` tinyint(1) DEFAULT 1,
 `created_by` varchar(255) NOT NULL DEFAULT '',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """ 
CREATE TABLE `printer` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `store_name` varchar(255) NOT NULL DEFAULT '',
 `city` int(11) NOT NULL DEFAULT 0,
 `address` varchar(255) NOT NULL DEFAULT '',
 `lat_lng` varchar(255) NOT NULL DEFAULT '',
 `status` tinyint(1) DEFAULT 1,
 `gst_no` varchar(255) NOT NULL DEFAULT '',
 `store_owner` varchar(255) NOT NULL DEFAULT '',
 `contact_number` varchar(255) NOT NULL DEFAULT '',
 `printer_user_name` varchar(255) NOT NULL DEFAULT '',
 `printer_password` varchar(255) NOT NULL DEFAULT '',
 PRIMARY KEY (`id`),
 UNIQUE KEY `uk_printer_user_name` (`printer_user_name`),
 KEY `idx_printer_user_name` (`printer_user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
""",
    """CREATE TABLE `print_jobs` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `transaction_id` varchar(255) NOT NULL DEFAULT '',
 `printer_id` varchar(255) NOT NULL DEFAULT '',
 `card_id` varchar(255) NOT NULL DEFAULT '',
 `status` tinyint(1) NOT NULL DEFAULT 0,
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 `last_modified` datetime NOT NULL DEFAULT current_timestamp(),
 `billing_amount` double NOT NULL DEFAULT 0,
 `event_id` int(11) NOT NULL DEFAULT 0,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
""",
    """
    CREATE TABLE `settlements` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `transaction_id` int(11) NOT NULL DEFAULT 0,
 `event_id` int(11) NOT NULL DEFAULT 0,
 `receiver_bank_id` int(11) NOT NULL DEFAULT 0,
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
""",
    """CREATE TABLE `transaction_history` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `sender_uid` varchar(255) NOT NULL DEFAULT '',
 `receiver_uid` varchar(255) NOT NULL DEFAULT '',
 `transaction_amount` double NOT NULL DEFAULT 0,
 `shagun_amount` double NOT NULL DEFAULT 0,
 `greeting_card_id` int(11) NOT NULL DEFAULT 0,
 `transaction_fee` double NOT NULL DEFAULT 0,
 `delivery_fee` double NOT NULL DEFAULT 0,
 `transaction_id` varchar(255) NOT NULL DEFAULT '',
 `payment_status` tinyint(1) NOT NULL DEFAULT 0,
 `event_id` int(11) NOT NULL DEFAULT 0,
 `status` tinyint(1) NOT NULL DEFAULT 0,
 `is_settled` tinyint(1) DEFAULT 0,
 `reciever_bank_id` varchar(255) NOT NULL DEFAULT '',
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
""",
    """
    CREATE TABLE `users` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `uid` varchar(255) NOT NULL DEFAULT '',
 `name` varchar(255) NOT NULL DEFAULT '',
 `email` varchar(255) NOT NULL DEFAULT '',
 `phone` varchar(255) NOT NULL DEFAULT '',
 `auth_type` varchar(255) NOT NULL DEFAULT '',
 `kyc` tinyint(1) NOT NULL DEFAULT 0,
 `profile_pic` varchar(255) NOT NULL DEFAULT 'http://cdn.onlinewebfonts.com/svg/img_504768.png',
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 `status` tinyint(1) DEFAULT 1,
 `role` tinyint(1) NOT NULL DEFAULT 0,
 `fcm_token` varchar(255) NOT NULL DEFAULT '',
 `city` varchar(255) NOT NULL DEFAULT '',
 `password` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `unique_uid` (`uid`),
 UNIQUE KEY `unique_phone` (`phone`),
 KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
""",
    """
    CREATE TABLE `user_callback_request` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `uid` varchar(255) NOT NULL DEFAULT '',
 `type` varchar(255) NOT NULL DEFAULT '',
 `status` tinyint(1) NOT NULL DEFAULT 0,
 `completed_by` varchar(255) DEFAULT NULL,
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 `event_date` date DEFAULT NULL,
 `event_type` varchar(255) DEFAULT NULL,
 `city` int(11) DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;""",
    """
    
CREATE TABLE `user_kyc` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `uid` varchar(255) NOT NULL DEFAULT '',
 `full_name` varchar(255) NOT NULL DEFAULT '',
 `dob` varchar(255) NOT NULL DEFAULT '',
 `gender` varchar(255) NOT NULL DEFAULT '',
 `address_line1` varchar(255) NOT NULL DEFAULT '',
 `address_line2` varchar(255) NOT NULL DEFAULT '',
 `city` varchar(255) NOT NULL DEFAULT '',
 `state` varchar(255) NOT NULL DEFAULT '',
 `postcode` varchar(255) NOT NULL DEFAULT '',
 `country` varchar(255) NOT NULL DEFAULT '',
 `identification_proof1` varchar(255) NOT NULL DEFAULT '',
 `identification_proof2` varchar(255) NOT NULL DEFAULT '',
 `identification_number1` varchar(255) NOT NULL DEFAULT '',
 `identification_number2` varchar(255) NOT NULL DEFAULT '',
 `identification_doc1` varchar(255) NOT NULL DEFAULT '',
 `identification_doc2` varchar(255) NOT NULL DEFAULT '',
 `verification_status` tinyint(1) NOT NULL DEFAULT 0,
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 `created_by` varchar(255) NOT NULL DEFAULT '',
 `updated_by` varchar(255) NOT NULL DEFAULT '',
 `updated_on` datetime NULL DEFAULT NULL,
 `approved_by` varchar(255) DEFAULT NULL,
 `approved_on` datetime NULL DEFAULT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """
    CREATE TABLE `version_details` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `app_name` varchar(255) NOT NULL DEFAULT '',
 `min_version` varchar(255) NOT NULL DEFAULT '',
 `latest_version` varchar(255) NOT NULL DEFAULT '',
 `platform` varchar(255) NOT NULL DEFAULT '',
 `created` timestamp NOT NULL DEFAULT current_timestamp(),
 `updated` datetime NULL DEFAULT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """
    CREATE TABLE `notification` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `uid` varchar(255) NOT NULL DEFAULT '',
 `type` varchar(255) NOT NULL DEFAULT '',
 `title` text NOT NULL,
 `message` text NOT NULL,
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """CREATE TABLE `order_status` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `transaction_id` int(11) NOT NULL DEFAULT 0,
 `status` int(11) NOT NULL DEFAULT 0,
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
""",
    f"""
    INSERT INTO `users` (`id`, `uid`, `name`, `email`, `phone`, `auth_type`, `kyc`, `profile_pic`, `created_on`, 
    `status`, `role`, `fcm_token`, `city`, `password`) VALUES (NULL, 'admin@shagun.com', 'Shagun Admin', 
    'admin@shagun.com', '1234567890', '', '0', 'images/profile_pic/profile.png', '2023-09-15 14:21:59', '1', '1', '', 
    'Bangalore', '{password_hash}');
    """
]

# Execute the SQL queries to create tables
for query in create_table_queries:
    cursor.execute(query)

# Commit changes and close the cursor and connection
conn.commit()
cursor.close()
conn.close()
print("Tables created successfully")
