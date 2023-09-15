import pymysql

# Database connection parameters
host = 'your_host'  # Replace with your MySQL host
user = 'your_user'  # Replace with your MySQL user
password = 'your_password'  # Replace with your MySQL password
database = 'shagun_db'

# SQL statements for table creation
table_queries = [
    """
    CREATE TABLE IF NOT EXISTS auth_group (
        id INT(11) NOT NULL AUTO_INCREMENT,
        name VARCHAR(150) NOT NULL,
        PRIMARY KEY (id),
        UNIQUE KEY name (name)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """
    CREATE TABLE IF NOT EXISTS auth_group_permissions (
        id BIGINT(20) NOT NULL AUTO_INCREMENT,
        group_id INT(11) NOT NULL,
        permission_id INT(11) NOT NULL,
        PRIMARY KEY (id),
        UNIQUE KEY auth_group_permissions_group_id_permission_id_0cd325b0_uniq (group_id, permission_id),
        KEY auth_group_permissio_permission_id_84c5c92e_fk_auth_perm (permission_id),
        CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission (id),
        CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group (id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """
    CREATE TABLE IF NOT EXISTS auth_permission (
        id INT(11) NOT NULL AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        content_type_id INT(11) NOT NULL,
        codename VARCHAR(100) NOT NULL,
        PRIMARY KEY (id),
        UNIQUE KEY auth_permission_content_type_id_codename_01ab375a_uniq (content_type_id, codename),
        CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type (id)
    ) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """
    CREATE TABLE IF NOT EXISTS auth_user (
        id INT(11) NOT NULL AUTO_INCREMENT,
        password VARCHAR(128) NOT NULL,
        last_login DATETIME(6) DEFAULT NULL,
        is_superuser TINYINT(1) NOT NULL,
        username VARCHAR(150) NOT NULL,
        first_name VARCHAR(150) NOT NULL,
        last_name VARCHAR(150) NOT NULL,
        email VARCHAR(254) NOT NULL,
        is_staff TINYINT(1) NOT NULL,
        is_active TINYINT(1) NOT NULL,
        date_joined DATETIME(6) NOT NULL,
        PRIMARY KEY (id),
        UNIQUE KEY username (username)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """
    CREATE TABLE IF NOT EXISTS auth_user_groups (
        id BIGINT(20) NOT NULL AUTO_INCREMENT,
        user_id INT(11) NOT NULL,
        group_id INT(11) NOT NULL,
        PRIMARY KEY (id),
        UNIQUE KEY auth_user_groups_user_id_group_id_94350c0c_uniq (user_id, group_id),
        KEY auth_user_groups_group_id_97559544_fk_auth_group_id (group_id),
        CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group (id),
        CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user (id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """
    CREATE TABLE IF NOT EXISTS auth_user_user_permissions (
        id BIGINT(20) NOT NULL AUTO_INCREMENT,
        user_id INT(11) NOT NULL,
        permission_id INT(11) NOT NULL,
        PRIMARY KEY (id),
        UNIQUE KEY auth_user_user_permissions_user_id_permission_id_14a6b632_uniq (user_id, permission_id),
        KEY auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm (permission_id),
        CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission (id),
        CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user (id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """
    CREATE TABLE IF NOT EXISTS bank_details (
        id INT(11) NOT NULL AUTO_INCREMENT,
        uid VARCHAR(255) NOT NULL,
        bank_name VARCHAR(255) NOT NULL,
        bank_logo VARCHAR(255) NOT NULL,
        ifsc_code VARCHAR(255) NOT NULL,
        account_holder_name VARCHAR(255) NOT NULL,
        account_number VARCHAR(255) NOT NULL,
        status TINYINT(1) NOT NULL,
        created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
        added_by VARCHAR(255) NOT NULL,
        modified_on DATETIME NOT NULL,
        modified_by VARCHAR(255) NOT NULL,
        PRIMARY KEY (id)
    ) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """
    CREATE TABLE IF NOT EXISTS bank_list (
        id INT(11) NOT NULL AUTO_INCREMENT,
        bank_name VARCHAR(255) NOT NULL,
        bank_logo VARCHAR(255) NOT NULL,
        status TINYINT(1) NOT NULL,
        created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
        PRIMARY KEY (id)
    ) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """
    CREATE TABLE IF NOT EXISTS delivery_vendors (
        id INT(11) NOT NULL AUTO_INCREMENT,
        delivery_vendor_name VARCHAR(255) NOT NULL,
        city INT(255) NOT NULL,
        address VARCHAR(255) NOT NULL,
        lat_lng VARCHAR(255) NOT NULL,
        status TINYINT(1) NOT NULL DEFAULT 1,
        gst_no VARCHAR(255) NOT NULL,
        delivery_vendor_owner VARCHAR(255) NOT NULL,
        contact_number VARCHAR(255) NOT NULL,
        created_by VARCHAR(255) NOT NULL,
        created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
        PRIMARY KEY (id)
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """
    CREATE TABLE IF NOT EXISTS django_admin_log (
        id INT(11) NOT NULL AUTO_INCREMENT,
        action_time DATETIME(6) NOT NULL,
        object_id LONGTEXT DEFAULT NULL,
        object_repr VARCHAR(200) NOT NULL,
        action_flag SMALLINT(5) UNSIGNED NOT NULL CHECK (action_flag >= 0),
        change_message LONGTEXT NOT NULL,
        content_type_id INT(11) DEFAULT NULL,
        user_id INT(11) NOT NULL,
        PRIMARY KEY (id),
        KEY django_admin_log_content_type_id_c4bce8eb_fk_django_co (content_type_id),
        KEY django_admin_log_user_id_c564eba6_fk_auth_user_id (user_id),
        CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type (id),
        CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user (id)
    ) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """
    CREATE TABLE IF NOT EXISTS django_content_type (
        id INT(11) NOT NULL AUTO_INCREMENT,
        app_label VARCHAR(100) NOT NULL,
        model VARCHAR(100) NOT NULL,
        PRIMARY KEY (id),
        UNIQUE KEY django_content_type_app_label_model_76bd3d3b_uniq (app_label, model)
    ) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
    """,
    """ 
    CREATE TABLE `django_migrations` (
         `id` bigint(20) NOT NULL AUTO_INCREMENT,
         `app` varchar(255) NOT NULL,
         `name` varchar(255) NOT NULL,
         `applied` datetime(6) NOT NULL,
         PRIMARY KEY (`id`)
        ) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    """ 
    CREATE TABLE `django_session` (
 `session_key` varchar(40) NOT NULL,
 `session_data` longtext NOT NULL,
 `expire_date` datetime(6) NOT NULL,
 PRIMARY KEY (`session_key`),
 KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    """ 
    CREATE TABLE `event` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `created_by_uid` varchar(255) NOT NULL,
 `event_type_id` int(11) NOT NULL,
 `city_id` int(11) NOT NULL,
 `address_line1` varchar(255) NOT NULL,
 `address_line2` varchar(255) NOT NULL,
 `event_lat_lng` varchar(255) NOT NULL,
 `created_on` datetime NOT NULL,
 `sub_events` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`sub_events`)),
 `event_date` datetime NOT NULL,
 `event_note` varchar(255) NOT NULL,
 `event_admin` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`event_admin`)),
 `is_approved` tinyint(1) NOT NULL DEFAULT 0,
 `approved_by` int(11) NOT NULL,
 `printer_id` int(11) NOT NULL,
 `approved_date_time` datetime NOT NULL,
 `status` tinyint(1) NOT NULL DEFAULT 0,
 `delivery_fee` double NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `events_type` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `event_type_name` varchar(255) NOT NULL,
 `status` tinyint(1) DEFAULT 1,
 `created_by` varchar(255) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `event_admin_invite` (
 `id` int(11) NOT NULL,
 `invited_by` varchar(255) NOT NULL,
 `invited_to` varchar(255) NOT NULL,
 `event_id` int(11) NOT NULL,
 `status` tinyint(1) NOT NULL DEFAULT 0,
 `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `event_guest_invite` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `invited_by` varchar(255) NOT NULL,
 `invited_to` varchar(255) NOT NULL,
 `event_id` int(11) NOT NULL,
 `status` tinyint(1) NOT NULL DEFAULT 0,
 `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
 `invite_message` varchar(500) NOT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `unique_invite` (`invited_by`,`invited_to`,`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `greeting_cards` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `card_name` varchar(255) NOT NULL,
 `card_image_url` varchar(255) NOT NULL,
 `card_price` double NOT NULL,
 `printer_id` int(11) NOT NULL,
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 `status` tinyint(1) NOT NULL DEFAULT 1,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `locations` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `city_name` varchar(255) NOT NULL,
 `status` tinyint(1) DEFAULT 1,
 `created_by` varchar(255) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `notification` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `uid` varchar(255) NOT NULL,
 `type` varchar(255) NOT NULL,
 `title` text NOT NULL,
 `message` text NOT NULL,
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `printer` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `store_name` varchar(255) NOT NULL,
 `city` int(11) NOT NULL,
 `address` varchar(255) NOT NULL,
 `email` varchar(255) NOT NULL,
 `status` tinyint(1) DEFAULT 1,
 `gst_no` varchar(255) NOT NULL,
 `store_owner` varchar(255) NOT NULL,
 `contact_number` varchar(255) NOT NULL,
 `printer_user_name` varchar(255) NOT NULL,
 `printer_password` varchar(255) NOT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `uk_printer_user_name` (`printer_user_name`),
 KEY `idx_printer_user_name` (`printer_user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,
    """
    CREATE TABLE `print_jobs` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `transaction_id` varchar(255) NOT NULL,
 `printer_id` varchar(255) NOT NULL,
 `card_id` varchar(255) NOT NULL,
 `status` tinyint(1) NOT NULL,
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 `last_modified` datetime NOT NULL,
 `billing_amount` double NOT NULL,
 `event_id` int(11) NOT NULL,
 `wish` longtext NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    """
    CREATE TABLE `settlements` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `transaction_id` int(11) NOT NULL,
 `event_id` int(11) NOT NULL,
 `receiver_bank_id` int(11) NOT NULL,
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    """
    CREATE TABLE `transaction_history` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `sender_uid` varchar(255) NOT NULL,
 `receiver_uid` varchar(255) NOT NULL,
 `transaction_amount` double NOT NULL,
 `shagun_amount` double NOT NULL,
 `greeting_card_id` int(11) NOT NULL,
 `transaction_fee` double NOT NULL,
 `delivery_fee` double NOT NULL,
 `transaction_id` varchar(255) NOT NULL,
 `payment_status` varchar(255) NOT NULL,
 `event_id` int(11) NOT NULL,
 `status` tinyint(1) NOT NULL,
 `is_settled` tinyint(1) DEFAULT 0,
 `reciever_bank_id` varchar(255) NOT NULL,
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 `gifter_name` varchar(255) NOT NULL,
 `greeting_card_price` double NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    """
    CREATE TABLE `users` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `uid` varchar(255) NOT NULL,
 `name` varchar(255) NOT NULL,
 `email` varchar(255) NOT NULL,
 `phone` varchar(255) NOT NULL,
 `auth_type` varchar(255) NOT NULL,
 `kyc` tinyint(1) NOT NULL DEFAULT 0,
 `profile_pic` varchar(255) NOT NULL DEFAULT 'http://cdn.onlinewebfonts.com/svg/img_504768.png',
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 `status` tinyint(1) DEFAULT 1,
 `role` tinyint(1) NOT NULL,
 `fcm_token` varchar(255) NOT NULL,
 `city` varchar(255) NOT NULL,
 `password` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `unique_uid` (`uid`),
 UNIQUE KEY `unique_phone` (`phone`),
 KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    """
    CREATE TABLE `user_callback_request` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `uid` varchar(255) NOT NULL,
 `type` varchar(255) NOT NULL,
 `status` tinyint(1) NOT NULL DEFAULT 0,
 `completed_by` varchar(255) NOT NULL,
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 `event_date` date DEFAULT NULL,
 `event_type` varchar(255) DEFAULT NULL,
 `city` int(11) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    """
    CREATE TABLE `user_kyc` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `uid` varchar(255) NOT NULL,
 `full_name` varchar(255) NOT NULL,
 `dob` varchar(255) NOT NULL,
 `gender` varchar(255) NOT NULL,
 `address_line1` varchar(255) NOT NULL,
 `address_line2` varchar(255) NOT NULL,
 `city` varchar(255) NOT NULL,
 `state` varchar(255) NOT NULL,
 `postcode` varchar(255) NOT NULL,
 `country` varchar(255) NOT NULL,
 `identification_proof1` varchar(255) NOT NULL,
 `identification_proof2` varchar(255) NOT NULL,
 `identification_number1` varchar(255) NOT NULL,
 `identification_number2` varchar(255) NOT NULL,
 `identification_doc1` varchar(255) NOT NULL,
 `identification_doc2` varchar(255) NOT NULL,
 `verification_status` tinyint(1) NOT NULL,
 `created_on` timestamp NOT NULL DEFAULT current_timestamp(),
 `created_by` varchar(255) NOT NULL,
 `updated_by` varchar(255) NOT NULL,
 `updated_on` datetime NOT NULL,
 `approved_by` varchar(255) NOT NULL,
 `approved_on` datetime NOT NULL,
 PRIMARY KEY (`id`),
 UNIQUE KEY `idx_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """,

    """
    CREATE TABLE `version_details` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `app_name` varchar(255) NOT NULL,
 `min_version` varchar(255) NOT NULL,
 `latest_version` varchar(255) NOT NULL,
 `platform` varchar(255) NOT NULL,
 `created` timestamp NOT NULL DEFAULT current_timestamp(),
 `updated` datetime NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
    """

]

try:
    # Connect to the database
    connection = pymysql.connect(
        host=host,
        user=user,
        password=password,
        database=database,
        cursorclass=pymysql.cursors.DictCursor
    )

    # Create a cursor object
    cursor = connection.cursor()

    # Execute the table creation queries
    for query in table_queries:
        cursor.execute(query)
        connection.commit()

    print("Tables created successfully.")

except pymysql.Error as e:
    print(f"Error: {e}")

finally:
    if connection:
        connection.close()
