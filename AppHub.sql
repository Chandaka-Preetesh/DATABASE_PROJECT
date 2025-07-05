-- A DATABASE SCHEMA FOR APPHUB

--Creation of tables

CREATE TABLE USERS (

    user_id  INTEGER,
    user_name VARCHAR2(60),
    user_email  VARCHAR2(40) UNIQUE,
    user_country  VARCHAR2(40),
    created_on  DATE,
    
    PRIMARY KEY (user_id)
);


CREATE TABLE DEVELOPER (

    developer_id   INTEGER,
    company_name   VARCHAR2(60),
    developer_name  VARCHAR2(60),
    developer_email VARCHAR2(40),
    
    PRIMARY KEY (developer_id)
);

CREATE TABLE APP (

    app_id   INTEGER,
    app_name   VARCHAR2(20),
    description  VARCHAR2(1000),
    price   NUMBER(10,2),
    app_size  NUMBER,
    initial_release  DATE,
    
    PRIMARY KEY (app_id)
);




CREATE TABLE APP_VERSION (

    version_code  VARCHAR2(20),
    release_note  VARCHAR2(1000),
    release_date   DATE,
    is_available   CHAR(1) CHECK (is_available IN ('Y','N')),
    app_id         INTEGER,
    developer_id   INTEGER NOT NULL,
    source_code_url VARCHAR2(200),
    
    FOREIGN KEY (app_id) REFERENCES APP(app_id) ON DELETE CASCADE ,
    FOREIGN KEY (developer_id) REFERENCES DEVELOPER(developer_id) ,
    PRIMARY KEY (version_code, app_id)
);



CREATE TABLE PERMISSION (
    permission_id  INTEGER,
    permission_name VARCHAR2(40),
    permission_type VARCHAR2(40),
    
    PRIMARY KEY (permission_id)
);


CREATE TABLE CATEGORY (
    category_id   INTEGER,
    category_name VARCHAR2(40),
    
    PRIMARY KEY (category_id)
);


CREATE TABLE REVIEW (
    review_id  INTEGER,
    user_id    INTEGER,
    app_id    INTEGER,
    rating    NUMBER(2,1) CHECK (rating BETWEEN 0 AND 5),
    comments   VARCHAR2(400),
    review_date   DATE,
    
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
    FOREIGN KEY (app_id) REFERENCES APP(app_id) ON DELETE CASCADE,
    PRIMARY KEY (review_id)
);


CREATE TABLE DOWNLOAD (
    download_id     INTEGER,
    user_id         INTEGER,
    app_id          INTEGER,
    download_date   DATE,
    download_status VARCHAR2(20),
    device_type     VARCHAR2(20),
    network_type    VARCHAR2(20),
    
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
    FOREIGN KEY (app_id) REFERENCES APP(app_id) ON DELETE CASCADE,
    PRIMARY KEY (download_id)
);



CREATE TABLE APP_PERMISSION (

    permission_id   INTEGER,
    required_since  DATE,
    grant_by     VARCHAR2(20),
    app_id   INTEGER,


    FOREIGN KEY (app_id) REFERENCES APP(app_id) ON DELETE CASCADE,
    FOREIGN KEY (permission_id) REFERENCES PERMISSION(permission_id) ON DELETE CASCADE,
    PRIMARY KEY (permission_id,app_id)
);



CREATE TABLE APP_CATEGORY (
    category_id  INTEGER,
    assigned_by  VARCHAR2(20),
    assigned_on  DATE,
    app_id INTEGER,
    
    FOREIGN KEY (app_id) REFERENCES APP(app_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id) ON DELETE CASCADE,
    PRIMARY KEY (app_id, category_id)
);

CREATE TABLE WISHLIST (
    user_id   INTEGER,
    app_id    INTEGER,
    added_on  DATE,
    note      VARCHAR2(400),
    status    VARCHAR2(20),
  
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE,
    FOREIGN KEY (app_id) REFERENCES APP(app_id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, app_id)
);



--INSETION OF DATA 

--DATA INSERTION TO USERS TABLE
--user_id, user_name,user_email,country, created_on

INSERT INTO USERS VALUES (1, 'Chandaka Preetesh', 'cp123@gmail.com', 'India', TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO USERS VALUES (2, 'Vihaan Patel', 'vihaan.patel@gmail.com', 'India', TO_DATE('2022-04-11', 'YYYY-MM-DD'));
INSERT INTO USERS VALUES (3, 'Ishaan Reddy', 'ishaan.reddy@gmail.com', 'India', TO_DATE('2022-12-05', 'YYYY-MM-DD'));
INSERT INTO USERS VALUES (4, 'Kabir Mehta', 'kabir.mehta@gmail.com', 'India', TO_DATE('2024-06-19', 'YYYY-MM-DD'));
INSERT INTO USERS VALUES (5, 'Arjun Verma', 'arjun.verma@gmail.com', 'India', TO_DATE('2020-03-03', 'YYYY-MM-DD'));
INSERT INTO USERS VALUES (6, 'Anaya Gupta', 'anaya.gupta@gmail.com', 'India', TO_DATE('2022-02-09', 'YYYY-MM-DD'));
INSERT INTO USERS VALUES (7, 'Myra Joshi', 'myra.joshi@gmail.com', 'India', TO_DATE('2019-07-22', 'YYYY-MM-DD'));
INSERT INTO USERS VALUES (8, 'Siya Nair', 'siya.nair@gmail.com', 'India', TO_DATE('2015-05-10', 'YYYY-MM-DD'));
INSERT INTO USERS VALUES (9, 'Aanya Iyer', 'aanya.iyer@gmail.com', 'India', TO_DATE('2016-10-27', 'YYYY-MM-DD'));
INSERT INTO USERS VALUES (10, 'Kiara Das', 'kiara.das@gmail.com', 'India', TO_DATE('2022-11-13', 'YYYY-MM-DD'));


--DATA OF DEVELOPER TABLE
--developer_id,company,name,email

INSERT INTO DEVELOPER VALUES (101, 'App Designers', 'Rajesh Kumar', 'rajesh@appdesigners.in');
INSERT INTO DEVELOPER VALUES (102, 'Techno Apps', 'Priya Desai', 'priya@technoapp.in');
INSERT INTO DEVELOPER VALUES (103, 'Techno Apps', 'Arjun Verma', 'Av@technoapp.in');



--Data of APP table
--app__id,name,description,price,size,date,intial_release date


INSERT INTO APP VALUES (1001, 'WhatsApp', 'Private messaging and calling app from Meta.', 0.00, 80, TO_DATE('2015-02-24', 'YYYY-MM-DD'));
INSERT INTO APP VALUES (1002, 'Instagram', 'Photo and video sharing social network.', 0.00, 150, TO_DATE('2012-10-06', 'YYYY-MM-DD'));
INSERT INTO APP VALUES (1003, 'Spotify', 'Stream millions of songs and podcasts.', 155.00, 130, TO_DATE('2014-07-01', 'YYYY-MM-DD'));
INSERT INTO APP VALUES (1004, 'YouTube', 'Watch and upload videos on any topic.', 0.00, 140, TO_DATE('2010-05-10', 'YYYY-MM-DD'));
INSERT INTO APP VALUES (1005, 'Zoom', 'Meetings, video conferencing and webinars.', 0.00, 100, TO_DATE('2016-01-20', 'YYYY-MM-DD'));
INSERT INTO APP VALUES (1006, 'LinkedIn', 'Professional networking and job search.', 0.00, 105, TO_DATE('2011-03-28', 'YYYY-MM-DD'));
INSERT INTO APP VALUES (1007, 'Google Maps', 'Navigation, traffic, and local discovery.', 0.00, 160, TO_DATE('2011-06-15', 'YYYY-MM-DD'));
INSERT INTO APP VALUES (1008, 'Facebook', 'Social media platform to connect and share.', 0.00, 180, TO_DATE('2010-09-22', 'YYYY-MM-DD'));
INSERT INTO APP VALUES (1009, 'Twitter', 'News, trends and conversations in real-time.', 0.00, 98, TO_DATE('2011-11-01', 'YYYY-MM-DD'));
INSERT INTO APP VALUES (1010, 'Microsoft Teams', 'Team collaboration and communication.', 255.00, 125, TO_DATE('2017-03-14', 'YYYY-MM-DD'));
INSERT INTO APP VALUES (1011, 'Adobe Scan', 'Scan documents and save as PDF.', 400.00, 65, TO_DATE('2018-06-30', 'YYYY-MM-DD'));
INSERT INTO APP VALUES (1012, 'Truecaller', 'Caller ID, spam protection and call blocking.', 0.00, 78, TO_DATE('2013-04-05', 'YYYY-MM-DD'));



--App Version DATA
--versioncode,note,date,app_id,developer_id,sourcelink

INSERT INTO APP_VERSION VALUES ('1.0.0', 'Initial release with core messaging features.', TO_DATE('2025-03-01', 'YYYY-MM-DD'), 'Y', 1001, 101, 'https://github.com/meta/whatsapp-core');
INSERT INTO APP_VERSION VALUES ('2.5.1', 'Improved photo filters and story features.', TO_DATE('2025-01-15', 'YYYY-MM-DD'), 'Y', 1002, 103, 'https://github.com/meta/instagram-filters');
INSERT INTO APP_VERSION VALUES ('8.3.0', 'Updated music discovery and playback enhancements.', TO_DATE('2024-08-10', 'YYYY-MM-DD'), 'Y', 1003, 102, 'https://github.com/spotify/streaming-sdk');
INSERT INTO APP_VERSION VALUES ('17.2.5', 'UI tweaks and performance improvements.', TO_DATE('2019-06-15', 'YYYY-MM-DD'), 'Y', 1004, 101, 'https://github.com/google/youtube-client');
INSERT INTO APP_VERSION VALUES ('5.10.1', 'Improved virtual background and security patches.', TO_DATE('2018-03-01', 'YYYY-MM-DD'), 'Y', 1005, 103, 'https://github.com/zoom/zoom-meetings');
INSERT INTO APP_VERSION VALUES ('9.1.0', 'Added new job filters and in-app messaging.', TO_DATE('2021-05-10', 'YYYY-MM-DD'), 'Y', 1006, 102, 'https://github.com/linkedin/linkedin-app');
INSERT INTO APP_VERSION VALUES ('11.7.2', 'Added real-time traffic and offline maps.', TO_DATE('2022-07-10', 'YYYY-MM-DD'), 'Y', 1007, 101, 'https://github.com/google/maps-sdk');
INSERT INTO APP_VERSION VALUES ('4.8.0', 'Revamped design and improved privacy options.', TO_DATE('2023-10-10', 'YYYY-MM-DD'), 'Y', 1008, 102, 'https://github.com/meta/facebook-web');
INSERT INTO APP_VERSION VALUES ('6.3.2', 'Improved tweet threading and live event support.', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 'Y', 1009, 103, 'https://github.com/twitter/api-client');
INSERT INTO APP_VERSION VALUES ('3.1.4', 'Faster sync and improved team video call quality.', TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'Y', 1010, 101, 'https://github.com/microsoft/teams-client');
INSERT INTO APP_VERSION VALUES ('2.2.9', 'Added multi-page scan and auto-crop.', TO_DATE('2023-07-15', 'YYYY-MM-DD'), 'Y', 1011, 102, 'https://github.com/adobe/scan-app');
INSERT INTO APP_VERSION VALUES ('7.0.0', 'Enhanced spam detection and contact sync.', TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'Y', 1012, 103, 'https://github.com/truecaller/core-engine');


INSERT INTO APP_VERSION VALUES ('7.2.1', 'Initial release of Spotify on mobile.', TO_DATE('2023-03-15', 'YYYY-MM-DD'), 'N', 1003, 102, 'https://github.com/spotify/mobile-init');
INSERT INTO APP_VERSION VALUES ('8.0.0', 'Introduced new personalized playlists.', TO_DATE('2025-11-01', 'YYYY-MM-DD'), 'Y', 1003, 102, 'https://github.com/spotify/playlist-engine');
INSERT INTO APP_VERSION VALUES ('12.0.0', 'First version supporting HD streaming.', TO_DATE('2020-12-01', 'YYYY-MM-DD'), 'N', 1004, 101, 'https://github.com/google/youtube-hd');
INSERT INTO APP_VERSION VALUES ('16.1.3', 'Added support for Shorts and livestreaming.', TO_DATE('2025-06-20', 'YYYY-MM-DD'), 'Y', 1004, 101, 'https://github.com/google/youtube-shorts');
INSERT INTO APP_VERSION VALUES ('3.9.0', 'Basic video call and screen sharing features.', TO_DATE('2019-05-05', 'YYYY-MM-DD'), 'N', 1005, 103, 'https://github.com/zoom/zoom-initial');
INSERT INTO APP_VERSION VALUES ('4.5.1', 'Security updates and breakout room support.', TO_DATE('2019-04-15', 'YYYY-MM-DD'), 'Y', 1005, 103, 'https://github.com/zoom/zoom-security');


--PERMISSIONS DATA
--permission_id,name,type


INSERT INTO PERMISSION VALUES (1, 'CAMERA', 'Runtime');
INSERT INTO PERMISSION VALUES (2, 'Output_Audio', 'Runtime');
INSERT INTO PERMISSION VALUES (3, 'CALL', 'Runtime');
INSERT INTO PERMISSION VALUES (4, 'SMS', 'once_during_installation');
INSERT INTO PERMISSION VALUES (5, 'SMS', 'Always');
INSERT INTO PERMISSION VALUES (6, 'Location', 'Always');
INSERT INTO PERMISSION VALUES (7, 'Input_Audio', 'Background');
INSERT INTO PERMISSION VALUES (8, 'Output_Audio', 'Background');
INSERT INTO PERMISSION VALUES (9, 'Files', 'Runtime');



--CATEGROY DATA
--category_id,name

INSERT INTO CATEGORY VALUES (1, 'GAMING');
INSERT INTO CATEGORY VALUES (2, 'FREE');
INSERT INTO CATEGORY VALUES (3, 'EDUCATION');
INSERT INTO CATEGORY VALUES (4, 'PRODUCTIVITY');
INSERT INTO CATEGORY VALUES (5, 'HEALTH AND FITNESS');
INSERT INTO CATEGORY VALUES (6, 'SOCIAL');
INSERT INTO CATEGORY VALUES (7, 'Music');
INSERT INTO CATEGORY VALUES (8, 'Entertainment');


--REVIEW DATA

--review id,user_id,app_id,rating,comment,review_date

INSERT INTO REVIEW VALUES (1, 1, 1001, 4.5, 'Great messaging features!', TO_DATE('2025-03-15', 'YYYY-MM-DD'));
INSERT INTO REVIEW VALUES (2, 2, 1001, 4.0, 'Needs better media sharing.', TO_DATE('2025-05-01', 'YYYY-MM-DD'));

INSERT INTO REVIEW VALUES (3, 3, 1002, 3.8, 'Fun stories, but buggy.', TO_DATE('2024-06-10', 'YYYY-MM-DD'));
INSERT INTO REVIEW VALUES (4, 1, 1002, 4.8, 'Great app ', TO_DATE('2022-06-10', 'YYYY-MM-DD'));

INSERT INTO REVIEW VALUES (5, 2, 1003, 4.9, 'Excellent music suggestions.', TO_DATE('2014-07-01', 'YYYY-MM-DD'));
INSERT INTO REVIEW VALUES (6, 5, 1003, 4.7, 'Clean interface and huge collection.', TO_DATE('2022-08-20', 'YYYY-MM-DD'));
INSERT INTO REVIEW VALUES (7, 8, 1003, 4.2, 'Occasional buffering issues.', TO_DATE('2020-09-12', 'YYYY-MM-DD'));

INSERT INTO REVIEW VALUES (8, 10, 1005, 4.8, 'Smooth video calls.', TO_DATE('2021-04-18', 'YYYY-MM-DD'));

INSERT INTO REVIEW VALUES (9, 9, 1006, 3.5, 'Too many notifications.', TO_DATE('2022-06-30', 'YYYY-MM-DD'));

INSERT INTO REVIEW VALUES (10, 4, 1008, 4.0, 'Classic social app, good updates.', TO_DATE('2023-10-12', 'YYYY-MM-DD'));
INSERT INTO REVIEW VALUES (11, 2, 1008, 3.7, 'Addicted to scrolling.', TO_DATE('2023-11-05', 'YYYY-MM-DD'));

INSERT INTO REVIEW VALUES (12, 3, 1010, 4.6, 'Very useful for work meetings.', TO_DATE('2023-08-22', 'YYYY-MM-DD'));
INSERT INTO REVIEW VALUES (13, 7, 1012, 4.3, 'Call blocking works great.', TO_DATE('2023-07-07', 'YYYY-MM-DD'));



--DOWNLOAD DATA
--download_id,user_id,app__id,download__date,status,device,netwrok_type

INSERT INTO DOWNLOAD VALUES (1, 1, 1001, TO_DATE('2025-03-01', 'YYYY-MM-DD'), 'Completed', 'Android', 'WiFi');
INSERT INTO DOWNLOAD VALUES (2, 2, 1001, TO_DATE('2025-04-28', 'YYYY-MM-DD'), 'Completed', 'iOS', 'LAN');
INSERT INTO DOWNLOAD VALUES (3, 3, 1002, TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'Completed', 'Android', 'MobileData');
INSERT INTO DOWNLOAD VALUES (4, 1, 1002, TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'Completed', 'iOS', 'WiFi');
INSERT INTO DOWNLOAD VALUES (5, 2, 1003, TO_DATE('2015-06-25', 'YYYY-MM-DD'), 'Completed', 'Android', 'WiFi');
INSERT INTO DOWNLOAD VALUES (6, 5, 1003, TO_DATE('2025-02-01', 'YYYY-MM-DD'), 'Completed', 'Android', 'LAN');
INSERT INTO DOWNLOAD VALUES (7, 8, 1003, TO_DATE('2025-01-01', 'YYYY-MM-DD'), 'Completed', 'iOS', 'MobileData');
INSERT INTO DOWNLOAD VALUES (8, 10, 1005, TO_DATE('2025-04-01', 'YYYY-MM-DD'), 'Completed', 'Android', 'WiFi');
INSERT INTO DOWNLOAD VALUES (9, 9, 1006, TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'Completed', 'Android', 'Satellite');
INSERT INTO DOWNLOAD VALUES (10, 4, 1008, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 'Completed', 'iOS', 'WiFi');
INSERT INTO DOWNLOAD VALUES (11, 2, 1008, TO_DATE('2023-11-01', 'YYYY-MM-DD'), 'Completed', 'Android', 'WiFi');
INSERT INTO DOWNLOAD VALUES (12, 3, 1010, TO_DATE('2023-08-01', 'YYYY-MM-DD'), 'Completed', 'iOS', 'LAN');
INSERT INTO DOWNLOAD VALUES (13, 7, 1012, TO_DATE('2025-07-01', 'YYYY-MM-DD'), 'Completed', 'Android', 'MobileData');


INSERT INTO DOWNLOAD VALUES (14, 6, 1004, TO_DATE('2025-03-15', 'YYYY-MM-DD'), 'Failed', 'Android', 'WiFi');
INSERT INTO DOWNLOAD VALUES (15, 6, 1005, TO_DATE('2023-05-20', 'YYYY-MM-DD'), 'Incomplete', 'iOS', 'Satellite');
INSERT INTO DOWNLOAD VALUES (16, 9, 1001, TO_DATE('2024-02-12', 'YYYY-MM-DD'), 'Failed', 'Android', 'WiFi');
INSERT INTO DOWNLOAD VALUES (17, 7, 1006, TO_DATE('2024-07-02', 'YYYY-MM-DD'), 'Completed', 'iOS', 'Satellite');
INSERT INTO DOWNLOAD VALUES (18, 6, 1008, TO_DATE('2022-09-10', 'YYYY-MM-DD'), 'Completed', 'Android', 'MobileData');
INSERT INTO DOWNLOAD VALUES (19, 8, 1010, TO_DATE('2023-01-05', 'YYYY-MM-DD'), 'Failed', 'iOS', 'LAN');
INSERT INTO DOWNLOAD VALUES (20, 9, 1009, TO_DATE('2023-06-30', 'YYYY-MM-DD'), 'Completed', 'Android', 'Satellite');

--APP_PERMISSION DATA
--permisson_id,requiered_since,granted_by,app_id

-- WhatsApp (1001): needs CAMERA, Media, CALL
INSERT INTO APP_PERMISSION VALUES (1, TO_DATE('2021-01-24', 'YYYY-MM-DD'), 'System', 1001);
INSERT INTO APP_PERMISSION VALUES (2, TO_DATE('2024-01-24', 'YYYY-MM-DD'), 'System', 1001);
INSERT INTO APP_PERMISSION VALUES (7, TO_DATE('2025-04-24', 'YYYY-MM-DD'), 'User', 1001);
INSERT INTO APP_PERMISSION VALUES (9, TO_DATE('2022-04-24', 'YYYY-MM-DD'), 'User', 1001);
 
 
-- Instagram (1002): needs CAMERA, AUDIO
INSERT INTO APP_PERMISSION VALUES (1, TO_DATE('2014-10-16', 'YYYY-MM-DD'), 'System', 1002);
INSERT INTO APP_PERMISSION VALUES (2, TO_DATE('2018-10-26', 'YYYY-MM-DD'), 'System', 1002);
INSERT INTO APP_PERMISSION VALUES (7, TO_DATE('2020-10-16', 'YYYY-MM-DD'), 'User', 1002);
INSERT INTO APP_PERMISSION VALUES (9, TO_DATE('2023-04-24', 'YYYY-MM-DD'), 'User', 1002);
 

-- Spotify (1003): needs AUDIO,one time otp
INSERT INTO APP_PERMISSION VALUES (2, TO_DATE('2024-07-01', 'YYYY-MM-DD'), 'System', 1003);
INSERT INTO APP_PERMISSION VALUES (4, TO_DATE('2025-07-01', 'YYYY-MM-DD'), 'User', 1003);
INSERT INTO APP_PERMISSION VALUES (9, TO_DATE('2023-04-24', 'YYYY-MM-DD'), 'User', 1003);
 


-- YouTube (1004): needs 
INSERT INTO APP_PERMISSION VALUES (1, TO_DATE('2015-05-10', 'YYYY-MM-DD'), 'User', 1004);
INSERT INTO APP_PERMISSION VALUES (2, TO_DATE('2015-05-10', 'YYYY-MM-DD'), 'System', 1004);
INSERT INTO APP_PERMISSION VALUES (7, TO_DATE('2020-05-10', 'YYYY-MM-DD'), 'User', 1004);


-- Zoom (1005): needs CAMERA, AUDIO, CALL
INSERT INTO APP_PERMISSION VALUES (1, TO_DATE('2024-01-20', 'YYYY-MM-DD'), 'User', 1005);
INSERT INTO APP_PERMISSION VALUES (2, TO_DATE('2024-01-20', 'YYYY-MM-DD'), 'System', 1005);
INSERT INTO APP_PERMISSION VALUES (7, TO_DATE('2022-01-20', 'YYYY-MM-DD'), 'User', 1005);


-- Facebook (1008): needs CAMERA, AUDIO
INSERT INTO APP_PERMISSION VALUES (1, TO_DATE('2020-09-22', 'YYYY-MM-DD'), 'User', 1008);
INSERT INTO APP_PERMISSION VALUES (2, TO_DATE('2020-09-22', 'YYYY-MM-DD'), 'System', 1008);
INSERT INTO APP_PERMISSION VALUES (7, TO_DATE('2025-04-24', 'YYYY-MM-DD'), 'User', 1008);
INSERT INTO APP_PERMISSION VALUES (9, TO_DATE('2025-04-24', 'YYYY-MM-DD'), 'User', 1008);



-- Microsoft Teams (1010): needs AUDIO, CALL
INSERT INTO APP_PERMISSION VALUES (1, TO_DATE('2017-03-14', 'YYYY-MM-DD'), 'User', 1010);
INSERT INTO APP_PERMISSION VALUES (2, TO_DATE('2017-03-14', 'YYYY-MM-DD'), 'User', 1010);
INSERT INTO APP_PERMISSION VALUES (3, TO_DATE('2017-03-14', 'YYYY-MM-DD'), 'User', 1010);

-- Adobe Scan (1011): needs CAMERA
INSERT INTO APP_PERMISSION VALUES (1, TO_DATE('2018-06-30', 'YYYY-MM-DD'), 'User', 1011);

-- Truecaller (1012): needs CALL, SMS
INSERT INTO APP_PERMISSION VALUES (3, TO_DATE('2013-04-05', 'YYYY-MM-DD'), 'User', 1012);
INSERT INTO APP_PERMISSION VALUES (7, TO_DATE('2013-04-05', 'YYYY-MM-DD'), 'System', 1012);



--APP_CATEGORY DATA
--category_id,assigned_by,on


INSERT INTO APP_CATEGORY VALUES (2, 'Admin', TO_DATE('2015-02-24', 'YYYY-MM-DD'), 1001); -- WhatsApp - Free
INSERT INTO APP_CATEGORY VALUES (6, 'Admin', TO_DATE('2015-02-24', 'YYYY-MM-DD'), 1001); -- WhatsApp - Social

INSERT INTO APP_CATEGORY VALUES (2, 'System', TO_DATE('2012-10-06', 'YYYY-MM-DD'), 1002); -- Instagram - Free
INSERT INTO APP_CATEGORY VALUES (6, 'System', TO_DATE('2012-10-06', 'YYYY-MM-DD'), 1002); -- Instagram - Social

INSERT INTO APP_CATEGORY VALUES (7, 'Admin', TO_DATE('2014-07-01', 'YYYY-MM-DD'), 1003); -- Spotify - Music
INSERT INTO APP_CATEGORY VALUES (4, 'System', TO_DATE('2014-07-01', 'YYYY-MM-DD'), 1003); -- Spotify - Productivity

-- YouTube
INSERT INTO APP_CATEGORY VALUES (8, 'User', TO_DATE('2010-05-10', 'YYYY-MM-DD'), 1004); -- Entertainment
INSERT INTO APP_CATEGORY VALUES (7, 'System', TO_DATE('2010-05-10', 'YYYY-MM-DD'), 1004); -- Music
INSERT INTO APP_CATEGORY VALUES (2, 'User', TO_DATE('2010-05-10', 'YYYY-MM-DD'), 1004); -- Free

-- LinkedIn
INSERT INTO APP_CATEGORY VALUES (4, 'System', TO_DATE('2011-03-28', 'YYYY-MM-DD'), 1006); -- Productivity
INSERT INTO APP_CATEGORY VALUES (6, 'System', TO_DATE('2011-03-28', 'YYYY-MM-DD'), 1006); -- Social

-- Google Maps
INSERT INTO APP_CATEGORY VALUES (4, 'System', TO_DATE('2011-06-15', 'YYYY-MM-DD'), 1007); -- Productivity
INSERT INTO APP_CATEGORY VALUES (2, 'User', TO_DATE('2011-06-15', 'YYYY-MM-DD'), 1007); -- Free

-- Twitter
INSERT INTO APP_CATEGORY VALUES (6, 'Admin', TO_DATE('2011-11-01', 'YYYY-MM-DD'), 1009); -- Social
INSERT INTO APP_CATEGORY VALUES (2, 'Admin', TO_DATE('2011-11-01', 'YYYY-MM-DD'), 1009); -- Free

-- Microsoft Teams
INSERT INTO APP_CATEGORY VALUES (4, 'User', TO_DATE('2017-03-14', 'YYYY-MM-DD'), 1010); -- Productivity
INSERT INTO APP_CATEGORY VALUES (3, 'User', TO_DATE('2017-03-14', 'YYYY-MM-DD'), 1010); -- Education

-- Adobe Scan
INSERT INTO APP_CATEGORY VALUES (4, 'Admin', TO_DATE('2018-06-30', 'YYYY-MM-DD'), 1011); -- Productivity

-- Truecaller
INSERT INTO APP_CATEGORY VALUES (5, 'System', TO_DATE('2013-04-05', 'YYYY-MM-DD'), 1012); -- Health and Fitness (for digital well-being)
INSERT INTO APP_CATEGORY VALUES (2, 'System', TO_DATE('2013-04-05', 'YYYY-MM-DD'), 1012); -- Free



--WISHLIST DATA

-- WISHLIST: user_id, app_id, added_on, note, status

INSERT INTO WISHLIST VALUES (1, 1003, TO_DATE('2025-04-10', 'YYYY-MM-DD'), 'Looks good for music', 'Interested');
INSERT INTO WISHLIST VALUES (1, 1005, TO_DATE('2025-08-20', 'YYYY-MM-DD'), 'Useful for online meetings', 'Pending');
INSERT INTO WISHLIST VALUES (2, 1004, TO_DATE('2022-05-02', 'YYYY-MM-DD'), 'Entertainment app suggestion', 'Notify_Release');
INSERT INTO WISHLIST VALUES (3, 1006, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Will try for job alerts', 'Interested');
INSERT INTO WISHLIST VALUES (4, 1007, TO_DATE('2024-06-25', 'YYYY-MM-DD'), 'Travel and maps app', 'Pending');
INSERT INTO WISHLIST VALUES (5, 1001, TO_DATE('2022-05-12', 'YYYY-MM-DD'), 'Check for communication use', 'Interested');
INSERT INTO WISHLIST VALUES (6, 1010, TO_DATE('2021-01-15', 'YYYY-MM-DD'), 'Messaging app for groups', 'Notify_Release');
INSERT INTO WISHLIST VALUES (7, 1002, TO_DATE('2022-01-01', 'YYYY-MM-DD'), 'Photo editing features look good', 'Pending');
INSERT INTO WISHLIST VALUES (8, 1009, TO_DATE('2018-01-05', 'YYYY-MM-DD'), 'Looks like a trending news app', 'Interested');
INSERT INTO WISHLIST VALUES (9, 1012, TO_DATE('2018-05-18', 'YYYY-MM-DD'), 'Protect from spam calls', 'Notify_Release');
INSERT INTO WISHLIST VALUES (10, 1011, TO_DATE('2023-03-19', 'YYYY-MM-DD'), 'Scanner feature needed for project', 'Interested');
INSERT INTO WISHLIST VALUES (3, 1008, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 'Facebook alternative maybe?', 'Pending');
INSERT INTO WISHLIST VALUES (4, 1011, TO_DATE('2024-06-30', 'YYYY-MM-DD'), 'Document scanner required soon', 'Interested');
INSERT INTO WISHLIST VALUES (6, 1003, TO_DATE('2023-09-10', 'YYYY-MM-DD'), 'Podcast features sound great', 'Notify_Release');
INSERT INTO WISHLIST VALUES (2, 1006, TO_DATE('2023-02-11', 'YYYY-MM-DD'), 'For professional networking', 'Interested');




-- APPHUB QUERIES



-- 1.What are  Top 5 most trending apps ?  (last 3 months)

SELECT app_t.app_name as trending_apps, COUNT(download_t.download_id) AS number_of_download
FROM APP app_t
LEFT JOIN DOWNLOAD download_t ON app_t.app_id = download_t.app_id
WHERE download_t.download_status = 'Completed' and SYSDATE-download_t.download_date<=90
GROUP BY app_t.app_name
ORDER BY  number_of_download DESC
FETCH FIRST 5 ROWS ONLY;


-- 2. Finding all social media apps.

SELECT app_t.app_name
FROM APP app_t
LEFT JOIN APP_CATEGORY app_category_t ON app_t.app_id = app_category_t.app_id
LEFT JOIN CATEGORY category_t ON app_category_t.category_id = category_t.category_id
WHERE category_t.category_name = 'SOCIAL';


-- 3. Average rating for each app .
SELECT app_t.app_name, COALESCE(ROUND(AVG(review_t.rating), 2), 0) AS avg_rating
FROM APP app_t
LEFT JOIN REVIEW review_t ON app_t.app_id = review_t.app_id
GROUP BY app_t.app_name
ORDER BY avg_rating DESC;



-- 4.Ranking of various networks used to download app. 


SELECT network_type, COUNT(*) AS total_downloads
FROM DOWNLOAD
WHERE download_status = 'Completed'
GROUP BY network_type
ORDER BY total_downloads DESC;


-- 5. Showing latest version of each app 

SELECT app_t.app_name, MAX(app_version_t.release_date) AS latest_release, app_version_t.version_code
FROM APP app_t
JOIN APP_VERSION app_version_t ON app_t.app_id = app_version_t.app_id
GROUP BY app_t.app_name, app_version_t.version_code;


-- 6.Finding  Top 5 most wished apps

SELECT app_t.app_name, COUNT(wish_t.user_id) AS total_wishlist
FROM APP app_t
JOIN WISHLIST wish_t ON app_t.app_id = wish_t.app_id
GROUP BY app_t.app_name
ORDER BY total_wishlist DESC
FETCH FIRST 5 ROWS ONLY;



-- 7. List apps that require 'CAMERA' permission

SELECT DISTINCT app_t.app_name
FROM APP app_t
JOIN APP_PERMISSION app_permission_t ON app_t.app_id = app_permission_t.app_id
JOIN PERMISSION permission_t ON app_permission_t.permission_id = permission_t.permission_id
WHERE (permission_t.permission_name) = 'CAMERA';



-- 8 Finding Top 3 most common permissions among all apps.

SELECT p.permission_name, COUNT(ap.app_id) AS total_usage
FROM PERMISSION p
LEFT JOIN APP_PERMISSION ap ON p.permission_id = ap.permission_id
GROUP BY p.permission_name
ORDER BY total_usage DESC
FETCH FIRST 3 ROWS ONLY;



-- 9. Count of apps per category .

SELECT category_t.category_name, COUNT(DISTINCT app_category_t.app_id) AS total_apps
FROM CATEGORY category_t
JOIN APP_CATEGORY app_category_t ON category_t.category_id = app_category_t.category_id
GROUP BY category_t.category_name
ORDER BY total_apps DESC;


-- 10.Count of  Apps downloaded by each user.

SELECT 
    user_t.user_name,
    COUNT(download_t.download_id) AS count_of_downloads
FROM USERS user_t
JOIN DOWNLOAD download_t ON user_t.user_id = download_t.user_id
WHERE  download_t.download_status='Completed'
GROUP BY user_t.user_name
ORDER BY count_of_downloads DESC;


