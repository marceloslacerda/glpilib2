/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.5.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: glpi
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `glpi_agents`
--

DROP TABLE IF EXISTS `glpi_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_agents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deviceid` varchar(255) NOT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `agenttypes_id` int(10) unsigned NOT NULL,
  `last_contact` timestamp NULL DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) unsigned NOT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `port` varchar(6) DEFAULT NULL,
  `remote_addr` varchar(255) DEFAULT NULL,
  `threads_networkdiscovery` int(11) NOT NULL DEFAULT 1 COMMENT 'Number of threads for Network discovery',
  `threads_networkinventory` int(11) NOT NULL DEFAULT 1 COMMENT 'Number of threads for Network inventory',
  `timeout_networkdiscovery` int(11) NOT NULL DEFAULT 0 COMMENT 'Network Discovery task timeout (disabled by default)',
  `timeout_networkinventory` int(11) NOT NULL DEFAULT 0 COMMENT 'Network Inventory task timeout (disabled by default)',
  `use_module_wake_on_lan` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_computer_inventory` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_esx_remote_inventory` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_remote_inventory` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_network_inventory` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_network_discovery` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_package_deployment` tinyint(4) NOT NULL DEFAULT 0,
  `use_module_collect_data` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `deviceid` (`deviceid`),
  KEY `name` (`name`),
  KEY `agenttypes_id` (`agenttypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_agents`
--

LOCK TABLES `glpi_agents` WRITE;
/*!40000 ALTER TABLE `glpi_agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_agenttypes`
--

DROP TABLE IF EXISTS `glpi_agenttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_agenttypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_agenttypes`
--

LOCK TABLES `glpi_agenttypes` WRITE;
/*!40000 ALTER TABLE `glpi_agenttypes` DISABLE KEYS */;
INSERT INTO `glpi_agenttypes` VALUES
(1,'Core');
/*!40000 ALTER TABLE `glpi_agenttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_alerts`
--

DROP TABLE IF EXISTS `glpi_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_alerts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php ALERT_* constant',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`type`),
  KEY `type` (`type`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_alerts`
--

LOCK TABLES `glpi_alerts` WRITE;
/*!40000 ALTER TABLE `glpi_alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_apiclients`
--

DROP TABLE IF EXISTS `glpi_apiclients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_apiclients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `ipv4_range_start` bigint(20) DEFAULT NULL,
  `ipv4_range_end` bigint(20) DEFAULT NULL,
  `ipv6` varchar(255) DEFAULT NULL,
  `app_token` varchar(255) DEFAULT NULL,
  `app_token_date` timestamp NULL DEFAULT NULL,
  `dolog_method` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_active` (`is_active`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_apiclients`
--

LOCK TABLES `glpi_apiclients` WRITE;
/*!40000 ALTER TABLE `glpi_apiclients` DISABLE KEYS */;
INSERT INTO `glpi_apiclients` VALUES
(1,0,1,'full access from localhost','2024-11-19 10:21:28',NULL,1,NULL,NULL,NULL,'fJrh7xJieyR45puNYy3OqXNFulLO0DgpBK10oUHK','2024-11-19 10:21:28',1,NULL);
/*!40000 ALTER TABLE `glpi_apiclients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_applianceenvironments`
--

DROP TABLE IF EXISTS `glpi_applianceenvironments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_applianceenvironments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_applianceenvironments`
--

LOCK TABLES `glpi_applianceenvironments` WRITE;
/*!40000 ALTER TABLE `glpi_applianceenvironments` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_applianceenvironments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_appliances`
--

DROP TABLE IF EXISTS `glpi_appliances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_appliances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `appliancetypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `applianceenvironments_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `externalidentifier` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `is_helpdesk_visible` tinyint(4) NOT NULL DEFAULT 1,
  `pictures` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`externalidentifier`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `is_deleted` (`is_deleted`),
  KEY `appliancetypes_id` (`appliancetypes_id`),
  KEY `locations_id` (`locations_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `applianceenvironments_id` (`applianceenvironments_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id` (`groups_id`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `states_id` (`states_id`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_appliances`
--

LOCK TABLES `glpi_appliances` WRITE;
/*!40000 ALTER TABLE `glpi_appliances` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_appliances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_appliances_items`
--

DROP TABLE IF EXISTS `glpi_appliances_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_appliances_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appliances_id` int(10) unsigned NOT NULL DEFAULT 0,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`appliances_id`,`items_id`,`itemtype`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_appliances_items`
--

LOCK TABLES `glpi_appliances_items` WRITE;
/*!40000 ALTER TABLE `glpi_appliances_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_appliances_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_appliances_items_relations`
--

DROP TABLE IF EXISTS `glpi_appliances_items_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_appliances_items_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `appliances_items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `appliances_items_id` (`appliances_items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_appliances_items_relations`
--

LOCK TABLES `glpi_appliances_items_relations` WRITE;
/*!40000 ALTER TABLE `glpi_appliances_items_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_appliances_items_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_appliancetypes`
--

DROP TABLE IF EXISTS `glpi_appliancetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_appliancetypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `externalidentifier` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `externalidentifier` (`externalidentifier`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_appliancetypes`
--

LOCK TABLES `glpi_appliancetypes` WRITE;
/*!40000 ALTER TABLE `glpi_appliancetypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_appliancetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_authldapreplicates`
--

DROP TABLE IF EXISTS `glpi_authldapreplicates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_authldapreplicates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authldaps_id` int(10) unsigned NOT NULL DEFAULT 0,
  `host` varchar(255) DEFAULT NULL,
  `port` int(11) NOT NULL DEFAULT 389,
  `name` varchar(255) DEFAULT NULL,
  `timeout` int(11) NOT NULL DEFAULT 10,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `authldaps_id` (`authldaps_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_authldapreplicates`
--

LOCK TABLES `glpi_authldapreplicates` WRITE;
/*!40000 ALTER TABLE `glpi_authldapreplicates` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_authldapreplicates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_authldaps`
--

DROP TABLE IF EXISTS `glpi_authldaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_authldaps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `basedn` varchar(255) DEFAULT NULL,
  `rootdn` varchar(255) DEFAULT NULL,
  `port` int(11) NOT NULL DEFAULT 389,
  `condition` text DEFAULT NULL,
  `login_field` varchar(255) DEFAULT 'uid',
  `sync_field` varchar(255) DEFAULT NULL,
  `use_tls` tinyint(4) NOT NULL DEFAULT 0,
  `group_field` varchar(255) DEFAULT NULL,
  `group_condition` text DEFAULT NULL,
  `group_search_type` int(11) NOT NULL DEFAULT 0,
  `group_member_field` varchar(255) DEFAULT NULL,
  `email1_field` varchar(255) DEFAULT NULL,
  `realname_field` varchar(255) DEFAULT NULL,
  `firstname_field` varchar(255) DEFAULT NULL,
  `phone_field` varchar(255) DEFAULT NULL,
  `phone2_field` varchar(255) DEFAULT NULL,
  `mobile_field` varchar(255) DEFAULT NULL,
  `comment_field` varchar(255) DEFAULT NULL,
  `use_dn` tinyint(4) NOT NULL DEFAULT 1,
  `time_offset` int(11) NOT NULL DEFAULT 0 COMMENT 'in seconds',
  `deref_option` int(11) NOT NULL DEFAULT 0,
  `title_field` varchar(255) DEFAULT NULL,
  `category_field` varchar(255) DEFAULT NULL,
  `language_field` varchar(255) DEFAULT NULL,
  `entity_field` varchar(255) DEFAULT NULL,
  `entity_condition` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `rootdn_passwd` varchar(255) DEFAULT NULL,
  `registration_number_field` varchar(255) DEFAULT NULL,
  `email2_field` varchar(255) DEFAULT NULL,
  `email3_field` varchar(255) DEFAULT NULL,
  `email4_field` varchar(255) DEFAULT NULL,
  `location_field` varchar(255) DEFAULT NULL,
  `responsible_field` varchar(255) DEFAULT NULL,
  `pagesize` int(11) NOT NULL DEFAULT 0,
  `ldap_maxlimit` int(11) NOT NULL DEFAULT 0,
  `can_support_pagesize` tinyint(4) NOT NULL DEFAULT 0,
  `picture_field` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `inventory_domain` varchar(255) DEFAULT NULL,
  `tls_certfile` text DEFAULT NULL,
  `tls_keyfile` text DEFAULT NULL,
  `use_bind` tinyint(4) NOT NULL DEFAULT 1,
  `timeout` int(11) NOT NULL DEFAULT 10,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `is_default` (`is_default`),
  KEY `is_active` (`is_active`),
  KEY `date_creation` (`date_creation`),
  KEY `sync_field` (`sync_field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_authldaps`
--

LOCK TABLES `glpi_authldaps` WRITE;
/*!40000 ALTER TABLE `glpi_authldaps` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_authldaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_authmails`
--

DROP TABLE IF EXISTS `glpi_authmails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_authmails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `connect_string` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_authmails`
--

LOCK TABLES `glpi_authmails` WRITE;
/*!40000 ALTER TABLE `glpi_authmails` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_authmails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_autoupdatesystems`
--

DROP TABLE IF EXISTS `glpi_autoupdatesystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_autoupdatesystems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_autoupdatesystems`
--

LOCK TABLES `glpi_autoupdatesystems` WRITE;
/*!40000 ALTER TABLE `glpi_autoupdatesystems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_autoupdatesystems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_blacklistedmailcontents`
--

DROP TABLE IF EXISTS `glpi_blacklistedmailcontents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_blacklistedmailcontents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_blacklistedmailcontents`
--

LOCK TABLES `glpi_blacklistedmailcontents` WRITE;
/*!40000 ALTER TABLE `glpi_blacklistedmailcontents` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_blacklistedmailcontents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_blacklists`
--

DROP TABLE IF EXISTS `glpi_blacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_blacklists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_blacklists`
--

LOCK TABLES `glpi_blacklists` WRITE;
/*!40000 ALTER TABLE `glpi_blacklists` DISABLE KEYS */;
INSERT INTO `glpi_blacklists` VALUES
(1,3,'invalid serial','N/A',NULL,NULL,NULL),
(2,3,'invalid serial','(null string)',NULL,NULL,NULL),
(3,3,'invalid serial','INVALID',NULL,NULL,NULL),
(4,3,'invalid serial','SYS-1234567890',NULL,NULL,NULL),
(5,3,'invalid serial','SYS-9876543210',NULL,NULL,NULL),
(6,3,'invalid serial','SN-12345',NULL,NULL,NULL),
(7,3,'invalid serial','SN-1234567890',NULL,NULL,NULL),
(8,3,'invalid serial','/^0+$/',NULL,NULL,NULL),
(9,3,'invalid serial','/^1+$/',NULL,NULL,NULL),
(10,3,'invalid serial','/\\d\\.\\d(\\.\\d)?/',NULL,NULL,NULL),
(11,3,'invalid serial','/^(0|1)+$/',NULL,NULL,NULL),
(12,3,'invalid serial','0123456789',NULL,NULL,NULL),
(13,3,'invalid serial','12345',NULL,NULL,NULL),
(14,3,'invalid serial','123456',NULL,NULL,NULL),
(15,3,'invalid serial','1234567',NULL,NULL,NULL),
(16,3,'invalid serial','12345678',NULL,NULL,NULL),
(17,3,'invalid serial','123456789',NULL,NULL,NULL),
(18,3,'invalid serial','1234567890',NULL,NULL,NULL),
(19,3,'invalid serial','123456789000',NULL,NULL,NULL),
(20,3,'invalid serial','12345678901234567',NULL,NULL,NULL),
(21,3,'invalid serial','NNNNNNN',NULL,NULL,NULL),
(22,3,'invalid serial','xxxxxxxxxxx',NULL,NULL,NULL),
(23,3,'invalid serial','EVAL',NULL,NULL,NULL),
(24,3,'invalid serial','IATPASS',NULL,NULL,NULL),
(25,3,'invalid serial','none',NULL,NULL,NULL),
(26,3,'invalid serial','To Be Filled By O.E.M.',NULL,NULL,NULL),
(27,3,'invalid serial','Tulip Computers',NULL,NULL,NULL),
(28,3,'invalid serial','Serial Number xxxxxx',NULL,NULL,NULL),
(29,3,'invalid serial','SN-123456fvgv3i0b8o5n6n7k',NULL,NULL,NULL),
(30,3,'invalid serial','Unknow',NULL,NULL,NULL),
(31,3,'invalid serial','System Serial Number',NULL,NULL,NULL),
(32,3,'invalid serial','MB-1234567890',NULL,NULL,NULL),
(33,3,'invalid serial','empty',NULL,NULL,NULL),
(34,3,'invalid serial','Not Specified',NULL,NULL,NULL),
(35,3,'invalid serial','OEM_Serial',NULL,NULL,NULL),
(36,3,'invalid serial','SystemSerialNumb',NULL,NULL,NULL),
(37,4,'invalid UUID','FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF',NULL,NULL,NULL),
(38,4,'invalid UUID','03000200-0400-0500-0006-000700080009',NULL,NULL,NULL),
(39,4,'invalid UUID','6AB5B300-538D-1014-9FB5-B0684D007B53',NULL,NULL,NULL),
(40,4,'invalid UUID','01010101-0101-0101-0101-010101010101',NULL,NULL,NULL),
(41,4,'invalid UUID','2',NULL,NULL,NULL),
(42,2,'empty MAC','',NULL,NULL,NULL),
(43,2,'invalid MAC','20:41:53:59:4e:ff',NULL,NULL,NULL),
(44,2,'invalid MAC','02:00:4e:43:50:49',NULL,NULL,NULL),
(45,2,'invalid MAC','e2:e6:16:20:0a:35',NULL,NULL,NULL),
(46,2,'invalid MAC','d2:0a:2d:a0:04:be',NULL,NULL,NULL),
(47,2,'invalid MAC','00:a0:c6:00:00:00',NULL,NULL,NULL),
(48,2,'invalid MAC','d2:6b:25:2f:2c:e7',NULL,NULL,NULL),
(49,2,'invalid MAC','33:50:6f:45:30:30',NULL,NULL,NULL),
(50,2,'invalid MAC','0a:00:27:00:00:00',NULL,NULL,NULL),
(51,2,'invalid MAC','00:50:56:C0:00:01',NULL,NULL,NULL),
(52,2,'invalid MAC','00:50:56:C0:00:08',NULL,NULL,NULL),
(53,2,'invalid MAC','02:80:37:EC:02:00',NULL,NULL,NULL),
(54,2,'invalid MAC','50:50:54:50:30:30',NULL,NULL,NULL),
(55,2,'invalid MAC','24:b6:20:52:41:53',NULL,NULL,NULL),
(56,2,'invalid MAC','00:50:56:C0:00:02',NULL,NULL,NULL),
(57,2,'invalid MAC','/00:50:56:C0:[0-9a-f]+:[0-9a-f]+/i',NULL,NULL,NULL),
(58,2,'invalid MAC','FE:FF:FF:FF:FF:FF',NULL,NULL,NULL),
(59,2,'invalid MAC','00:00:00:00:00:00',NULL,NULL,NULL),
(60,2,'invalid MAC','00:0b:ca:fe:00:00',NULL,NULL,NULL),
(61,6,'Unknow','Unknow',NULL,NULL,NULL),
(62,6,'To Be Filled By O.E.M.','To Be Filled By O.E.M.',NULL,NULL,NULL),
(63,6,'*','*',NULL,NULL,NULL),
(64,6,'System Product Name','System Product Name',NULL,NULL,NULL),
(65,6,'Product Name','Product Name',NULL,NULL,NULL),
(66,6,'System Name','System Name',NULL,NULL,NULL),
(67,6,'All Series','All Series',NULL,NULL,NULL),
(68,8,'System manufacturer','System manufacturer',NULL,NULL,NULL),
(69,1,'empty IP','',NULL,NULL,NULL),
(70,1,'zero IP','0.0.0.0',NULL,NULL,NULL),
(71,1,'localhost','127.0.0.1',NULL,NULL,NULL),
(72,1,'IPV6 localhost','::1',NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_blacklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_budgets`
--

DROP TABLE IF EXISTS `glpi_budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_budgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `value` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `budgettypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `entities_id` (`entities_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `is_template` (`is_template`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `locations_id` (`locations_id`),
  KEY `budgettypes_id` (`budgettypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_budgets`
--

LOCK TABLES `glpi_budgets` WRITE;
/*!40000 ALTER TABLE `glpi_budgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_budgettypes`
--

DROP TABLE IF EXISTS `glpi_budgettypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_budgettypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_budgettypes`
--

LOCK TABLES `glpi_budgettypes` WRITE;
/*!40000 ALTER TABLE `glpi_budgettypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_budgettypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_businesscriticities`
--

DROP TABLE IF EXISTS `glpi_businesscriticities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_businesscriticities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `businesscriticities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`businesscriticities_id`,`name`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_businesscriticities`
--

LOCK TABLES `glpi_businesscriticities` WRITE;
/*!40000 ALTER TABLE `glpi_businesscriticities` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_businesscriticities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_cables`
--

DROP TABLE IF EXISTS `glpi_cables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_cables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `itemtype_endpoint_a` varchar(255) DEFAULT NULL,
  `itemtype_endpoint_b` varchar(255) DEFAULT NULL,
  `items_id_endpoint_a` int(10) unsigned NOT NULL DEFAULT 0,
  `items_id_endpoint_b` int(10) unsigned NOT NULL DEFAULT 0,
  `socketmodels_id_endpoint_a` int(10) unsigned NOT NULL DEFAULT 0,
  `socketmodels_id_endpoint_b` int(10) unsigned NOT NULL DEFAULT 0,
  `sockets_id_endpoint_a` int(10) unsigned NOT NULL DEFAULT 0,
  `sockets_id_endpoint_b` int(10) unsigned NOT NULL DEFAULT 0,
  `cablestrands_id` int(10) unsigned NOT NULL DEFAULT 0,
  `color` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `cabletypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `item_endpoint_a` (`itemtype_endpoint_a`,`items_id_endpoint_a`),
  KEY `item_endpoint_b` (`itemtype_endpoint_b`,`items_id_endpoint_b`),
  KEY `items_id_endpoint_b` (`items_id_endpoint_b`),
  KEY `items_id_endpoint_a` (`items_id_endpoint_a`),
  KEY `socketmodels_id_endpoint_a` (`socketmodels_id_endpoint_a`),
  KEY `socketmodels_id_endpoint_b` (`socketmodels_id_endpoint_b`),
  KEY `sockets_id_endpoint_a` (`sockets_id_endpoint_a`),
  KEY `sockets_id_endpoint_b` (`sockets_id_endpoint_b`),
  KEY `cablestrands_id` (`cablestrands_id`),
  KEY `states_id` (`states_id`),
  KEY `complete` (`entities_id`,`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `cabletypes_id` (`cabletypes_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_cables`
--

LOCK TABLES `glpi_cables` WRITE;
/*!40000 ALTER TABLE `glpi_cables` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_cables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_cablestrands`
--

DROP TABLE IF EXISTS `glpi_cablestrands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_cablestrands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_cablestrands`
--

LOCK TABLES `glpi_cablestrands` WRITE;
/*!40000 ALTER TABLE `glpi_cablestrands` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_cablestrands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_cabletypes`
--

DROP TABLE IF EXISTS `glpi_cabletypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_cabletypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_cabletypes`
--

LOCK TABLES `glpi_cabletypes` WRITE;
/*!40000 ALTER TABLE `glpi_cabletypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_cabletypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_calendars`
--

DROP TABLE IF EXISTS `glpi_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_calendars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `cache_duration` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_calendars`
--

LOCK TABLES `glpi_calendars` WRITE;
/*!40000 ALTER TABLE `glpi_calendars` DISABLE KEYS */;
INSERT INTO `glpi_calendars` VALUES
(1,'Default',0,1,'Default calendar',NULL,'[0,43200,43200,43200,43200,43200,0]',NULL);
/*!40000 ALTER TABLE `glpi_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_calendars_holidays`
--

DROP TABLE IF EXISTS `glpi_calendars_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_calendars_holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calendars_id` int(10) unsigned NOT NULL DEFAULT 0,
  `holidays_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`calendars_id`,`holidays_id`),
  KEY `holidays_id` (`holidays_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_calendars_holidays`
--

LOCK TABLES `glpi_calendars_holidays` WRITE;
/*!40000 ALTER TABLE `glpi_calendars_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_calendars_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_calendarsegments`
--

DROP TABLE IF EXISTS `glpi_calendarsegments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_calendarsegments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calendars_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `day` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'numer of the day based on date(w)',
  `begin` time DEFAULT NULL,
  `end` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendars_id` (`calendars_id`),
  KEY `day` (`day`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_calendarsegments`
--

LOCK TABLES `glpi_calendarsegments` WRITE;
/*!40000 ALTER TABLE `glpi_calendarsegments` DISABLE KEYS */;
INSERT INTO `glpi_calendarsegments` VALUES
(1,1,0,0,1,'08:00:00','20:00:00'),
(2,1,0,0,2,'08:00:00','20:00:00'),
(3,1,0,0,3,'08:00:00','20:00:00'),
(4,1,0,0,4,'08:00:00','20:00:00'),
(5,1,0,0,5,'08:00:00','20:00:00');
/*!40000 ALTER TABLE `glpi_calendarsegments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_cartridgeitems`
--

DROP TABLE IF EXISTS `glpi_cartridgeitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_cartridgeitems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `cartridgeitemtypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `alarm_threshold` int(11) NOT NULL DEFAULT 10,
  `stock_target` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `cartridgeitemtypes_id` (`cartridgeitemtypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `alarm_threshold` (`alarm_threshold`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_cartridgeitems`
--

LOCK TABLES `glpi_cartridgeitems` WRITE;
/*!40000 ALTER TABLE `glpi_cartridgeitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_cartridgeitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_cartridgeitems_printermodels`
--

DROP TABLE IF EXISTS `glpi_cartridgeitems_printermodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_cartridgeitems_printermodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cartridgeitems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `printermodels_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`printermodels_id`,`cartridgeitems_id`),
  KEY `cartridgeitems_id` (`cartridgeitems_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_cartridgeitems_printermodels`
--

LOCK TABLES `glpi_cartridgeitems_printermodels` WRITE;
/*!40000 ALTER TABLE `glpi_cartridgeitems_printermodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_cartridgeitems_printermodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_cartridgeitemtypes`
--

DROP TABLE IF EXISTS `glpi_cartridgeitemtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_cartridgeitemtypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_cartridgeitemtypes`
--

LOCK TABLES `glpi_cartridgeitemtypes` WRITE;
/*!40000 ALTER TABLE `glpi_cartridgeitemtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_cartridgeitemtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_cartridges`
--

DROP TABLE IF EXISTS `glpi_cartridges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_cartridges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `cartridgeitems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `printers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_in` date DEFAULT NULL,
  `date_use` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `pages` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cartridgeitems_id` (`cartridgeitems_id`),
  KEY `printers_id` (`printers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_cartridges`
--

LOCK TABLES `glpi_cartridges` WRITE;
/*!40000 ALTER TABLE `glpi_cartridges` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_cartridges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_certificates`
--

DROP TABLE IF EXISTS `glpi_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_certificates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `certificatetypes_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'RELATION to glpi_certificatetypes (id)',
  `dns_name` varchar(255) DEFAULT NULL,
  `dns_suffix` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'RELATION to glpi_users (id)',
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'RELATION to glpi_groups (id)',
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'RELATION to glpi_locations (id)',
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'RELATION to glpi_manufacturers (id)',
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_autosign` tinyint(4) NOT NULL DEFAULT 0,
  `date_expiration` date DEFAULT NULL,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'RELATION to states (id)',
  `command` text DEFAULT NULL,
  `certificate_request` text DEFAULT NULL,
  `certificate_item` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_template` (`is_template`),
  KEY `is_deleted` (`is_deleted`),
  KEY `certificatetypes_id` (`certificatetypes_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `states_id` (`states_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_certificates`
--

LOCK TABLES `glpi_certificates` WRITE;
/*!40000 ALTER TABLE `glpi_certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_certificates_items`
--

DROP TABLE IF EXISTS `glpi_certificates_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_certificates_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `certificates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'RELATION to various tables, according to itemtype (id)',
  `itemtype` varchar(100) NOT NULL COMMENT 'see .class.php file',
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`certificates_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_certificates_items`
--

LOCK TABLES `glpi_certificates_items` WRITE;
/*!40000 ALTER TABLE `glpi_certificates_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_certificates_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_certificatetypes`
--

DROP TABLE IF EXISTS `glpi_certificatetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_certificatetypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_certificatetypes`
--

LOCK TABLES `glpi_certificatetypes` WRITE;
/*!40000 ALTER TABLE `glpi_certificatetypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_certificatetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changecosts`
--

DROP TABLE IF EXISTS `glpi_changecosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changecosts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `cost_time` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_material` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `budgets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `changes_id` (`changes_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changecosts`
--

LOCK TABLES `glpi_changecosts` WRITE;
/*!40000 ALTER TABLE `glpi_changecosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changecosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changes`
--

DROP TABLE IF EXISTS `glpi_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `content` longtext DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `solvedate` timestamp NULL DEFAULT NULL,
  `closedate` timestamp NULL DEFAULT NULL,
  `time_to_resolve` timestamp NULL DEFAULT NULL,
  `users_id_recipient` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_lastupdater` int(10) unsigned NOT NULL DEFAULT 0,
  `urgency` int(11) NOT NULL DEFAULT 1,
  `impact` int(11) NOT NULL DEFAULT 1,
  `priority` int(11) NOT NULL DEFAULT 1,
  `itilcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `impactcontent` longtext DEFAULT NULL,
  `controlistcontent` longtext DEFAULT NULL,
  `rolloutplancontent` longtext DEFAULT NULL,
  `backoutplancontent` longtext DEFAULT NULL,
  `checklistcontent` longtext DEFAULT NULL,
  `global_validation` int(11) NOT NULL DEFAULT 1,
  `validation_percent` int(11) NOT NULL DEFAULT 0,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `begin_waiting_date` timestamp NULL DEFAULT NULL,
  `waiting_duration` int(11) NOT NULL DEFAULT 0,
  `close_delay_stat` int(11) NOT NULL DEFAULT 0,
  `solve_delay_stat` int(11) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `date_mod` (`date_mod`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `solvedate` (`solvedate`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `time_to_resolve` (`time_to_resolve`),
  KEY `global_validation` (`global_validation`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `date_creation` (`date_creation`),
  KEY `locations_id` (`locations_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changes`
--

LOCK TABLES `glpi_changes` WRITE;
/*!40000 ALTER TABLE `glpi_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changes_groups`
--

DROP TABLE IF EXISTS `glpi_changes_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changes_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changes_groups`
--

LOCK TABLES `glpi_changes_groups` WRITE;
/*!40000 ALTER TABLE `glpi_changes_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changes_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changes_items`
--

DROP TABLE IF EXISTS `glpi_changes_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changes_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changes_items`
--

LOCK TABLES `glpi_changes_items` WRITE;
/*!40000 ALTER TABLE `glpi_changes_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changes_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changes_problems`
--

DROP TABLE IF EXISTS `glpi_changes_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changes_problems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `problems_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`problems_id`),
  KEY `problems_id` (`problems_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changes_problems`
--

LOCK TABLES `glpi_changes_problems` WRITE;
/*!40000 ALTER TABLE `glpi_changes_problems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changes_problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changes_suppliers`
--

DROP TABLE IF EXISTS `glpi_changes_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changes_suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `suppliers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 0,
  `alternative_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`type`,`suppliers_id`),
  KEY `group` (`suppliers_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changes_suppliers`
--

LOCK TABLES `glpi_changes_suppliers` WRITE;
/*!40000 ALTER TABLE `glpi_changes_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changes_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changes_tickets`
--

DROP TABLE IF EXISTS `glpi_changes_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changes_tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tickets_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`tickets_id`),
  KEY `tickets_id` (`tickets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changes_tickets`
--

LOCK TABLES `glpi_changes_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_changes_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changes_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changes_users`
--

DROP TABLE IF EXISTS `glpi_changes_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changes_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `changes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 0,
  `alternative_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changes_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changes_users`
--

LOCK TABLES `glpi_changes_users` WRITE;
/*!40000 ALTER TABLE `glpi_changes_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changes_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changetasks`
--

DROP TABLE IF EXISTS `glpi_changetasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changetasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `changes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `taskcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `state` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_editor` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `tasktemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  `is_private` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `changes_id` (`changes_id`),
  KEY `state` (`state`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `tasktemplates_id` (`tasktemplates_id`),
  KEY `is_private` (`is_private`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changetasks`
--

LOCK TABLES `glpi_changetasks` WRITE;
/*!40000 ALTER TABLE `glpi_changetasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changetasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changetemplatehiddenfields`
--

DROP TABLE IF EXISTS `glpi_changetemplatehiddenfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changetemplatehiddenfields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `changetemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changetemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changetemplatehiddenfields`
--

LOCK TABLES `glpi_changetemplatehiddenfields` WRITE;
/*!40000 ALTER TABLE `glpi_changetemplatehiddenfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changetemplatehiddenfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changetemplatemandatoryfields`
--

DROP TABLE IF EXISTS `glpi_changetemplatemandatoryfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changetemplatemandatoryfields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `changetemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`changetemplates_id`,`num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changetemplatemandatoryfields`
--

LOCK TABLES `glpi_changetemplatemandatoryfields` WRITE;
/*!40000 ALTER TABLE `glpi_changetemplatemandatoryfields` DISABLE KEYS */;
INSERT INTO `glpi_changetemplatemandatoryfields` VALUES
(1,1,21);
/*!40000 ALTER TABLE `glpi_changetemplatemandatoryfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changetemplatepredefinedfields`
--

DROP TABLE IF EXISTS `glpi_changetemplatepredefinedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changetemplatepredefinedfields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `changetemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `changetemplates_id` (`changetemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changetemplatepredefinedfields`
--

LOCK TABLES `glpi_changetemplatepredefinedfields` WRITE;
/*!40000 ALTER TABLE `glpi_changetemplatepredefinedfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changetemplatepredefinedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changetemplates`
--

DROP TABLE IF EXISTS `glpi_changetemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changetemplates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changetemplates`
--

LOCK TABLES `glpi_changetemplates` WRITE;
/*!40000 ALTER TABLE `glpi_changetemplates` DISABLE KEYS */;
INSERT INTO `glpi_changetemplates` VALUES
(1,'Default',0,1,NULL);
/*!40000 ALTER TABLE `glpi_changetemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_changevalidations`
--

DROP TABLE IF EXISTS `glpi_changevalidations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_changevalidations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `changes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_validate` int(10) unsigned NOT NULL DEFAULT 0,
  `comment_submission` text DEFAULT NULL,
  `comment_validation` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `submission_date` timestamp NULL DEFAULT NULL,
  `validation_date` timestamp NULL DEFAULT NULL,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `users_id` (`users_id`),
  KEY `users_id_validate` (`users_id_validate`),
  KEY `changes_id` (`changes_id`),
  KEY `submission_date` (`submission_date`),
  KEY `validation_date` (`validation_date`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_changevalidations`
--

LOCK TABLES `glpi_changevalidations` WRITE;
/*!40000 ALTER TABLE `glpi_changevalidations` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_changevalidations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_clusters`
--

DROP TABLE IF EXISTS `glpi_clusters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_clusters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'RELATION to states (id)',
  `comment` text DEFAULT NULL,
  `clustertypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `group_id_tech` (`groups_id_tech`),
  KEY `is_deleted` (`is_deleted`),
  KEY `states_id` (`states_id`),
  KEY `clustertypes_id` (`clustertypes_id`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_clusters`
--

LOCK TABLES `glpi_clusters` WRITE;
/*!40000 ALTER TABLE `glpi_clusters` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_clusters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_clustertypes`
--

DROP TABLE IF EXISTS `glpi_clustertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_clustertypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_clustertypes`
--

LOCK TABLES `glpi_clustertypes` WRITE;
/*!40000 ALTER TABLE `glpi_clustertypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_clustertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_computerantiviruses`
--

DROP TABLE IF EXISTS `glpi_computerantiviruses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_computerantiviruses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `computers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `antivirus_version` varchar(255) DEFAULT NULL,
  `signature_version` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_uptodate` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_expiration` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `antivirus_version` (`antivirus_version`),
  KEY `signature_version` (`signature_version`),
  KEY `is_active` (`is_active`),
  KEY `is_uptodate` (`is_uptodate`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted` (`is_deleted`),
  KEY `computers_id` (`computers_id`),
  KEY `date_expiration` (`date_expiration`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `manufacturers_id` (`manufacturers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_computerantiviruses`
--

LOCK TABLES `glpi_computerantiviruses` WRITE;
/*!40000 ALTER TABLE `glpi_computerantiviruses` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_computerantiviruses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_computermodels`
--

DROP TABLE IF EXISTS `glpi_computermodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_computermodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_computermodels`
--

LOCK TABLES `glpi_computermodels` WRITE;
/*!40000 ALTER TABLE `glpi_computermodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_computermodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_computers`
--

DROP TABLE IF EXISTS `glpi_computers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_computers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `autoupdatesystems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `networks_id` int(10) unsigned NOT NULL DEFAULT 0,
  `computermodels_id` int(10) unsigned NOT NULL DEFAULT 0,
  `computertypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  `last_boot` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `computermodels_id` (`computermodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `computertypes_id` (`computertypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_computers`
--

LOCK TABLES `glpi_computers` WRITE;
/*!40000 ALTER TABLE `glpi_computers` DISABLE KEYS */;
INSERT INTO `glpi_computers` VALUES
(1,0,'computer1','','','','',0,1,'','2024-11-25 14:26:27',0,0,0,0,0,0,NULL,0,0,0,0,1,0,0.0000,'','2024-11-25 13:48:16',0,NULL,NULL);
/*!40000 ALTER TABLE `glpi_computers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_computers_items`
--

DROP TABLE IF EXISTS `glpi_computers_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_computers_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'RELATION to various table, according to itemtype (ID)',
  `computers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_computers_items`
--

LOCK TABLES `glpi_computers_items` WRITE;
/*!40000 ALTER TABLE `glpi_computers_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_computers_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_computertypes`
--

DROP TABLE IF EXISTS `glpi_computertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_computertypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_computertypes`
--

LOCK TABLES `glpi_computertypes` WRITE;
/*!40000 ALTER TABLE `glpi_computertypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_computertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_computervirtualmachines`
--

DROP TABLE IF EXISTS `glpi_computervirtualmachines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_computervirtualmachines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `computers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `virtualmachinestates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `virtualmachinesystems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `virtualmachinetypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `vcpu` int(11) NOT NULL DEFAULT 0,
  `ram` int(10) unsigned DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `name` (`name`),
  KEY `virtualmachinestates_id` (`virtualmachinestates_id`),
  KEY `virtualmachinesystems_id` (`virtualmachinesystems_id`),
  KEY `vcpu` (`vcpu`),
  KEY `ram` (`ram`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `uuid` (`uuid`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `virtualmachinetypes_id` (`virtualmachinetypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_computervirtualmachines`
--

LOCK TABLES `glpi_computervirtualmachines` WRITE;
/*!40000 ALTER TABLE `glpi_computervirtualmachines` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_computervirtualmachines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_configs`
--

DROP TABLE IF EXISTS `glpi_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_configs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `context` varchar(150) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`context`,`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_configs`
--

LOCK TABLES `glpi_configs` WRITE;
/*!40000 ALTER TABLE `glpi_configs` DISABLE KEYS */;
INSERT INTO `glpi_configs` VALUES
(1,'core','version','10.0.17'),
(2,'core','show_jobs_at_login','0'),
(3,'core','cut','250'),
(4,'core','list_limit','15'),
(5,'core','list_limit_max','50'),
(6,'core','url_maxlength','30'),
(7,'core','event_loglevel','5'),
(8,'core','notifications_mailing','0'),
(9,'core','admin_email','admsys@localhost'),
(10,'core','admin_email_name',''),
(11,'core','from_email',''),
(12,'core','from_email_name',''),
(13,'core','noreply_email',''),
(14,'core','noreply_email_name',''),
(15,'core','replyto_email',''),
(16,'core','replyto_email_name',''),
(17,'core','mailing_signature','SIGNATURE'),
(18,'core','use_anonymous_helpdesk','0'),
(19,'core','use_anonymous_followups','0'),
(20,'core','language','en_GB'),
(21,'core','priority_1','#fff2f2'),
(22,'core','priority_2','#ffe0e0'),
(23,'core','priority_3','#ffcece'),
(24,'core','priority_4','#ffbfbf'),
(25,'core','priority_5','#ffadad'),
(26,'core','priority_6','#ff5555'),
(27,'core','date_tax','2005-12-31'),
(28,'core','cas_host',''),
(29,'core','cas_port','443'),
(30,'core','cas_uri',''),
(31,'core','cas_logout',''),
(32,'core','cas_version','CAS_VERSION_2_0'),
(33,'core','existing_auth_server_field_clean_domain','0'),
(34,'core','planning_begin','08:00:00'),
(35,'core','planning_end','20:00:00'),
(36,'core','utf8_conv','1'),
(37,'core','use_public_faq','0'),
(38,'core','url_base','http://localhost/glpi'),
(39,'core','show_link_in_mail','0'),
(40,'core','text_login',''),
(41,'core','founded_new_version',''),
(42,'core','dropdown_max','100'),
(43,'core','ajax_wildcard','*'),
(44,'core','ajax_limit_count','10'),
(45,'core','is_users_auto_add','1'),
(46,'core','date_format','0'),
(47,'core','number_format','0'),
(48,'core','csv_delimiter',';'),
(49,'core','is_ids_visible','0'),
(50,'core','smtp_mode','0'),
(51,'core','smtp_host',''),
(52,'core','smtp_port','25'),
(53,'core','smtp_username',''),
(54,'core','smtp_oauth_provider',''),
(55,'core','smtp_oauth_client_id',''),
(56,'core','smtp_oauth_client_secret',''),
(57,'core','smtp_oauth_options','{}'),
(58,'core','smtp_oauth_refresh_token',''),
(59,'core','proxy_name',''),
(60,'core','proxy_port','8080'),
(61,'core','proxy_user',''),
(62,'core','add_followup_on_update_ticket','1'),
(63,'core','keep_tickets_on_delete','0'),
(64,'core','time_step','5'),
(65,'core','decimal_number','2'),
(66,'core','helpdesk_doc_url',''),
(67,'core','central_doc_url',''),
(68,'core','documentcategories_id_forticket','0'),
(69,'core','monitors_management_restrict','2'),
(70,'core','phones_management_restrict','2'),
(71,'core','peripherals_management_restrict','2'),
(72,'core','printers_management_restrict','2'),
(73,'core','use_log_in_files','1'),
(74,'core','time_offset','0'),
(75,'core','is_contact_autoupdate','1'),
(76,'core','is_user_autoupdate','1'),
(77,'core','is_group_autoupdate','1'),
(78,'core','is_location_autoupdate','1'),
(79,'core','state_autoupdate_mode','0'),
(80,'core','is_contact_autoclean','0'),
(81,'core','is_user_autoclean','0'),
(82,'core','is_group_autoclean','0'),
(83,'core','is_location_autoclean','0'),
(84,'core','state_autoclean_mode','0'),
(85,'core','use_flat_dropdowntree','0'),
(86,'core','use_flat_dropdowntree_on_search_result','1'),
(87,'core','use_autoname_by_entity','1'),
(88,'core','softwarecategories_id_ondelete','1'),
(89,'core','x509_email_field',''),
(90,'core','x509_cn_restrict',''),
(91,'core','x509_o_restrict',''),
(92,'core','x509_ou_restrict',''),
(93,'core','default_mailcollector_filesize_max','2097152'),
(94,'core','followup_private','0'),
(95,'core','task_private','0'),
(96,'core','default_software_helpdesk_visible','1'),
(97,'core','names_format','0'),
(98,'core','default_requesttypes_id','1'),
(99,'core','use_noright_users_add','1'),
(100,'core','cron_limit','5'),
(101,'core','priority_matrix','{\"1\":{\"1\":1,\"2\":1,\"3\":2,\"4\":2,\"5\":2},\"2\":{\"1\":1,\"2\":2,\"3\":2,\"4\":3,\"5\":3},\"3\":{\"1\":2,\"2\":2,\"3\":3,\"4\":4,\"5\":4},\"4\":{\"1\":2,\"2\":3,\"3\":4,\"4\":4,\"5\":5},\"5\":{\"1\":2,\"2\":3,\"3\":4,\"4\":5,\"5\":5}}'),
(102,'core','urgency_mask','62'),
(103,'core','impact_mask','62'),
(104,'core','user_deleted_ldap','0'),
(105,'core','user_restored_ldap','0'),
(106,'core','auto_create_infocoms','0'),
(107,'core','use_slave_for_search','0'),
(108,'core','proxy_passwd',''),
(109,'core','smtp_passwd',''),
(110,'core','show_count_on_tabs','1'),
(111,'core','refresh_views','0'),
(112,'core','set_default_tech','1'),
(113,'core','allow_search_view','2'),
(114,'core','allow_search_all','0'),
(115,'core','allow_search_global','1'),
(116,'core','display_count_on_home','5'),
(117,'core','use_password_security','0'),
(118,'core','password_min_length','8'),
(119,'core','password_need_number','1'),
(120,'core','password_need_letter','1'),
(121,'core','password_need_caps','1'),
(122,'core','password_need_symbol','1'),
(123,'core','use_check_pref','0'),
(124,'core','notification_to_myself','1'),
(125,'core','duedateok_color','#06ff00'),
(126,'core','duedatewarning_color','#ffb800'),
(127,'core','duedatecritical_color','#ff0000'),
(128,'core','duedatewarning_less','20'),
(129,'core','duedatecritical_less','5'),
(130,'core','duedatewarning_unit','%'),
(131,'core','duedatecritical_unit','%'),
(132,'core','realname_ssofield',''),
(133,'core','firstname_ssofield',''),
(134,'core','email1_ssofield',''),
(135,'core','email2_ssofield',''),
(136,'core','email3_ssofield',''),
(137,'core','email4_ssofield',''),
(138,'core','phone_ssofield',''),
(139,'core','phone2_ssofield',''),
(140,'core','mobile_ssofield',''),
(141,'core','comment_ssofield',''),
(142,'core','title_ssofield',''),
(143,'core','category_ssofield',''),
(144,'core','language_ssofield',''),
(145,'core','entity_ssofield',''),
(146,'core','registration_number_ssofield',''),
(147,'core','ssovariables_id','0'),
(148,'core','ssologout_url',''),
(149,'core','translate_kb','0'),
(150,'core','translate_dropdowns','0'),
(151,'core','translate_reminders','0'),
(152,'core','pdffont','dejavusans'),
(153,'core','keep_devices_when_purging_item','0'),
(154,'core','maintenance_mode','0'),
(155,'core','maintenance_text',''),
(156,'core','attach_ticket_documents_to_mail','0'),
(157,'core','backcreated','0'),
(158,'core','task_state','1'),
(159,'core','palette','auror'),
(160,'core','page_layout','vertical'),
(161,'core','fold_menu','0'),
(162,'core','fold_search','0'),
(163,'core','savedsearches_pinned','0'),
(164,'core','timeline_order','natural'),
(165,'core','itil_layout',''),
(166,'core','richtext_layout','classic'),
(167,'core','lock_use_lock_item','0'),
(168,'core','lock_autolock_mode','1'),
(169,'core','lock_directunlock_notification','0'),
(170,'core','lock_item_list','[]'),
(171,'core','lock_lockprofile_id','8'),
(172,'core','set_default_requester','1'),
(173,'core','highcontrast_css','0'),
(174,'core','default_central_tab','0'),
(175,'core','smtp_check_certificate','1'),
(176,'core','enable_api','1'),
(177,'core','enable_api_login_credentials','0'),
(178,'core','enable_api_login_external_token','1'),
(179,'core','url_base_api','http://localhost/glpi/api'),
(180,'core','login_remember_time','604800'),
(181,'core','login_remember_default','1'),
(182,'core','use_notifications','0'),
(183,'core','notifications_ajax','0'),
(184,'core','notifications_ajax_check_interval','5'),
(185,'core','notifications_ajax_sound',NULL),
(186,'core','notifications_ajax_icon_url','/pics/glpi.png'),
(187,'core','dbversion','10.0.17@bde16719fbd4112f59a9a7d34c66c959bce73434'),
(188,'core','smtp_max_retries','5'),
(189,'core','smtp_sender',NULL),
(190,'core','instance_uuid',NULL),
(191,'core','registration_uuid',NULL),
(192,'core','smtp_retry_time','5'),
(193,'core','purge_addrelation','0'),
(194,'core','purge_deleterelation','0'),
(195,'core','purge_createitem','0'),
(196,'core','purge_deleteitem','0'),
(197,'core','purge_restoreitem','0'),
(198,'core','purge_updateitem','0'),
(199,'core','purge_item_software_install','0'),
(200,'core','purge_software_item_install','0'),
(201,'core','purge_software_version_install','0'),
(202,'core','purge_infocom_creation','0'),
(203,'core','purge_profile_user','0'),
(204,'core','purge_group_user','0'),
(205,'core','purge_adddevice','0'),
(206,'core','purge_updatedevice','0'),
(207,'core','purge_deletedevice','0'),
(208,'core','purge_connectdevice','0'),
(209,'core','purge_disconnectdevice','0'),
(210,'core','purge_userdeletedfromldap','0'),
(211,'core','purge_comments','0'),
(212,'core','purge_datemod','0'),
(213,'core','purge_all','0'),
(214,'core','purge_user_auth_changes','0'),
(215,'core','purge_plugins','0'),
(216,'core','purge_refusedequipment','0'),
(217,'core','display_login_source','1'),
(218,'core','devices_in_menu','[\"Item_DeviceSimcard\"]'),
(219,'core','password_expiration_delay','-1'),
(220,'core','password_expiration_notice','-1'),
(221,'core','password_expiration_lock_delay','-1'),
(222,'core','default_dashboard_central','central'),
(223,'core','default_dashboard_assets','assets'),
(224,'core','default_dashboard_helpdesk','assistance'),
(225,'core','default_dashboard_mini_ticket','mini_tickets'),
(226,'core','impact_enabled_itemtypes','[\"Appliance\",\"Cluster\",\"Computer\",\"Datacenter\",\"DCRoom\",\"Domain\",\"Enclosure\",\"Monitor\",\"NetworkEquipment\",\"PDU\",\"Peripheral\",\"Phone\",\"Printer\",\"Rack\",\"Software\",\"DatabaseInstance\"]'),
(227,'core','document_max_size','2'),
(228,'core','planning_work_days','[0,1,2,3,4,5,6]'),
(229,'core','system_user','6'),
(230,'core','support_legacy_data','0'),
(231,'core','initialized_rules_collections','[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\",\"RuleAssetCollection\",\"RuleDictionnaryOperatingSystemCollection\",\"RuleDictionnaryOperatingSystemVersionCollection\",\"RuleDictionnaryOperatingSystemEditionCollection\"]'),
(232,'core','timeline_action_btn_layout','0'),
(233,'core','timeline_date_format','0'),
(234,'inventory','enabled_inventory','0'),
(235,'inventory','import_software','1'),
(236,'inventory','import_volume','1'),
(237,'inventory','import_antivirus','1'),
(238,'inventory','import_registry','1'),
(239,'inventory','import_process','1'),
(240,'inventory','import_vm','1'),
(241,'inventory','import_monitor_on_partial_sn','0'),
(242,'inventory','import_unmanaged','1'),
(243,'inventory','component_processor','1'),
(244,'inventory','component_memory','1'),
(245,'inventory','component_harddrive','1'),
(246,'inventory','component_networkcard','1'),
(247,'inventory','component_graphiccard','1'),
(248,'inventory','component_soundcard','1'),
(249,'inventory','component_drive','1'),
(250,'inventory','component_networkdrive','1'),
(251,'inventory','component_networkcardvirtual','1'),
(252,'inventory','component_control','1'),
(253,'inventory','component_battery','1'),
(254,'inventory','component_simcard','1'),
(255,'inventory','states_id_default','0'),
(256,'inventory','entities_id_default','0'),
(257,'inventory','location','0'),
(258,'inventory','group','0'),
(259,'inventory','vm_type','0'),
(260,'inventory','vm_components','0'),
(261,'inventory','vm_as_computer','0'),
(262,'inventory','component_removablemedia','1'),
(263,'inventory','component_powersupply','1'),
(264,'inventory','inventory_frequency','24'),
(265,'inventory','import_monitor','1'),
(266,'inventory','import_printer','1'),
(267,'inventory','import_peripheral','1'),
(268,'inventory','stale_agents_delay','0'),
(269,'inventory','stale_agents_action','[0]'),
(270,'inventory','stale_agents_status','0');
/*!40000 ALTER TABLE `glpi_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_consumableitems`
--

DROP TABLE IF EXISTS `glpi_consumableitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_consumableitems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `consumableitemtypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `alarm_threshold` int(11) NOT NULL DEFAULT 10,
  `stock_target` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `consumableitemtypes_id` (`consumableitemtypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `alarm_threshold` (`alarm_threshold`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `otherserial` (`otherserial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_consumableitems`
--

LOCK TABLES `glpi_consumableitems` WRITE;
/*!40000 ALTER TABLE `glpi_consumableitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_consumableitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_consumableitemtypes`
--

DROP TABLE IF EXISTS `glpi_consumableitemtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_consumableitemtypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_consumableitemtypes`
--

LOCK TABLES `glpi_consumableitemtypes` WRITE;
/*!40000 ALTER TABLE `glpi_consumableitemtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_consumableitemtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_consumables`
--

DROP TABLE IF EXISTS `glpi_consumables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_consumables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `consumableitems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_in` date DEFAULT NULL,
  `date_out` date DEFAULT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_in` (`date_in`),
  KEY `date_out` (`date_out`),
  KEY `consumableitems_id` (`consumableitems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_consumables`
--

LOCK TABLES `glpi_consumables` WRITE;
/*!40000 ALTER TABLE `glpi_consumables` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_consumables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_contacts`
--

DROP TABLE IF EXISTS `glpi_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contacttypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `usertitles_id` int(10) unsigned NOT NULL DEFAULT 0,
  `address` text DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `contacttypes_id` (`contacttypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `usertitles_id` (`usertitles_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_contacts`
--

LOCK TABLES `glpi_contacts` WRITE;
/*!40000 ALTER TABLE `glpi_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_contacts_suppliers`
--

DROP TABLE IF EXISTS `glpi_contacts_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_contacts_suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `suppliers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `contacts_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`suppliers_id`,`contacts_id`),
  KEY `contacts_id` (`contacts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_contacts_suppliers`
--

LOCK TABLES `glpi_contacts_suppliers` WRITE;
/*!40000 ALTER TABLE `glpi_contacts_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_contacts_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_contacttypes`
--

DROP TABLE IF EXISTS `glpi_contacttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_contacttypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_contacttypes`
--

LOCK TABLES `glpi_contacttypes` WRITE;
/*!40000 ALTER TABLE `glpi_contacttypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_contacttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_contractcosts`
--

DROP TABLE IF EXISTS `glpi_contractcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_contractcosts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contracts_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `budgets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `contracts_id` (`contracts_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_contractcosts`
--

LOCK TABLES `glpi_contractcosts` WRITE;
/*!40000 ALTER TABLE `glpi_contractcosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_contractcosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_contracts`
--

DROP TABLE IF EXISTS `glpi_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_contracts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `contracttypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `begin_date` date DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `notice` int(11) NOT NULL DEFAULT 0,
  `periodicity` int(11) NOT NULL DEFAULT 0,
  `billing` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `accounting_number` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `week_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `week_end_hour` time NOT NULL DEFAULT '00:00:00',
  `saturday_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `saturday_end_hour` time NOT NULL DEFAULT '00:00:00',
  `use_saturday` tinyint(4) NOT NULL DEFAULT 0,
  `sunday_begin_hour` time NOT NULL DEFAULT '00:00:00',
  `sunday_end_hour` time NOT NULL DEFAULT '00:00:00',
  `use_sunday` tinyint(4) NOT NULL DEFAULT 0,
  `max_links_allowed` int(11) NOT NULL DEFAULT 0,
  `alert` int(11) NOT NULL DEFAULT 0,
  `renewal` int(11) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `begin_date` (`begin_date`),
  KEY `name` (`name`),
  KEY `contracttypes_id` (`contracttypes_id`),
  KEY `locations_id` (`locations_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_template` (`is_template`),
  KEY `use_sunday` (`use_sunday`),
  KEY `use_saturday` (`use_saturday`),
  KEY `alert` (`alert`),
  KEY `states_id` (`states_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_contracts`
--

LOCK TABLES `glpi_contracts` WRITE;
/*!40000 ALTER TABLE `glpi_contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_contracts_items`
--

DROP TABLE IF EXISTS `glpi_contracts_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_contracts_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contracts_id` int(10) unsigned NOT NULL DEFAULT 0,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`contracts_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_contracts_items`
--

LOCK TABLES `glpi_contracts_items` WRITE;
/*!40000 ALTER TABLE `glpi_contracts_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_contracts_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_contracts_suppliers`
--

DROP TABLE IF EXISTS `glpi_contracts_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_contracts_suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `suppliers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `contracts_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`suppliers_id`,`contracts_id`),
  KEY `contracts_id` (`contracts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_contracts_suppliers`
--

LOCK TABLES `glpi_contracts_suppliers` WRITE;
/*!40000 ALTER TABLE `glpi_contracts_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_contracts_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_contracttypes`
--

DROP TABLE IF EXISTS `glpi_contracttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_contracttypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_contracttypes`
--

LOCK TABLES `glpi_contracttypes` WRITE;
/*!40000 ALTER TABLE `glpi_contracttypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_contracttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_crontasklogs`
--

DROP TABLE IF EXISTS `glpi_crontasklogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_crontasklogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crontasks_id` int(10) unsigned NOT NULL,
  `crontasklogs_id` int(10) unsigned NOT NULL COMMENT 'id of ''start'' event',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `state` int(11) NOT NULL COMMENT '0:start, 1:run, 2:stop',
  `elapsed` float NOT NULL COMMENT 'time elapsed since start',
  `volume` int(11) NOT NULL COMMENT 'for statistics',
  `content` varchar(255) DEFAULT NULL COMMENT 'message',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `crontasks_id` (`crontasks_id`),
  KEY `crontasklogs_id_state` (`crontasklogs_id`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_crontasklogs`
--

LOCK TABLES `glpi_crontasklogs` WRITE;
/*!40000 ALTER TABLE `glpi_crontasklogs` DISABLE KEYS */;
INSERT INTO `glpi_crontasklogs` VALUES
(1,5,0,'2024-11-19 10:20:20',0,0,0,'Run mode: GLPI'),
(2,5,1,'2024-11-19 10:20:20',2,0.00343704,0,'Action completed, no processing required'),
(3,6,0,'2024-11-19 10:26:31',0,0,0,'Run mode: GLPI'),
(4,6,3,'2024-11-19 10:26:31',2,0.00233698,0,'Action completed, no processing required'),
(5,9,0,'2024-11-25 12:23:41',0,0,0,'Run mode: GLPI'),
(6,9,5,'2024-11-25 12:23:41',2,0.00494885,0,'Action completed, no processing required'),
(7,12,0,'2024-11-25 12:37:50',0,0,0,'Run mode: GLPI'),
(8,12,7,'2024-11-25 12:37:50',1,0.00195503,3,'Clean 3 session files created since more than 1440 seconds\n'),
(9,12,7,'2024-11-25 12:37:50',2,0.00677991,3,'Action completed, fully processed'),
(10,13,0,'2024-11-25 12:54:55',0,0,0,'Run mode: GLPI'),
(11,13,10,'2024-11-25 12:54:55',2,0.0028739,0,'Action completed, no processing required'),
(12,14,0,'2024-11-25 13:47:59',0,0,0,'Run mode: GLPI'),
(13,14,12,'2024-11-25 13:47:59',2,0.00341392,0,'Action completed, no processing required'),
(14,15,0,'2024-11-25 14:11:50',0,0,0,'Run mode: GLPI'),
(15,15,14,'2024-11-25 14:11:50',2,0.00430417,0,'Action completed, no processing required'),
(16,16,0,'2024-11-25 14:19:45',0,0,0,'Run mode: GLPI'),
(17,16,16,'2024-11-25 14:19:45',2,0.004457,0,'Action completed, no processing required'),
(18,17,0,'2024-11-25 14:25:13',0,0,0,'Run mode: GLPI'),
(19,17,18,'2024-11-25 14:25:13',2,0.00262094,0,'Action completed, no processing required'),
(20,18,0,'2024-11-25 14:44:03',0,0,0,'Run mode: GLPI'),
(21,18,20,'2024-11-25 14:44:03',2,0.0040319,0,'Action completed, no processing required'),
(22,19,0,'2024-11-25 14:51:11',0,0,0,'Run mode: GLPI'),
(23,19,22,'2024-11-25 14:51:11',2,0.00319219,0,'Action completed, fully processed'),
(24,20,0,'2025-01-27 12:34:44',0,0,0,'Run mode: GLPI'),
(25,20,24,'2025-01-27 12:34:44',2,0.00595713,0,'Action completed, no processing required'),
(26,21,0,'2025-01-27 12:41:02',0,0,0,'Run mode: GLPI'),
(27,21,26,'2025-01-27 12:41:02',2,0.00293899,0,'Action completed, no processing required'),
(28,22,0,'2025-01-27 13:07:14',0,0,0,'Run mode: GLPI'),
(29,22,28,'2025-01-27 13:07:14',2,0.00331116,0,'Action completed, no processing required'),
(30,23,0,'2025-01-27 13:12:20',0,0,0,'Run mode: GLPI'),
(31,23,30,'2025-01-27 13:12:20',2,0.003093,0,'Action completed, no processing required');
/*!40000 ALTER TABLE `glpi_crontasklogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_crontasks`
--

DROP TABLE IF EXISTS `glpi_crontasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_crontasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL COMMENT 'task name',
  `frequency` int(11) NOT NULL COMMENT 'second between launch',
  `param` int(11) DEFAULT NULL COMMENT 'task specify parameter',
  `state` int(11) NOT NULL DEFAULT 1 COMMENT '0:disabled, 1:waiting, 2:running',
  `mode` int(11) NOT NULL DEFAULT 1 COMMENT '1:internal, 2:external',
  `allowmode` int(11) NOT NULL DEFAULT 3 COMMENT '1:internal, 2:external, 3:both',
  `hourmin` int(11) NOT NULL DEFAULT 0,
  `hourmax` int(11) NOT NULL DEFAULT 24,
  `logs_lifetime` int(11) NOT NULL DEFAULT 30 COMMENT 'number of days',
  `lastrun` timestamp NULL DEFAULT NULL COMMENT 'last run date',
  `lastcode` int(11) DEFAULT NULL COMMENT 'last run return code',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`name`),
  KEY `name` (`name`),
  KEY `mode` (`mode`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Task run by internal / external cron.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_crontasks`
--

LOCK TABLES `glpi_crontasks` WRITE;
/*!40000 ALTER TABLE `glpi_crontasks` DISABLE KEYS */;
INSERT INTO `glpi_crontasks` VALUES
(2,'CartridgeItem','cartridge',86400,10,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(3,'ConsumableItem','consumable',86400,10,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(4,'SoftwareLicense','software',86400,NULL,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(5,'Contract','contract',86400,NULL,1,1,3,0,24,30,'2024-11-19 10:20:00',NULL,NULL,NULL,NULL),
(6,'Infocom','infocom',86400,NULL,1,1,3,0,24,30,'2024-11-19 10:26:00',NULL,NULL,NULL,NULL),
(7,'CronTask','logs',86400,30,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(9,'MailCollector','mailgate',600,10,1,1,3,0,24,30,'2024-11-25 12:23:00',NULL,NULL,NULL,NULL),
(10,'DBconnection','checkdbreplicate',300,NULL,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(11,'CronTask','checkupdate',604800,NULL,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(12,'CronTask','session',86400,NULL,1,1,3,0,24,30,'2024-11-25 12:37:00',NULL,NULL,NULL,NULL),
(13,'CronTask','graph',3600,NULL,1,1,3,0,24,30,'2024-11-25 12:54:00',NULL,NULL,NULL,NULL),
(14,'ReservationItem','reservation',3600,NULL,1,1,3,0,24,30,'2024-11-25 13:47:00',NULL,NULL,NULL,NULL),
(15,'Ticket','closeticket',43200,NULL,1,1,3,0,24,30,'2024-11-25 14:11:00',NULL,NULL,NULL,NULL),
(16,'Ticket','alertnotclosed',43200,NULL,1,1,3,0,24,30,'2024-11-25 14:19:00',NULL,NULL,NULL,NULL),
(17,'SlaLevel_Ticket','slaticket',300,NULL,1,1,3,0,24,30,'2024-11-25 14:25:00',NULL,NULL,NULL,NULL),
(18,'Ticket','createinquest',86400,NULL,1,1,3,0,24,30,'2024-11-25 14:44:00',NULL,NULL,NULL,NULL),
(19,'CronTask','watcher',86400,NULL,1,1,3,0,24,30,'2024-11-25 14:51:00',NULL,NULL,NULL,NULL),
(20,'CommonITILRecurrentCron','RecurrentItems',3600,NULL,1,1,3,0,24,30,'2025-01-27 12:34:00',NULL,NULL,NULL,NULL),
(21,'PlanningRecall','planningrecall',300,NULL,1,1,3,0,24,30,'2025-01-27 12:41:00',NULL,NULL,NULL,NULL),
(22,'QueuedNotification','queuednotification',60,50,1,1,3,0,24,30,'2025-01-27 13:07:00',NULL,NULL,NULL,NULL),
(23,'QueuedNotification','queuednotificationclean',86400,30,1,1,3,0,24,30,'2025-01-27 13:12:00',NULL,NULL,NULL,NULL),
(24,'CronTask','temp',3600,NULL,1,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(25,'MailCollector','mailgateerror',86400,NULL,1,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(26,'CronTask','circularlogs',86400,4,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(27,'ObjectLock','unlockobject',86400,4,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(28,'SavedSearch','countAll',604800,NULL,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(29,'SavedSearch_Alert','savedsearchesalerts',86400,NULL,0,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(30,'Telemetry','telemetry',2592000,NULL,1,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(31,'Certificate','certificate',86400,NULL,1,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(32,'OlaLevel_Ticket','olaticket',300,NULL,1,1,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(33,'PurgeLogs','PurgeLogs',604800,24,1,2,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(34,'Ticket','purgeticket',604800,NULL,0,2,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(35,'Document','cleanorphans',604800,NULL,0,2,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(36,'User','passwordexpiration',86400,100,0,2,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(37,'Glpi\\Marketplace\\Controller','checkAllUpdates',86400,NULL,1,2,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(38,'CleanSoftwareCron','cleansoftware',2592000,1000,0,2,3,0,24,300,NULL,NULL,NULL,NULL,NULL),
(39,'Domain','DomainsAlert',86400,NULL,1,2,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(40,'Glpi\\Inventory\\Inventory','cleantemp',86400,NULL,0,2,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(41,'Glpi\\Inventory\\Inventory','cleanorphans',604800,NULL,1,2,3,0,24,30,NULL,NULL,NULL,NULL,NULL),
(42,'PendingReasonCron','pendingreason_autobump_autosolve',1800,NULL,1,2,3,0,24,60,NULL,NULL,NULL,NULL,NULL),
(43,'Agent','Cleanoldagents',86400,NULL,1,2,3,0,24,30,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_crontasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_dashboards_dashboards`
--

DROP TABLE IF EXISTS `glpi_dashboards_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_dashboards_dashboards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `context` varchar(100) NOT NULL DEFAULT 'core',
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `name` (`name`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_dashboards_dashboards`
--

LOCK TABLES `glpi_dashboards_dashboards` WRITE;
/*!40000 ALTER TABLE `glpi_dashboards_dashboards` DISABLE KEYS */;
INSERT INTO `glpi_dashboards_dashboards` VALUES
(1,'central','Central','core',0),
(2,'assets','Assets','core',0),
(3,'assistance','Assistance','core',0),
(4,'mini_tickets','Mini tickets dashboard','mini_core',0);
/*!40000 ALTER TABLE `glpi_dashboards_dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_dashboards_filters`
--

DROP TABLE IF EXISTS `glpi_dashboards_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_dashboards_filters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dashboards_dashboards_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `filter` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboards_dashboards_id` (`dashboards_dashboards_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_dashboards_filters`
--

LOCK TABLES `glpi_dashboards_filters` WRITE;
/*!40000 ALTER TABLE `glpi_dashboards_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_dashboards_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_dashboards_items`
--

DROP TABLE IF EXISTS `glpi_dashboards_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_dashboards_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dashboards_dashboards_id` int(10) unsigned NOT NULL,
  `gridstack_id` varchar(255) NOT NULL,
  `card_id` varchar(255) NOT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `card_options` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboards_dashboards_id` (`dashboards_dashboards_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_dashboards_items`
--

LOCK TABLES `glpi_dashboards_items` WRITE;
/*!40000 ALTER TABLE `glpi_dashboards_items` DISABLE KEYS */;
INSERT INTO `glpi_dashboards_items` VALUES
(1,1,'bn_count_Computer_4a315743-151c-40cb-a20b-762250668dac','bn_count_Computer',3,0,3,2,'{\"color\":\"#e69393\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(2,1,'bn_count_Software_0690f524-e826-47a9-b50a-906451196b83','bn_count_Software',0,0,3,2,'{\"color\":\"#aaddac\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(3,1,'bn_count_Rack_c6502e0a-5991-46b4-a771-7f355137306b','bn_count_Rack',6,2,3,2,'{\"color\":\"#0e87a0\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(4,1,'bn_count_SoftwareLicense_e755fd06-283e-4479-ba35-2d548f8f8a90','bn_count_SoftwareLicense',0,2,3,2,'{\"color\":\"#27ab3c\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(5,1,'bn_count_Monitor_7059b94c-583c-4ba7-b100-d40461165318','bn_count_Monitor',3,2,3,2,'{\"color\":\"#b52d30\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(6,1,'bn_count_Ticket_a74c0903-3387-4a07-9111-b0938af8f1e7','bn_count_Ticket',14,7,3,2,'{\"color\":\"#ffdc64\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(7,1,'bn_count_Problem_c1cf5cfb-f626-472e-82a1-49c3e200e746','bn_count_Problem',20,7,3,2,'{\"color\":\"#f08d7b\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(8,1,'count_Computer_Manufacturer_6129c451-42b5-489d-b693-c362adf32d49','count_Computer_Manufacturer',0,4,5,4,'{\"color\":\"#f8faf9\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(9,1,'top_ticket_user_requester_c74f52a8-046a-4077-b1a6-c9f840d34b82','top_ticket_user_requester',14,9,6,5,'{\"color\":\"#f9fafb\",\"widgettype\":\"hbar\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(10,1,'bn_count_tickets_late_04c47208-d7e5-4aca-9566-d46e68c45c67','bn_count_tickets_late',17,7,3,2,'{\"color\":\"#f8911f\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(11,1,'ticket_status_2e4e968b-d4e6-4e33-9ce9-a1aaff53dfde','ticket_status',14,0,12,7,'{\"color\":\"#fafafa\",\"widgettype\":\"stackedbars\",\"use_gradient\":\"0\",\"limit\":\"12\"}'),
(12,1,'top_ticket_ITILCategory_37736ba9-d429-4cb3-9058-ef4d111d9269','top_ticket_ITILCategory',20,9,6,5,'{\"color\":\"#fbf9f9\",\"widgettype\":\"hbar\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(13,1,'bn_count_Printer_517684b0-b064-49dd-943e-fcb6f915e453','bn_count_Printer',9,2,3,2,'{\"color\":\"#365a8f\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(14,1,'bn_count_Phone_f70c489f-02c1-46e5-978b-94a95b5038ee','bn_count_Phone',9,0,3,2,'{\"color\":\"#d5e1ec\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(15,1,'bn_count_Change_ab950dbd-cd25-466d-8dff-7dcaca386564','bn_count_Change',23,7,3,2,'{\"color\":\"#cae3c4\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(16,1,'bn_count_Group_b84a93f2-a26c-49d7-82a4-5446697cc5b0','bn_count_Group',4,8,4,2,'{\"color\":\"#e0e0e0\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(17,1,'bn_count_Profile_770b35e8-68e9-4b4f-9e09-5a11058f069f','bn_count_Profile',4,10,4,2,'{\"color\":\"#e0e0e0\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(18,1,'bn_count_Supplier_36ff9011-e4cf-4d89-b9ab-346b9857d734','bn_count_Supplier',8,8,3,2,'{\"color\":\"#c9c9c9\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(19,1,'bn_count_KnowbaseItem_a3785a56-bed4-4a30-8387-f251f5365b3b','bn_count_KnowbaseItem',8,10,3,2,'{\"color\":\"#c9c9c9\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(20,1,'bn_count_Entity_9b82951a-ba52-45cc-a2d3-1d238ec37adf','bn_count_Entity',0,10,4,2,'{\"color\":\"#f9f9f9\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(21,1,'bn_count_Document_7dc7f4b8-61ff-4147-b994-5541bddd7b66','bn_count_Document',11,8,3,2,'{\"color\":\"#b4b4b4\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(22,1,'bn_count_Project_4d412ee2-8b79-469b-995f-4c0a05ab849d','bn_count_Project',11,10,3,2,'{\"color\":\"#b3b3b3\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(23,1,'bn_count_NetworkEquipment_c537e334-d584-43bc-b6de-b4a939143e89','bn_count_NetworkEquipment',6,0,3,2,'{\"color\":\"#bfe7ea\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(24,1,'bn_count_User_ac0cbe52-3593-43c1-8ecc-0eb115de494d','bn_count_User',0,8,4,2,'{\"color\":\"#fafafa\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(25,1,'count_Monitor_MonitorModel_5a476ff9-116e-4270-858b-c003c20841a9','count_Monitor_MonitorModel',5,4,5,4,'{\"color\":\"#f5fafa\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(26,1,'count_NetworkEquipment_State_81f2ae35-b366-4065-ac26-02ea4e3704a6','count_NetworkEquipment_State',10,4,4,4,'{\"color\":\"#f5f3ef\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(27,2,'bn_count_Computer_34cfbaf9-a471-4852-b48c-0dadea7644de','bn_count_Computer',0,0,4,3,'{\"color\":\"#f3d0d0\",\"widgettype\":\"bigNumber\"}'),
(28,2,'bn_count_Software_60091467-2137-49f4-8834-f6602a482079','bn_count_Software',4,0,4,3,'{\"color\":\"#d1f1a8\",\"widgettype\":\"bigNumber\"}'),
(29,2,'bn_count_Printer_c9a385d4-76a3-4971-ad0e-1470efeafacc','bn_count_Printer',8,3,4,3,'{\"color\":\"#5da8d6\",\"widgettype\":\"bigNumber\"}'),
(30,2,'bn_count_PDU_60053eb6-8dda-4416-9a4b-afd51889bd09','bn_count_PDU',12,3,4,3,'{\"color\":\"#ffb62f\",\"widgettype\":\"bigNumber\"}'),
(31,2,'bn_count_Rack_0fdc196f-20d2-4f63-9ddb-b75c165cc664','bn_count_Rack',12,0,4,3,'{\"color\":\"#f7d79a\",\"widgettype\":\"bigNumber\"}'),
(32,2,'bn_count_Phone_c31fde2d-510a-4482-b17d-2f65b61eae08','bn_count_Phone',16,3,4,3,'{\"color\":\"#a0cec2\",\"widgettype\":\"bigNumber\"}'),
(33,2,'bn_count_Enclosure_c21ce30a-58c3-456a-81ec-3c5f01527a8f','bn_count_Enclosure',16,0,4,3,'{\"color\":\"#d7e8e4\",\"widgettype\":\"bigNumber\"}'),
(34,2,'bn_count_NetworkEquipment_76f1e239-777b-4552-b053-ae5c64190347','bn_count_NetworkEquipment',8,0,4,3,'{\"color\":\"#c8dae4\",\"widgettype\":\"bigNumber\"}'),
(35,2,'bn_count_SoftwareLicense_576e58fe-a386-480f-b405-1c2315b8ab47','bn_count_SoftwareLicense',4,3,4,3,'{\"color\":\"#9bc06b\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(36,2,'bn_count_Monitor_890e16d3-b121-48c6-9713-d9c239d9a970','bn_count_Monitor',0,3,4,3,'{\"color\":\"#dc6f6f\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(37,2,'count_Computer_Manufacturer_986e92e8-32e8-4a6f-806f-6f5383acbb3f','count_Computer_Manufacturer',4,6,4,4,'{\"color\":\"#f3f5f1\",\"widgettype\":\"hbar\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(38,2,'count_Computer_State_290c5920-9eab-4db8-8753-46108e60f1d8','count_Computer_State',0,6,4,4,'{\"color\":\"#fbf7f7\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(39,2,'count_Computer_ComputerType_c58f9c7e-22d5-478b-8226-d2a752bcbb09','count_Computer_ComputerType',8,6,4,4,'{\"color\":\"#f5f9fa\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(40,2,'count_NetworkEquipment_Manufacturer_8132b21c-6f7f-4dc1-af54-bea794cb96e9','count_NetworkEquipment_Manufacturer',12,6,4,4,'{\"color\":\"#fcf8ed\",\"widgettype\":\"hbar\",\"use_gradient\":\"0\",\"limit\":\"5\"}'),
(41,2,'count_Monitor_Manufacturer_43b0c16b-af82-418e-aac1-f32b39705c0d','count_Monitor_Manufacturer',16,6,4,4,'{\"color\":\"#f9fbfb\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"5\"}'),
(42,3,'bn_count_Ticket_344e761b-f7e8-4617-8c90-154b266b4d67','bn_count_Ticket',0,0,3,2,'{\"color\":\"#ffdc64\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(43,3,'bn_count_Problem_bdb4002b-a674-4493-820f-af85bed44d2a','bn_count_Problem',0,4,3,2,'{\"color\":\"#f0967b\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(44,3,'bn_count_Change_b9b87513-4f40-41e6-8621-f51f9a30fb19','bn_count_Change',0,6,3,2,'{\"color\":\"#cae3c4\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(45,3,'bn_count_tickets_late_1e9ae481-21b4-4463-a830-dec1b68ec5e7','bn_count_tickets_late',0,2,3,2,'{\"color\":\"#f8911f\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(46,3,'bn_count_tickets_incoming_336a36d9-67fe-4475-880e-447bd766b8fe','bn_count_tickets_incoming',3,6,3,2,'{\"color\":\"#a0e19d\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(47,3,'bn_count_tickets_closed_e004bab5-f2b6-4060-a401-a2a8b9885245','bn_count_tickets_closed',9,8,3,2,'{\"color\":\"#515151\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(48,3,'bn_count_tickets_assigned_7455c855-6df8-4514-a3d9-8b0fce52bd63','bn_count_tickets_assigned',6,6,3,2,'{\"color\":\"#eaf5f7\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(49,3,'bn_count_tickets_solved_5e9759b3-ee7e-4a14-b68f-1ac024ef55ee','bn_count_tickets_solved',9,6,3,2,'{\"color\":\"#d8d8d8\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(50,3,'bn_count_tickets_waiting_102b2c2a-6ac6-4d73-ba47-8b09382fe00e','bn_count_tickets_waiting',3,8,3,2,'{\"color\":\"#ffcb7d\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(51,3,'bn_count_TicketRecurrent_13f79539-61f6-45f7-8dde-045706e652f2','bn_count_TicketRecurrent',0,8,3,2,'{\"color\":\"#fafafa\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(52,3,'bn_count_tickets_planned_267bf627-9d5e-4b6c-b53d-b8623d793ccf','bn_count_tickets_planned',6,8,3,2,'{\"color\":\"#6298d5\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(53,3,'top_ticket_ITILCategory_0cba0c84-6c62-4cd8-8564-18614498d8e4','top_ticket_ITILCategory',12,6,4,4,'{\"color\":\"#f1f5ef\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"7\"}'),
(54,3,'top_ticket_RequestType_b9e43f34-8e94-4a6e-9023-c5d1e2ce7859','top_ticket_RequestType',16,6,4,4,'{\"color\":\"#f9fafb\",\"widgettype\":\"hbar\",\"use_gradient\":\"1\",\"limit\":\"4\"}'),
(55,3,'top_ticket_Entity_a8e65812-519c-488e-9892-9adbe22fbd5c','top_ticket_Entity',20,6,4,4,'{\"color\":\"#f7f1f0\",\"widgettype\":\"donut\",\"use_gradient\":\"1\",\"limit\":\"7\"}'),
(56,3,'ticket_evolution_76fd4926-ee5e-48db-b6d6-e2947c190c5e','ticket_evolution',3,0,12,6,'{\"color\":\"#f3f7f8\",\"widgettype\":\"areas\",\"use_gradient\":\"0\",\"limit\":\"12\"}'),
(57,3,'ticket_status_5b256a35-b36b-4db5-ba11-ea7c125f126e','ticket_status',15,0,11,6,'{\"color\":\"#f7f3f2\",\"widgettype\":\"stackedbars\",\"use_gradient\":\"0\",\"limit\":\"12\"}'),
(58,4,'bn_count_tickets_closed_ccf7246b-645a-40d2-8206-fa33c769e3f5','bn_count_tickets_closed',24,0,4,2,'{\"color\":\"#fafafa\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(59,4,'bn_count_Ticket_d5bf3576-5033-40fb-bbdb-292294a7698e','bn_count_Ticket',0,0,4,2,'{\"color\":\"#ffd957\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(60,4,'bn_count_tickets_incoming_055e813c-b0ce-4687-91ef-559249e8ddd8','bn_count_tickets_incoming',4,0,4,2,'{\"color\":\"#6fd169\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(61,4,'bn_count_tickets_waiting_793c665b-b620-4b3a-a5a8-cf502defc008','bn_count_tickets_waiting',8,0,4,2,'{\"color\":\"#ffcb7d\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(62,4,'bn_count_tickets_assigned_d3d2f697-52b4-435e-9030-a760dd649085','bn_count_tickets_assigned',12,0,4,2,'{\"color\":\"#eaf4f7\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(63,4,'bn_count_tickets_planned_0c7f3569-c23b-4ee3-8e85-279229b23e70','bn_count_tickets_planned',16,0,4,2,'{\"color\":\"#6298d5\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}'),
(64,4,'bn_count_tickets_solved_ae2406cf-e8e8-410b-b355-46e3f5705ee8','bn_count_tickets_solved',20,0,4,2,'{\"color\":\"#d7d7d7\",\"widgettype\":\"bigNumber\",\"use_gradient\":\"0\",\"limit\":\"7\"}');
/*!40000 ALTER TABLE `glpi_dashboards_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_dashboards_rights`
--

DROP TABLE IF EXISTS `glpi_dashboards_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_dashboards_rights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dashboards_dashboards_id` int(10) unsigned NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`dashboards_dashboards_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_dashboards_rights`
--

LOCK TABLES `glpi_dashboards_rights` WRITE;
/*!40000 ALTER TABLE `glpi_dashboards_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_dashboards_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_databaseinstancecategories`
--

DROP TABLE IF EXISTS `glpi_databaseinstancecategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_databaseinstancecategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_databaseinstancecategories`
--

LOCK TABLES `glpi_databaseinstancecategories` WRITE;
/*!40000 ALTER TABLE `glpi_databaseinstancecategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_databaseinstancecategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_databaseinstances`
--

DROP TABLE IF EXISTS `glpi_databaseinstances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_databaseinstances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `port` varchar(10) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `size` int(11) NOT NULL DEFAULT 0,
  `databaseinstancetypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `databaseinstancecategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_onbackup` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_helpdesk_visible` tinyint(4) NOT NULL DEFAULT 1,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_lastboot` timestamp NULL DEFAULT NULL,
  `date_lastbackup` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `databaseinstancetypes_id` (`databaseinstancetypes_id`),
  KEY `databaseinstancecategories_id` (`databaseinstancecategories_id`),
  KEY `locations_id` (`locations_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `states_id` (`states_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `is_active` (`is_active`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_databaseinstances`
--

LOCK TABLES `glpi_databaseinstances` WRITE;
/*!40000 ALTER TABLE `glpi_databaseinstances` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_databaseinstances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_databaseinstancetypes`
--

DROP TABLE IF EXISTS `glpi_databaseinstancetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_databaseinstancetypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_databaseinstancetypes`
--

LOCK TABLES `glpi_databaseinstancetypes` WRITE;
/*!40000 ALTER TABLE `glpi_databaseinstancetypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_databaseinstancetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_databases`
--

DROP TABLE IF EXISTS `glpi_databases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_databases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `size` int(11) NOT NULL DEFAULT 0,
  `databaseinstances_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_onbackup` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_update` timestamp NULL DEFAULT NULL,
  `date_lastbackup` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `is_active` (`is_active`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `databaseinstances_id` (`databaseinstances_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_databases`
--

LOCK TABLES `glpi_databases` WRITE;
/*!40000 ALTER TABLE `glpi_databases` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_databases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_datacenters`
--

DROP TABLE IF EXISTS `glpi_datacenters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_datacenters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_datacenters`
--

LOCK TABLES `glpi_datacenters` WRITE;
/*!40000 ALTER TABLE `glpi_datacenters` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_datacenters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_dcrooms`
--

DROP TABLE IF EXISTS `glpi_dcrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_dcrooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `vis_cols` int(11) DEFAULT NULL,
  `vis_rows` int(11) DEFAULT NULL,
  `blueprint` text DEFAULT NULL,
  `datacenters_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `datacenters_id` (`datacenters_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_dcrooms`
--

LOCK TABLES `glpi_dcrooms` WRITE;
/*!40000 ALTER TABLE `glpi_dcrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_dcrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicebatteries`
--

DROP TABLE IF EXISTS `glpi_devicebatteries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicebatteries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `voltage` int(11) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `devicebatterytypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicebatterymodels_id` int(10) unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicebatterymodels_id` (`devicebatterymodels_id`),
  KEY `devicebatterytypes_id` (`devicebatterytypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicebatteries`
--

LOCK TABLES `glpi_devicebatteries` WRITE;
/*!40000 ALTER TABLE `glpi_devicebatteries` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicebatteries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicebatterymodels`
--

DROP TABLE IF EXISTS `glpi_devicebatterymodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicebatterymodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicebatterymodels`
--

LOCK TABLES `glpi_devicebatterymodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicebatterymodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicebatterymodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicebatterytypes`
--

DROP TABLE IF EXISTS `glpi_devicebatterytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicebatterytypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicebatterytypes`
--

LOCK TABLES `glpi_devicebatterytypes` WRITE;
/*!40000 ALTER TABLE `glpi_devicebatterytypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicebatterytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicecameramodels`
--

DROP TABLE IF EXISTS `glpi_devicecameramodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicecameramodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicecameramodels`
--

LOCK TABLES `glpi_devicecameramodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicecameramodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicecameramodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicecameras`
--

DROP TABLE IF EXISTS `glpi_devicecameras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicecameras` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `flashunit` tinyint(4) NOT NULL DEFAULT 0,
  `lensfacing` varchar(255) DEFAULT NULL,
  `orientation` varchar(255) DEFAULT NULL,
  `focallength` varchar(255) DEFAULT NULL,
  `sensorsize` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicecameramodels_id` int(10) unsigned DEFAULT NULL,
  `support` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicecameramodels_id` (`devicecameramodels_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicecameras`
--

LOCK TABLES `glpi_devicecameras` WRITE;
/*!40000 ALTER TABLE `glpi_devicecameras` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicecameras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicecasemodels`
--

DROP TABLE IF EXISTS `glpi_devicecasemodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicecasemodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicecasemodels`
--

LOCK TABLES `glpi_devicecasemodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicecasemodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicecasemodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicecases`
--

DROP TABLE IF EXISTS `glpi_devicecases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicecases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `devicecasetypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicecasemodels_id` int(10) unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicecasetypes_id` (`devicecasetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicecasemodels_id` (`devicecasemodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicecases`
--

LOCK TABLES `glpi_devicecases` WRITE;
/*!40000 ALTER TABLE `glpi_devicecases` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicecases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicecasetypes`
--

DROP TABLE IF EXISTS `glpi_devicecasetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicecasetypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicecasetypes`
--

LOCK TABLES `glpi_devicecasetypes` WRITE;
/*!40000 ALTER TABLE `glpi_devicecasetypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicecasetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicecontrolmodels`
--

DROP TABLE IF EXISTS `glpi_devicecontrolmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicecontrolmodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicecontrolmodels`
--

LOCK TABLES `glpi_devicecontrolmodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicecontrolmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicecontrolmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicecontrols`
--

DROP TABLE IF EXISTS `glpi_devicecontrols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicecontrols` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `is_raid` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `interfacetypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicecontrolmodels_id` int(10) unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicecontrolmodels_id` (`devicecontrolmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicecontrols`
--

LOCK TABLES `glpi_devicecontrols` WRITE;
/*!40000 ALTER TABLE `glpi_devicecontrols` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicecontrols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicedrivemodels`
--

DROP TABLE IF EXISTS `glpi_devicedrivemodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicedrivemodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicedrivemodels`
--

LOCK TABLES `glpi_devicedrivemodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicedrivemodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicedrivemodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicedrives`
--

DROP TABLE IF EXISTS `glpi_devicedrives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicedrives` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `is_writer` tinyint(4) NOT NULL DEFAULT 1,
  `speed` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `interfacetypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicedrivemodels_id` int(10) unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicedrivemodels_id` (`devicedrivemodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicedrives`
--

LOCK TABLES `glpi_devicedrives` WRITE;
/*!40000 ALTER TABLE `glpi_devicedrives` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicedrives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicefirmwaremodels`
--

DROP TABLE IF EXISTS `glpi_devicefirmwaremodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicefirmwaremodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicefirmwaremodels`
--

LOCK TABLES `glpi_devicefirmwaremodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicefirmwaremodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicefirmwaremodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicefirmwares`
--

DROP TABLE IF EXISTS `glpi_devicefirmwares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicefirmwares` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `devicefirmwaretypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicefirmwaremodels_id` int(10) unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicefirmwaremodels_id` (`devicefirmwaremodels_id`),
  KEY `devicefirmwaretypes_id` (`devicefirmwaretypes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicefirmwares`
--

LOCK TABLES `glpi_devicefirmwares` WRITE;
/*!40000 ALTER TABLE `glpi_devicefirmwares` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicefirmwares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicefirmwaretypes`
--

DROP TABLE IF EXISTS `glpi_devicefirmwaretypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicefirmwaretypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicefirmwaretypes`
--

LOCK TABLES `glpi_devicefirmwaretypes` WRITE;
/*!40000 ALTER TABLE `glpi_devicefirmwaretypes` DISABLE KEYS */;
INSERT INTO `glpi_devicefirmwaretypes` VALUES
(1,'BIOS',NULL,NULL,NULL),
(2,'UEFI',NULL,NULL,NULL),
(3,'Firmware',NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_devicefirmwaretypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicegenericmodels`
--

DROP TABLE IF EXISTS `glpi_devicegenericmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicegenericmodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicegenericmodels`
--

LOCK TABLES `glpi_devicegenericmodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicegenericmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicegenericmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicegenerics`
--

DROP TABLE IF EXISTS `glpi_devicegenerics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicegenerics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `devicegenerictypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `devicegenericmodels_id` int(10) unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicegenerictypes_id` (`devicegenerictypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicegenericmodels_id` (`devicegenericmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicegenerics`
--

LOCK TABLES `glpi_devicegenerics` WRITE;
/*!40000 ALTER TABLE `glpi_devicegenerics` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicegenerics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicegenerictypes`
--

DROP TABLE IF EXISTS `glpi_devicegenerictypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicegenerictypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicegenerictypes`
--

LOCK TABLES `glpi_devicegenerictypes` WRITE;
/*!40000 ALTER TABLE `glpi_devicegenerictypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicegenerictypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicegraphiccardmodels`
--

DROP TABLE IF EXISTS `glpi_devicegraphiccardmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicegraphiccardmodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicegraphiccardmodels`
--

LOCK TABLES `glpi_devicegraphiccardmodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicegraphiccardmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicegraphiccardmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicegraphiccards`
--

DROP TABLE IF EXISTS `glpi_devicegraphiccards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicegraphiccards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `interfacetypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `memory_default` int(11) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicegraphiccardmodels_id` int(10) unsigned DEFAULT NULL,
  `chipset` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `chipset` (`chipset`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicegraphiccardmodels_id` (`devicegraphiccardmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicegraphiccards`
--

LOCK TABLES `glpi_devicegraphiccards` WRITE;
/*!40000 ALTER TABLE `glpi_devicegraphiccards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicegraphiccards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_deviceharddrivemodels`
--

DROP TABLE IF EXISTS `glpi_deviceharddrivemodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_deviceharddrivemodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_deviceharddrivemodels`
--

LOCK TABLES `glpi_deviceharddrivemodels` WRITE;
/*!40000 ALTER TABLE `glpi_deviceharddrivemodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_deviceharddrivemodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_deviceharddrives`
--

DROP TABLE IF EXISTS `glpi_deviceharddrives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_deviceharddrives` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `rpm` varchar(255) DEFAULT NULL,
  `interfacetypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `cache` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `capacity_default` int(11) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `deviceharddrivemodels_id` int(10) unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `interfacetypes_id` (`interfacetypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `deviceharddrivemodels_id` (`deviceharddrivemodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_deviceharddrives`
--

LOCK TABLES `glpi_deviceharddrives` WRITE;
/*!40000 ALTER TABLE `glpi_deviceharddrives` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_deviceharddrives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicememories`
--

DROP TABLE IF EXISTS `glpi_devicememories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicememories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `frequence` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `size_default` int(11) NOT NULL DEFAULT 0,
  `devicememorytypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicememorymodels_id` int(10) unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicememorytypes_id` (`devicememorytypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicememorymodels_id` (`devicememorymodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicememories`
--

LOCK TABLES `glpi_devicememories` WRITE;
/*!40000 ALTER TABLE `glpi_devicememories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicememories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicememorymodels`
--

DROP TABLE IF EXISTS `glpi_devicememorymodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicememorymodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicememorymodels`
--

LOCK TABLES `glpi_devicememorymodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicememorymodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicememorymodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicememorytypes`
--

DROP TABLE IF EXISTS `glpi_devicememorytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicememorytypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicememorytypes`
--

LOCK TABLES `glpi_devicememorytypes` WRITE;
/*!40000 ALTER TABLE `glpi_devicememorytypes` DISABLE KEYS */;
INSERT INTO `glpi_devicememorytypes` VALUES
(1,'EDO',NULL,NULL,NULL),
(2,'DDR',NULL,NULL,NULL),
(3,'SDRAM',NULL,NULL,NULL),
(4,'SDRAM-2',NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_devicememorytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicemotherboardmodels`
--

DROP TABLE IF EXISTS `glpi_devicemotherboardmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicemotherboardmodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicemotherboardmodels`
--

LOCK TABLES `glpi_devicemotherboardmodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicemotherboardmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicemotherboardmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicemotherboards`
--

DROP TABLE IF EXISTS `glpi_devicemotherboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicemotherboards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `chipset` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicemotherboardmodels_id` int(10) unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicemotherboardmodels_id` (`devicemotherboardmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicemotherboards`
--

LOCK TABLES `glpi_devicemotherboards` WRITE;
/*!40000 ALTER TABLE `glpi_devicemotherboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicemotherboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicenetworkcardmodels`
--

DROP TABLE IF EXISTS `glpi_devicenetworkcardmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicenetworkcardmodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicenetworkcardmodels`
--

LOCK TABLES `glpi_devicenetworkcardmodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicenetworkcardmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicenetworkcardmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicenetworkcards`
--

DROP TABLE IF EXISTS `glpi_devicenetworkcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicenetworkcards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `bandwidth` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `mac_default` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicenetworkcardmodels_id` int(10) unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicenetworkcardmodels_id` (`devicenetworkcardmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicenetworkcards`
--

LOCK TABLES `glpi_devicenetworkcards` WRITE;
/*!40000 ALTER TABLE `glpi_devicenetworkcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicenetworkcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicepcimodels`
--

DROP TABLE IF EXISTS `glpi_devicepcimodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicepcimodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicepcimodels`
--

LOCK TABLES `glpi_devicepcimodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicepcimodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicepcimodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicepcis`
--

DROP TABLE IF EXISTS `glpi_devicepcis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicepcis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `devicenetworkcardmodels_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicepcimodels_id` int(10) unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicenetworkcardmodels_id` (`devicenetworkcardmodels_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicepcimodels_id` (`devicepcimodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicepcis`
--

LOCK TABLES `glpi_devicepcis` WRITE;
/*!40000 ALTER TABLE `glpi_devicepcis` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicepcis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicepowersupplies`
--

DROP TABLE IF EXISTS `glpi_devicepowersupplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicepowersupplies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `power` varchar(255) DEFAULT NULL,
  `is_atx` tinyint(4) NOT NULL DEFAULT 1,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicepowersupplymodels_id` int(10) unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicepowersupplymodels_id` (`devicepowersupplymodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicepowersupplies`
--

LOCK TABLES `glpi_devicepowersupplies` WRITE;
/*!40000 ALTER TABLE `glpi_devicepowersupplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicepowersupplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicepowersupplymodels`
--

DROP TABLE IF EXISTS `glpi_devicepowersupplymodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicepowersupplymodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicepowersupplymodels`
--

LOCK TABLES `glpi_devicepowersupplymodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicepowersupplymodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicepowersupplymodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_deviceprocessormodels`
--

DROP TABLE IF EXISTS `glpi_deviceprocessormodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_deviceprocessormodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_deviceprocessormodels`
--

LOCK TABLES `glpi_deviceprocessormodels` WRITE;
/*!40000 ALTER TABLE `glpi_deviceprocessormodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_deviceprocessormodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_deviceprocessors`
--

DROP TABLE IF EXISTS `glpi_deviceprocessors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_deviceprocessors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `frequence` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `frequency_default` int(11) NOT NULL DEFAULT 0,
  `nbcores_default` int(11) DEFAULT NULL,
  `nbthreads_default` int(11) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `deviceprocessormodels_id` int(10) unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `deviceprocessormodels_id` (`deviceprocessormodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_deviceprocessors`
--

LOCK TABLES `glpi_deviceprocessors` WRITE;
/*!40000 ALTER TABLE `glpi_deviceprocessors` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_deviceprocessors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicesensormodels`
--

DROP TABLE IF EXISTS `glpi_devicesensormodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicesensormodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicesensormodels`
--

LOCK TABLES `glpi_devicesensormodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicesensormodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicesensormodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicesensors`
--

DROP TABLE IF EXISTS `glpi_devicesensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicesensors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `devicesensortypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `devicesensormodels_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `devicesensortypes_id` (`devicesensortypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicesensormodels_id` (`devicesensormodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicesensors`
--

LOCK TABLES `glpi_devicesensors` WRITE;
/*!40000 ALTER TABLE `glpi_devicesensors` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicesensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicesensortypes`
--

DROP TABLE IF EXISTS `glpi_devicesensortypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicesensortypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicesensortypes`
--

LOCK TABLES `glpi_devicesensortypes` WRITE;
/*!40000 ALTER TABLE `glpi_devicesensortypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicesensortypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicesimcards`
--

DROP TABLE IF EXISTS `glpi_devicesimcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicesimcards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `voltage` int(11) DEFAULT NULL,
  `devicesimcardtypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `allow_voip` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `devicesimcardtypes_id` (`devicesimcardtypes_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `manufacturers_id` (`manufacturers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicesimcards`
--

LOCK TABLES `glpi_devicesimcards` WRITE;
/*!40000 ALTER TABLE `glpi_devicesimcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicesimcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicesimcardtypes`
--

DROP TABLE IF EXISTS `glpi_devicesimcardtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicesimcardtypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicesimcardtypes`
--

LOCK TABLES `glpi_devicesimcardtypes` WRITE;
/*!40000 ALTER TABLE `glpi_devicesimcardtypes` DISABLE KEYS */;
INSERT INTO `glpi_devicesimcardtypes` VALUES
(1,'Full SIM',NULL,NULL,NULL),
(2,'Mini SIM',NULL,NULL,NULL),
(3,'Micro SIM',NULL,NULL,NULL),
(4,'Nano SIM',NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_devicesimcardtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicesoundcardmodels`
--

DROP TABLE IF EXISTS `glpi_devicesoundcardmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicesoundcardmodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicesoundcardmodels`
--

LOCK TABLES `glpi_devicesoundcardmodels` WRITE;
/*!40000 ALTER TABLE `glpi_devicesoundcardmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicesoundcardmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_devicesoundcards`
--

DROP TABLE IF EXISTS `glpi_devicesoundcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_devicesoundcards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `devicesoundcardmodels_id` int(10) unsigned DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `designation` (`designation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `devicesoundcardmodels_id` (`devicesoundcardmodels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_devicesoundcards`
--

LOCK TABLES `glpi_devicesoundcards` WRITE;
/*!40000 ALTER TABLE `glpi_devicesoundcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_devicesoundcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_displaypreferences`
--

DROP TABLE IF EXISTS `glpi_displaypreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_displaypreferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `num` int(11) NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`itemtype`,`num`),
  KEY `rank` (`rank`),
  KEY `num` (`num`),
  KEY `itemtype` (`itemtype`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_displaypreferences`
--

LOCK TABLES `glpi_displaypreferences` WRITE;
/*!40000 ALTER TABLE `glpi_displaypreferences` DISABLE KEYS */;
INSERT INTO `glpi_displaypreferences` VALUES
(1,'Computer',4,4,0),
(2,'Computer',45,6,0),
(3,'Computer',40,5,0),
(4,'Computer',5,3,0),
(5,'Computer',23,2,0),
(6,'DocumentType',3,1,0),
(7,'Monitor',31,1,0),
(8,'Monitor',23,2,0),
(9,'Monitor',3,3,0),
(10,'Monitor',4,4,0),
(11,'Printer',31,1,0),
(12,'NetworkEquipment',31,1,0),
(13,'NetworkEquipment',23,2,0),
(14,'Printer',23,2,0),
(15,'Printer',3,3,0),
(16,'Software',4,3,0),
(17,'Software',5,2,0),
(18,'Software',23,1,0),
(19,'CartridgeItem',4,2,0),
(20,'CartridgeItem',34,1,0),
(21,'Peripheral',3,3,0),
(22,'Peripheral',23,2,0),
(23,'Peripheral',31,1,0),
(24,'Computer',31,1,0),
(25,'Computer',3,7,0),
(26,'Computer',19,8,0),
(27,'Computer',17,9,0),
(28,'NetworkEquipment',3,3,0),
(29,'NetworkEquipment',4,4,0),
(30,'NetworkEquipment',11,6,0),
(31,'NetworkEquipment',19,7,0),
(32,'Printer',4,4,0),
(33,'Printer',19,6,0),
(34,'Monitor',19,6,0),
(35,'Monitor',7,7,0),
(36,'Peripheral',4,4,0),
(37,'Peripheral',19,6,0),
(38,'Peripheral',7,7,0),
(39,'Contact',3,1,0),
(40,'Contact',4,2,0),
(41,'Contact',5,3,0),
(42,'Contact',6,4,0),
(43,'Contact',9,5,0),
(44,'Supplier',9,1,0),
(45,'Supplier',3,2,0),
(46,'Supplier',4,3,0),
(47,'Supplier',5,4,0),
(48,'Supplier',10,5,0),
(49,'Supplier',6,6,0),
(50,'Contract',4,1,0),
(51,'Contract',3,2,0),
(52,'Contract',5,3,0),
(53,'Contract',6,4,0),
(54,'Contract',7,5,0),
(55,'Contract',11,6,0),
(56,'CartridgeItem',23,3,0),
(57,'CartridgeItem',3,4,0),
(58,'DocumentType',6,2,0),
(59,'DocumentType',4,3,0),
(60,'DocumentType',5,4,0),
(61,'Document',3,1,0),
(62,'Document',4,2,0),
(63,'Document',7,3,0),
(64,'Document',5,4,0),
(65,'Document',16,5,0),
(66,'User',34,1,0),
(67,'User',5,3,0),
(68,'User',6,4,0),
(69,'User',3,5,0),
(70,'ConsumableItem',34,1,0),
(71,'ConsumableItem',4,2,0),
(72,'ConsumableItem',23,3,0),
(73,'ConsumableItem',3,4,0),
(74,'NetworkEquipment',40,5,0),
(75,'Printer',40,5,0),
(76,'Monitor',40,5,0),
(77,'Peripheral',40,5,0),
(78,'User',8,6,0),
(79,'Phone',31,1,0),
(80,'Phone',23,2,0),
(81,'Phone',3,3,0),
(82,'Phone',4,4,0),
(83,'Phone',40,5,0),
(84,'Phone',19,6,0),
(85,'Phone',7,7,0),
(86,'Group',16,1,0),
(87,'AllAssets',31,1,0),
(88,'ReservationItem',4,1,0),
(89,'ReservationItem',3,2,0),
(90,'Budget',3,2,0),
(91,'Software',72,4,0),
(92,'Software',163,5,0),
(93,'Budget',5,1,0),
(94,'Budget',4,3,0),
(95,'Budget',19,4,0),
(96,'CronTask',8,1,0),
(97,'CronTask',3,2,0),
(98,'CronTask',4,3,0),
(99,'CronTask',7,4,0),
(100,'RequestType',14,1,0),
(101,'RequestType',15,2,0),
(102,'NotificationTemplate',4,1,0),
(103,'NotificationTemplate',16,2,0),
(104,'Notification',5,1,0),
(105,'Notification',6,2,0),
(106,'Notification',2,3,0),
(107,'Notification',4,4,0),
(108,'Notification',80,5,0),
(109,'Notification',86,6,0),
(110,'MailCollector',2,1,0),
(111,'MailCollector',19,2,0),
(112,'AuthLDAP',3,1,0),
(113,'AuthLDAP',19,2,0),
(114,'AuthMail',3,1,0),
(115,'AuthMail',19,2,0),
(116,'IPNetwork',18,1,0),
(117,'WifiNetwork',10,1,0),
(118,'Profile',2,1,0),
(119,'Profile',3,2,0),
(120,'Profile',19,3,0),
(121,'Transfer',19,1,0),
(122,'TicketValidation',3,1,0),
(123,'TicketValidation',2,2,0),
(124,'TicketValidation',8,3,0),
(125,'TicketValidation',4,4,0),
(126,'TicketValidation',9,5,0),
(127,'TicketValidation',7,6,0),
(128,'NotImportedEmail',2,1,0),
(129,'NotImportedEmail',5,2,0),
(130,'NotImportedEmail',4,3,0),
(131,'NotImportedEmail',6,4,0),
(132,'NotImportedEmail',16,5,0),
(133,'NotImportedEmail',19,6,0),
(134,'RuleRightParameter',11,1,0),
(135,'Ticket',12,1,0),
(136,'Ticket',19,2,0),
(137,'Ticket',15,3,0),
(138,'Ticket',3,4,0),
(139,'Ticket',4,5,0),
(140,'Ticket',5,6,0),
(141,'Ticket',7,7,0),
(142,'Calendar',19,1,0),
(143,'Holiday',11,1,0),
(144,'Holiday',12,2,0),
(145,'Holiday',13,3,0),
(146,'SLA',4,1,0),
(147,'Ticket',18,8,0),
(148,'AuthLDAP',30,3,0),
(149,'AuthMail',6,3,0),
(150,'FQDN',11,1,0),
(151,'FieldUnicity',1,1,0),
(152,'FieldUnicity',80,2,0),
(153,'FieldUnicity',4,3,0),
(154,'FieldUnicity',3,4,0),
(155,'FieldUnicity',86,5,0),
(156,'FieldUnicity',30,6,0),
(157,'Problem',21,1,0),
(158,'Problem',12,2,0),
(159,'Problem',19,3,0),
(160,'Problem',15,4,0),
(161,'Problem',3,5,0),
(162,'Problem',7,6,0),
(163,'Problem',18,7,0),
(164,'Vlan',11,1,0),
(165,'TicketRecurrent',11,1,0),
(166,'TicketRecurrent',12,2,0),
(167,'TicketRecurrent',13,3,0),
(168,'TicketRecurrent',15,4,0),
(169,'TicketRecurrent',14,5,0),
(170,'Reminder',2,1,0),
(171,'Reminder',3,2,0),
(172,'Reminder',4,3,0),
(173,'Reminder',5,4,0),
(174,'Reminder',6,5,0),
(175,'Reminder',7,6,0),
(176,'IPNetwork',10,2,0),
(177,'IPNetwork',11,3,0),
(178,'IPNetwork',12,4,0),
(179,'IPNetwork',17,5,0),
(180,'NetworkName',12,1,0),
(181,'NetworkName',13,2,0),
(182,'RSSFeed',2,1,0),
(183,'RSSFeed',4,2,0),
(184,'RSSFeed',5,3,0),
(185,'RSSFeed',19,4,0),
(186,'RSSFeed',6,5,0),
(187,'RSSFeed',7,6,0),
(188,'Blacklist',12,1,0),
(189,'Blacklist',11,2,0),
(190,'ReservationItem',5,3,0),
(191,'QueuedNotification',16,1,0),
(192,'QueuedNotification',7,2,0),
(193,'QueuedNotification',20,3,0),
(194,'QueuedNotification',21,4,0),
(195,'QueuedNotification',22,5,0),
(196,'QueuedNotification',15,6,0),
(197,'Change',12,1,0),
(198,'Change',19,2,0),
(199,'Change',15,3,0),
(200,'Change',7,4,0),
(201,'Change',18,5,0),
(202,'Project',3,1,0),
(203,'Project',4,2,0),
(204,'Project',12,3,0),
(205,'Project',5,4,0),
(206,'Project',15,5,0),
(207,'Project',21,6,0),
(208,'ProjectState',12,1,0),
(209,'ProjectState',11,2,0),
(210,'ProjectTask',2,1,0),
(211,'ProjectTask',12,2,0),
(212,'ProjectTask',14,3,0),
(213,'ProjectTask',5,4,0),
(214,'ProjectTask',7,5,0),
(215,'ProjectTask',8,6,0),
(216,'ProjectTask',13,7,0),
(217,'CartridgeItem',9,5,0),
(218,'ConsumableItem',9,5,0),
(219,'ReservationItem',9,4,0),
(220,'SoftwareLicense',1,1,0),
(221,'SoftwareLicense',3,2,0),
(222,'SoftwareLicense',10,3,0),
(223,'SoftwareLicense',162,4,0),
(224,'SoftwareLicense',5,5,0),
(225,'SavedSearch',8,1,0),
(226,'SavedSearch',9,1,0),
(227,'SavedSearch',3,1,0),
(228,'SavedSearch',10,1,0),
(229,'SavedSearch',11,1,0),
(230,'Plugin',2,1,0),
(231,'Plugin',3,2,0),
(232,'Plugin',4,3,0),
(233,'Plugin',5,4,0),
(234,'Plugin',6,5,0),
(235,'Plugin',7,6,0),
(236,'Plugin',8,7,0),
(237,'Cluster',31,1,0),
(238,'Cluster',19,2,0),
(239,'Domain',3,1,0),
(240,'Domain',4,2,0),
(241,'Domain',2,3,0),
(242,'Domain',6,4,0),
(243,'Domain',7,5,0),
(244,'DomainRecord',2,1,0),
(245,'DomainRecord',3,2,0),
(246,'Appliance',2,1,0),
(247,'Appliance',3,2,0),
(248,'Appliance',4,3,0),
(249,'Appliance',5,4,0),
(250,'Lockedfield',3,1,0),
(251,'Lockedfield',13,2,0),
(252,'Lockedfield',5,3,0),
(253,'Unmanaged',2,1,0),
(254,'Unmanaged',4,2,0),
(255,'Unmanaged',3,3,0),
(256,'Unmanaged',5,4,0),
(257,'Unmanaged',7,5,0),
(258,'Unmanaged',10,6,0),
(259,'Unmanaged',18,7,0),
(260,'Unmanaged',14,8,0),
(261,'Unmanaged',15,9,0),
(262,'Unmanaged',9,10,0),
(263,'NetworkPortType',10,1,0),
(264,'NetworkPortType',11,2,0),
(265,'NetworkPortType',12,3,0),
(266,'NetworkPort',3,1,0),
(267,'NetworkPort',30,2,0),
(268,'NetworkPort',31,3,0),
(269,'NetworkPort',32,4,0),
(270,'NetworkPort',33,5,0),
(271,'NetworkPort',34,6,0),
(272,'NetworkPort',35,7,0),
(273,'NetworkPort',36,8,0),
(274,'NetworkPort',38,9,0),
(275,'NetworkPort',39,10,0),
(276,'NetworkPort',40,11,0),
(277,'NetworkPort',6,12,0),
(278,'USBVendor',10,1,0),
(279,'USBVendor',11,2,0),
(280,'PCIVendor',10,1,0),
(281,'PCIVendor',11,2,0),
(282,'Agent',2,1,0),
(283,'Agent',4,2,0),
(284,'Agent',10,3,0),
(285,'Agent',8,4,0),
(286,'Agent',11,5,0),
(287,'Agent',6,6,0),
(288,'Agent',15,7,0),
(289,'Database',2,1,0),
(290,'Database',3,2,0),
(291,'Database',6,3,0),
(292,'Database',9,4,0),
(293,'Database',10,5,0),
(294,'Glpi\\Socket',5,1,0),
(295,'Glpi\\Socket',6,2,0),
(296,'Glpi\\Socket',9,3,0),
(297,'Glpi\\Socket',8,4,0),
(298,'Glpi\\Socket',7,5,0),
(299,'Cable',4,1,0),
(300,'Cable',31,2,0),
(301,'Cable',6,3,0),
(302,'Cable',15,4,0),
(303,'Cable',24,5,0),
(304,'Cable',8,6,0),
(305,'Cable',10,7,0),
(306,'Cable',13,8,0),
(307,'Cable',14,9,0);
/*!40000 ALTER TABLE `glpi_displaypreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_documentcategories`
--

DROP TABLE IF EXISTS `glpi_documentcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_documentcategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `documentcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`documentcategories_id`,`name`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_documentcategories`
--

LOCK TABLES `glpi_documentcategories` WRITE;
/*!40000 ALTER TABLE `glpi_documentcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_documentcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_documents`
--

DROP TABLE IF EXISTS `glpi_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL COMMENT 'for display and transfert',
  `filepath` varchar(255) DEFAULT NULL COMMENT 'file storage path',
  `documentcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `mime` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `link` varchar(255) DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tickets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sha1sum` char(40) DEFAULT NULL,
  `is_blacklisted` tinyint(4) NOT NULL DEFAULT 0,
  `tag` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `tickets_id` (`tickets_id`),
  KEY `users_id` (`users_id`),
  KEY `documentcategories_id` (`documentcategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `sha1sum` (`sha1sum`),
  KEY `tag` (`tag`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_documents`
--

LOCK TABLES `glpi_documents` WRITE;
/*!40000 ALTER TABLE `glpi_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_documents_items`
--

DROP TABLE IF EXISTS `glpi_documents_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_documents_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documents_id` int(10) unsigned NOT NULL DEFAULT 0,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int(10) unsigned DEFAULT 0,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`documents_id`,`itemtype`,`items_id`,`timeline_position`),
  KEY `item` (`itemtype`,`items_id`,`entities_id`,`is_recursive`),
  KEY `users_id` (`users_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `date` (`date`),
  KEY `timeline_position` (`timeline_position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_documents_items`
--

LOCK TABLES `glpi_documents_items` WRITE;
/*!40000 ALTER TABLE `glpi_documents_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_documents_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_documenttypes`
--

DROP TABLE IF EXISTS `glpi_documenttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_documenttypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `is_uploadable` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`ext`),
  KEY `name` (`name`),
  KEY `is_uploadable` (`is_uploadable`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_documenttypes`
--

LOCK TABLES `glpi_documenttypes` WRITE;
/*!40000 ALTER TABLE `glpi_documenttypes` DISABLE KEYS */;
INSERT INTO `glpi_documenttypes` VALUES
(1,'JPEG','jpg','jpg-dist.png',NULL,1,NULL,NULL,NULL),
(2,'PNG','png','png-dist.png',NULL,1,NULL,NULL,NULL),
(3,'GIF','gif','gif-dist.png',NULL,1,NULL,NULL,NULL),
(4,'BMP','bmp','bmp-dist.png',NULL,1,NULL,NULL,NULL),
(5,'Photoshop','psd','psd-dist.png',NULL,1,NULL,NULL,NULL),
(6,'TIFF','tif','tif-dist.png',NULL,1,NULL,NULL,NULL),
(7,'AIFF','aiff','aiff-dist.png',NULL,1,NULL,NULL,NULL),
(8,'Windows Media','asf','asf-dist.png',NULL,1,NULL,NULL,NULL),
(9,'Windows Media','avi','avi-dist.png',NULL,1,NULL,NULL,NULL),
(10,'BZip','bz2','bz2-dist.png',NULL,1,NULL,NULL,NULL),
(11,'Word','doc','doc-dist.png',NULL,1,NULL,NULL,NULL),
(12,'DjVu','djvu','',NULL,1,NULL,NULL,NULL),
(13,'PostScript','eps','ps-dist.png',NULL,1,NULL,NULL,NULL),
(14,'GZ','gz','gz-dist.png',NULL,1,NULL,NULL,NULL),
(15,'HTML','html','html-dist.png',NULL,1,NULL,NULL,NULL),
(16,'Midi','mid','mid-dist.png',NULL,1,NULL,NULL,NULL),
(17,'QuickTime','mov','mov-dist.png',NULL,1,NULL,NULL,NULL),
(18,'MP3','mp3','mp3-dist.png',NULL,1,NULL,NULL,NULL),
(19,'MPEG','mpg','mpg-dist.png',NULL,1,NULL,NULL,NULL),
(20,'Ogg Vorbis','ogg','ogg-dist.png',NULL,1,NULL,NULL,NULL),
(21,'PDF','pdf','pdf-dist.png',NULL,1,NULL,NULL,NULL),
(22,'PowerPoint','ppt','ppt-dist.png',NULL,1,NULL,NULL,NULL),
(23,'PostScript','ps','ps-dist.png',NULL,1,NULL,NULL,NULL),
(24,'QuickTime','qt','qt-dist.png',NULL,1,NULL,NULL,NULL),
(25,'RealAudio','ra','ra-dist.png',NULL,1,NULL,NULL,NULL),
(26,'RealAudio','ram','ram-dist.png',NULL,1,NULL,NULL,NULL),
(27,'RealAudio','rm','rm-dist.png',NULL,1,NULL,NULL,NULL),
(28,'RTF','rtf','rtf-dist.png',NULL,1,NULL,NULL,NULL),
(29,'StarOffice','sdd','sdd-dist.png',NULL,1,NULL,NULL,NULL),
(30,'StarOffice','sdw','sdw-dist.png',NULL,1,NULL,NULL,NULL),
(31,'Stuffit','sit','sit-dist.png',NULL,1,NULL,NULL,NULL),
(32,'OpenOffice Impress','sxi','sxi-dist.png',NULL,1,NULL,NULL,NULL),
(33,'OpenOffice','sxw','sxw-dist.png',NULL,1,NULL,NULL,NULL),
(34,'Flash','swf','swf-dist.png',NULL,1,NULL,NULL,NULL),
(35,'TGZ','tgz','tgz-dist.png',NULL,1,NULL,NULL,NULL),
(36,'texte','txt','txt-dist.png',NULL,1,NULL,NULL,NULL),
(37,'WAV','wav','wav-dist.png',NULL,1,NULL,NULL,NULL),
(38,'Excel','xls','xls-dist.png',NULL,1,NULL,NULL,NULL),
(39,'XML','xml','xml-dist.png',NULL,1,NULL,NULL,NULL),
(40,'Windows Media','wmv','wmv-dist.png',NULL,1,NULL,NULL,NULL),
(41,'Zip','zip','zip-dist.png',NULL,1,NULL,NULL,NULL),
(42,'MNG','mng','',NULL,1,NULL,NULL,NULL),
(43,'Adobe Illustrator','ai','ai-dist.png',NULL,1,NULL,NULL,NULL),
(44,'C source','c','c-dist.png',NULL,1,NULL,NULL,NULL),
(45,'Debian','deb','deb-dist.png',NULL,1,NULL,NULL,NULL),
(46,'DVI','dvi','dvi-dist.png',NULL,1,NULL,NULL,NULL),
(47,'C header','h','h-dist.png',NULL,1,NULL,NULL,NULL),
(48,'Pascal','pas','pas-dist.png',NULL,1,NULL,NULL,NULL),
(49,'RedHat/Mandrake/SuSE','rpm','rpm-dist.png',NULL,1,NULL,NULL,NULL),
(50,'OpenOffice Calc','sxc','sxc-dist.png',NULL,1,NULL,NULL,NULL),
(51,'LaTeX','tex','tex-dist.png',NULL,1,NULL,NULL,NULL),
(52,'GIMP multi-layer','xcf','xcf-dist.png',NULL,1,NULL,NULL,NULL),
(53,'JPEG','jpeg','jpg-dist.png',NULL,1,NULL,NULL,NULL),
(54,'Oasis Open Office Writer','odt','odt-dist.png',NULL,1,NULL,NULL,NULL),
(55,'Oasis Open Office Calc','ods','ods-dist.png',NULL,1,NULL,NULL,NULL),
(56,'Oasis Open Office Impress','odp','odp-dist.png',NULL,1,NULL,NULL,NULL),
(57,'Oasis Open Office Impress Template','otp','odp-dist.png',NULL,1,NULL,NULL,NULL),
(58,'Oasis Open Office Writer Template','ott','odt-dist.png',NULL,1,NULL,NULL,NULL),
(59,'Oasis Open Office Calc Template','ots','ods-dist.png',NULL,1,NULL,NULL,NULL),
(60,'Oasis Open Office Math','odf','odf-dist.png',NULL,1,NULL,NULL,NULL),
(61,'Oasis Open Office Draw','odg','odg-dist.png',NULL,1,NULL,NULL,NULL),
(62,'Oasis Open Office Draw Template','otg','odg-dist.png',NULL,1,NULL,NULL,NULL),
(63,'Oasis Open Office Base','odb','odb-dist.png',NULL,1,NULL,NULL,NULL),
(64,'Oasis Open Office HTML','oth','oth-dist.png',NULL,1,NULL,NULL,NULL),
(65,'Oasis Open Office Writer Master','odm','odm-dist.png',NULL,1,NULL,NULL,NULL),
(66,'Oasis Open Office Chart','odc','',NULL,1,NULL,NULL,NULL),
(67,'Oasis Open Office Image','odi','',NULL,1,NULL,NULL,NULL),
(68,'Word XML','docx','doc-dist.png',NULL,1,NULL,NULL,NULL),
(69,'Excel XML','xlsx','xls-dist.png',NULL,1,NULL,NULL,NULL),
(70,'PowerPoint XML','pptx','ppt-dist.png',NULL,1,NULL,NULL,NULL),
(71,'Comma-Separated Values','csv','csv-dist.png',NULL,1,NULL,NULL,NULL),
(72,'Scalable Vector Graphics','svg','svg-dist.png',NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_documenttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_domainrecords`
--

DROP TABLE IF EXISTS `glpi_domainrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_domainrecords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `data_obj` text DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `domains_id` int(10) unsigned NOT NULL DEFAULT 0,
  `domainrecordtypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ttl` int(11) NOT NULL,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `domains_id` (`domains_id`),
  KEY `domainrecordtypes_id` (`domainrecordtypes_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date_mod` (`date_mod`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_domainrecords`
--

LOCK TABLES `glpi_domainrecords` WRITE;
/*!40000 ALTER TABLE `glpi_domainrecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_domainrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_domainrecordtypes`
--

DROP TABLE IF EXISTS `glpi_domainrecordtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_domainrecordtypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `fields` text DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_domainrecordtypes`
--

LOCK TABLES `glpi_domainrecordtypes` WRITE;
/*!40000 ALTER TABLE `glpi_domainrecordtypes` DISABLE KEYS */;
INSERT INTO `glpi_domainrecordtypes` VALUES
(1,'A','[]',0,1,'Host address'),
(2,'AAAA','[]',0,1,'IPv6 host address'),
(3,'ALIAS','[]',0,1,'Auto resolved alias'),
(4,'CNAME','[{\"key\":\"target\",\"label\":\"Target\",\"placeholder\":\"sip.example.com.\",\"is_fqdn\":true}]',0,1,'Canonical name for an alias'),
(5,'MX','[{\"key\":\"priority\",\"label\":\"Priority\",\"placeholder\":\"10\"},{\"key\":\"server\",\"label\":\"Server\",\"placeholder\":\"mail.example.com.\",\"is_fqdn\":true}]',0,1,'Mail eXchange'),
(6,'NS','[]',0,1,'Name Server'),
(7,'PTR','[]',0,1,'Pointer'),
(8,'SOA','[{\"key\":\"primary_name_server\",\"label\":\"Primary name server\",\"placeholder\":\"ns1.example.com.\",\"is_fqdn\":true},{\"key\":\"primary_contact\",\"label\":\"Primary contact\",\"placeholder\":\"admin.example.com.\",\"is_fqdn\":true},{\"key\":\"serial\",\"label\":\"Serial\",\"placeholder\":\"2020010101\"},{\"key\":\"zone_refresh_timer\",\"label\":\"Zone refresh timer\",\"placeholder\":\"86400\"},{\"key\":\"failed_refresh_retry_timer\",\"label\":\"Failed refresh retry timer\",\"placeholder\":\"7200\"},{\"key\":\"zone_expiry_timer\",\"label\":\"Zone expiry timer\",\"placeholder\":\"1209600\"},{\"key\":\"minimum_ttl\",\"label\":\"Minimum TTL\",\"placeholder\":\"300\"}]',0,1,'Start Of Authority'),
(9,'SRV','[{\"key\":\"priority\",\"label\":\"Priority\",\"placeholder\":\"0\"},{\"key\":\"weight\",\"label\":\"Weight\",\"placeholder\":\"10\"},{\"key\":\"port\",\"label\":\"Port\",\"placeholder\":\"5060\"},{\"key\":\"target\",\"label\":\"Target\",\"placeholder\":\"sip.example.com.\",\"is_fqdn\":true}]',0,1,'Location of service'),
(10,'TXT','[{\"key\":\"data\",\"label\":\"TXT record data\",\"placeholder\":\"Your TXT record data\",\"quote_value\":true}]',0,1,'Descriptive text'),
(11,'CAA','[{\"key\":\"flag\",\"label\":\"Flag\",\"placeholder\":\"0\"},{\"key\":\"tag\",\"label\":\"Tag\",\"placeholder\":\"issue\"},{\"key\":\"value\",\"label\":\"Value\",\"placeholder\":\"letsencrypt.org\",\"quote_value\":true}]',0,1,'Certification Authority Authorization');
/*!40000 ALTER TABLE `glpi_domainrecordtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_domainrelations`
--

DROP TABLE IF EXISTS `glpi_domainrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_domainrelations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_domainrelations`
--

LOCK TABLES `glpi_domainrelations` WRITE;
/*!40000 ALTER TABLE `glpi_domainrelations` DISABLE KEYS */;
INSERT INTO `glpi_domainrelations` VALUES
(1,'Belongs',0,1,'Item belongs to domain'),
(2,'Manage',0,1,'Item manages domain');
/*!40000 ALTER TABLE `glpi_domainrelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_domains`
--

DROP TABLE IF EXISTS `glpi_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `domaintypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_expiration` timestamp NULL DEFAULT NULL,
  `date_domaincreation` timestamp NULL DEFAULT NULL,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `domaintypes_id` (`domaintypes_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date_mod` (`date_mod`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_template` (`is_template`),
  KEY `is_active` (`is_active`),
  KEY `date_expiration` (`date_expiration`),
  KEY `date_domaincreation` (`date_domaincreation`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_domains`
--

LOCK TABLES `glpi_domains` WRITE;
/*!40000 ALTER TABLE `glpi_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_domains_items`
--

DROP TABLE IF EXISTS `glpi_domains_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_domains_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domains_id` int(10) unsigned NOT NULL DEFAULT 0,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `domainrelations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`domains_id`,`itemtype`,`items_id`),
  KEY `domainrelations_id` (`domainrelations_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_domains_items`
--

LOCK TABLES `glpi_domains_items` WRITE;
/*!40000 ALTER TABLE `glpi_domains_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_domains_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_domaintypes`
--

DROP TABLE IF EXISTS `glpi_domaintypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_domaintypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_domaintypes`
--

LOCK TABLES `glpi_domaintypes` WRITE;
/*!40000 ALTER TABLE `glpi_domaintypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_domaintypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_dropdowntranslations`
--

DROP TABLE IF EXISTS `glpi_dropdowntranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_dropdowntranslations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `field` varchar(100) DEFAULT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`language`,`field`),
  KEY `language` (`language`),
  KEY `field` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_dropdowntranslations`
--

LOCK TABLES `glpi_dropdowntranslations` WRITE;
/*!40000 ALTER TABLE `glpi_dropdowntranslations` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_dropdowntranslations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_enclosuremodels`
--

DROP TABLE IF EXISTS `glpi_enclosuremodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_enclosuremodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_enclosuremodels`
--

LOCK TABLES `glpi_enclosuremodels` WRITE;
/*!40000 ALTER TABLE `glpi_enclosuremodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_enclosuremodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_enclosures`
--

DROP TABLE IF EXISTS `glpi_enclosures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_enclosures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `enclosuremodels_id` int(10) unsigned DEFAULT NULL,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `orientation` tinyint(4) DEFAULT NULL,
  `power_supplies` tinyint(4) NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'RELATION to states (id)',
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `enclosuremodels_id` (`enclosuremodels_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `group_id_tech` (`groups_id_tech`),
  KEY `is_template` (`is_template`),
  KEY `is_deleted` (`is_deleted`),
  KEY `states_id` (`states_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_enclosures`
--

LOCK TABLES `glpi_enclosures` WRITE;
/*!40000 ALTER TABLE `glpi_enclosures` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_enclosures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_entities`
--

DROP TABLE IF EXISTS `glpi_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_entities` (
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned DEFAULT 0,
  `completename` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `sons_cache` longtext DEFAULT NULL,
  `ancestors_cache` longtext DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `admin_email` varchar(255) DEFAULT NULL,
  `admin_email_name` varchar(255) DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `from_email_name` varchar(255) DEFAULT NULL,
  `noreply_email` varchar(255) DEFAULT NULL,
  `noreply_email_name` varchar(255) DEFAULT NULL,
  `replyto_email` varchar(255) DEFAULT NULL,
  `replyto_email_name` varchar(255) DEFAULT NULL,
  `notification_subject_tag` varchar(255) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `authldaps_id` int(10) unsigned NOT NULL DEFAULT 0,
  `mail_domain` varchar(255) DEFAULT NULL,
  `entity_ldapfilter` text DEFAULT NULL,
  `mailing_signature` text DEFAULT NULL,
  `cartridges_alert_repeat` int(11) NOT NULL DEFAULT -2,
  `consumables_alert_repeat` int(11) NOT NULL DEFAULT -2,
  `use_licenses_alert` int(11) NOT NULL DEFAULT -2,
  `send_licenses_alert_before_delay` int(11) NOT NULL DEFAULT -2,
  `use_certificates_alert` int(11) NOT NULL DEFAULT -2,
  `send_certificates_alert_before_delay` int(11) NOT NULL DEFAULT -2,
  `certificates_alert_repeat_interval` int(11) NOT NULL DEFAULT -2,
  `use_contracts_alert` int(11) NOT NULL DEFAULT -2,
  `send_contracts_alert_before_delay` int(11) NOT NULL DEFAULT -2,
  `use_infocoms_alert` int(11) NOT NULL DEFAULT -2,
  `send_infocoms_alert_before_delay` int(11) NOT NULL DEFAULT -2,
  `use_reservations_alert` int(11) NOT NULL DEFAULT -2,
  `use_domains_alert` int(11) NOT NULL DEFAULT -2,
  `send_domains_alert_close_expiries_delay` int(11) NOT NULL DEFAULT -2,
  `send_domains_alert_expired_delay` int(11) NOT NULL DEFAULT -2,
  `autoclose_delay` int(11) NOT NULL DEFAULT -2,
  `autopurge_delay` int(11) NOT NULL DEFAULT -2,
  `notclosed_delay` int(11) NOT NULL DEFAULT -2,
  `calendars_strategy` tinyint(4) NOT NULL DEFAULT -2,
  `calendars_id` int(10) unsigned NOT NULL DEFAULT 0,
  `auto_assign_mode` int(11) NOT NULL DEFAULT -2,
  `tickettype` int(11) NOT NULL DEFAULT -2,
  `max_closedate` timestamp NULL DEFAULT NULL,
  `inquest_config` int(11) NOT NULL DEFAULT -2,
  `inquest_rate` int(11) NOT NULL DEFAULT 0,
  `inquest_delay` int(11) NOT NULL DEFAULT -10,
  `inquest_URL` varchar(255) DEFAULT NULL,
  `autofill_warranty_date` varchar(255) NOT NULL DEFAULT '-2',
  `autofill_use_date` varchar(255) NOT NULL DEFAULT '-2',
  `autofill_buy_date` varchar(255) NOT NULL DEFAULT '-2',
  `autofill_delivery_date` varchar(255) NOT NULL DEFAULT '-2',
  `autofill_order_date` varchar(255) NOT NULL DEFAULT '-2',
  `tickettemplates_strategy` tinyint(4) NOT NULL DEFAULT -2,
  `tickettemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `changetemplates_strategy` tinyint(4) NOT NULL DEFAULT -2,
  `changetemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `problemtemplates_strategy` tinyint(4) NOT NULL DEFAULT -2,
  `problemtemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_strategy_software` tinyint(4) NOT NULL DEFAULT -2,
  `entities_id_software` int(10) unsigned NOT NULL DEFAULT 0,
  `default_contract_alert` int(11) NOT NULL DEFAULT -2,
  `default_infocom_alert` int(11) NOT NULL DEFAULT -2,
  `default_cartridges_alarm_threshold` int(11) NOT NULL DEFAULT -2,
  `default_consumables_alarm_threshold` int(11) NOT NULL DEFAULT -2,
  `delay_send_emails` int(11) NOT NULL DEFAULT -2,
  `is_notif_enable_default` int(11) NOT NULL DEFAULT -2,
  `inquest_duration` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `autofill_decommission_date` varchar(255) NOT NULL DEFAULT '-2',
  `suppliers_as_private` int(11) NOT NULL DEFAULT -2,
  `anonymize_support_agents` int(11) NOT NULL DEFAULT -2,
  `display_users_initials` int(11) NOT NULL DEFAULT -2,
  `contracts_strategy_default` tinyint(4) NOT NULL DEFAULT -2,
  `contracts_id_default` int(10) unsigned NOT NULL DEFAULT 0,
  `enable_custom_css` int(11) NOT NULL DEFAULT -2,
  `custom_css_code` text DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `altitude` varchar(255) DEFAULT NULL,
  `transfers_strategy` tinyint(4) NOT NULL DEFAULT -2,
  `transfers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `agent_base_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`name`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `tickettemplates_id` (`tickettemplates_id`),
  KEY `changetemplates_id` (`changetemplates_id`),
  KEY `problemtemplates_id` (`problemtemplates_id`),
  KEY `transfers_id` (`transfers_id`),
  KEY `authldaps_id` (`authldaps_id`),
  KEY `calendars_id` (`calendars_id`),
  KEY `entities_id_software` (`entities_id_software`),
  KEY `contracts_id_default` (`contracts_id_default`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_entities`
--

LOCK TABLES `glpi_entities` WRITE;
/*!40000 ALTER TABLE `glpi_entities` DISABLE KEYS */;
INSERT INTO `glpi_entities` VALUES
(0,'Root entity',NULL,'Root entity',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,30,1,-10,-10,0,0,0,-10,1,NULL,1,0,0,NULL,'0','0','0','0','0',0,1,0,1,0,1,-10,0,0,0,10,10,0,1,0,NULL,NULL,'0',0,0,1,0,0,0,'',NULL,NULL,NULL,0,0,NULL);
/*!40000 ALTER TABLE `glpi_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_entities_knowbaseitems`
--

DROP TABLE IF EXISTS `glpi_entities_knowbaseitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_entities_knowbaseitems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_entities_knowbaseitems`
--

LOCK TABLES `glpi_entities_knowbaseitems` WRITE;
/*!40000 ALTER TABLE `glpi_entities_knowbaseitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_entities_knowbaseitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_entities_reminders`
--

DROP TABLE IF EXISTS `glpi_entities_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_entities_reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reminders_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_entities_reminders`
--

LOCK TABLES `glpi_entities_reminders` WRITE;
/*!40000 ALTER TABLE `glpi_entities_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_entities_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_entities_rssfeeds`
--

DROP TABLE IF EXISTS `glpi_entities_rssfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_entities_rssfeeds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_entities_rssfeeds`
--

LOCK TABLES `glpi_entities_rssfeeds` WRITE;
/*!40000 ALTER TABLE `glpi_entities_rssfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_entities_rssfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_events`
--

DROP TABLE IF EXISTS `glpi_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `message` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `level` (`level`),
  KEY `item` (`type`,`items_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_events`
--

LOCK TABLES `glpi_events` WRITE;
/*!40000 ALTER TABLE `glpi_events` DISABLE KEYS */;
INSERT INTO `glpi_events` VALUES
(1,0,'system','2024-11-19 10:20:18','login',3,'Failed login for  from IP 172.22.0.1'),
(2,0,'system','2024-11-19 10:20:28','login',3,'glpi login from IP 172.22.0.1'),
(3,1,'APIClient','2024-11-19 10:21:28','setup',4,'glpi updates an item'),
(4,4,'users','2024-11-19 10:21:49','setup',5,'glpi updates an item'),
(5,0,'system','2024-11-19 10:27:13','login',3,'tech log in from IP 172.22.0.1'),
(6,1,'ticket','2024-11-19 10:27:53','tracking',4,'glpi adds the item 1'),
(7,0,'Plugin','2024-11-25 12:12:54','setup',3,'All plugins have been disabled.'),
(8,0,'system','2024-11-25 12:21:44','login',3,'tech log in from IP 172.22.0.1'),
(9,0,'system','2024-11-25 12:24:02','login',3,'glpi login from IP 172.22.0.1'),
(10,4,'users','2024-11-25 12:39:54','setup',4,'glpi adds a user to an entity'),
(11,0,'system','2024-11-25 12:41:14','login',3,'tech log in from IP 172.22.0.1'),
(12,0,'system','2024-11-25 12:41:27','login',3,'tech log in from IP 172.22.0.1'),
(13,0,'system','2024-11-25 12:46:57','login',3,'tech log in from IP 172.22.0.1'),
(14,0,'system','2024-11-25 12:48:24','login',3,'tech log in from IP 172.22.0.1'),
(15,0,'system','2024-11-25 12:52:37','login',3,'tech log in from IP 172.22.0.1'),
(16,0,'system','2024-11-25 13:40:37','login',3,'tech log in from IP 172.22.0.1'),
(17,0,'system','2024-11-25 13:41:10','login',3,'tech log in from IP 172.22.0.1'),
(18,0,'system','2024-11-25 13:41:37','login',3,'tech log in from IP 172.22.0.1'),
(19,0,'system','2024-11-25 13:42:24','login',3,'glpi login from IP 172.22.0.1'),
(20,4,'users','2024-11-25 13:42:36','setup',5,'glpi updates an item'),
(21,0,'system','2024-11-25 13:42:46','login',3,'tech log in from IP 172.22.0.1'),
(22,0,'system','2024-11-25 13:43:26','login',3,'tech log in from IP 172.22.0.1'),
(23,0,'system','2024-11-25 13:46:07','login',3,'tech log in from IP 172.22.0.1'),
(24,0,'system','2024-11-25 13:46:46','login',3,'tech log in from IP 172.22.0.1'),
(25,1,'computers','2024-11-25 13:48:16','inventory',4,'glpi adds the item Test computer'),
(26,0,'system','2024-11-25 13:48:24','login',3,'tech log in from IP 172.22.0.1'),
(27,1,'groups','2024-11-25 13:49:18','setup',4,'glpi adds the item group1'),
(28,0,'system','2024-11-25 13:49:50','login',3,'tech log in from IP 172.22.0.1'),
(29,1,'computers','2024-11-25 13:49:58','inventory',4,'glpi updates an item'),
(30,0,'system','2024-11-25 13:50:03','login',3,'tech log in from IP 172.22.0.1'),
(31,1,'ticket','2024-11-25 14:13:28','tracking',4,'glpi updates an item'),
(32,0,'system','2024-11-25 14:13:33','login',3,'tech log in from IP 172.22.0.1'),
(33,0,'system','2024-11-25 14:15:30','login',3,'tech log in from IP 172.22.0.1'),
(34,0,'system','2024-11-25 14:18:47','login',3,'tech log in from IP 172.22.0.1'),
(35,1,'computers','2024-11-25 14:20:05','inventory',4,'glpi updates an item'),
(36,0,'system','2024-11-25 14:20:11','login',3,'tech log in from IP 172.22.0.1'),
(37,2,'ticket','2024-11-25 14:21:33','tracking',4,'glpi adds the item 2'),
(38,2,'ticket','2024-11-25 14:21:41','tracking',4,'glpi deletes an item'),
(39,0,'system','2024-11-25 14:21:49','login',3,'tech log in from IP 172.22.0.1'),
(40,1,'monitors','2024-11-25 14:22:16','inventory',4,'glpi adds the item Monitor 1'),
(41,2,'monitors','2024-11-25 14:22:22','inventory',4,'glpi adds the item Monitor 2'),
(42,0,'system','2024-11-25 14:22:28','login',3,'tech log in from IP 172.22.0.1'),
(43,1,'monitors','2024-11-25 14:23:17','inventory',4,'glpi updates an item'),
(44,2,'monitors','2024-11-25 14:23:26','inventory',4,'glpi updates an item'),
(45,0,'system','2024-11-25 14:23:30','login',3,'tech log in from IP 172.22.0.1'),
(46,2,'monitors','2024-11-25 14:24:23','inventory',4,'glpi updates an item'),
(47,0,'system','2024-11-25 14:24:27','login',3,'tech log in from IP 172.22.0.1'),
(48,1,'monitors','2024-11-25 14:24:43','inventory',4,'glpi updates an item'),
(49,0,'system','2024-11-25 14:24:48','login',3,'tech log in from IP 172.22.0.1'),
(50,1,'monitors','2024-11-25 14:25:13','inventory',4,'glpi updates an item'),
(51,0,'system','2024-11-25 14:25:16','login',3,'tech log in from IP 172.22.0.1'),
(52,1,'computers','2024-11-25 14:26:27','inventory',4,'glpi updates an item'),
(53,0,'system','2024-11-25 14:26:31','login',3,'tech log in from IP 172.22.0.1'),
(54,1,'racks','2024-11-25 14:27:39','inventory',4,'glpi adds the item rack1'),
(55,1,'racks','2024-11-25 14:28:01','inventory',4,'glpi updates an item'),
(56,0,'system','2024-11-25 14:28:20','login',3,'tech log in from IP 172.22.0.1'),
(57,0,'system','2024-11-25 14:28:42','login',3,'tech log in from IP 172.22.0.1'),
(58,0,'system','2024-11-25 14:29:17','login',3,'tech log in from IP 172.22.0.1'),
(59,1,'monitors','2024-11-25 14:44:12','inventory',4,'glpi updates an item'),
(60,2,'monitors','2024-11-25 14:44:19','inventory',4,'glpi updates an item'),
(61,0,'system','2024-11-25 14:44:24','login',3,'tech log in from IP 172.22.0.1'),
(62,2,'monitors','2024-11-25 14:44:32','inventory',4,'glpi updates an item'),
(63,2,'monitors','2024-11-25 14:44:40','inventory',4,'glpi updates an item'),
(64,0,'system','2024-11-25 14:44:52','login',3,'tech log in from IP 172.22.0.1'),
(65,0,'system','2024-11-25 14:46:06','login',3,'tech log in from IP 172.22.0.1'),
(66,0,'system','2024-11-25 14:47:56','login',3,'tech log in from IP 172.22.0.1'),
(67,1,'monitors','2024-11-25 14:51:17','inventory',4,'glpi updates an item'),
(68,2,'monitors','2024-11-25 14:51:22','inventory',4,'glpi updates an item'),
(69,0,'system','2024-11-25 14:51:26','login',3,'tech log in from IP 172.22.0.1'),
(70,0,'system','2024-11-25 14:51:38','login',3,'tech log in from IP 172.22.0.1'),
(71,0,'system','2024-11-25 14:52:17','login',3,'tech log in from IP 172.22.0.1'),
(72,0,'system','2025-01-27 12:34:42','login',3,'Failed login for  from IP 172.22.0.1'),
(73,0,'system','2025-01-27 12:34:48','login',3,'glpi login from IP 172.22.0.1'),
(74,1,'State','2025-01-27 13:08:50','setup',4,'glpi adds the item Operational'),
(75,2,'State','2025-01-27 13:09:00','setup',4,'glpi adds the item Defective'),
(76,1,'PrinterType','2025-01-27 13:11:00','setup',4,'glpi adds the item Dot matrix'),
(77,2,'PrinterType','2025-01-27 13:11:12','setup',4,'glpi adds the item Inkjet'),
(78,3,'PrinterType','2025-01-27 13:11:27','setup',4,'glpi adds the item Laser'),
(79,1,'printers','2025-01-27 13:11:42','inventory',4,'glpi adds the item Dot matrix printer 1'),
(80,2,'printers','2025-01-27 13:12:07','inventory',4,'glpi adds the item Jet printer operational'),
(81,3,'printers','2025-01-27 13:12:20','inventory',4,'glpi adds the item Jet printer defective'),
(82,4,'printers','2025-01-27 13:12:31','inventory',4,'glpi adds the item Laser printer 1');
/*!40000 ALTER TABLE `glpi_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_fieldblacklists`
--

DROP TABLE IF EXISTS `glpi_fieldblacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_fieldblacklists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `field` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_fieldblacklists`
--

LOCK TABLES `glpi_fieldblacklists` WRITE;
/*!40000 ALTER TABLE `glpi_fieldblacklists` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_fieldblacklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_fieldunicities`
--

DROP TABLE IF EXISTS `glpi_fieldunicities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_fieldunicities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `fields` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `action_refuse` tinyint(4) NOT NULL DEFAULT 0,
  `action_notify` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Stores field unicity criterias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_fieldunicities`
--

LOCK TABLES `glpi_fieldunicities` WRITE;
/*!40000 ALTER TABLE `glpi_fieldunicities` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_fieldunicities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_filesystems`
--

DROP TABLE IF EXISTS `glpi_filesystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_filesystems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_filesystems`
--

LOCK TABLES `glpi_filesystems` WRITE;
/*!40000 ALTER TABLE `glpi_filesystems` DISABLE KEYS */;
INSERT INTO `glpi_filesystems` VALUES
(1,'ext',NULL,NULL,NULL),
(2,'ext2',NULL,NULL,NULL),
(3,'ext3',NULL,NULL,NULL),
(4,'ext4',NULL,NULL,NULL),
(5,'FAT',NULL,NULL,NULL),
(6,'FAT32',NULL,NULL,NULL),
(7,'VFAT',NULL,NULL,NULL),
(8,'HFS',NULL,NULL,NULL),
(9,'HPFS',NULL,NULL,NULL),
(10,'HTFS',NULL,NULL,NULL),
(11,'JFS',NULL,NULL,NULL),
(12,'JFS2',NULL,NULL,NULL),
(13,'NFS',NULL,NULL,NULL),
(14,'NTFS',NULL,NULL,NULL),
(15,'ReiserFS',NULL,NULL,NULL),
(16,'SMBFS',NULL,NULL,NULL),
(17,'UDF',NULL,NULL,NULL),
(18,'UFS',NULL,NULL,NULL),
(19,'XFS',NULL,NULL,NULL),
(20,'ZFS',NULL,NULL,NULL),
(21,'APFS',NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_filesystems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_fqdns`
--

DROP TABLE IF EXISTS `glpi_fqdns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_fqdns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `fqdn` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `name` (`name`),
  KEY `fqdn` (`fqdn`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_fqdns`
--

LOCK TABLES `glpi_fqdns` WRITE;
/*!40000 ALTER TABLE `glpi_fqdns` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_fqdns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_groups`
--

DROP TABLE IF EXISTS `glpi_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `ldap_field` varchar(255) DEFAULT NULL,
  `ldap_value` text DEFAULT NULL,
  `ldap_group_dn` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `is_requester` tinyint(4) NOT NULL DEFAULT 1,
  `is_watcher` tinyint(4) NOT NULL DEFAULT 1,
  `is_assign` tinyint(4) NOT NULL DEFAULT 1,
  `is_task` tinyint(4) NOT NULL DEFAULT 1,
  `is_notify` tinyint(4) NOT NULL DEFAULT 1,
  `is_itemgroup` tinyint(4) NOT NULL DEFAULT 1,
  `is_usergroup` tinyint(4) NOT NULL DEFAULT 1,
  `is_manager` tinyint(4) NOT NULL DEFAULT 1,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `ldap_field` (`ldap_field`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `ldap_value` (`ldap_value`(200)),
  KEY `ldap_group_dn` (`ldap_group_dn`(200)),
  KEY `groups_id` (`groups_id`),
  KEY `is_requester` (`is_requester`),
  KEY `is_watcher` (`is_watcher`),
  KEY `is_assign` (`is_assign`),
  KEY `is_notify` (`is_notify`),
  KEY `is_itemgroup` (`is_itemgroup`),
  KEY `is_usergroup` (`is_usergroup`),
  KEY `is_manager` (`is_manager`),
  KEY `date_creation` (`date_creation`),
  KEY `level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_groups`
--

LOCK TABLES `glpi_groups` WRITE;
/*!40000 ALTER TABLE `glpi_groups` DISABLE KEYS */;
INSERT INTO `glpi_groups` VALUES
(1,0,0,'group1','',NULL,NULL,NULL,'2024-11-25 13:49:18',0,'group1',1,'[]',NULL,1,1,1,1,1,1,1,1,'2024-11-25 13:49:18');
/*!40000 ALTER TABLE `glpi_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_groups_knowbaseitems`
--

DROP TABLE IF EXISTS `glpi_groups_knowbaseitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_groups_knowbaseitems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_groups_knowbaseitems`
--

LOCK TABLES `glpi_groups_knowbaseitems` WRITE;
/*!40000 ALTER TABLE `glpi_groups_knowbaseitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_groups_knowbaseitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_groups_problems`
--

DROP TABLE IF EXISTS `glpi_groups_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_groups_problems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_groups_problems`
--

LOCK TABLES `glpi_groups_problems` WRITE;
/*!40000 ALTER TABLE `glpi_groups_problems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_groups_problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_groups_reminders`
--

DROP TABLE IF EXISTS `glpi_groups_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_groups_reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reminders_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_groups_reminders`
--

LOCK TABLES `glpi_groups_reminders` WRITE;
/*!40000 ALTER TABLE `glpi_groups_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_groups_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_groups_rssfeeds`
--

DROP TABLE IF EXISTS `glpi_groups_rssfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_groups_rssfeeds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `groups_id` (`groups_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_groups_rssfeeds`
--

LOCK TABLES `glpi_groups_rssfeeds` WRITE;
/*!40000 ALTER TABLE `glpi_groups_rssfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_groups_rssfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_groups_tickets`
--

DROP TABLE IF EXISTS `glpi_groups_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_groups_tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`groups_id`),
  KEY `group` (`groups_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_groups_tickets`
--

LOCK TABLES `glpi_groups_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_groups_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_groups_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_groups_users`
--

DROP TABLE IF EXISTS `glpi_groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_groups_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_manager` tinyint(4) NOT NULL DEFAULT 0,
  `is_userdelegate` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`groups_id`),
  KEY `groups_id` (`groups_id`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_manager` (`is_manager`),
  KEY `is_userdelegate` (`is_userdelegate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_groups_users`
--

LOCK TABLES `glpi_groups_users` WRITE;
/*!40000 ALTER TABLE `glpi_groups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_holidays`
--

DROP TABLE IF EXISTS `glpi_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_perpetual` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `is_perpetual` (`is_perpetual`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_holidays`
--

LOCK TABLES `glpi_holidays` WRITE;
/*!40000 ALTER TABLE `glpi_holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_imageformats`
--

DROP TABLE IF EXISTS `glpi_imageformats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_imageformats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_imageformats`
--

LOCK TABLES `glpi_imageformats` WRITE;
/*!40000 ALTER TABLE `glpi_imageformats` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_imageformats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_imageresolutions`
--

DROP TABLE IF EXISTS `glpi_imageresolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_imageresolutions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `is_video` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `is_video` (`is_video`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_imageresolutions`
--

LOCK TABLES `glpi_imageresolutions` WRITE;
/*!40000 ALTER TABLE `glpi_imageresolutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_imageresolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_impactcompounds`
--

DROP TABLE IF EXISTS `glpi_impactcompounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_impactcompounds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `color` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_impactcompounds`
--

LOCK TABLES `glpi_impactcompounds` WRITE;
/*!40000 ALTER TABLE `glpi_impactcompounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_impactcompounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_impactcontexts`
--

DROP TABLE IF EXISTS `glpi_impactcontexts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_impactcontexts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `positions` mediumtext NOT NULL,
  `zoom` float NOT NULL DEFAULT 0,
  `pan_x` float NOT NULL DEFAULT 0,
  `pan_y` float NOT NULL DEFAULT 0,
  `impact_color` varchar(255) NOT NULL DEFAULT '',
  `depends_color` varchar(255) NOT NULL DEFAULT '',
  `impact_and_depends_color` varchar(255) NOT NULL DEFAULT '',
  `show_depends` tinyint(4) NOT NULL DEFAULT 1,
  `show_impact` tinyint(4) NOT NULL DEFAULT 1,
  `max_depth` int(11) NOT NULL DEFAULT 5,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_impactcontexts`
--

LOCK TABLES `glpi_impactcontexts` WRITE;
/*!40000 ALTER TABLE `glpi_impactcontexts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_impactcontexts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_impactitems`
--

DROP TABLE IF EXISTS `glpi_impactitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_impactitems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `impactcontexts_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_slave` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  KEY `source` (`itemtype`,`items_id`),
  KEY `parent_id` (`parent_id`),
  KEY `impactcontexts_id` (`impactcontexts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_impactitems`
--

LOCK TABLES `glpi_impactitems` WRITE;
/*!40000 ALTER TABLE `glpi_impactitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_impactitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_impactrelations`
--

DROP TABLE IF EXISTS `glpi_impactrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_impactrelations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype_source` varchar(255) NOT NULL DEFAULT '',
  `items_id_source` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype_impacted` varchar(255) NOT NULL DEFAULT '',
  `items_id_impacted` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype_source`,`items_id_source`,`itemtype_impacted`,`items_id_impacted`),
  KEY `impacted_asset` (`itemtype_impacted`,`items_id_impacted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_impactrelations`
--

LOCK TABLES `glpi_impactrelations` WRITE;
/*!40000 ALTER TABLE `glpi_impactrelations` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_impactrelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_infocoms`
--

DROP TABLE IF EXISTS `glpi_infocoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_infocoms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `buy_date` date DEFAULT NULL,
  `use_date` date DEFAULT NULL,
  `warranty_duration` int(11) NOT NULL DEFAULT 0,
  `warranty_info` varchar(255) DEFAULT NULL,
  `suppliers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `order_number` varchar(255) DEFAULT NULL,
  `delivery_number` varchar(255) DEFAULT NULL,
  `immo_number` varchar(255) DEFAULT NULL,
  `value` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `warranty_value` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `sink_time` int(11) NOT NULL DEFAULT 0,
  `sink_type` int(11) NOT NULL DEFAULT 0,
  `sink_coeff` float NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `bill` varchar(255) DEFAULT NULL,
  `budgets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `alert` int(11) NOT NULL DEFAULT 0,
  `order_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `inventory_date` date DEFAULT NULL,
  `warranty_date` date DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `decommission_date` timestamp NULL DEFAULT NULL,
  `businesscriticities_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  KEY `buy_date` (`buy_date`),
  KEY `alert` (`alert`),
  KEY `budgets_id` (`budgets_id`),
  KEY `suppliers_id` (`suppliers_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `businesscriticities_id` (`businesscriticities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_infocoms`
--

LOCK TABLES `glpi_infocoms` WRITE;
/*!40000 ALTER TABLE `glpi_infocoms` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_infocoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_interfacetypes`
--

DROP TABLE IF EXISTS `glpi_interfacetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_interfacetypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_interfacetypes`
--

LOCK TABLES `glpi_interfacetypes` WRITE;
/*!40000 ALTER TABLE `glpi_interfacetypes` DISABLE KEYS */;
INSERT INTO `glpi_interfacetypes` VALUES
(1,'IDE',NULL,NULL,NULL),
(2,'SATA',NULL,NULL,NULL),
(3,'SCSI',NULL,NULL,NULL),
(4,'USB',NULL,NULL,NULL),
(5,'AGP',NULL,NULL,NULL),
(6,'PCI',NULL,NULL,NULL),
(7,'PCIe',NULL,NULL,NULL),
(8,'PCI-X',NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_interfacetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ipaddresses`
--

DROP TABLE IF EXISTS `glpi_ipaddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ipaddresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `version` tinyint(3) unsigned DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `binary_0` int(10) unsigned NOT NULL DEFAULT 0,
  `binary_1` int(10) unsigned NOT NULL DEFAULT 0,
  `binary_2` int(10) unsigned NOT NULL DEFAULT 0,
  `binary_3` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `mainitems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `mainitemtype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `binary` (`binary_0`,`binary_1`,`binary_2`,`binary_3`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `item` (`itemtype`,`items_id`,`is_deleted`),
  KEY `mainitem` (`mainitemtype`,`mainitems_id`,`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ipaddresses`
--

LOCK TABLES `glpi_ipaddresses` WRITE;
/*!40000 ALTER TABLE `glpi_ipaddresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_ipaddresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ipaddresses_ipnetworks`
--

DROP TABLE IF EXISTS `glpi_ipaddresses_ipnetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ipaddresses_ipnetworks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipaddresses_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ipnetworks_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`ipaddresses_id`,`ipnetworks_id`),
  KEY `ipnetworks_id` (`ipnetworks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ipaddresses_ipnetworks`
--

LOCK TABLES `glpi_ipaddresses_ipnetworks` WRITE;
/*!40000 ALTER TABLE `glpi_ipaddresses_ipnetworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_ipaddresses_ipnetworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ipnetworks`
--

DROP TABLE IF EXISTS `glpi_ipnetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ipnetworks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `ipnetworks_id` int(10) unsigned NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `addressable` tinyint(4) NOT NULL DEFAULT 0,
  `version` tinyint(3) unsigned DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `address_0` int(10) unsigned NOT NULL DEFAULT 0,
  `address_1` int(10) unsigned NOT NULL DEFAULT 0,
  `address_2` int(10) unsigned NOT NULL DEFAULT 0,
  `address_3` int(10) unsigned NOT NULL DEFAULT 0,
  `netmask` varchar(40) DEFAULT NULL,
  `netmask_0` int(10) unsigned NOT NULL DEFAULT 0,
  `netmask_1` int(10) unsigned NOT NULL DEFAULT 0,
  `netmask_2` int(10) unsigned NOT NULL DEFAULT 0,
  `netmask_3` int(10) unsigned NOT NULL DEFAULT 0,
  `gateway` varchar(40) DEFAULT NULL,
  `gateway_0` int(10) unsigned NOT NULL DEFAULT 0,
  `gateway_1` int(10) unsigned NOT NULL DEFAULT 0,
  `gateway_2` int(10) unsigned NOT NULL DEFAULT 0,
  `gateway_3` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `network_definition` (`entities_id`,`address`,`netmask`),
  KEY `address` (`address_0`,`address_1`,`address_2`,`address_3`),
  KEY `netmask` (`netmask_0`,`netmask_1`,`netmask_2`,`netmask_3`),
  KEY `gateway` (`gateway_0`,`gateway_1`,`gateway_2`,`gateway_3`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `ipnetworks_id` (`ipnetworks_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ipnetworks`
--

LOCK TABLES `glpi_ipnetworks` WRITE;
/*!40000 ALTER TABLE `glpi_ipnetworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_ipnetworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ipnetworks_vlans`
--

DROP TABLE IF EXISTS `glpi_ipnetworks_vlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ipnetworks_vlans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipnetworks_id` int(10) unsigned NOT NULL DEFAULT 0,
  `vlans_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`ipnetworks_id`,`vlans_id`),
  KEY `vlans_id` (`vlans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ipnetworks_vlans`
--

LOCK TABLES `glpi_ipnetworks_vlans` WRITE;
/*!40000 ALTER TABLE `glpi_ipnetworks_vlans` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_ipnetworks_vlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_clusters`
--

DROP TABLE IF EXISTS `glpi_items_clusters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_clusters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clusters_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`clusters_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_clusters`
--

LOCK TABLES `glpi_items_clusters` WRITE;
/*!40000 ALTER TABLE `glpi_items_clusters` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_clusters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicebatteries`
--

DROP TABLE IF EXISTS `glpi_items_devicebatteries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicebatteries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicebatteries_id` int(10) unsigned NOT NULL DEFAULT 0,
  `manufacturing_date` date DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `real_capacity` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `devicebatteries_id` (`devicebatteries_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicebatteries`
--

LOCK TABLES `glpi_items_devicebatteries` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicebatteries` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicebatteries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicecameras`
--

DROP TABLE IF EXISTS `glpi_items_devicecameras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicecameras` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicecameras_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `items_id` (`items_id`),
  KEY `devicecameras_id` (`devicecameras_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicecameras`
--

LOCK TABLES `glpi_items_devicecameras` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicecameras` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicecameras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicecameras_imageformats`
--

DROP TABLE IF EXISTS `glpi_items_devicecameras_imageformats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicecameras_imageformats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_devicecameras_id` int(10) unsigned NOT NULL DEFAULT 0,
  `imageformats_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `items_devicecameras_id` (`items_devicecameras_id`),
  KEY `imageformats_id` (`imageformats_id`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicecameras_imageformats`
--

LOCK TABLES `glpi_items_devicecameras_imageformats` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicecameras_imageformats` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicecameras_imageformats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicecameras_imageresolutions`
--

DROP TABLE IF EXISTS `glpi_items_devicecameras_imageresolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicecameras_imageresolutions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_devicecameras_id` int(10) unsigned NOT NULL DEFAULT 0,
  `imageresolutions_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `items_devicecameras_id` (`items_devicecameras_id`),
  KEY `imageresolutions_id` (`imageresolutions_id`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicecameras_imageresolutions`
--

LOCK TABLES `glpi_items_devicecameras_imageresolutions` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicecameras_imageresolutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicecameras_imageresolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicecases`
--

DROP TABLE IF EXISTS `glpi_items_devicecases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicecases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicecases_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `devicecases_id` (`devicecases_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicecases`
--

LOCK TABLES `glpi_items_devicecases` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicecases` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicecases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicecontrols`
--

DROP TABLE IF EXISTS `glpi_items_devicecontrols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicecontrols` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicecontrols_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `devicecontrols_id` (`devicecontrols_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicecontrols`
--

LOCK TABLES `glpi_items_devicecontrols` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicecontrols` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicecontrols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicedrives`
--

DROP TABLE IF EXISTS `glpi_items_devicedrives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicedrives` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicedrives_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `devicedrives_id` (`devicedrives_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicedrives`
--

LOCK TABLES `glpi_items_devicedrives` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicedrives` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicedrives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicefirmwares`
--

DROP TABLE IF EXISTS `glpi_items_devicefirmwares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicefirmwares` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicefirmwares_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `devicefirmwares_id` (`devicefirmwares_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicefirmwares`
--

LOCK TABLES `glpi_items_devicefirmwares` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicefirmwares` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicefirmwares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicegenerics`
--

DROP TABLE IF EXISTS `glpi_items_devicegenerics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicegenerics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicegenerics_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `devicegenerics_id` (`devicegenerics_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicegenerics`
--

LOCK TABLES `glpi_items_devicegenerics` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicegenerics` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicegenerics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicegraphiccards`
--

DROP TABLE IF EXISTS `glpi_items_devicegraphiccards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicegraphiccards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicegraphiccards_id` int(10) unsigned NOT NULL DEFAULT 0,
  `memory` int(11) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `devicegraphiccards_id` (`devicegraphiccards_id`),
  KEY `specificity` (`memory`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicegraphiccards`
--

LOCK TABLES `glpi_items_devicegraphiccards` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicegraphiccards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicegraphiccards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_deviceharddrives`
--

DROP TABLE IF EXISTS `glpi_items_deviceharddrives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_deviceharddrives` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `deviceharddrives_id` int(10) unsigned NOT NULL DEFAULT 0,
  `capacity` int(11) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `deviceharddrives_id` (`deviceharddrives_id`),
  KEY `specificity` (`capacity`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_deviceharddrives`
--

LOCK TABLES `glpi_items_deviceharddrives` WRITE;
/*!40000 ALTER TABLE `glpi_items_deviceharddrives` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_deviceharddrives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicememories`
--

DROP TABLE IF EXISTS `glpi_items_devicememories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicememories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicememories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `size` int(11) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `devicememories_id` (`devicememories_id`),
  KEY `specificity` (`size`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicememories`
--

LOCK TABLES `glpi_items_devicememories` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicememories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicememories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicemotherboards`
--

DROP TABLE IF EXISTS `glpi_items_devicemotherboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicemotherboards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicemotherboards_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `devicemotherboards_id` (`devicemotherboards_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicemotherboards`
--

LOCK TABLES `glpi_items_devicemotherboards` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicemotherboards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicemotherboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicenetworkcards`
--

DROP TABLE IF EXISTS `glpi_items_devicenetworkcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicenetworkcards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicenetworkcards_id` int(10) unsigned NOT NULL DEFAULT 0,
  `mac` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `devicenetworkcards_id` (`devicenetworkcards_id`),
  KEY `specificity` (`mac`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicenetworkcards`
--

LOCK TABLES `glpi_items_devicenetworkcards` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicenetworkcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicenetworkcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicepcis`
--

DROP TABLE IF EXISTS `glpi_items_devicepcis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicepcis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicepcis_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `devicepcis_id` (`devicepcis_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicepcis`
--

LOCK TABLES `glpi_items_devicepcis` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicepcis` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicepcis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicepowersupplies`
--

DROP TABLE IF EXISTS `glpi_items_devicepowersupplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicepowersupplies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicepowersupplies_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `devicepowersupplies_id` (`devicepowersupplies_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicepowersupplies`
--

LOCK TABLES `glpi_items_devicepowersupplies` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicepowersupplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicepowersupplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_deviceprocessors`
--

DROP TABLE IF EXISTS `glpi_items_deviceprocessors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_deviceprocessors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `deviceprocessors_id` int(10) unsigned NOT NULL DEFAULT 0,
  `frequency` int(11) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `nbcores` int(11) DEFAULT NULL,
  `nbthreads` int(11) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `deviceprocessors_id` (`deviceprocessors_id`),
  KEY `specificity` (`frequency`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `nbcores` (`nbcores`),
  KEY `nbthreads` (`nbthreads`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_deviceprocessors`
--

LOCK TABLES `glpi_items_deviceprocessors` WRITE;
/*!40000 ALTER TABLE `glpi_items_deviceprocessors` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_deviceprocessors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicesensors`
--

DROP TABLE IF EXISTS `glpi_items_devicesensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicesensors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicesensors_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `devicesensors_id` (`devicesensors_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicesensors`
--

LOCK TABLES `glpi_items_devicesensors` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicesensors` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicesensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicesimcards`
--

DROP TABLE IF EXISTS `glpi_items_devicesimcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicesimcards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'RELATION to various table, according to itemtype (id)',
  `itemtype` varchar(100) NOT NULL,
  `devicesimcards_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `lines_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `pin` varchar(255) NOT NULL DEFAULT '',
  `pin2` varchar(255) NOT NULL DEFAULT '',
  `puk` varchar(255) NOT NULL DEFAULT '',
  `puk2` varchar(255) NOT NULL DEFAULT '',
  `msin` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `devicesimcards_id` (`devicesimcards_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `states_id` (`states_id`),
  KEY `locations_id` (`locations_id`),
  KEY `lines_id` (`lines_id`),
  KEY `users_id` (`users_id`),
  KEY `groups_id` (`groups_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicesimcards`
--

LOCK TABLES `glpi_items_devicesimcards` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicesimcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicesimcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_devicesoundcards`
--

DROP TABLE IF EXISTS `glpi_items_devicesoundcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_devicesoundcards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `devicesoundcards_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `busID` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `devicesoundcards_id` (`devicesoundcards_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `serial` (`serial`),
  KEY `busID` (`busID`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `otherserial` (`otherserial`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_devicesoundcards`
--

LOCK TABLES `glpi_items_devicesoundcards` WRITE;
/*!40000 ALTER TABLE `glpi_items_devicesoundcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_devicesoundcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_disks`
--

DROP TABLE IF EXISTS `glpi_items_disks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_disks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `mountpoint` varchar(255) DEFAULT NULL,
  `filesystems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `totalsize` bigint(20) NOT NULL DEFAULT 0,
  `freesize` bigint(20) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `encryption_status` int(11) NOT NULL DEFAULT 0,
  `encryption_tool` varchar(255) DEFAULT NULL,
  `encryption_algorithm` varchar(255) DEFAULT NULL,
  `encryption_type` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `device` (`device`),
  KEY `mountpoint` (`mountpoint`),
  KEY `totalsize` (`totalsize`),
  KEY `freesize` (`freesize`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `filesystems_id` (`filesystems_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_disks`
--

LOCK TABLES `glpi_items_disks` WRITE;
/*!40000 ALTER TABLE `glpi_items_disks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_disks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_enclosures`
--

DROP TABLE IF EXISTS `glpi_items_enclosures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_enclosures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `enclosures_id` int(10) unsigned NOT NULL,
  `itemtype` varchar(255) NOT NULL,
  `items_id` int(10) unsigned NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`itemtype`,`items_id`),
  KEY `relation` (`enclosures_id`,`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_enclosures`
--

LOCK TABLES `glpi_items_enclosures` WRITE;
/*!40000 ALTER TABLE `glpi_items_enclosures` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_enclosures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_kanbans`
--

DROP TABLE IF EXISTS `glpi_items_kanbans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_kanbans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) unsigned DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `state` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`users_id`),
  KEY `users_id` (`users_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_kanbans`
--

LOCK TABLES `glpi_items_kanbans` WRITE;
/*!40000 ALTER TABLE `glpi_items_kanbans` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_kanbans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_operatingsystems`
--

DROP TABLE IF EXISTS `glpi_items_operatingsystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_operatingsystems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `operatingsystems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `operatingsystemversions_id` int(10) unsigned NOT NULL DEFAULT 0,
  `operatingsystemservicepacks_id` int(10) unsigned NOT NULL DEFAULT 0,
  `operatingsystemarchitectures_id` int(10) unsigned NOT NULL DEFAULT 0,
  `operatingsystemkernelversions_id` int(10) unsigned NOT NULL DEFAULT 0,
  `license_number` varchar(255) DEFAULT NULL,
  `licenseid` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `hostid` varchar(255) DEFAULT NULL,
  `operatingsystemeditions_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `install_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`items_id`,`itemtype`,`operatingsystems_id`,`operatingsystemarchitectures_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `operatingsystems_id` (`operatingsystems_id`),
  KEY `operatingsystemservicepacks_id` (`operatingsystemservicepacks_id`),
  KEY `operatingsystemversions_id` (`operatingsystemversions_id`),
  KEY `operatingsystemarchitectures_id` (`operatingsystemarchitectures_id`),
  KEY `operatingsystemkernelversions_id` (`operatingsystemkernelversions_id`),
  KEY `operatingsystemeditions_id` (`operatingsystemeditions_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_operatingsystems`
--

LOCK TABLES `glpi_items_operatingsystems` WRITE;
/*!40000 ALTER TABLE `glpi_items_operatingsystems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_operatingsystems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_problems`
--

DROP TABLE IF EXISTS `glpi_items_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_problems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_problems`
--

LOCK TABLES `glpi_items_problems` WRITE;
/*!40000 ALTER TABLE `glpi_items_problems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_projects`
--

DROP TABLE IF EXISTS `glpi_items_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projects_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`projects_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_projects`
--

LOCK TABLES `glpi_items_projects` WRITE;
/*!40000 ALTER TABLE `glpi_items_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_racks`
--

DROP TABLE IF EXISTS `glpi_items_racks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_racks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `racks_id` int(10) unsigned NOT NULL,
  `itemtype` varchar(255) NOT NULL,
  `items_id` int(10) unsigned NOT NULL,
  `position` int(11) NOT NULL,
  `orientation` tinyint(4) DEFAULT NULL,
  `bgcolor` varchar(7) DEFAULT NULL,
  `hpos` tinyint(4) NOT NULL DEFAULT 0,
  `is_reserved` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`itemtype`,`items_id`,`is_reserved`),
  KEY `relation` (`racks_id`,`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_racks`
--

LOCK TABLES `glpi_items_racks` WRITE;
/*!40000 ALTER TABLE `glpi_items_racks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_racks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_remotemanagements`
--

DROP TABLE IF EXISTS `glpi_items_remotemanagements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_remotemanagements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `remoteid` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted` (`is_deleted`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_remotemanagements`
--

LOCK TABLES `glpi_items_remotemanagements` WRITE;
/*!40000 ALTER TABLE `glpi_items_remotemanagements` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_remotemanagements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_softwarelicenses`
--

DROP TABLE IF EXISTS `glpi_items_softwarelicenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_softwarelicenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `softwarelicenses_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `softwarelicenses_id` (`softwarelicenses_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_softwarelicenses`
--

LOCK TABLES `glpi_items_softwarelicenses` WRITE;
/*!40000 ALTER TABLE `glpi_items_softwarelicenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_softwarelicenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_softwareversions`
--

DROP TABLE IF EXISTS `glpi_items_softwareversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_softwareversions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `softwareversions_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted_item` tinyint(4) NOT NULL DEFAULT 0,
  `is_template_item` tinyint(4) NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_install` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`softwareversions_id`),
  KEY `softwareversions_id` (`softwareversions_id`),
  KEY `computers_info` (`entities_id`,`is_template_item`,`is_deleted_item`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `is_deleted_item` (`is_deleted_item`),
  KEY `is_template_item` (`is_template_item`),
  KEY `date_install` (`date_install`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_softwareversions`
--

LOCK TABLES `glpi_items_softwareversions` WRITE;
/*!40000 ALTER TABLE `glpi_items_softwareversions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_softwareversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_items_tickets`
--

DROP TABLE IF EXISTS `glpi_items_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_items_tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(255) DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tickets_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`tickets_id`),
  KEY `tickets_id` (`tickets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_items_tickets`
--

LOCK TABLES `glpi_items_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_items_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_items_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_itilcategories`
--

DROP TABLE IF EXISTS `glpi_itilcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_itilcategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `itilcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `completename` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `knowbaseitemcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `code` varchar(255) DEFAULT NULL,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `is_helpdeskvisible` tinyint(4) NOT NULL DEFAULT 1,
  `tickettemplates_id_incident` int(10) unsigned NOT NULL DEFAULT 0,
  `tickettemplates_id_demand` int(10) unsigned NOT NULL DEFAULT 0,
  `changetemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `problemtemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_incident` int(11) NOT NULL DEFAULT 1,
  `is_request` int(11) NOT NULL DEFAULT 1,
  `is_problem` int(11) NOT NULL DEFAULT 1,
  `is_change` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  KEY `users_id` (`users_id`),
  KEY `groups_id` (`groups_id`),
  KEY `is_helpdeskvisible` (`is_helpdeskvisible`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `tickettemplates_id_incident` (`tickettemplates_id_incident`),
  KEY `tickettemplates_id_demand` (`tickettemplates_id_demand`),
  KEY `changetemplates_id` (`changetemplates_id`),
  KEY `problemtemplates_id` (`problemtemplates_id`),
  KEY `is_incident` (`is_incident`),
  KEY `is_request` (`is_request`),
  KEY `is_problem` (`is_problem`),
  KEY `is_change` (`is_change`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_itilcategories`
--

LOCK TABLES `glpi_itilcategories` WRITE;
/*!40000 ALTER TABLE `glpi_itilcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_itilcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_itilfollowups`
--

DROP TABLE IF EXISTS `glpi_itilfollowups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_itilfollowups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_editor` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `is_private` tinyint(4) NOT NULL DEFAULT 0,
  `requesttypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  `sourceitems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sourceof_items_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `is_private` (`is_private`),
  KEY `requesttypes_id` (`requesttypes_id`),
  KEY `sourceitems_id` (`sourceitems_id`),
  KEY `sourceof_items_id` (`sourceof_items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_itilfollowups`
--

LOCK TABLES `glpi_itilfollowups` WRITE;
/*!40000 ALTER TABLE `glpi_itilfollowups` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_itilfollowups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_itilfollowuptemplates`
--

DROP TABLE IF EXISTS `glpi_itilfollowuptemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_itilfollowuptemplates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `requesttypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_private` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `requesttypes_id` (`requesttypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_private` (`is_private`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_itilfollowuptemplates`
--

LOCK TABLES `glpi_itilfollowuptemplates` WRITE;
/*!40000 ALTER TABLE `glpi_itilfollowuptemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_itilfollowuptemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_itils_projects`
--

DROP TABLE IF EXISTS `glpi_itils_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_itils_projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `projects_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`projects_id`),
  KEY `projects_id` (`projects_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_itils_projects`
--

LOCK TABLES `glpi_itils_projects` WRITE;
/*!40000 ALTER TABLE `glpi_itils_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_itils_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_itilsolutions`
--

DROP TABLE IF EXISTS `glpi_itilsolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_itilsolutions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `solutiontypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `solutiontype_name` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_approval` timestamp NULL DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_name` varchar(255) DEFAULT NULL,
  `users_id_editor` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_approval` int(10) unsigned NOT NULL DEFAULT 0,
  `user_name_approval` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `itilfollowups_id` int(10) unsigned DEFAULT NULL COMMENT 'Followup reference on reject or approve a solution',
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `solutiontypes_id` (`solutiontypes_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `users_id_approval` (`users_id_approval`),
  KEY `status` (`status`),
  KEY `itilfollowups_id` (`itilfollowups_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_itilsolutions`
--

LOCK TABLES `glpi_itilsolutions` WRITE;
/*!40000 ALTER TABLE `glpi_itilsolutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_itilsolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitemcategories`
--

DROP TABLE IF EXISTS `glpi_knowbaseitemcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitemcategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `knowbaseitemcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `completename` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `sons_cache` longtext DEFAULT NULL,
  `ancestors_cache` longtext DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`knowbaseitemcategories_id`,`name`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitemcategories`
--

LOCK TABLES `glpi_knowbaseitemcategories` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitemcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitemcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitems`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `is_faq` tinyint(4) NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `view` int(11) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `begin_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `is_faq` (`is_faq`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  FULLTEXT KEY `fulltext` (`name`,`answer`),
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY `answer` (`answer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitems`
--

LOCK TABLES `glpi_knowbaseitems` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitems_comments`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitems_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(10) unsigned NOT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `language` varchar(10) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `parent_comment_id` int(10) unsigned DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `parent_comment_id` (`parent_comment_id`),
  KEY `users_id` (`users_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitems_comments`
--

LOCK TABLES `glpi_knowbaseitems_comments` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitems_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitems_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitems_items`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitems_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(10) unsigned NOT NULL,
  `itemtype` varchar(100) NOT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`knowbaseitems_id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitems_items`
--

LOCK TABLES `glpi_knowbaseitems_items` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitems_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitems_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitems_knowbaseitemcategories`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_knowbaseitemcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitems_knowbaseitemcategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `knowbaseitemcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitems_knowbaseitemcategories`
--

LOCK TABLES `glpi_knowbaseitems_knowbaseitemcategories` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitems_knowbaseitemcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitems_knowbaseitemcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitems_profiles`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitems_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `profiles_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitems_profiles`
--

LOCK TABLES `glpi_knowbaseitems_profiles` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitems_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitems_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitems_revisions`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitems_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(10) unsigned NOT NULL,
  `revision` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`knowbaseitems_id`,`revision`,`language`),
  KEY `revision` (`revision`),
  KEY `users_id` (`users_id`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitems_revisions`
--

LOCK TABLES `glpi_knowbaseitems_revisions` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitems_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitems_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitems_users`
--

DROP TABLE IF EXISTS `glpi_knowbaseitems_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitems_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `knowbaseitems_id` (`knowbaseitems_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitems_users`
--

LOCK TABLES `glpi_knowbaseitems_users` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitems_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitems_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_knowbaseitemtranslations`
--

DROP TABLE IF EXISTS `glpi_knowbaseitemtranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_knowbaseitemtranslations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `knowbaseitems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `language` varchar(10) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`knowbaseitems_id`,`language`),
  KEY `users_id` (`users_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  FULLTEXT KEY `fulltext` (`name`,`answer`),
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY `answer` (`answer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_knowbaseitemtranslations`
--

LOCK TABLES `glpi_knowbaseitemtranslations` WRITE;
/*!40000 ALTER TABLE `glpi_knowbaseitemtranslations` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_knowbaseitemtranslations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_lineoperators`
--

DROP TABLE IF EXISTS `glpi_lineoperators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_lineoperators` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `mcc` int(11) DEFAULT NULL,
  `mnc` int(11) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`mcc`,`mnc`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_lineoperators`
--

LOCK TABLES `glpi_lineoperators` WRITE;
/*!40000 ALTER TABLE `glpi_lineoperators` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_lineoperators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_lines`
--

DROP TABLE IF EXISTS `glpi_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `caller_num` varchar(255) NOT NULL DEFAULT '',
  `caller_name` varchar(255) NOT NULL DEFAULT '',
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `lineoperators_id` int(10) unsigned NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `linetypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `users_id` (`users_id`),
  KEY `lineoperators_id` (`lineoperators_id`),
  KEY `groups_id` (`groups_id`),
  KEY `linetypes_id` (`linetypes_id`),
  KEY `locations_id` (`locations_id`),
  KEY `states_id` (`states_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_lines`
--

LOCK TABLES `glpi_lines` WRITE;
/*!40000 ALTER TABLE `glpi_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_linetypes`
--

DROP TABLE IF EXISTS `glpi_linetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_linetypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_linetypes`
--

LOCK TABLES `glpi_linetypes` WRITE;
/*!40000 ALTER TABLE `glpi_linetypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_linetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_links`
--

DROP TABLE IF EXISTS `glpi_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 1,
  `name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `open_window` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_links`
--

LOCK TABLES `glpi_links` WRITE;
/*!40000 ALTER TABLE `glpi_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_links_itemtypes`
--

DROP TABLE IF EXISTS `glpi_links_itemtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_links_itemtypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `links_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`links_id`),
  KEY `links_id` (`links_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_links_itemtypes`
--

LOCK TABLES `glpi_links_itemtypes` WRITE;
/*!40000 ALTER TABLE `glpi_links_itemtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_links_itemtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_locations`
--

DROP TABLE IF EXISTS `glpi_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `address` text DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `building` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `altitude` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`entities_id`,`locations_id`,`name`),
  KEY `locations_id` (`locations_id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_locations`
--

LOCK TABLES `glpi_locations` WRITE;
/*!40000 ALTER TABLE `glpi_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_lockedfields`
--

DROP TABLE IF EXISTS `glpi_lockedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_lockedfields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `field` varchar(50) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_global` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`field`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_global` (`is_global`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_lockedfields`
--

LOCK TABLES `glpi_lockedfields` WRITE;
/*!40000 ALTER TABLE `glpi_lockedfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_lockedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_logs`
--

DROP TABLE IF EXISTS `glpi_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype_link` varchar(100) NOT NULL DEFAULT '',
  `linked_action` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php HISTORY_* constant',
  `user_name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `id_search_option` int(11) NOT NULL DEFAULT 0 COMMENT 'see search.constant.php for value',
  `old_value` varchar(255) DEFAULT NULL,
  `new_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `itemtype_link` (`itemtype_link`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `id_search_option` (`id_search_option`)
) ENGINE=InnoDB AUTO_INCREMENT=1211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_logs`
--

LOCK TABLES `glpi_logs` WRITE;
/*!40000 ALTER TABLE `glpi_logs` DISABLE KEYS */;
INSERT INTO `glpi_logs` VALUES
(1,'RuleImportAsset',1,'0',20,'','2024-11-19 10:17:34',0,'',''),
(2,'RuleImportAsset',1,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Is partial is Yes (1)'),
(3,'RuleCriteria',1,'0',20,'','2024-11-19 10:17:34',0,'',''),
(4,'RuleImportAsset',1,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type does not exist Yes (2)'),
(5,'RuleCriteria',2,'0',20,'','2024-11-19 10:17:34',0,'',''),
(6,'RuleImportAsset',1,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (1)'),
(7,'RuleAction',1,'0',20,'','2024-11-19 10:17:34',0,'',''),
(8,'RuleImportAsset',2,'0',20,'','2024-11-19 10:17:34',0,'',''),
(9,'RuleImportAsset',2,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type does not exist Yes (3)'),
(10,'RuleCriteria',3,'0',20,'','2024-11-19 10:17:34',0,'',''),
(11,'RuleImportAsset',2,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC is already present Yes (4)'),
(12,'RuleCriteria',4,'0',20,'','2024-11-19 10:17:34',0,'',''),
(13,'RuleImportAsset',2,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC exists Yes (5)'),
(14,'RuleCriteria',5,'0',20,'','2024-11-19 10:17:34',0,'',''),
(15,'RuleImportAsset',2,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; Port number is already present Yes (6)'),
(16,'RuleCriteria',6,'0',20,'','2024-11-19 10:17:34',0,'',''),
(17,'RuleImportAsset',2,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; Port number exists Yes (7)'),
(18,'RuleCriteria',7,'0',20,'','2024-11-19 10:17:34',0,'',''),
(19,'RuleImportAsset',2,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','General &#62; Restrict criteria to same network port Yes Yes (8)'),
(20,'RuleCriteria',8,'0',20,'','2024-11-19 10:17:34',0,'',''),
(21,'RuleImportAsset',2,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (2)'),
(22,'RuleAction',2,'0',20,'','2024-11-19 10:17:34',0,'',''),
(23,'RuleImportAsset',3,'0',20,'','2024-11-19 10:17:34',0,'',''),
(24,'RuleImportAsset',3,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type does not exist Yes (9)'),
(25,'RuleCriteria',9,'0',20,'','2024-11-19 10:17:34',0,'',''),
(26,'RuleImportAsset',3,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC is already present Yes (10)'),
(27,'RuleCriteria',10,'0',20,'','2024-11-19 10:17:34',0,'',''),
(28,'RuleImportAsset',3,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC exists Yes (11)'),
(29,'RuleCriteria',11,'0',20,'','2024-11-19 10:17:34',0,'',''),
(30,'RuleImportAsset',3,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; Port number is already present Yes (12)'),
(31,'RuleCriteria',12,'0',20,'','2024-11-19 10:17:34',0,'',''),
(32,'RuleImportAsset',3,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; Port number exists Yes (13)'),
(33,'RuleCriteria',13,'0',20,'','2024-11-19 10:17:34',0,'',''),
(34,'RuleImportAsset',3,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (3)'),
(35,'RuleAction',3,'0',20,'','2024-11-19 10:17:34',0,'',''),
(36,'RuleImportAsset',4,'0',20,'','2024-11-19 10:17:34',0,'',''),
(37,'RuleImportAsset',4,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type does not exist Yes (14)'),
(38,'RuleCriteria',14,'0',20,'','2024-11-19 10:17:34',0,'',''),
(39,'RuleImportAsset',4,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC exists Yes (15)'),
(40,'RuleCriteria',15,'0',20,'','2024-11-19 10:17:34',0,'',''),
(41,'RuleImportAsset',4,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; Port number exists Yes (16)'),
(42,'RuleCriteria',16,'0',20,'','2024-11-19 10:17:34',0,'',''),
(43,'RuleImportAsset',4,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (4)'),
(44,'RuleAction',4,'0',20,'','2024-11-19 10:17:34',0,'',''),
(45,'RuleImportAsset',5,'0',20,'','2024-11-19 10:17:34',0,'',''),
(46,'RuleImportAsset',5,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type does not exist Yes (17)'),
(47,'RuleCriteria',17,'0',20,'','2024-11-19 10:17:34',0,'',''),
(48,'RuleImportAsset',5,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; IP is already present Yes (18)'),
(49,'RuleCriteria',18,'0',20,'','2024-11-19 10:17:34',0,'',''),
(50,'RuleImportAsset',5,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; IP exists Yes (19)'),
(51,'RuleCriteria',19,'0',20,'','2024-11-19 10:17:34',0,'',''),
(52,'RuleImportAsset',5,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; Port description is already present Yes (20)'),
(53,'RuleCriteria',20,'0',20,'','2024-11-19 10:17:34',0,'',''),
(54,'RuleImportAsset',5,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; Port description exists Yes (21)'),
(55,'RuleCriteria',21,'0',20,'','2024-11-19 10:17:34',0,'',''),
(56,'RuleImportAsset',5,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','General &#62; Restrict criteria to same network port Yes Yes (22)'),
(57,'RuleCriteria',22,'0',20,'','2024-11-19 10:17:34',0,'',''),
(58,'RuleImportAsset',5,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (5)'),
(59,'RuleAction',5,'0',20,'','2024-11-19 10:17:34',0,'',''),
(60,'RuleImportAsset',6,'0',20,'','2024-11-19 10:17:34',0,'',''),
(61,'RuleImportAsset',6,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type does not exist Yes (23)'),
(62,'RuleCriteria',23,'0',20,'','2024-11-19 10:17:34',0,'',''),
(63,'RuleImportAsset',6,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; IP is already present Yes (24)'),
(64,'RuleCriteria',24,'0',20,'','2024-11-19 10:17:34',0,'',''),
(65,'RuleImportAsset',6,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; IP exists Yes (25)'),
(66,'RuleCriteria',25,'0',20,'','2024-11-19 10:17:34',0,'',''),
(67,'RuleImportAsset',6,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; Port description is already present Yes (26)'),
(68,'RuleCriteria',26,'0',20,'','2024-11-19 10:17:34',0,'',''),
(69,'RuleImportAsset',6,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; Port description exists Yes (27)'),
(70,'RuleCriteria',27,'0',20,'','2024-11-19 10:17:34',0,'',''),
(71,'RuleImportAsset',6,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (6)'),
(72,'RuleAction',6,'0',20,'','2024-11-19 10:17:34',0,'',''),
(73,'RuleImportAsset',7,'0',20,'','2024-11-19 10:17:34',0,'',''),
(74,'RuleImportAsset',7,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type does not exist Yes (28)'),
(75,'RuleCriteria',28,'0',20,'','2024-11-19 10:17:34',0,'',''),
(76,'RuleImportAsset',7,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; IP exists Yes (29)'),
(77,'RuleCriteria',29,'0',20,'','2024-11-19 10:17:34',0,'',''),
(78,'RuleImportAsset',7,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; Port description exists Yes (30)'),
(79,'RuleCriteria',30,'0',20,'','2024-11-19 10:17:34',0,'',''),
(80,'RuleImportAsset',7,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (7)'),
(81,'RuleAction',7,'0',20,'','2024-11-19 10:17:34',0,'',''),
(82,'RuleImportAsset',8,'0',20,'','2024-11-19 10:17:34',0,'',''),
(83,'RuleImportAsset',8,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type does not exist Yes (31)'),
(84,'RuleCriteria',31,'0',20,'','2024-11-19 10:17:34',0,'',''),
(85,'RuleImportAsset',8,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC is already present Yes (32)'),
(86,'RuleCriteria',32,'0',20,'','2024-11-19 10:17:34',0,'',''),
(87,'RuleImportAsset',8,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC exists Yes (33)'),
(88,'RuleCriteria',33,'0',20,'','2024-11-19 10:17:34',0,'',''),
(89,'RuleImportAsset',8,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','General &#62; Only criteria of this rule in data Yes Yes (34)'),
(90,'RuleCriteria',34,'0',20,'','2024-11-19 10:17:34',0,'',''),
(91,'RuleImportAsset',8,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (8)'),
(92,'RuleAction',8,'0',20,'','2024-11-19 10:17:34',0,'',''),
(93,'RuleImportAsset',9,'0',20,'','2024-11-19 10:17:34',0,'',''),
(94,'RuleImportAsset',9,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type does not exist Yes (35)'),
(95,'RuleCriteria',35,'0',20,'','2024-11-19 10:17:34',0,'',''),
(96,'RuleImportAsset',9,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC exists Yes (36)'),
(97,'RuleCriteria',36,'0',20,'','2024-11-19 10:17:34',0,'',''),
(98,'RuleImportAsset',9,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','General &#62; Only criteria of this rule in data Yes Yes (37)'),
(99,'RuleCriteria',37,'0',20,'','2024-11-19 10:17:34',0,'',''),
(100,'RuleImportAsset',9,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (9)'),
(101,'RuleAction',9,'0',20,'','2024-11-19 10:17:34',0,'',''),
(102,'RuleImportAsset',10,'0',20,'','2024-11-19 10:17:34',0,'',''),
(103,'RuleImportAsset',10,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Computers (38)'),
(104,'RuleCriteria',38,'0',20,'','2024-11-19 10:17:34',0,'',''),
(105,'RuleImportAsset',10,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name does not exist Yes (39)'),
(106,'RuleCriteria',39,'0',20,'','2024-11-19 10:17:34',0,'',''),
(107,'RuleImportAsset',10,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (10)'),
(108,'RuleAction',10,'0',20,'','2024-11-19 10:17:34',0,'',''),
(109,'RuleImportAsset',11,'0',20,'','2024-11-19 10:17:34',0,'',''),
(110,'RuleImportAsset',11,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Computers (40)'),
(111,'RuleCriteria',40,'0',20,'','2024-11-19 10:17:34',0,'',''),
(112,'RuleImportAsset',11,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number is already present Yes (41)'),
(113,'RuleCriteria',41,'0',20,'','2024-11-19 10:17:34',0,'',''),
(114,'RuleImportAsset',11,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (42)'),
(115,'RuleCriteria',42,'0',20,'','2024-11-19 10:17:34',0,'',''),
(116,'RuleImportAsset',11,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID is already present Yes (43)'),
(117,'RuleCriteria',43,'0',20,'','2024-11-19 10:17:34',0,'',''),
(118,'RuleImportAsset',11,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID exists Yes (44)'),
(119,'RuleCriteria',44,'0',20,'','2024-11-19 10:17:34',0,'',''),
(120,'RuleImportAsset',11,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (11)'),
(121,'RuleAction',11,'0',20,'','2024-11-19 10:17:34',0,'',''),
(122,'RuleImportAsset',12,'0',20,'','2024-11-19 10:17:34',0,'',''),
(123,'RuleImportAsset',12,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Computers (45)'),
(124,'RuleCriteria',45,'0',20,'','2024-11-19 10:17:34',0,'',''),
(125,'RuleImportAsset',12,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number is already present Yes (46)'),
(126,'RuleCriteria',46,'0',20,'','2024-11-19 10:17:34',0,'',''),
(127,'RuleImportAsset',12,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (47)'),
(128,'RuleCriteria',47,'0',20,'','2024-11-19 10:17:34',0,'',''),
(129,'RuleImportAsset',12,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID is empty Yes (48)'),
(130,'RuleCriteria',48,'0',20,'','2024-11-19 10:17:34',0,'',''),
(131,'RuleImportAsset',12,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (12)'),
(132,'RuleAction',12,'0',20,'','2024-11-19 10:17:34',0,'',''),
(133,'RuleImportAsset',13,'0',20,'','2024-11-19 10:17:34',0,'',''),
(134,'RuleImportAsset',13,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Computers (49)'),
(135,'RuleCriteria',49,'0',20,'','2024-11-19 10:17:34',0,'',''),
(136,'RuleImportAsset',13,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID exists Yes (50)'),
(137,'RuleCriteria',50,'0',20,'','2024-11-19 10:17:34',0,'',''),
(138,'RuleImportAsset',13,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (51)'),
(139,'RuleCriteria',51,'0',20,'','2024-11-19 10:17:34',0,'',''),
(140,'RuleImportAsset',13,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (13)'),
(141,'RuleAction',13,'0',20,'','2024-11-19 10:17:34',0,'',''),
(142,'RuleImportAsset',14,'0',20,'','2024-11-19 10:17:34',0,'',''),
(143,'RuleImportAsset',14,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Computers (52)'),
(144,'RuleCriteria',52,'0',20,'','2024-11-19 10:17:34',0,'',''),
(145,'RuleImportAsset',14,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number is already present Yes (53)'),
(146,'RuleCriteria',53,'0',20,'','2024-11-19 10:17:34',0,'',''),
(147,'RuleImportAsset',14,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (54)'),
(148,'RuleCriteria',54,'0',20,'','2024-11-19 10:17:34',0,'',''),
(149,'RuleImportAsset',14,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (14)'),
(150,'RuleAction',14,'0',20,'','2024-11-19 10:17:34',0,'',''),
(151,'RuleImportAsset',15,'0',20,'','2024-11-19 10:17:34',0,'',''),
(152,'RuleImportAsset',15,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Computers (55)'),
(153,'RuleCriteria',55,'0',20,'','2024-11-19 10:17:34',0,'',''),
(154,'RuleImportAsset',15,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID is already present Yes (56)'),
(155,'RuleCriteria',56,'0',20,'','2024-11-19 10:17:34',0,'',''),
(156,'RuleImportAsset',15,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID exists Yes (57)'),
(157,'RuleCriteria',57,'0',20,'','2024-11-19 10:17:34',0,'',''),
(158,'RuleImportAsset',15,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (15)'),
(159,'RuleAction',15,'0',20,'','2024-11-19 10:17:34',0,'',''),
(160,'RuleImportAsset',16,'0',20,'','2024-11-19 10:17:34',0,'',''),
(161,'RuleImportAsset',16,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Computers (58)'),
(162,'RuleCriteria',58,'0',20,'','2024-11-19 10:17:34',0,'',''),
(163,'RuleImportAsset',16,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC is already present Yes (59)'),
(164,'RuleCriteria',59,'0',20,'','2024-11-19 10:17:34',0,'',''),
(165,'RuleImportAsset',16,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC exists Yes (60)'),
(166,'RuleCriteria',60,'0',20,'','2024-11-19 10:17:34',0,'',''),
(167,'RuleImportAsset',16,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (16)'),
(168,'RuleAction',16,'0',20,'','2024-11-19 10:17:34',0,'',''),
(169,'RuleImportAsset',17,'0',20,'','2024-11-19 10:17:34',0,'',''),
(170,'RuleImportAsset',17,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Computers (61)'),
(171,'RuleCriteria',61,'0',20,'','2024-11-19 10:17:34',0,'',''),
(172,'RuleImportAsset',17,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name is already present Yes (62)'),
(173,'RuleCriteria',62,'0',20,'','2024-11-19 10:17:34',0,'',''),
(174,'RuleImportAsset',17,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name exists Yes (63)'),
(175,'RuleCriteria',63,'0',20,'','2024-11-19 10:17:34',0,'',''),
(176,'RuleImportAsset',17,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (17)'),
(177,'RuleAction',17,'0',20,'','2024-11-19 10:17:34',0,'',''),
(178,'RuleImportAsset',18,'0',20,'','2024-11-19 10:17:34',0,'',''),
(179,'RuleImportAsset',18,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Computers (64)'),
(180,'RuleCriteria',64,'0',20,'','2024-11-19 10:17:34',0,'',''),
(181,'RuleImportAsset',18,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (65)'),
(182,'RuleCriteria',65,'0',20,'','2024-11-19 10:17:34',0,'',''),
(183,'RuleImportAsset',18,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (18)'),
(184,'RuleAction',18,'0',20,'','2024-11-19 10:17:34',0,'',''),
(185,'RuleImportAsset',19,'0',20,'','2024-11-19 10:17:34',0,'',''),
(186,'RuleImportAsset',19,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Computers (66)'),
(187,'RuleCriteria',66,'0',20,'','2024-11-19 10:17:34',0,'',''),
(188,'RuleImportAsset',19,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID exists Yes (67)'),
(189,'RuleCriteria',67,'0',20,'','2024-11-19 10:17:34',0,'',''),
(190,'RuleImportAsset',19,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (19)'),
(191,'RuleAction',19,'0',20,'','2024-11-19 10:17:34',0,'',''),
(192,'RuleImportAsset',20,'0',20,'','2024-11-19 10:17:34',0,'',''),
(193,'RuleImportAsset',20,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Computers (68)'),
(194,'RuleCriteria',68,'0',20,'','2024-11-19 10:17:34',0,'',''),
(195,'RuleImportAsset',20,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC exists Yes (69)'),
(196,'RuleCriteria',69,'0',20,'','2024-11-19 10:17:34',0,'',''),
(197,'RuleImportAsset',20,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (20)'),
(198,'RuleAction',20,'0',20,'','2024-11-19 10:17:34',0,'',''),
(199,'RuleImportAsset',21,'0',20,'','2024-11-19 10:17:34',0,'',''),
(200,'RuleImportAsset',21,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Computers (70)'),
(201,'RuleCriteria',70,'0',20,'','2024-11-19 10:17:34',0,'',''),
(202,'RuleImportAsset',21,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name exists Yes (71)'),
(203,'RuleCriteria',71,'0',20,'','2024-11-19 10:17:34',0,'',''),
(204,'RuleImportAsset',21,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (21)'),
(205,'RuleAction',21,'0',20,'','2024-11-19 10:17:34',0,'',''),
(206,'RuleImportAsset',22,'0',20,'','2024-11-19 10:17:34',0,'',''),
(207,'RuleImportAsset',22,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Computers (72)'),
(208,'RuleCriteria',72,'0',20,'','2024-11-19 10:17:34',0,'',''),
(209,'RuleImportAsset',22,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (22)'),
(210,'RuleAction',22,'0',20,'','2024-11-19 10:17:34',0,'',''),
(211,'RuleImportAsset',23,'0',20,'','2024-11-19 10:17:34',0,'',''),
(212,'RuleImportAsset',23,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Printers (73)'),
(213,'RuleCriteria',73,'0',20,'','2024-11-19 10:17:34',0,'',''),
(214,'RuleImportAsset',23,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name does not exist Yes (74)'),
(215,'RuleCriteria',74,'0',20,'','2024-11-19 10:17:34',0,'',''),
(216,'RuleImportAsset',23,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (23)'),
(217,'RuleAction',23,'0',20,'','2024-11-19 10:17:34',0,'',''),
(218,'RuleImportAsset',24,'0',20,'','2024-11-19 10:17:34',0,'',''),
(219,'RuleImportAsset',24,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Printers (75)'),
(220,'RuleCriteria',75,'0',20,'','2024-11-19 10:17:34',0,'',''),
(221,'RuleImportAsset',24,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (76)'),
(222,'RuleCriteria',76,'0',20,'','2024-11-19 10:17:34',0,'',''),
(223,'RuleImportAsset',24,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number is already present Yes (77)'),
(224,'RuleCriteria',77,'0',20,'','2024-11-19 10:17:34',0,'',''),
(225,'RuleImportAsset',24,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (24)'),
(226,'RuleAction',24,'0',20,'','2024-11-19 10:17:34',0,'',''),
(227,'RuleImportAsset',25,'0',20,'','2024-11-19 10:17:34',0,'',''),
(228,'RuleImportAsset',25,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Printers (78)'),
(229,'RuleCriteria',78,'0',20,'','2024-11-19 10:17:34',0,'',''),
(230,'RuleImportAsset',25,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC exists Yes (79)'),
(231,'RuleCriteria',79,'0',20,'','2024-11-19 10:17:34',0,'',''),
(232,'RuleImportAsset',25,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC is already present Yes (80)'),
(233,'RuleCriteria',80,'0',20,'','2024-11-19 10:17:34',0,'',''),
(234,'RuleImportAsset',25,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (25)'),
(235,'RuleAction',25,'0',20,'','2024-11-19 10:17:34',0,'',''),
(236,'RuleImportAsset',26,'0',20,'','2024-11-19 10:17:34',0,'',''),
(237,'RuleImportAsset',26,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Printers (81)'),
(238,'RuleCriteria',81,'0',20,'','2024-11-19 10:17:34',0,'',''),
(239,'RuleImportAsset',26,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (82)'),
(240,'RuleCriteria',82,'0',20,'','2024-11-19 10:17:34',0,'',''),
(241,'RuleImportAsset',26,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (26)'),
(242,'RuleAction',26,'0',20,'','2024-11-19 10:17:34',0,'',''),
(243,'RuleImportAsset',27,'0',20,'','2024-11-19 10:17:34',0,'',''),
(244,'RuleImportAsset',27,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Printers (83)'),
(245,'RuleCriteria',83,'0',20,'','2024-11-19 10:17:34',0,'',''),
(246,'RuleImportAsset',27,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC exists Yes (84)'),
(247,'RuleCriteria',84,'0',20,'','2024-11-19 10:17:34',0,'',''),
(248,'RuleImportAsset',27,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (27)'),
(249,'RuleAction',27,'0',20,'','2024-11-19 10:17:34',0,'',''),
(250,'RuleImportAsset',28,'0',20,'','2024-11-19 10:17:34',0,'',''),
(251,'RuleImportAsset',28,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Printers (85)'),
(252,'RuleCriteria',85,'0',20,'','2024-11-19 10:17:34',0,'',''),
(253,'RuleImportAsset',28,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (28)'),
(254,'RuleAction',28,'0',20,'','2024-11-19 10:17:34',0,'',''),
(255,'RuleImportAsset',29,'0',20,'','2024-11-19 10:17:34',0,'',''),
(256,'RuleImportAsset',29,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Network devices (86)'),
(257,'RuleCriteria',86,'0',20,'','2024-11-19 10:17:34',0,'',''),
(258,'RuleImportAsset',29,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name does not exist Yes (87)'),
(259,'RuleCriteria',87,'0',20,'','2024-11-19 10:17:34',0,'',''),
(260,'RuleImportAsset',29,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (29)'),
(261,'RuleAction',29,'0',20,'','2024-11-19 10:17:34',0,'',''),
(262,'RuleImportAsset',30,'0',20,'','2024-11-19 10:17:34',0,'',''),
(263,'RuleImportAsset',30,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Network devices (88)'),
(264,'RuleCriteria',88,'0',20,'','2024-11-19 10:17:34',0,'',''),
(265,'RuleImportAsset',30,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (89)'),
(266,'RuleCriteria',89,'0',20,'','2024-11-19 10:17:34',0,'',''),
(267,'RuleImportAsset',30,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number is already present Yes (90)'),
(268,'RuleCriteria',90,'0',20,'','2024-11-19 10:17:34',0,'',''),
(269,'RuleImportAsset',30,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (30)'),
(270,'RuleAction',30,'0',20,'','2024-11-19 10:17:34',0,'',''),
(271,'RuleImportAsset',31,'0',20,'','2024-11-19 10:17:34',0,'',''),
(272,'RuleImportAsset',31,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Network devices (91)'),
(273,'RuleCriteria',91,'0',20,'','2024-11-19 10:17:34',0,'',''),
(274,'RuleImportAsset',31,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC exists Yes (92)'),
(275,'RuleCriteria',92,'0',20,'','2024-11-19 10:17:34',0,'',''),
(276,'RuleImportAsset',31,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC is already present Yes (93)'),
(277,'RuleCriteria',93,'0',20,'','2024-11-19 10:17:34',0,'',''),
(278,'RuleImportAsset',31,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (31)'),
(279,'RuleAction',31,'0',20,'','2024-11-19 10:17:34',0,'',''),
(280,'RuleImportAsset',32,'0',20,'','2024-11-19 10:17:34',0,'',''),
(281,'RuleImportAsset',32,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Network devices (94)'),
(282,'RuleCriteria',94,'0',20,'','2024-11-19 10:17:34',0,'',''),
(283,'RuleImportAsset',32,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (95)'),
(284,'RuleCriteria',95,'0',20,'','2024-11-19 10:17:34',0,'',''),
(285,'RuleImportAsset',32,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (32)'),
(286,'RuleAction',32,'0',20,'','2024-11-19 10:17:34',0,'',''),
(287,'RuleImportAsset',33,'0',20,'','2024-11-19 10:17:34',0,'',''),
(288,'RuleImportAsset',33,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Network devices (96)'),
(289,'RuleCriteria',96,'0',20,'','2024-11-19 10:17:34',0,'',''),
(290,'RuleImportAsset',33,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC exists Yes (97)'),
(291,'RuleCriteria',97,'0',20,'','2024-11-19 10:17:34',0,'',''),
(292,'RuleImportAsset',33,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (33)'),
(293,'RuleAction',33,'0',20,'','2024-11-19 10:17:34',0,'',''),
(294,'RuleImportAsset',34,'0',20,'','2024-11-19 10:17:34',0,'',''),
(295,'RuleImportAsset',34,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Network devices (98)'),
(296,'RuleCriteria',98,'0',20,'','2024-11-19 10:17:34',0,'',''),
(297,'RuleImportAsset',34,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (34)'),
(298,'RuleAction',34,'0',20,'','2024-11-19 10:17:34',0,'',''),
(299,'RuleImportAsset',35,'0',20,'','2024-11-19 10:17:34',0,'',''),
(300,'RuleImportAsset',35,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Devices (99)'),
(301,'RuleCriteria',99,'0',20,'','2024-11-19 10:17:34',0,'',''),
(302,'RuleImportAsset',35,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (100)'),
(303,'RuleCriteria',100,'0',20,'','2024-11-19 10:17:34',0,'',''),
(304,'RuleImportAsset',35,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number is already present Yes (101)'),
(305,'RuleCriteria',101,'0',20,'','2024-11-19 10:17:34',0,'',''),
(306,'RuleImportAsset',35,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (35)'),
(307,'RuleAction',35,'0',20,'','2024-11-19 10:17:34',0,'',''),
(308,'RuleImportAsset',36,'0',20,'','2024-11-19 10:17:34',0,'',''),
(309,'RuleImportAsset',36,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Devices (102)'),
(310,'RuleCriteria',102,'0',20,'','2024-11-19 10:17:34',0,'',''),
(311,'RuleImportAsset',36,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (103)'),
(312,'RuleCriteria',103,'0',20,'','2024-11-19 10:17:34',0,'',''),
(313,'RuleImportAsset',36,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (36)'),
(314,'RuleAction',36,'0',20,'','2024-11-19 10:17:34',0,'',''),
(315,'RuleImportAsset',37,'0',20,'','2024-11-19 10:17:34',0,'',''),
(316,'RuleImportAsset',37,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Devices (104)'),
(317,'RuleCriteria',104,'0',20,'','2024-11-19 10:17:34',0,'',''),
(318,'RuleImportAsset',37,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (37)'),
(319,'RuleAction',37,'0',20,'','2024-11-19 10:17:34',0,'',''),
(320,'RuleImportAsset',38,'0',20,'','2024-11-19 10:17:34',0,'',''),
(321,'RuleImportAsset',38,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Monitors (105)'),
(322,'RuleCriteria',105,'0',20,'','2024-11-19 10:17:34',0,'',''),
(323,'RuleImportAsset',38,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (106)'),
(324,'RuleCriteria',106,'0',20,'','2024-11-19 10:17:34',0,'',''),
(325,'RuleImportAsset',38,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number is already present Yes (107)'),
(326,'RuleCriteria',107,'0',20,'','2024-11-19 10:17:34',0,'',''),
(327,'RuleImportAsset',38,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (38)'),
(328,'RuleAction',38,'0',20,'','2024-11-19 10:17:34',0,'',''),
(329,'RuleImportAsset',39,'0',20,'','2024-11-19 10:17:34',0,'',''),
(330,'RuleImportAsset',39,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Monitors (108)'),
(331,'RuleCriteria',108,'0',20,'','2024-11-19 10:17:34',0,'',''),
(332,'RuleImportAsset',39,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (109)'),
(333,'RuleCriteria',109,'0',20,'','2024-11-19 10:17:34',0,'',''),
(334,'RuleImportAsset',39,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (39)'),
(335,'RuleAction',39,'0',20,'','2024-11-19 10:17:34',0,'',''),
(336,'RuleImportAsset',40,'0',20,'','2024-11-19 10:17:34',0,'',''),
(337,'RuleImportAsset',40,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Monitors (110)'),
(338,'RuleCriteria',110,'0',20,'','2024-11-19 10:17:34',0,'',''),
(339,'RuleImportAsset',40,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (40)'),
(340,'RuleAction',40,'0',20,'','2024-11-19 10:17:34',0,'',''),
(341,'RuleImportAsset',41,'0',20,'','2024-11-19 10:17:34',0,'',''),
(342,'RuleImportAsset',41,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Phones (111)'),
(343,'RuleCriteria',111,'0',20,'','2024-11-19 10:17:34',0,'',''),
(344,'RuleImportAsset',41,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name does not exist Yes (112)'),
(345,'RuleCriteria',112,'0',20,'','2024-11-19 10:17:34',0,'',''),
(346,'RuleImportAsset',41,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (41)'),
(347,'RuleAction',41,'0',20,'','2024-11-19 10:17:34',0,'',''),
(348,'RuleImportAsset',42,'0',20,'','2024-11-19 10:17:34',0,'',''),
(349,'RuleImportAsset',42,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Phones (113)'),
(350,'RuleCriteria',113,'0',20,'','2024-11-19 10:17:34',0,'',''),
(351,'RuleImportAsset',42,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number is already present Yes (114)'),
(352,'RuleCriteria',114,'0',20,'','2024-11-19 10:17:34',0,'',''),
(353,'RuleImportAsset',42,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (115)'),
(354,'RuleCriteria',115,'0',20,'','2024-11-19 10:17:34',0,'',''),
(355,'RuleImportAsset',42,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID is already present Yes (116)'),
(356,'RuleCriteria',116,'0',20,'','2024-11-19 10:17:34',0,'',''),
(357,'RuleImportAsset',42,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID exists Yes (117)'),
(358,'RuleCriteria',117,'0',20,'','2024-11-19 10:17:34',0,'',''),
(359,'RuleImportAsset',42,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (42)'),
(360,'RuleAction',42,'0',20,'','2024-11-19 10:17:34',0,'',''),
(361,'RuleImportAsset',43,'0',20,'','2024-11-19 10:17:34',0,'',''),
(362,'RuleImportAsset',43,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Phones (118)'),
(363,'RuleCriteria',118,'0',20,'','2024-11-19 10:17:34',0,'',''),
(364,'RuleImportAsset',43,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number is already present Yes (119)'),
(365,'RuleCriteria',119,'0',20,'','2024-11-19 10:17:34',0,'',''),
(366,'RuleImportAsset',43,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (120)'),
(367,'RuleCriteria',120,'0',20,'','2024-11-19 10:17:34',0,'',''),
(368,'RuleImportAsset',43,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID is empty Yes (121)'),
(369,'RuleCriteria',121,'0',20,'','2024-11-19 10:17:34',0,'',''),
(370,'RuleImportAsset',43,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (43)'),
(371,'RuleAction',43,'0',20,'','2024-11-19 10:17:34',0,'',''),
(372,'RuleImportAsset',44,'0',20,'','2024-11-19 10:17:34',0,'',''),
(373,'RuleImportAsset',44,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Phones (122)'),
(374,'RuleCriteria',122,'0',20,'','2024-11-19 10:17:34',0,'',''),
(375,'RuleImportAsset',44,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID exists Yes (123)'),
(376,'RuleCriteria',123,'0',20,'','2024-11-19 10:17:34',0,'',''),
(377,'RuleImportAsset',44,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (124)'),
(378,'RuleCriteria',124,'0',20,'','2024-11-19 10:17:34',0,'',''),
(379,'RuleImportAsset',44,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (44)'),
(380,'RuleAction',44,'0',20,'','2024-11-19 10:17:34',0,'',''),
(381,'RuleImportAsset',45,'0',20,'','2024-11-19 10:17:34',0,'',''),
(382,'RuleImportAsset',45,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Phones (125)'),
(383,'RuleCriteria',125,'0',20,'','2024-11-19 10:17:34',0,'',''),
(384,'RuleImportAsset',45,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number is already present Yes (126)'),
(385,'RuleCriteria',126,'0',20,'','2024-11-19 10:17:34',0,'',''),
(386,'RuleImportAsset',45,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (127)'),
(387,'RuleCriteria',127,'0',20,'','2024-11-19 10:17:34',0,'',''),
(388,'RuleImportAsset',45,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (45)'),
(389,'RuleAction',45,'0',20,'','2024-11-19 10:17:34',0,'',''),
(390,'RuleImportAsset',46,'0',20,'','2024-11-19 10:17:34',0,'',''),
(391,'RuleImportAsset',46,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Phones (128)'),
(392,'RuleCriteria',128,'0',20,'','2024-11-19 10:17:34',0,'',''),
(393,'RuleImportAsset',46,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID is already present Yes (129)'),
(394,'RuleCriteria',129,'0',20,'','2024-11-19 10:17:34',0,'',''),
(395,'RuleImportAsset',46,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID exists Yes (130)'),
(396,'RuleCriteria',130,'0',20,'','2024-11-19 10:17:34',0,'',''),
(397,'RuleImportAsset',46,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (46)'),
(398,'RuleAction',46,'0',20,'','2024-11-19 10:17:34',0,'',''),
(399,'RuleImportAsset',47,'0',20,'','2024-11-19 10:17:34',0,'',''),
(400,'RuleImportAsset',47,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Phones (131)'),
(401,'RuleCriteria',131,'0',20,'','2024-11-19 10:17:34',0,'',''),
(402,'RuleImportAsset',47,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC is already present Yes (132)'),
(403,'RuleCriteria',132,'0',20,'','2024-11-19 10:17:34',0,'',''),
(404,'RuleImportAsset',47,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC exists Yes (133)'),
(405,'RuleCriteria',133,'0',20,'','2024-11-19 10:17:34',0,'',''),
(406,'RuleImportAsset',47,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (47)'),
(407,'RuleAction',47,'0',20,'','2024-11-19 10:17:34',0,'',''),
(408,'RuleImportAsset',48,'0',20,'','2024-11-19 10:17:34',0,'',''),
(409,'RuleImportAsset',48,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Phones (134)'),
(410,'RuleCriteria',134,'0',20,'','2024-11-19 10:17:34',0,'',''),
(411,'RuleImportAsset',48,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name is already present Yes (135)'),
(412,'RuleCriteria',135,'0',20,'','2024-11-19 10:17:34',0,'',''),
(413,'RuleImportAsset',48,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name exists Yes (136)'),
(414,'RuleCriteria',136,'0',20,'','2024-11-19 10:17:34',0,'',''),
(415,'RuleImportAsset',48,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (48)'),
(416,'RuleAction',48,'0',20,'','2024-11-19 10:17:34',0,'',''),
(417,'RuleImportAsset',49,'0',20,'','2024-11-19 10:17:34',0,'',''),
(418,'RuleImportAsset',49,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Phones (137)'),
(419,'RuleCriteria',137,'0',20,'','2024-11-19 10:17:34',0,'',''),
(420,'RuleImportAsset',49,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (138)'),
(421,'RuleCriteria',138,'0',20,'','2024-11-19 10:17:34',0,'',''),
(422,'RuleImportAsset',49,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (49)'),
(423,'RuleAction',49,'0',20,'','2024-11-19 10:17:34',0,'',''),
(424,'RuleImportAsset',50,'0',20,'','2024-11-19 10:17:34',0,'',''),
(425,'RuleImportAsset',50,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Phones (139)'),
(426,'RuleCriteria',139,'0',20,'','2024-11-19 10:17:34',0,'',''),
(427,'RuleImportAsset',50,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID exists Yes (140)'),
(428,'RuleCriteria',140,'0',20,'','2024-11-19 10:17:34',0,'',''),
(429,'RuleImportAsset',50,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (50)'),
(430,'RuleAction',50,'0',20,'','2024-11-19 10:17:34',0,'',''),
(431,'RuleImportAsset',51,'0',20,'','2024-11-19 10:17:34',0,'',''),
(432,'RuleImportAsset',51,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Phones (141)'),
(433,'RuleCriteria',141,'0',20,'','2024-11-19 10:17:34',0,'',''),
(434,'RuleImportAsset',51,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC exists Yes (142)'),
(435,'RuleCriteria',142,'0',20,'','2024-11-19 10:17:34',0,'',''),
(436,'RuleImportAsset',51,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (51)'),
(437,'RuleAction',51,'0',20,'','2024-11-19 10:17:34',0,'',''),
(438,'RuleImportAsset',52,'0',20,'','2024-11-19 10:17:34',0,'',''),
(439,'RuleImportAsset',52,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Phones (143)'),
(440,'RuleCriteria',143,'0',20,'','2024-11-19 10:17:34',0,'',''),
(441,'RuleImportAsset',52,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name exists Yes (144)'),
(442,'RuleCriteria',144,'0',20,'','2024-11-19 10:17:34',0,'',''),
(443,'RuleImportAsset',52,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (52)'),
(444,'RuleAction',52,'0',20,'','2024-11-19 10:17:34',0,'',''),
(445,'RuleImportAsset',53,'0',20,'','2024-11-19 10:17:34',0,'',''),
(446,'RuleImportAsset',53,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Phones (145)'),
(447,'RuleCriteria',145,'0',20,'','2024-11-19 10:17:34',0,'',''),
(448,'RuleImportAsset',53,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (53)'),
(449,'RuleAction',53,'0',20,'','2024-11-19 10:17:34',0,'',''),
(450,'RuleImportAsset',54,'0',20,'','2024-11-19 10:17:34',0,'',''),
(451,'RuleImportAsset',54,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Clusters (146)'),
(452,'RuleCriteria',146,'0',20,'','2024-11-19 10:17:34',0,'',''),
(453,'RuleImportAsset',54,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID exists Yes (147)'),
(454,'RuleCriteria',147,'0',20,'','2024-11-19 10:17:34',0,'',''),
(455,'RuleImportAsset',54,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID is already present Yes (148)'),
(456,'RuleCriteria',148,'0',20,'','2024-11-19 10:17:34',0,'',''),
(457,'RuleImportAsset',54,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (54)'),
(458,'RuleAction',54,'0',20,'','2024-11-19 10:17:34',0,'',''),
(459,'RuleImportAsset',55,'0',20,'','2024-11-19 10:17:34',0,'',''),
(460,'RuleImportAsset',55,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Clusters (149)'),
(461,'RuleCriteria',149,'0',20,'','2024-11-19 10:17:34',0,'',''),
(462,'RuleImportAsset',55,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; UUID exists Yes (150)'),
(463,'RuleCriteria',150,'0',20,'','2024-11-19 10:17:34',0,'',''),
(464,'RuleImportAsset',55,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (55)'),
(465,'RuleAction',55,'0',20,'','2024-11-19 10:17:34',0,'',''),
(466,'RuleImportAsset',56,'0',20,'','2024-11-19 10:17:34',0,'',''),
(467,'RuleImportAsset',56,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Clusters (151)'),
(468,'RuleCriteria',151,'0',20,'','2024-11-19 10:17:34',0,'',''),
(469,'RuleImportAsset',56,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (56)'),
(470,'RuleAction',56,'0',20,'','2024-11-19 10:17:34',0,'',''),
(471,'RuleImportAsset',57,'0',20,'','2024-11-19 10:17:34',0,'',''),
(472,'RuleImportAsset',57,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Enclosures (152)'),
(473,'RuleCriteria',152,'0',20,'','2024-11-19 10:17:34',0,'',''),
(474,'RuleImportAsset',57,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (153)'),
(475,'RuleCriteria',153,'0',20,'','2024-11-19 10:17:34',0,'',''),
(476,'RuleImportAsset',57,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number is already present Yes (154)'),
(477,'RuleCriteria',154,'0',20,'','2024-11-19 10:17:34',0,'',''),
(478,'RuleImportAsset',57,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (57)'),
(479,'RuleAction',57,'0',20,'','2024-11-19 10:17:34',0,'',''),
(480,'RuleImportAsset',58,'0',20,'','2024-11-19 10:17:34',0,'',''),
(481,'RuleImportAsset',58,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Enclosures (155)'),
(482,'RuleCriteria',155,'0',20,'','2024-11-19 10:17:34',0,'',''),
(483,'RuleImportAsset',58,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (156)'),
(484,'RuleCriteria',156,'0',20,'','2024-11-19 10:17:34',0,'',''),
(485,'RuleImportAsset',58,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (58)'),
(486,'RuleAction',58,'0',20,'','2024-11-19 10:17:34',0,'',''),
(487,'RuleImportAsset',59,'0',20,'','2024-11-19 10:17:34',0,'',''),
(488,'RuleImportAsset',59,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Enclosures (157)'),
(489,'RuleCriteria',157,'0',20,'','2024-11-19 10:17:34',0,'',''),
(490,'RuleImportAsset',59,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (59)'),
(491,'RuleAction',59,'0',20,'','2024-11-19 10:17:34',0,'',''),
(492,'RuleImportAsset',60,'0',20,'','2024-11-19 10:17:34',0,'',''),
(493,'RuleImportAsset',60,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name does not exist Yes (158)'),
(494,'RuleCriteria',158,'0',20,'','2024-11-19 10:17:34',0,'',''),
(495,'RuleImportAsset',60,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (60)'),
(496,'RuleAction',60,'0',20,'','2024-11-19 10:17:34',0,'',''),
(497,'RuleImportAsset',61,'0',20,'','2024-11-19 10:17:34',0,'',''),
(498,'RuleImportAsset',61,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (159)'),
(499,'RuleCriteria',159,'0',20,'','2024-11-19 10:17:34',0,'',''),
(500,'RuleImportAsset',61,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number is already present Yes (160)'),
(501,'RuleCriteria',160,'0',20,'','2024-11-19 10:17:34',0,'',''),
(502,'RuleImportAsset',61,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (61)'),
(503,'RuleAction',61,'0',20,'','2024-11-19 10:17:34',0,'',''),
(504,'RuleImportAsset',62,'0',20,'','2024-11-19 10:17:34',0,'',''),
(505,'RuleImportAsset',62,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC exists Yes (161)'),
(506,'RuleCriteria',161,'0',20,'','2024-11-19 10:17:34',0,'',''),
(507,'RuleImportAsset',62,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC is already present Yes (162)'),
(508,'RuleCriteria',162,'0',20,'','2024-11-19 10:17:34',0,'',''),
(509,'RuleImportAsset',62,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (62)'),
(510,'RuleAction',62,'0',20,'','2024-11-19 10:17:34',0,'',''),
(511,'RuleImportAsset',63,'0',20,'','2024-11-19 10:17:34',0,'',''),
(512,'RuleImportAsset',63,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Serial number exists Yes (163)'),
(513,'RuleCriteria',163,'0',20,'','2024-11-19 10:17:34',0,'',''),
(514,'RuleImportAsset',63,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (63)'),
(515,'RuleAction',63,'0',20,'','2024-11-19 10:17:34',0,'',''),
(516,'RuleImportAsset',64,'0',20,'','2024-11-19 10:17:34',0,'',''),
(517,'RuleImportAsset',64,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Network port &#62; MAC exists Yes (164)'),
(518,'RuleCriteria',164,'0',20,'','2024-11-19 10:17:34',0,'',''),
(519,'RuleImportAsset',64,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (64)'),
(520,'RuleAction',64,'0',20,'','2024-11-19 10:17:34',0,'',''),
(521,'RuleImportAsset',65,'0',20,'','2024-11-19 10:17:34',0,'',''),
(522,'RuleImportAsset',65,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is No itemtype defined (165)'),
(523,'RuleCriteria',165,'0',20,'','2024-11-19 10:17:34',0,'',''),
(524,'RuleImportAsset',65,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (65)'),
(525,'RuleAction',65,'0',20,'','2024-11-19 10:17:34',0,'',''),
(526,'RuleImportAsset',66,'0',20,'','2024-11-19 10:17:34',0,'',''),
(527,'RuleImportAsset',66,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Database instances (166)'),
(528,'RuleCriteria',166,'0',20,'','2024-11-19 10:17:34',0,'',''),
(529,'RuleImportAsset',66,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name exists Yes (167)'),
(530,'RuleCriteria',167,'0',20,'','2024-11-19 10:17:34',0,'',''),
(531,'RuleImportAsset',66,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name is already present Yes (168)'),
(532,'RuleCriteria',168,'0',20,'','2024-11-19 10:17:34',0,'',''),
(533,'RuleImportAsset',66,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Linked asset is already present Yes (169)'),
(534,'RuleCriteria',169,'0',20,'','2024-11-19 10:17:34',0,'',''),
(535,'RuleImportAsset',66,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (66)'),
(536,'RuleAction',66,'0',20,'','2024-11-19 10:17:34',0,'',''),
(537,'RuleImportAsset',67,'0',20,'','2024-11-19 10:17:34',0,'',''),
(538,'RuleImportAsset',67,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Database instances (170)'),
(539,'RuleCriteria',170,'0',20,'','2024-11-19 10:17:34',0,'',''),
(540,'RuleImportAsset',67,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name exists Yes (171)'),
(541,'RuleCriteria',171,'0',20,'','2024-11-19 10:17:34',0,'',''),
(542,'RuleImportAsset',67,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (67)'),
(543,'RuleAction',67,'0',20,'','2024-11-19 10:17:34',0,'',''),
(544,'RuleImportAsset',68,'0',20,'','2024-11-19 10:17:34',0,'',''),
(545,'RuleImportAsset',68,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Database instances (172)'),
(546,'RuleCriteria',172,'0',20,'','2024-11-19 10:17:34',0,'',''),
(547,'RuleImportAsset',68,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (68)'),
(548,'RuleAction',68,'0',20,'','2024-11-19 10:17:34',0,'',''),
(549,'RuleImportAsset',69,'0',20,'','2024-11-19 10:17:34',0,'',''),
(550,'RuleImportAsset',69,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Unmanaged devices (173)'),
(551,'RuleCriteria',173,'0',20,'','2024-11-19 10:17:34',0,'',''),
(552,'RuleImportAsset',69,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name exists Yes (174)'),
(553,'RuleCriteria',174,'0',20,'','2024-11-19 10:17:34',0,'',''),
(554,'RuleImportAsset',69,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name is already present Yes (175)'),
(555,'RuleCriteria',175,'0',20,'','2024-11-19 10:17:34',0,'',''),
(556,'RuleImportAsset',69,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (69)'),
(557,'RuleAction',69,'0',20,'','2024-11-19 10:17:34',0,'',''),
(558,'RuleImportAsset',70,'0',20,'','2024-11-19 10:17:34',0,'',''),
(559,'RuleImportAsset',70,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Unmanaged devices (176)'),
(560,'RuleCriteria',176,'0',20,'','2024-11-19 10:17:34',0,'',''),
(561,'RuleImportAsset',70,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Name exists Yes (177)'),
(562,'RuleCriteria',177,'0',20,'','2024-11-19 10:17:34',0,'',''),
(563,'RuleImportAsset',70,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Inventory link Assign Link if possible (70)'),
(564,'RuleAction',70,'0',20,'','2024-11-19 10:17:34',0,'',''),
(565,'RuleImportAsset',71,'0',20,'','2024-11-19 10:17:34',0,'',''),
(566,'RuleImportAsset',71,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Asset &#62; Item type is Unmanaged devices (178)'),
(567,'RuleCriteria',178,'0',20,'','2024-11-19 10:17:34',0,'',''),
(568,'RuleImportAsset',71,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Refuse import Assign Yes (71)'),
(569,'RuleAction',71,'0',20,'','2024-11-19 10:17:34',0,'',''),
(570,'Config',1,'',0,'','2024-11-19 10:17:34',1,'initialized_rules_collections []','[\"RuleImportAssetCollection\"]'),
(571,'RuleMailCollector',72,'0',20,'','2024-11-19 10:17:34',0,'',''),
(572,'RuleMailCollector',72,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Subject email header regular expression matches /.*/ (179)'),
(573,'RuleCriteria',179,'0',20,'','2024-11-19 10:17:34',0,'',''),
(574,'RuleMailCollector',72,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Entity Assign Root entity (72)'),
(575,'RuleAction',72,'0',20,'','2024-11-19 10:17:34',0,'',''),
(576,'RuleMailCollector',73,'0',20,'','2024-11-19 10:17:34',0,'',''),
(577,'RuleMailCollector',73,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','X-Auto-Response-Suppress email header regular expression matches /S+/ (180)'),
(578,'RuleCriteria',180,'0',20,'','2024-11-19 10:17:34',0,'',''),
(579,'RuleMailCollector',73,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Reject email (without email response) Assign Yes (73)'),
(580,'RuleAction',73,'0',20,'','2024-11-19 10:17:34',0,'',''),
(581,'RuleMailCollector',74,'0',20,'','2024-11-19 10:17:34',0,'',''),
(582,'RuleMailCollector',74,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Auto-Submitted email header regular expression matches /^(?!.*no).+$/i (181)'),
(583,'RuleCriteria',181,'0',20,'','2024-11-19 10:17:34',0,'',''),
(584,'RuleMailCollector',74,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Reject email (without email response) Assign Yes (74)'),
(585,'RuleAction',74,'0',20,'','2024-11-19 10:17:34',0,'',''),
(586,'Config',1,'',0,'','2024-11-19 10:17:34',1,'initialized_rules_collections [\"RuleImportAssetCollection\"]','[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\"]'),
(587,'RuleRight',75,'0',20,'','2024-11-19 10:17:34',0,'',''),
(588,'RuleRight',75,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Authentication type is LDAP directory: (182)'),
(589,'RuleCriteria',182,'0',20,'','2024-11-19 10:17:34',0,'',''),
(590,'RuleRight',75,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Authentication type is Email server: (183)'),
(591,'RuleCriteria',183,'0',20,'','2024-11-19 10:17:34',0,'',''),
(592,'RuleRight',75,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Entity Assign Root entity (75)'),
(593,'RuleAction',75,'0',20,'','2024-11-19 10:17:34',0,'',''),
(594,'Config',1,'',0,'','2024-11-19 10:17:34',1,'initialized_rules_collections [\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\"]','[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\"]'),
(595,'RuleSoftwareCategory',76,'0',20,'','2024-11-19 10:17:34',0,'',''),
(596,'RuleSoftwareCategory',76,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Software is * (184)'),
(597,'RuleCriteria',184,'0',20,'','2024-11-19 10:17:34',0,'',''),
(598,'RuleSoftwareCategory',76,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Import category from inventory tool Assign Yes (76)'),
(599,'RuleAction',76,'0',20,'','2024-11-19 10:17:34',0,'',''),
(600,'Config',1,'',0,'','2024-11-19 10:17:34',1,'initialized_rules_collections [\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\"]','[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\"]'),
(601,'RuleTicket',77,'0',20,'','2024-11-19 10:17:34',0,'',''),
(602,'RuleTicket',77,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Ticket location does not exist Yes (185)'),
(603,'RuleCriteria',185,'0',20,'','2024-11-19 10:17:34',0,'',''),
(604,'RuleTicket',77,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Item location exists Yes (186)'),
(605,'RuleCriteria',186,'0',20,'','2024-11-19 10:17:34',0,'',''),
(606,'RuleTicket',77,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Location Copy from item Yes (77)'),
(607,'RuleAction',77,'0',20,'','2024-11-19 10:17:34',0,'',''),
(608,'RuleTicket',78,'0',20,'','2024-11-19 10:17:34',0,'',''),
(609,'RuleTicket',78,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Ticket location does not exist Yes (187)'),
(610,'RuleCriteria',187,'0',20,'','2024-11-19 10:17:34',0,'',''),
(611,'RuleTicket',78,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Requester location exists Yes (188)'),
(612,'RuleCriteria',188,'0',20,'','2024-11-19 10:17:34',0,'',''),
(613,'RuleTicket',78,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Location Copy from user Yes (78)'),
(614,'RuleAction',78,'0',20,'','2024-11-19 10:17:34',0,'',''),
(615,'Config',1,'',0,'','2024-11-19 10:17:34',1,'initialized_rules_collections [\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\"]','[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\"]'),
(616,'RuleAsset',79,'0',20,'','2024-11-19 10:17:34',0,'',''),
(617,'RuleAsset',79,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Item type is Computer (189)'),
(618,'RuleCriteria',189,'0',20,'','2024-11-19 10:17:34',0,'',''),
(619,'RuleAsset',79,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Automatic inventory is Yes (190)'),
(620,'RuleCriteria',190,'0',20,'','2024-11-19 10:17:34',0,'',''),
(621,'RuleAsset',79,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Alternate username regular expression matches /(.*)@/ (191)'),
(622,'RuleCriteria',191,'0',20,'','2024-11-19 10:17:34',0,'',''),
(623,'RuleAsset',79,'RuleAction',17,'','2024-11-19 10:17:34',0,'','User based contact information Assign the value from regular expression #0 (79)'),
(624,'RuleAction',79,'0',20,'','2024-11-19 10:17:34',0,'',''),
(625,'RuleAsset',80,'0',20,'','2024-11-19 10:17:34',0,'',''),
(626,'RuleAsset',80,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Item type is Computer (192)'),
(627,'RuleCriteria',192,'0',20,'','2024-11-19 10:17:34',0,'',''),
(628,'RuleAsset',80,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Automatic inventory is Yes (193)'),
(629,'RuleCriteria',193,'0',20,'','2024-11-19 10:17:34',0,'',''),
(630,'RuleAsset',80,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Alternate username regular expression matches /(.*)[,|/]/ (194)'),
(631,'RuleCriteria',194,'0',20,'','2024-11-19 10:17:34',0,'',''),
(632,'RuleAsset',80,'RuleAction',17,'','2024-11-19 10:17:34',0,'','User based contact information Assign the value from regular expression #0 (80)'),
(633,'RuleAction',80,'0',20,'','2024-11-19 10:17:34',0,'',''),
(634,'RuleAsset',81,'0',20,'','2024-11-19 10:17:34',0,'',''),
(635,'RuleAsset',81,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Item type is Computer (195)'),
(636,'RuleCriteria',195,'0',20,'','2024-11-19 10:17:34',0,'',''),
(637,'RuleAsset',81,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Automatic inventory is Yes (196)'),
(638,'RuleCriteria',196,'0',20,'','2024-11-19 10:17:34',0,'',''),
(639,'RuleAsset',81,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Alternate username regular expression matches /(.*)/ (197)'),
(640,'RuleCriteria',197,'0',20,'','2024-11-19 10:17:34',0,'',''),
(641,'RuleAsset',81,'RuleAction',17,'','2024-11-19 10:17:34',0,'','User based contact information Assign the value from regular expression #0 (81)'),
(642,'RuleAction',81,'0',20,'','2024-11-19 10:17:34',0,'',''),
(643,'Config',1,'',0,'','2024-11-19 10:17:34',1,'initialized_rules_collections [\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\"]','[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\",\"RuleAssetCollection\"]'),
(644,'RuleDictionnaryOperatingSystem',82,'0',20,'','2024-11-19 10:17:34',0,'',''),
(645,'RuleDictionnaryOperatingSystem',82,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Unavailable regular expression matches /(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle|Amazon Linux)(?:D+|)([d.]*) ?(?:(?([w ]+))?)?/ (198)'),
(646,'RuleCriteria',198,'0',20,'','2024-11-19 10:17:34',0,'',''),
(647,'RuleDictionnaryOperatingSystem',82,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Operating system Add the result of regular expression #0 (82)'),
(648,'RuleAction',82,'0',20,'','2024-11-19 10:17:34',0,'',''),
(649,'RuleDictionnaryOperatingSystem',83,'0',20,'','2024-11-19 10:17:34',0,'',''),
(650,'RuleDictionnaryOperatingSystem',83,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Unavailable regular expression matches /(Microsoft)(?&#62;(R)|®)? (Windows) (XP|d.d|d{1,4}|Vista)(™)? ?(.*)/ (199)'),
(651,'RuleCriteria',199,'0',20,'','2024-11-19 10:17:34',0,'',''),
(652,'RuleDictionnaryOperatingSystem',83,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Operating system Add the result of regular expression #1 (83)'),
(653,'RuleAction',83,'0',20,'','2024-11-19 10:17:34',0,'',''),
(654,'RuleDictionnaryOperatingSystem',84,'0',20,'','2024-11-19 10:17:34',0,'',''),
(655,'RuleDictionnaryOperatingSystem',84,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Unavailable regular expression matches /(Microsoft)(?&#62;(R)|®)? (?:(Hyper-V|Windows)(?:(R))?) ((?:Server|))(?:(R)|®)? (d{4}(?: R2)?)(?:[,s]++)?([^s]*)(?: Edition(?: x64)?)?$/ (20'),
(656,'RuleCriteria',200,'0',20,'','2024-11-19 10:17:34',0,'',''),
(657,'RuleDictionnaryOperatingSystem',84,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Operating system Add the result of regular expression #1 #2 (84)'),
(658,'RuleAction',84,'0',20,'','2024-11-19 10:17:34',0,'',''),
(659,'Config',1,'',0,'','2024-11-19 10:17:34',1,'initialized_rules_collections [\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\",\"RuleAssetCol','[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\",\"RuleAssetCollection\",\"RuleDictionnaryOpera'),
(660,'RuleDictionnaryOperatingSystemVersion',85,'0',20,'','2024-11-19 10:17:34',0,'',''),
(661,'RuleDictionnaryOperatingSystemVersion',85,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Operating system regular expression matches /(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle)(?:D+|)([d.]+) ?(?:(?([w ]+))?)?/ (201)'),
(662,'RuleCriteria',201,'0',20,'','2024-11-19 10:17:34',0,'',''),
(663,'RuleDictionnaryOperatingSystemVersion',85,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Version Add the result of regular expression #1 (85)'),
(664,'RuleAction',85,'0',20,'','2024-11-19 10:17:34',0,'',''),
(665,'RuleDictionnaryOperatingSystemVersion',86,'0',20,'','2024-11-19 10:17:34',0,'',''),
(666,'RuleDictionnaryOperatingSystemVersion',86,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Operating system regular expression matches /(Microsoft)(?&#62;(R)|®)? (Windows) (XP|d.d|d{1,4}|Vista)(™)? ?(.*)/ (202)'),
(667,'RuleCriteria',202,'0',20,'','2024-11-19 10:17:34',0,'',''),
(668,'RuleDictionnaryOperatingSystemVersion',86,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Version Add the result of regular expression #2 (86)'),
(669,'RuleAction',86,'0',20,'','2024-11-19 10:17:34',0,'',''),
(670,'RuleDictionnaryOperatingSystemVersion',87,'0',20,'','2024-11-19 10:17:34',0,'',''),
(671,'RuleDictionnaryOperatingSystemVersion',87,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Operating system regular expression matches /(Microsoft)(?&#62;(R)|®)? (?:(Hyper-V|Windows)(?:(R))?) ((?:Server|))(?:(R)|®)? (d{4}(?: R2)?)(?:[,s]++)?([^s]*)(?: Edition(?: x64)?)?$'),
(672,'RuleCriteria',203,'0',20,'','2024-11-19 10:17:34',0,'',''),
(673,'RuleDictionnaryOperatingSystemVersion',87,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Version Add the result of regular expression #3 (87)'),
(674,'RuleAction',87,'0',20,'','2024-11-19 10:17:34',0,'',''),
(675,'Config',1,'',0,'','2024-11-19 10:17:34',1,'initialized_rules_collections [\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\",\"RuleAssetCol','[\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\",\"RuleAssetCollection\",\"RuleDictionnaryOpera'),
(676,'RuleDictionnaryOperatingSystemEdition',88,'0',20,'','2024-11-19 10:17:34',0,'',''),
(677,'RuleDictionnaryOperatingSystemEdition',88,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Operating system regular expression matches /(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle)(?:D+|)([d.]+) ?(?:(?([w ]+))?)?/ (204)'),
(678,'RuleCriteria',204,'0',20,'','2024-11-19 10:17:34',0,'',''),
(679,'RuleDictionnaryOperatingSystemEdition',88,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Edition Add the result of regular expression #2 (88)'),
(680,'RuleAction',88,'0',20,'','2024-11-19 10:17:34',0,'',''),
(681,'RuleDictionnaryOperatingSystemEdition',89,'0',20,'','2024-11-19 10:17:34',0,'',''),
(682,'RuleDictionnaryOperatingSystemEdition',89,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Operating system regular expression matches /(Microsoft)(?&#62;(R)|®)? (Windows) (XP|d.d|d{1,4}|Vista)(™)? ?(.*)/ (205)'),
(683,'RuleCriteria',205,'0',20,'','2024-11-19 10:17:34',0,'',''),
(684,'RuleDictionnaryOperatingSystemEdition',89,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Edition Add the result of regular expression #4 (89)'),
(685,'RuleAction',89,'0',20,'','2024-11-19 10:17:34',0,'',''),
(686,'RuleDictionnaryOperatingSystemEdition',90,'0',20,'','2024-11-19 10:17:34',0,'',''),
(687,'RuleDictionnaryOperatingSystemEdition',90,'RuleCriteria',17,'','2024-11-19 10:17:34',0,'','Operating system regular expression matches /(Microsoft)(?&#62;(R)|®)? (?:(Hyper-V|Windows)(?:(R))?) ((?:Server|))(?:(R)|®)? (d{4}(?: R2)?)(?:[,s]++)?([^s]*)(?: Edition(?: x64)?)?$'),
(688,'RuleCriteria',206,'0',20,'','2024-11-19 10:17:34',0,'',''),
(689,'RuleDictionnaryOperatingSystemEdition',90,'RuleAction',17,'','2024-11-19 10:17:34',0,'','Edition Add the result of regular expression #4 (90)'),
(690,'RuleAction',90,'0',20,'','2024-11-19 10:17:34',0,'',''),
(691,'Config',1,'',0,'','2024-11-19 10:17:34',1,'initialized_rules_collections [\"RuleImportAssetCollection\",\"RuleMailCollectorCollection\",\"RuleRightCollection\",\"RuleSoftwareCategoryCollection\",\"RuleTicketCollection\",\"RuleAssetCol','{...}'),
(692,'Config',1,'',0,'','2024-11-19 10:17:34',1,'version FILLED AT INSTALL','10.0.16'),
(693,'Config',1,'',0,'','2024-11-19 10:17:34',1,'dbversion FILLED AT INSTALL','10.0.16@b13256c443dd4fdb27b4a0d3b8fea8caba4dfaa9'),
(694,'Config',1,'',0,'glpi (2)','2024-11-19 10:21:04',1,'enable_api 0','1'),
(695,'APIClient',1,'',0,'glpi (2)','2024-11-19 10:21:28',4,'0','1'),
(696,'APIClient',1,'',0,'glpi (2)','2024-11-19 10:21:28',5,'2130706433',NULL),
(697,'APIClient',1,'',0,'glpi (2)','2024-11-19 10:21:28',6,'2130706433',NULL),
(698,'APIClient',1,'',0,'glpi (2)','2024-11-19 10:21:28',7,'::1',NULL),
(699,'APIClient',1,'',0,'glpi (2)','2024-11-19 10:21:28',8,'','fJrh7xJieyR45puNYy3OqXNFulLO0DgpBK10oUHK'),
(700,'User',4,'',0,'','2024-11-19 10:27:13',17,'en_GB',NULL),
(701,'Ticket',1,'User',15,'glpi (2)','2024-11-19 10:27:53',4,'','glpi (2)'),
(702,'Ticket',1,'',0,'glpi (2)','2024-11-19 10:27:53',150,'0','1'),
(703,'Ticket',1,'User',15,'glpi (2)','2024-11-19 10:27:53',5,'','glpi (2)'),
(704,'Ticket',1,'',0,'glpi (2)','2024-11-19 10:27:53',12,'1','2'),
(705,'Ticket',1,'0',20,'glpi (2)','2024-11-19 10:27:53',0,'',''),
(706,'Config',1,'',0,'','2024-11-25 12:12:54',1,'version 10.0.16','10.0.17'),
(707,'Config',1,'',0,'','2024-11-25 12:12:54',1,'dbversion 10.0.16@b13256c443dd4fdb27b4a0d3b8fea8caba4dfaa9','10.0.17@bde16719fbd4112f59a9a7d34c66c959bce73434'),
(715,'User',4,'Profile',17,'glpi (2)','2024-11-25 12:39:54',0,'','Root entity (0), Super-Admin (4)'),
(716,'Profile',4,'User',17,'glpi (2)','2024-11-25 12:39:54',0,'','tech (4), Root entity (0)'),
(717,'Entity',0,'User',17,'glpi (2)','2024-11-25 12:39:54',0,'','tech (4), Super-Admin (4)'),
(776,'User',4,'',0,'glpi (2)','2024-11-25 13:42:36',150,'','8a/4_67447ecce048a.jpg'),
(813,'Computer',1,'0',20,'glpi (2)','2024-11-25 13:48:16',0,'',''),
(823,'Group',1,'0',20,'glpi (2)','2024-11-25 13:49:18',0,'',''),
(833,'Computer',1,'',0,'glpi (2)','2024-11-25 13:49:58',71,'&nbsp; (0)','group1 (1)'),
(843,'Ticket',1,'',0,'glpi (2)','2024-11-25 14:13:28',1,'Hello World!','ticket1'),
(870,'Computer',1,'',0,'glpi (2)','2024-11-25 14:20:05',49,'&nbsp; (0)','group1 (1)'),
(880,'Ticket',2,'User',15,'glpi (2)','2024-11-25 14:21:33',4,'','glpi (2)'),
(881,'Ticket',2,'',0,'glpi (2)','2024-11-25 14:21:33',150,'0','1'),
(882,'Ticket',2,'User',15,'glpi (2)','2024-11-25 14:21:33',5,'','glpi (2)'),
(883,'Ticket',2,'',0,'glpi (2)','2024-11-25 14:21:33',12,'1','2'),
(884,'Ticket',2,'0',20,'glpi (2)','2024-11-25 14:21:33',0,'',''),
(885,'Ticket',2,'0',13,'glpi (2)','2024-11-25 14:21:41',0,'',''),
(895,'Monitor',1,'0',20,'glpi (2)','2024-11-25 14:22:16',0,'',''),
(896,'Monitor',2,'0',20,'glpi (2)','2024-11-25 14:22:22',0,'',''),
(905,'Monitor',1,'',0,'tech (4)','2024-11-25 14:22:29',10,'','update uuid'),
(906,'Monitor',2,'',0,'tech (4)','2024-11-25 14:22:29',10,'','update uid2'),
(908,'Monitor',1,'',0,'glpi (2)','2024-11-25 14:23:17',1,'Monitor 1','monitor1'),
(909,'Monitor',2,'',0,'glpi (2)','2024-11-25 14:23:26',1,'Monitor 2','monitor2'),
(919,'Monitor',2,'',0,'glpi (2)','2024-11-25 14:24:23',11,'0.00','10'),
(929,'Monitor',1,'',0,'glpi (2)','2024-11-25 14:24:43',11,'0.00','1'),
(939,'Monitor',1,'',0,'glpi (2)','2024-11-25 14:25:13',11,'1.00','11'),
(949,'Computer',1,'',0,'glpi (2)','2024-11-25 14:26:27',1,'Test computer','computer1'),
(959,'Rack',1,'0',20,'glpi (2)','2024-11-25 14:27:39',0,'',''),
(960,'Rack',1,'',0,'glpi (2)','2024-11-25 14:28:01',16,'','somelog'),
(988,'Monitor',1,'',0,'glpi (2)','2024-11-25 14:44:12',5,'','1'),
(989,'Monitor',2,'',0,'glpi (2)','2024-11-25 14:44:19',5,'','2'),
(999,'Monitor',2,'',0,'glpi (2)','2024-11-25 14:44:32',5,'2','1'),
(1000,'Monitor',2,'',0,'glpi (2)','2024-11-25 14:44:40',5,'1','2'),
(1027,'Monitor',1,'',0,'glpi (2)','2024-11-25 14:51:17',5,'1','2'),
(1028,'Monitor',2,'',0,'glpi (2)','2024-11-25 14:51:22',5,'2','1'),
(1202,'State',1,'0',20,'glpi (2)','2025-01-27 13:08:50',0,'',''),
(1203,'State',2,'0',20,'glpi (2)','2025-01-27 13:09:00',0,'',''),
(1204,'PrinterType',1,'0',20,'glpi (2)','2025-01-27 13:11:00',0,'',''),
(1205,'PrinterType',2,'0',20,'glpi (2)','2025-01-27 13:11:12',0,'',''),
(1206,'PrinterType',3,'0',20,'glpi (2)','2025-01-27 13:11:27',0,'',''),
(1207,'Printer',1,'0',20,'glpi (2)','2025-01-27 13:11:42',0,'',''),
(1208,'Printer',2,'0',20,'glpi (2)','2025-01-27 13:12:07',0,'',''),
(1209,'Printer',3,'0',20,'glpi (2)','2025-01-27 13:12:20',0,'',''),
(1210,'Printer',4,'0',20,'glpi (2)','2025-01-27 13:12:31',0,'','');
/*!40000 ALTER TABLE `glpi_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_mailcollectors`
--

DROP TABLE IF EXISTS `glpi_mailcollectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_mailcollectors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `filesize_max` int(11) NOT NULL DEFAULT 2097152,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `passwd` varchar(255) DEFAULT NULL,
  `accepted` varchar(255) DEFAULT NULL,
  `refused` varchar(255) DEFAULT NULL,
  `errors` int(11) NOT NULL DEFAULT 0,
  `use_mail_date` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `requester_field` int(11) NOT NULL DEFAULT 0,
  `add_cc_to_observer` tinyint(4) NOT NULL DEFAULT 0,
  `collect_only_unread` tinyint(4) NOT NULL DEFAULT 0,
  `last_collect_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `last_collect_date` (`last_collect_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_mailcollectors`
--

LOCK TABLES `glpi_mailcollectors` WRITE;
/*!40000 ALTER TABLE `glpi_mailcollectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_mailcollectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_manuallinks`
--

DROP TABLE IF EXISTS `glpi_manuallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_manuallinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(8096) NOT NULL,
  `open_window` tinyint(4) NOT NULL DEFAULT 1,
  `icon` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `items_id` (`items_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_manuallinks`
--

LOCK TABLES `glpi_manuallinks` WRITE;
/*!40000 ALTER TABLE `glpi_manuallinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_manuallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_manufacturers`
--

DROP TABLE IF EXISTS `glpi_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_manufacturers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_manufacturers`
--

LOCK TABLES `glpi_manufacturers` WRITE;
/*!40000 ALTER TABLE `glpi_manufacturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_monitormodels`
--

DROP TABLE IF EXISTS `glpi_monitormodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_monitormodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_monitormodels`
--

LOCK TABLES `glpi_monitormodels` WRITE;
/*!40000 ALTER TABLE `glpi_monitormodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_monitormodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_monitors`
--

DROP TABLE IF EXISTS `glpi_monitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_monitors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `size` decimal(5,2) NOT NULL DEFAULT 0.00,
  `have_micro` tinyint(4) NOT NULL DEFAULT 0,
  `have_speaker` tinyint(4) NOT NULL DEFAULT 0,
  `have_subd` tinyint(4) NOT NULL DEFAULT 0,
  `have_bnc` tinyint(4) NOT NULL DEFAULT 0,
  `have_dvi` tinyint(4) NOT NULL DEFAULT 0,
  `have_pivot` tinyint(4) NOT NULL DEFAULT 0,
  `have_hdmi` tinyint(4) NOT NULL DEFAULT 0,
  `have_displayport` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `monitortypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `monitormodels_id` int(10) unsigned NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_global` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `monitormodels_id` (`monitormodels_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `monitortypes_id` (`monitortypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_monitors`
--

LOCK TABLES `glpi_monitors` WRITE;
/*!40000 ALTER TABLE `glpi_monitors` DISABLE KEYS */;
INSERT INTO `glpi_monitors` VALUES
(1,0,'monitor1','2024-11-25 14:51:17','','',0,0,'','2','',11.00,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0.0000,0,0,'update uuid','2024-11-25 14:22:16',0),
(2,0,'monitor2','2024-11-25 14:51:22','','',0,0,'','1','',10.00,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0.0000,0,0,'update uid2','2024-11-25 14:22:22',0);
/*!40000 ALTER TABLE `glpi_monitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_monitortypes`
--

DROP TABLE IF EXISTS `glpi_monitortypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_monitortypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_monitortypes`
--

LOCK TABLES `glpi_monitortypes` WRITE;
/*!40000 ALTER TABLE `glpi_monitortypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_monitortypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkaliases`
--

DROP TABLE IF EXISTS `glpi_networkaliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkaliases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `networknames_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `fqdns_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `name` (`name`),
  KEY `networknames_id` (`networknames_id`),
  KEY `fqdns_id` (`fqdns_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkaliases`
--

LOCK TABLES `glpi_networkaliases` WRITE;
/*!40000 ALTER TABLE `glpi_networkaliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkaliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkequipmentmodels`
--

DROP TABLE IF EXISTS `glpi_networkequipmentmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkequipmentmodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkequipmentmodels`
--

LOCK TABLES `glpi_networkequipmentmodels` WRITE;
/*!40000 ALTER TABLE `glpi_networkequipmentmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkequipmentmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkequipments`
--

DROP TABLE IF EXISTS `glpi_networkequipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkequipments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `ram` int(10) unsigned DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `networks_id` int(10) unsigned NOT NULL DEFAULT 0,
  `networkequipmenttypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `networkequipmentmodels_id` int(10) unsigned NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `autoupdatesystems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sysdescr` text DEFAULT NULL,
  `cpu` int(11) NOT NULL DEFAULT 0,
  `uptime` varchar(255) NOT NULL DEFAULT '0',
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  `snmpcredentials_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `networkequipmentmodels_id` (`networkequipmentmodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `networkequipmenttypes_id` (`networkequipmenttypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `snmpcredentials_id` (`snmpcredentials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkequipments`
--

LOCK TABLES `glpi_networkequipments` WRITE;
/*!40000 ALTER TABLE `glpi_networkequipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkequipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkequipmenttypes`
--

DROP TABLE IF EXISTS `glpi_networkequipmenttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkequipmenttypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkequipmenttypes`
--

LOCK TABLES `glpi_networkequipmenttypes` WRITE;
/*!40000 ALTER TABLE `glpi_networkequipmenttypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkequipmenttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkinterfaces`
--

DROP TABLE IF EXISTS `glpi_networkinterfaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkinterfaces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkinterfaces`
--

LOCK TABLES `glpi_networkinterfaces` WRITE;
/*!40000 ALTER TABLE `glpi_networkinterfaces` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkinterfaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networknames`
--

DROP TABLE IF EXISTS `glpi_networknames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networknames` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `fqdns_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ipnetworks_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `FQDN` (`name`,`fqdns_id`),
  KEY `fqdns_id` (`fqdns_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `item` (`itemtype`,`items_id`,`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `ipnetworks_id` (`ipnetworks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networknames`
--

LOCK TABLES `glpi_networknames` WRITE;
/*!40000 ALTER TABLE `glpi_networknames` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networknames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportaggregates`
--

DROP TABLE IF EXISTS `glpi_networkportaggregates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportaggregates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int(10) unsigned NOT NULL DEFAULT 0,
  `networkports_id_list` text DEFAULT NULL COMMENT 'array of associated networkports_id',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportaggregates`
--

LOCK TABLES `glpi_networkportaggregates` WRITE;
/*!40000 ALTER TABLE `glpi_networkportaggregates` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkportaggregates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportaliases`
--

DROP TABLE IF EXISTS `glpi_networkportaliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportaliases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int(10) unsigned NOT NULL DEFAULT 0,
  `networkports_id_alias` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `networkports_id_alias` (`networkports_id_alias`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportaliases`
--

LOCK TABLES `glpi_networkportaliases` WRITE;
/*!40000 ALTER TABLE `glpi_networkportaliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkportaliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportconnectionlogs`
--

DROP TABLE IF EXISTS `glpi_networkportconnectionlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportconnectionlogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT NULL,
  `connected` tinyint(4) NOT NULL DEFAULT 0,
  `networkports_id_source` int(10) unsigned NOT NULL DEFAULT 0,
  `networkports_id_destination` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `networkports_id_source` (`networkports_id_source`),
  KEY `networkports_id_destination` (`networkports_id_destination`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportconnectionlogs`
--

LOCK TABLES `glpi_networkportconnectionlogs` WRITE;
/*!40000 ALTER TABLE `glpi_networkportconnectionlogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkportconnectionlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportdialups`
--

DROP TABLE IF EXISTS `glpi_networkportdialups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportdialups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportdialups`
--

LOCK TABLES `glpi_networkportdialups` WRITE;
/*!40000 ALTER TABLE `glpi_networkportdialups` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkportdialups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportethernets`
--

DROP TABLE IF EXISTS `glpi_networkportethernets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportethernets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int(10) unsigned NOT NULL DEFAULT 0,
  `items_devicenetworkcards_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` varchar(10) DEFAULT '' COMMENT 'T, LX, SX',
  `speed` int(11) NOT NULL DEFAULT 10 COMMENT 'Mbit/s: 10, 100, 1000, 10000',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `card` (`items_devicenetworkcards_id`),
  KEY `type` (`type`),
  KEY `speed` (`speed`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportethernets`
--

LOCK TABLES `glpi_networkportethernets` WRITE;
/*!40000 ALTER TABLE `glpi_networkportethernets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkportethernets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportfiberchannels`
--

DROP TABLE IF EXISTS `glpi_networkportfiberchannels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportfiberchannels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int(10) unsigned NOT NULL DEFAULT 0,
  `items_devicenetworkcards_id` int(10) unsigned NOT NULL DEFAULT 0,
  `networkportfiberchanneltypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `wwn` varchar(50) DEFAULT '',
  `speed` int(11) NOT NULL DEFAULT 10 COMMENT 'Mbit/s: 10, 100, 1000, 10000',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `card` (`items_devicenetworkcards_id`),
  KEY `type` (`networkportfiberchanneltypes_id`),
  KEY `wwn` (`wwn`),
  KEY `speed` (`speed`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportfiberchannels`
--

LOCK TABLES `glpi_networkportfiberchannels` WRITE;
/*!40000 ALTER TABLE `glpi_networkportfiberchannels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkportfiberchannels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportfiberchanneltypes`
--

DROP TABLE IF EXISTS `glpi_networkportfiberchanneltypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportfiberchanneltypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportfiberchanneltypes`
--

LOCK TABLES `glpi_networkportfiberchanneltypes` WRITE;
/*!40000 ALTER TABLE `glpi_networkportfiberchanneltypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkportfiberchanneltypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportlocals`
--

DROP TABLE IF EXISTS `glpi_networkportlocals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportlocals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportlocals`
--

LOCK TABLES `glpi_networkportlocals` WRITE;
/*!40000 ALTER TABLE `glpi_networkportlocals` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkportlocals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportmetrics`
--

DROP TABLE IF EXISTS `glpi_networkportmetrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportmetrics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `ifinbytes` bigint(20) NOT NULL DEFAULT 0,
  `ifinerrors` bigint(20) NOT NULL DEFAULT 0,
  `ifoutbytes` bigint(20) NOT NULL DEFAULT 0,
  `ifouterrors` bigint(20) NOT NULL DEFAULT 0,
  `networkports_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`networkports_id`,`date`),
  KEY `date` (`date`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportmetrics`
--

LOCK TABLES `glpi_networkportmetrics` WRITE;
/*!40000 ALTER TABLE `glpi_networkportmetrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkportmetrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkports`
--

DROP TABLE IF EXISTS `glpi_networkports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `logical_number` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `instantiation_type` varchar(255) DEFAULT NULL,
  `mac` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `ifmtu` int(11) NOT NULL DEFAULT 0,
  `ifspeed` bigint(20) NOT NULL DEFAULT 0,
  `ifinternalstatus` varchar(255) DEFAULT NULL,
  `ifconnectionstatus` int(11) NOT NULL DEFAULT 0,
  `iflastchange` varchar(255) DEFAULT NULL,
  `ifinbytes` bigint(20) NOT NULL DEFAULT 0,
  `ifinerrors` bigint(20) NOT NULL DEFAULT 0,
  `ifoutbytes` bigint(20) NOT NULL DEFAULT 0,
  `ifouterrors` bigint(20) NOT NULL DEFAULT 0,
  `ifstatus` varchar(255) DEFAULT NULL,
  `ifdescr` varchar(255) DEFAULT NULL,
  `ifalias` varchar(255) DEFAULT NULL,
  `portduplex` varchar(255) DEFAULT NULL,
  `trunk` tinyint(4) NOT NULL DEFAULT 0,
  `lastup` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `mac` (`mac`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkports`
--

LOCK TABLES `glpi_networkports` WRITE;
/*!40000 ALTER TABLE `glpi_networkports` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkports_networkports`
--

DROP TABLE IF EXISTS `glpi_networkports_networkports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkports_networkports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id_1` int(10) unsigned NOT NULL DEFAULT 0,
  `networkports_id_2` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`networkports_id_1`,`networkports_id_2`),
  KEY `networkports_id_2` (`networkports_id_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkports_networkports`
--

LOCK TABLES `glpi_networkports_networkports` WRITE;
/*!40000 ALTER TABLE `glpi_networkports_networkports` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkports_networkports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkports_vlans`
--

DROP TABLE IF EXISTS `glpi_networkports_vlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkports_vlans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int(10) unsigned NOT NULL DEFAULT 0,
  `vlans_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tagged` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`networkports_id`,`vlans_id`),
  KEY `vlans_id` (`vlans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkports_vlans`
--

LOCK TABLES `glpi_networkports_vlans` WRITE;
/*!40000 ALTER TABLE `glpi_networkports_vlans` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkports_vlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkporttypes`
--

DROP TABLE IF EXISTS `glpi_networkporttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkporttypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `value_decimal` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_importable` tinyint(4) NOT NULL DEFAULT 0,
  `instantiation_type` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `value_decimal` (`value_decimal`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_importable` (`is_importable`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkporttypes`
--

LOCK TABLES `glpi_networkporttypes` WRITE;
/*!40000 ALTER TABLE `glpi_networkporttypes` DISABLE KEYS */;
INSERT INTO `glpi_networkporttypes` VALUES
(1,0,0,0,'Name','Description References',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(2,0,0,1,'other','none of the following [RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(3,0,0,2,'regular1822','BBN Report 1822 [RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(4,0,0,3,'hdh1822','BBN Report 1822 [RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(5,0,0,4,'ddn-x25','BBN Report 1822 [RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(6,0,0,5,'x25','X.25 [RFC1382]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(7,0,0,6,'ethernet-csmacd','[RFC1213]',1,'NetworkPortEthernet','2024-11-19 10:17:34','2024-11-19 10:17:34'),
(8,0,0,7,'IEEE802.3','DEPRECATED [RFC3635]',1,'NetworkPortEthernet','2024-11-19 10:17:34','2024-11-19 10:17:34'),
(9,0,0,8,'IEEE802.4','Token Bus-like Objects [RFC1239]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(10,0,0,9,'IEEE802.5','Token Ring-like Objects [RFC1748]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(11,0,0,10,'iso88026-man','[RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(12,0,0,11,'starLan','DEPRECATED [RFC3635]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(13,0,0,12,'proteon-10Mbit','[RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(14,0,0,13,'proteon-80Mbit','[RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(15,0,0,14,'hyperchannel','[RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(16,0,0,15,'FDDI','FDDI Objects [RFC1512]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(17,0,0,16,'lapb','LAP B [RFC1381]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(18,0,0,17,'sdlc','[RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(19,0,0,18,'ds1','T1/E1 Carrier Objects [RFC4805]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(20,0,0,19,'e1','obsolete [RFC4805]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(21,0,0,20,'basicISDN','[RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(22,0,0,21,'primaryISDN','[RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(23,0,0,22,'propPointToPointSerial','[RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(24,0,0,23,'ppp','Point-to-Point Protocol [RFC1213][RFC1471]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(25,0,0,24,'softwareLoopback','[RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(26,0,0,25,'eon','[RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(27,0,0,26,'ethernet-3Mbit','[RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(28,0,0,27,'nsip','[RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(29,0,0,28,'slip','[RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(30,0,0,29,'ultra','[RFC1213]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(31,0,0,30,'ds3','DS3/E3 Interface Objects [RFC3896]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(32,0,0,31,'sip','SMDS Interface Objects [RFC1694]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(33,0,0,32,'frame-relay','Frame Relay Objects for DTE [RFC2115]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(34,0,0,33,'RS-232','RS-232 Objects [RFC1659]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(35,0,0,34,'Parallel','Parallel Printer Objects [RFC1660]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(36,0,0,35,'arcnet','ARC network',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(37,0,0,36,'arcnet-plus','ARC network plus',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(38,0,0,37,'atm','ATM',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(39,0,0,38,'MIOX25','MIOX25 [RFC1461]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(40,0,0,39,'SONET','SONET or SDH',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(41,0,0,40,'x25ple','X.25 packet level [RFC2127]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(42,0,0,41,'iso88022llc','802.2 LLC',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(43,0,0,42,'localTalk','',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(44,0,0,43,'smds-dxi','SMDS DXI',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(45,0,0,44,'frameRelayService','Frame Relay DCE [RFC2954]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(46,0,0,45,'v35','V.35',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(47,0,0,46,'hssi','HSSI',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(48,0,0,47,'hippi','HIPPI',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(49,0,0,48,'modem','generic modem',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(50,0,0,49,'aal5','AAL5 over ATM',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(51,0,0,50,'sonetPath','',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(52,0,0,51,'sonetVT','',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(53,0,0,52,'smds-icip','SMDS Inter-Carrier Interface Protocol',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(54,0,0,53,'propVirtual','proprietary vitural/internal interface [RFC2863]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(55,0,0,54,'propMultiLink','proprietary multi-link multiplexing [RFC2863]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(56,0,0,55,'ieee80212','100BaseVG',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(57,0,0,56,'fibre-channel','Fibre Channel',1,'NetworkPortFiberchannel','2024-11-19 10:17:34','2024-11-19 10:17:34'),
(58,0,0,57,'hippiInterfaces','HIPPI interfaces [Philip_Cameron]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(59,0,0,58,'FrameRelayInterconnect','Interconnet over FR [Unknown]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(60,0,0,59,'aflane8023','ATM Emulated LAN for 802.3 [Keith_McCloghrie]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(61,0,0,60,'aflane8025','ATM Emulated LAN for 802.5 [Keith_McCloghrie]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(62,0,0,61,'cctEmul','ATM Emulated circuit [Guy_Fedorkow]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(63,0,0,62,'fastEther','DEPRECATED [RFC3635]',1,'NetworkPortEthernet','2024-11-19 10:17:34','2024-11-19 10:17:34'),
(64,0,0,63,'isdn','ISDN and X.25 [RFC1356]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(65,0,0,64,'v11','CCITT V.11/X.21 [Satish_Popat]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(66,0,0,65,'v36','CCITT V.36 [Satish_Popat]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(67,0,0,66,'g703-64k','CCITT G703 at 64Kbps [Satish_Popat]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(68,0,0,67,'g703-2mb','CCITT G703 at 2Mbps [Satish_Popat]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(69,0,0,68,'qllc','SNA QLLC [Satish_Popat]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(70,0,0,69,'fastEtherFX','DEPRECATED [RFC3635]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(71,0,0,70,'channel','channel [Steven_Schwell]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(72,0,0,71,'IEEE802.11','radio spread spectrum [Dawkoon_Paul_Lee]',1,'NetworkPortWifi','2024-11-19 10:17:34','2024-11-19 10:17:34'),
(73,0,0,72,'ibm370parChan','IBM System 360/370 OEMI Channel [Bill_Kwan]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(74,0,0,73,'ESCON','IBM Enterprise Systems Connection [Bill_Kwan]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(75,0,0,74,'DLSw','Data Link Switching [Bill_Kwan]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(76,0,0,75,'ISDNs','ISDN S/T interface [Ed_Alcoff]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(77,0,0,76,'ISDNu','ISDN U interface [Ed_Alcoff]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(78,0,0,77,'lapd','Link Access Protocol D [Ed_Alcoff]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(79,0,0,78,'ip-switch','IP Switching Objects [Joe_Wei]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(80,0,0,79,'rsrb','Remote Source Route Bridging [Bob_Clouston]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(81,0,0,80,'atm-logical','ATM Logical Port [RFC3606]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(82,0,0,81,'ds0','Digital Signal Level 0 [RFC2494]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(83,0,0,82,'ds0Bundle','group of ds0s on the same ds1 [RFC2494]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(84,0,0,83,'bsc','Bisynchronous Protocol [Bill_Kwan]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(85,0,0,84,'async','Asynchronous Protocol [Bill_Kwan]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(86,0,0,85,'cnr','Combat Net Radio [Herb_Jensen]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(87,0,0,86,'iso88025Dtr','ISO 802.5r DTR [Trevor_Warwick]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(88,0,0,87,'eplrs','Enhanced  Pos Loc Report Sys [Herb_Jensen]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(89,0,0,88,'arap','Appletalk Remote Access Protocol [Jim_Halpin]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(90,0,0,89,'propCnls','Proprietary Connectionless Proto. [Robert_Neill]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(91,0,0,90,'hostPad','CCITT-ITU X.29 PAD Protocol [Robert_Neill]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(92,0,0,91,'termPad','CCITT-ITU X.3 PAD Facility [Robert_Neill]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(93,0,0,92,'frameRelayMPI','Multiproto Interconnect over FR [Robert_Neill]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(94,0,0,93,'x213','CCITT-ITU X213 [Robert_Neill]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(95,0,0,94,'adsl','Asymmetric Digital Subscriber Loop [Gregory_Bathrick]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(96,0,0,95,'radsl','Rate-Adapt. Digital Subscriber Loop [Gregory_Bathrick]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(97,0,0,96,'sdsl','Symmetric Digital Subscriber Loop [Gregory_Bathrick]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(98,0,0,97,'vdsl','Very H-Speed Digital Subscrib. Loop [Gregory_Bathrick]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(99,0,0,98,'iso88025CRFPInt','ISO 802.5 CRFP [Trevor_Warwick]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(100,0,0,99,'myrinet','Myricom Myrinet [Bob_Felderman]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(101,0,0,100,'voiceEM','Voice recEive and transMit (E&#38;M) [Bob_Stewart]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(102,0,0,101,'voiceFXO','Voice Foreign Exchange Office [Bob_Stewart]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(103,0,0,102,'voiceFXS','Voice Foreign Exchange Station [Bob_Stewart]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(104,0,0,103,'voiceEncap','Voice encapsulation [Bob_Stewart]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(105,0,0,104,'voiceOverIp','Voice over IP encapsulation [Bob_Stewart]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(106,0,0,105,'atmDxi','ATM DXI [Gary_Hanson]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(107,0,0,106,'atmFuni','ATM FUNI [Gary_Hanson]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(108,0,0,107,'atmIma','ATM IMA [Chris_Martin]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(109,0,0,108,'pppMultilinkBundle','PPP Multilink Bundle [John_Shriver]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(110,0,0,109,'ipOverCdlc','IBM ipOverCdlc [Ken_White]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(111,0,0,110,'ipOverClaw','IBM Common Link Access to Workstn [Ken_White]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(112,0,0,111,'stackToStack','IBM stackToStack [Ken_White]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(113,0,0,112,'virtualIpAddress','IBM VIPA [Ken_White]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(114,0,0,113,'mpc','IBM multi-protocol channel support [Ken_White]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(115,0,0,114,'ipOverAtm','IBM ipOverAtm [RFC2320]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(116,0,0,115,'iso88025Fiber','ISO 802.5j Fiber Token Ring [Kevin_Lingle]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(117,0,0,116,'tdlc','IBM twinaxial data link control [John_Pechacek]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(118,0,0,117,'gigabitEthernet','DEPRECATED [RFC3635]',1,'NetworkPortEthernet','2024-11-19 10:17:34','2024-11-19 10:17:34'),
(119,0,0,118,'hdlc','HDLC [Sebastien_Rosset]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(120,0,0,119,'lapf','LAP F [Sebastien_Rosset]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(121,0,0,120,'v37','V.37 [Sebastien_Rosset]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(122,0,0,121,'x25mlp','Multi-Link Protocol [Sebastien_Rosset]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(123,0,0,122,'x25huntGroup','X25 Hunt Group [Sebastien_Rosset]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(124,0,0,123,'transpHdlc','Transp HDLC [Sebastien_Rosset]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(125,0,0,124,'interleave','Interleave channel [Karmous_Edwards]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(126,0,0,125,'fast','Fast channel [Karmous_Edwards]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(127,0,0,126,'ip','IP (for APPN HPR in IP networks) [Robert_Moore]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(128,0,0,127,'docsCableMaclayer','CATV Mac Layer [Azlina_Palmer]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(129,0,0,128,'docsCableDownstream','CATV Downstream interface [Azlina_Palmer]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(130,0,0,129,'docsCableUpstream','CATV Upstream interface [Azlina_Palmer]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(131,0,0,130,'a12MppSwitch','Avalon Parallel Processor [Ross_Harvey]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(132,0,0,131,'tunnel','Encapsulation interface [Dave_Thaler]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(133,0,0,132,'coffee','coffee pot [RFC2325]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(134,0,0,133,'ces','Circiut Emulation Service [Ron_Carmona]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(135,0,0,134,'atmSubInterface','(x)  ATM Sub Interface [Keith_McCloghrie]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(136,0,0,135,'l2vlan','Layer 2 Virtual LAN using 802.1Q [Mike_MacFaden]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(137,0,0,136,'l3ipvlan','Layer 3 Virtual LAN - IP Protocol [Mike_MacFaden]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(138,0,0,137,'l3ipxvlan','Layer 3 Virtual LAN - IPX Prot. [Mike_MacFaden]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(139,0,0,138,'digitalPowerLine','IP over Power Lines [Hans_Scholtes]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(140,0,0,139,'mediaMailOverIp','(xxx)  Multimedia Mail over IP [Hongchi_Shih]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(141,0,0,140,'dtm','Dynamic synchronous Transfer Mode [Jakob_Ellerstedt]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(142,0,0,141,'dcn','Data Communications Network [James_Card]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(143,0,0,142,'ipForward','IP Forwarding Interface [James_Card]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(144,0,0,143,'msdsl','Multi-rate Symmetric DSL [Gopinath_Durairaj]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(145,0,0,144,'ieee1394     IEEE1394','High Performance Serial Bus [Kenji_Fujisawa]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(146,0,0,145,'if-gsn','HIPPI-6400 [Jean_Michel_Pittet]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(147,0,0,146,'dvbRccMacLayer','DVB-RCC MAC Layer [Maarten_Oelering]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(148,0,0,147,'dvbRccDownstream','DVB-RCC Downstream Channel [Maarten_Oelering]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(149,0,0,148,'dvbRccUpstream','DVB-RCC Upstream Channel [Maarten_Oelering]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(150,0,0,149,'atmVirtual','ATM Virtual Interface [Subrahmanya_Hegde]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(151,0,0,150,'mplsTunnel','MPLS Tunnel Virtual Interface [Cheenu_Srinivasan]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(152,0,0,151,'srp','Spatial Reuse Protocol [Bill_Shetti]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(153,0,0,152,'voiceOverAtm','Voice over ATM [Chris_White]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(154,0,0,153,'voiceOverFrameRelay','Voice Over Frame Relay [Chris_White]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(155,0,0,154,'idsl','Digital Subscriber Loop over ISDN [Patrick_Gili]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(156,0,0,155,'compositeLink','Avici Composite Link Interface [Joseph_Dube]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(157,0,0,156,'ss7SigLink','SS7 Signaling Link [Cheenu_Srinivasan]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(158,0,0,157,'propWirelessP2P','Prop. P2P wireless interface [Joseph_Raja]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(159,0,0,158,'frForward','Frame forward Interface [Subrahmanya_Hegde]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(160,0,0,159,'rfc1483','Multiprotocol over ATM AAL5 [RFC1483]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(161,0,0,160,'USB','USB Interface [Bejamin_Dolnik]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(162,0,0,161,'ieee8023adLag','IEEE 802.3ad Link Aggregate [Les_Bell]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(163,0,0,162,'bgpPolicyAccounting','BGP Policy Accounting [Vinod_B_C]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(164,0,0,163,'frf16MfrBundle','FRF.16 Multilik Frame Relay [Pate_Prayson]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(165,0,0,164,'h323Gatekeeper','H323 Gatekeeper [Chris_White]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(166,0,0,165,'h323Proxy','H323 Voice and Video Proxy [Chris_White]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(167,0,0,166,'mpls','MPLS [Cheenu_Srinivasan]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(168,0,0,167,'mfSigLink','Multi-frequency signaling link [Cheenu_Srinivasan]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(169,0,0,168,'hdsl2','High Bit-Rate DSL, 2nd gen. [Bob_Ray]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(170,0,0,169,'shdsl','Multirate HDSL2 [Bob_Ray]',1,'NetworkPortEthernet','2024-11-19 10:17:34','2024-11-19 10:17:34'),
(171,0,0,170,'ds1FDL','Facility Data Link (4Kbps) on a DS1 [Bill_Kwan]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(172,0,0,171,'POS','Packet over SONET/SDH Interface [Ewart_Tempest]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(173,0,0,172,'dvbAsiIn','DVB-ASI Input [Hezi_Oved]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(174,0,0,173,'dvbAsiOut','DVB-ASI Output [Hezi_Oved]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(175,0,0,174,'plc','Power Line Communications [Andrew_Lunn]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(176,0,0,175,'NFAS','Non-Facility Associated Signaling [Sidney_Antommarchi]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(177,0,0,176,'TR008','TROO8 [Sidney_Antommarchi]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(178,0,0,177,'GR303RDT','Remote Digital Terminal [Sidney_Antommarchi]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(179,0,0,178,'GR303IDT','Integrated Digital Terminal [Sidney_Antommarchi]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(180,0,0,179,'ISUP','ISUP [Sidney_Antommarchi]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(181,0,0,180,'propDocsWirelessMaclayer','Cisco proprietary Maclayer [Joseph_Raja]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(182,0,0,181,'propDocsWirelessDownstream','Cisco proprietary Downstream [Joseph_Raja]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(183,0,0,182,'propDocsWirelessUpstream','Cisco proprietary Upstream [Joseph_Raja]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(184,0,0,183,'hiperlan2','HIPERLAN Type 2 Radio Interface [Jamshid_Khun_Jush]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(185,0,0,184,'propBWAp2Mp','PropBroadbandWirelessAccesspt2Multipt\n(use of this type for IEEE 802.16\nWMAN, interfaces as per IEEE 802.16\nis deprecated and iftype 237 should\nbe used instead) [Zvika_Zilberman]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(186,0,0,185,'sonetOverheadChannel','SONET Overhead Channel [ODSI_Coalition_K_Arv]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(187,0,0,186,'digitalWrapperOverheadChannel','Digital Wrapper\nOverhead [ODSI_Coalition_K_Arv]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(188,0,0,187,'aal2','ATM adaptation layer 2 [K_Ashoka]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(189,0,0,188,'radioMAC','MAC layer over radio links [Daniele_Behar]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(190,0,0,189,'atmRadio','ATM over radio links [Daniele_Behar]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(191,0,0,190,'IMT','Inter-Machine Trunks [Sidney_Antommarchi]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(192,0,0,191,'mvl','Multiple Virtual Lines DSL [Kevin_Baughman]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(193,0,0,192,'reachDSL','Long Reach DSL [Kevin_Baughman]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(194,0,0,193,'frDlciEndPt','Frame Relay DLCI End Point [Robert_Steinberger]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(195,0,0,194,'atmVciEndPt','ATM VCI End Point [Robert_Steinberger]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(196,0,0,195,'opticalChannel','Optical Channel [Mark_Stewart]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(197,0,0,196,'opticalTransport','Optical Transport [Mark_Stewart]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(198,0,0,197,'propAtm','Proprietary ATM [Subrahmanya_Hegde]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(199,0,0,198,'voiceOverCable','Voice Over Cable Interface [Eugene_Nechamkin]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(200,0,0,199,'infiniband','Infiniband [Bill_Strahm]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(201,0,0,200,'teLink','TE Link [Martin_Dubuc]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(202,0,0,201,'q2931','Q.2931 [Sidney_Antommarchi_2]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(203,0,0,202,'virtualTg','Virtual Trunk Group [Sidney_Antommarchi_2]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(204,0,0,203,'sipTg','SIP Trunk Group [Sidney_Antommarchi_2]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(205,0,0,204,'sipSig','SIP Signaling [Sidney_Antommarchi_2]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(206,0,0,205,'docsCableUpstreamChannel','CATV Upstream Channel [Greg_Nakanishi]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(207,0,0,206,'econet','Acorn Econet [Ben_Harris]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(208,0,0,207,'pon155','FSAN 155Mb Symetrical PON interface [Graham_Higgins]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(209,0,0,208,'pon622','FSAN 622Mb Symetrical PON interface [Graham_Higgins]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(210,0,0,209,'bridge','Transparent bridge interface [Yuzo_Watanabe]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(211,0,0,210,'linegroup','Interface common to multiple lines [Yuzo_Watanabe]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(212,0,0,211,'voiceEMFGD','voice E&#38;M Feature Group D [Taher_Shaikh]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(213,0,0,212,'voiceFGDEANA','voice FGD Exchange Access North American [Taher_Shaikh]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(214,0,0,213,'voiceDID','voice Direct Inward Dialing [Taher_Shaikh]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(215,0,0,214,'mpegTransport','MPEG transport interface [Gaurav_Aggarwal]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(216,0,0,215,'sixToFour','6to4 interface  (DEPRECATED) [RFC4087]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(217,0,0,216,'gtp','GTP (GPRS Tunneling Protocol) [Rajesh_M_L]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(218,0,0,217,'pdnEtherLoop1','Paradyne EtherLoop 1 [Shu_Dong]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(219,0,0,218,'pdnEtherLoop2','Paradyne EtherLoop 2 [Shu_Dong]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(220,0,0,219,'opticalChannelGroup','Optical Channel Group [Hing_Kam_Lam]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(221,0,0,220,'homepna','HomePNA ITU-T G.989 [Stephen_Palm]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(222,0,0,221,'gfp','Generic Framing Procedure (GFP) [Italo_Busi]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(223,0,0,222,'ciscoISLvlan','Layer 2 Virtual LAN using Cisco ISL [Sandeep_Raghavendra]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(224,0,0,223,'actelisMetaLOOP','Acteleis proprietary MetaLOOP\nHigh Speed Link [Edward_Beili]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(225,0,0,224,'fcipLink','FCIP Link [Anil_Rijhsinghani]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(226,0,0,225,'rpr','Resilient Packet Ring Interface Type [IEEE 802.17]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(227,0,0,226,'qam','RF Qam Interface [Jeyachitra_Alagar]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(228,0,0,227,'lmp','Link Management Protocol [RFC4327]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(229,0,0,228,'cblVectaStar','Cambridge Broadband Networks Limited\nVectaStar [John_Naylon]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(230,0,0,229,'docsCableMCmtsDownstream','CATV Modular CMTS Downstream\nInterface [Eduardo_Cardona][\"Data-Over-Cable Service Interface Specifications:\nM-CMTS Operations Support System Interface Specification,\nCM-SP-M-OSSI-I01-050805\", DOCSIS, August 2005.][http://www.cablemodem.com/specifications][https://www.cablelabs.com/specifications/archives/docsis.html]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(231,0,0,230,'adsl2','Asymmetric Digital Subscriber Loop\nVersion 2 (DEPRECATED - REPLACED\nBY 238) [RFC4706]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(232,0,0,231,'macSecControlledIF','MACSecControlled [Paul_Congdon]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(233,0,0,232,'macSecUncontrolledIF','MACSecUncontrolled [Paul_Congdon]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(234,0,0,233,'aviciOpticalEther','Avici Optical Ethernet Aggregate [Somen_Bhattacharya]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(235,0,0,234,'atmbond','atmbond [https://www.itu.int/rec/T-REC-G.998.1-200501-I/en]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(236,0,0,235,'voiceFGDOS','voice FGD Operator Services [Lizzie_Cheung]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(237,0,0,236,'mocaVersion1','MultiMedia over Coax Alliance [Ladd_Wardani]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(238,0,0,237,'ieee80216WMAN','IEEE 802.16 WMAN interface [http://standards.ieee.org/getieee802/802.16.html]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(239,0,0,238,'adsl2plus','Asymmetric Digital Subscriber Loop\nVersion 2 -- Version 2 Plus and all\nvariants [RFC4706]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(240,0,0,239,'dvbRcsMacLayer','DVB-RCS MAC Layer [RFC5728][ETSI EN 301 790][https://web.archive.org/web/20181229131835/http://satlabs.org/pdf/SatLabs_System_Recommendations_v2.0_M&#38;C.pdf]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(241,0,0,240,'dvbTdm','DVB Satellite TDM [RFC5728][ETSI EN 300 421][ETSI EN 302 307][https://web.archive.org/web/20181229131835/http://satlabs.org/pdf/SatLabs_System_Recommendations_v2.0_M&#38;C.pdf]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(242,0,0,241,'dvbRcsTdma','DVB-RCS TDMA [RFC5728][ETSI EN 301 790][ETSI EN 300 421][https://web.archive.org/web/20181229131835/http://satlabs.org/pdf/SatLabs_System_Recommendations_v2.0_M&#38;C.pdf]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(243,0,0,242,'x86Laps','LAPS based on ITU-T X.86/Y.1323 [Orly_Nicklass][http://grouper.ieee.org/groups/802/3/ad_hoc/etholaps/public/docs/opening_report_0301.pdf]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(244,0,0,243,'wwanPP','3GPP WWAN [Gabriel_Montenegro][https://www.3gpp.org/ftp/specs/archive/23_series/23.060/23060-740.zip]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(245,0,0,244,'wwanPP2','3GPP2 WWAN [Gabriel_Montenegro][http://www.3gpp2.org/Public_html/Specs/C.S0017-005-A_v1.0_040617.pdf]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(246,0,0,245,'voiceEBS','voice P-phone EBS physical interface [Tom_Chou]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(247,0,0,246,'ifPwType','Pseudowire interface type [RFC5601]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(248,0,0,247,'ILAN','Internal LAN on a bridge per IEEE\n802.1ap [Glenn_Parsons][http://www.ieee802.org/1/files/private/ap-drafts/d3/802-1ap-D3-4.pdf]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(249,0,0,248,'PIP','Provider Instance Port on a bridge\nper IEEE 802.1ah PBB [Glenn_Parsons][http://www.ieee802.org/1/files/private/ah-drafts/d4/802-1ah-d4-2.pdf]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(250,0,0,249,'aluELP','Alcatel-Lucent Ethernet Link Protection [Xiaohua_Ma]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(251,0,0,250,'gpon','Gigabit-capable passive optical networks\n(G-PON)  as per ITU-T G.984 [Hyeri_Koh]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(252,0,0,251,'vdsl2','Very high speed digital subscriber\nline Version 2 (as per ITU-T Recommendation\nG.993.2) [Markus_Freudenberger][RFC5650]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(253,0,0,252,'capwapDot11Profile','WLAN Profile Interface [RFC5834]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(254,0,0,253,'capwapDot11Bss','WLAN BSS Interface [RFC5834]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(255,0,0,254,'capwapWtpVirtualRadio','WTP Virtual Radio Interface [RFC5833]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(256,0,0,255,'bits','bitsport [Du_Feng]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(257,0,0,256,'docsCableUpstreamRfPort','DOCSIS CATV Upstream RF\nPort [Michael_Patrick][https://www.cablelabs.com/specifications/CM-SP-EQAM-PMI-I01-081209.pdf]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(258,0,0,257,'cableDownstreamRfPort','CATV downstream RF port [Michael_Patrick]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(259,0,0,258,'vmwareVirtualNic','VMware Virtual Network Interface [Mike_MacFaden]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(260,0,0,259,'ieee802154','IEEE 802.15.4 WPAN interface [Juergen_Schoenwaelde][\"IEEE Std. 802.15.4-2006\", October 2006.]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(261,0,0,260,'otnOdu','OTN Optical Data Unit [Jim_Vance][https://www.itu.int/ITU-T/studygroups/com15/otn/OTNtutorial.pdf]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(262,0,0,261,'otnOtu','OTN Optical channel Transport Unit [Jim_Vance][https://www.itu.int/ITU-T/studygroups/com15/otn/OTNtutorial.pdf]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(263,0,0,262,'ifVfiType','VPLS Forwarding Instance Interface\nType [Manas_Pati]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(264,0,0,263,'g9981','G.998.1 bonded interface [RFC6768][RFC Errata 3591]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(265,0,0,264,'g9982','G.998.2 bonded interface [RFC6767][RFC Errata 3589]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(266,0,0,265,'g9983','G.998.3 bonded interface [RFC6766][RFC Errata 3588]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(267,0,0,266,'aluEpon (E-PON)','Ethernet Passive Optical Networks [Karel_Meijfroidt]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(268,0,0,267,'aluEponOnu','EPON Optical Network Unit [Karel_Meijfroidt]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(269,0,0,268,'aluEponPhysicalUni','EPON physical User to Network\ninterface [Karel_Meijfroidt]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(270,0,0,269,'aluEponLogicalLink','The emulation of a point-to-point\nlink over the EPON layer [Karel_Meijfroidt]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(271,0,0,270,'aluGponOnu','GPON Optical Network Unit [Karel_Meijfroidt][https://www.itu.int/rec/T-REC-G.984.2/en]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(272,0,0,271,'aluGponPhysicalUni','GPON physical User to Network\ninterface [Karel_Meijfroidt][https://www.itu.int/rec/T-REC-G.984.2/en]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(273,0,0,272,'vmwareNicTeam','VMware NIC Team [Michael_MacFaden][https://www.vmware.com/pdf/esx2_NIC_Teaming.pdf]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(274,0,0,273,'Reserved','The corresponding transmission value\nis allocated according to the following\nreference. [RFC6825]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(275,0,0,274,'Reserved','The corresponding transmission value\nis allocated according to the following reference. [RFC7257]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(276,0,0,275,'Reserved','The corresponding transmission value\nis allocated according to the following reference. [RFC7257]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(277,0,0,276,'Reserved','The corresponding transmission value\nis allocated according to the following reference. [RFC7257]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(278,0,0,277,'docsOfdmDownstream','CATV Downstream OFDM interface [https://www.cablelabs.com/specification/cable-modem-operations-support-system-interface-specification][Miguel_O_Alvarez]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(279,0,0,278,'docsOfdmaUpstream','CATV Upstream OFDMA interface [https://www.cablelabs.com/specification/cable-modem-operations-support-system-interface-specification][Miguel_O_Alvarez]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(280,0,0,279,'gfast','G.fast port [ITU-T G.9701]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(281,0,0,280,'sdci','SDCI (IO-Link) [IEC 61131-9 Edition 1.0 2013-09][Markus_Rentschler]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(282,0,0,281,'xboxWireless','Xbox wireless [Brandon_Jiang]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(283,0,0,282,'fastdsl','FastDSL [BBF TR-355][Broadband_Forum]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(284,0,0,283,'docsCableScte55d1FwdOob','Cable SCTE 55-1 OOB Forward Channel [https://www.scte.org/documents/pdf/Standards/ANSI_SCTE-55-1-2009.pdf][Brian_Hedstrom]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(285,0,0,284,'docsCableScte55d1RetOob','Cable SCTE 55-1 OOB Return Channel [https://www.scte.org/documents/pdf/Standards/ANSI_SCTE-55-1-2009.pdf][Brian_Hedstrom]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(286,0,0,285,'docsCableScte55d2DsOob','Cable SCTE 55-2 OOB Downstream Channel [https://web.archive.org/web/20190822104256/http://www.scte.org/documents/pdf/Standards/ANSI_SCTE%2055-2%202008.pdf][Brian_Hedstrom]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(287,0,0,286,'docsCableScte55d2UsOob','Cable SCTE 55-2 OOB Upstream Channel [https://web.archive.org/web/20190822104256/http://www.scte.org/documents/pdf/Standards/ANSI_SCTE%2055-2%202008.pdf][Brian_Hedstrom]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(288,0,0,287,'docsCableNdf','Cable Narrowband Digital Forward [http://www.cablelabs.com/wp-content/uploads/specdocs/CM-SP-R-OOB-I04-160923.pdf][Brian_Hedstrom]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(289,0,0,288,'docsCableNdr','Cable Narrowband Digital Return [http://www.cablelabs.com/wp-content/uploads/specdocs/CM-SP-R-OOB-I04-160923.pdf][Brian_Hedstrom]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(290,0,0,289,'ptm','Packet Transfer Mode [ITU-T G.993.1, Annex H][ITU-T G.993.2][ITU-T G.9701][Broadband_Forum]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(291,0,0,290,'ghn','G.hn port [ITU-T G.9961][Broadband_Forum]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(292,0,0,291,'otnOtsi','Optical Tributary Signal [ITU-T G.959.1][Koteswara_Boyapati]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(293,0,0,292,'otnOtuc','OTN OTUCn [ITU-T G.709/Y.1331][Koteswara_Boyapati]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(294,0,0,293,'otnOduc','OTN ODUC [ITU-T G.709][Koteswara_Boyapati]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(295,0,0,294,'otnOtsig','OTN OTUC Signal [ITU-T G.709][Koteswara_Boyapati]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(296,0,0,295,'microwaveCarrierTermination','air interface of a single microwave carrier [RFC8561]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(297,0,0,296,'microwaveRadioLinkTerminal','radio link interface for one or several aggregated microwave carriers [RFC8561]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(298,0,0,297,'ieee8021axDrni','IEEE 802.1AX Distributed Resilient Network Interface [IEEE 802.1AX-Rev-d2-0][John_Messenger]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(299,0,0,298,'ax25','AX.25 network interfaces [AX.25 Link Access Protocol for Amateur Packet Radio version 2.2][Iain_Learmonth]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(300,0,0,299,'ieee19061nanocom','Nanoscale and Molecular Communication [IEEE 1906.1-2015][Stephen_F_Bush]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(301,0,0,300,'cpri','Common Public Radio Interface [CPRI v7.0][Renwang_Liu]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(302,0,0,301,'omni','Overlay Multilink Network Interface (OMNI) [draft-templin-6man-omni-00][Fred_L_Templin]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(303,0,0,302,'roe','Radio over Ethernet Interface [1914.3-2018 - IEEE Standard for Radio over Ethernet Encapsulations and Mappings][Renwang_Liu]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34'),
(304,0,0,303,'p2pOverLan','Point to Point over LAN interface [RFC9296]',0,NULL,'2024-11-19 10:17:34','2024-11-19 10:17:34');
/*!40000 ALTER TABLE `glpi_networkporttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networkportwifis`
--

DROP TABLE IF EXISTS `glpi_networkportwifis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networkportwifis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `networkports_id` int(10) unsigned NOT NULL DEFAULT 0,
  `items_devicenetworkcards_id` int(10) unsigned NOT NULL DEFAULT 0,
  `wifinetworks_id` int(10) unsigned NOT NULL DEFAULT 0,
  `networkportwifis_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'only useful in case of Managed node',
  `version` varchar(20) DEFAULT NULL COMMENT 'a, a/b, a/b/g, a/b/g/n, a/b/g/n/y',
  `mode` varchar(20) DEFAULT NULL COMMENT 'ad-hoc, managed, master, repeater, secondary, monitor, auto',
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `networkports_id` (`networkports_id`),
  KEY `card` (`items_devicenetworkcards_id`),
  KEY `essid` (`wifinetworks_id`),
  KEY `version` (`version`),
  KEY `mode` (`mode`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `networkportwifis_id` (`networkportwifis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networkportwifis`
--

LOCK TABLES `glpi_networkportwifis` WRITE;
/*!40000 ALTER TABLE `glpi_networkportwifis` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networkportwifis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_networks`
--

DROP TABLE IF EXISTS `glpi_networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_networks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_networks`
--

LOCK TABLES `glpi_networks` WRITE;
/*!40000 ALTER TABLE `glpi_networks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_notepads`
--

DROP TABLE IF EXISTS `glpi_notepads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_notepads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_lastupdater` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_notepads`
--

LOCK TABLES `glpi_notepads` WRITE;
/*!40000 ALTER TABLE `glpi_notepads` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_notepads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_notifications`
--

DROP TABLE IF EXISTS `glpi_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `event` varchar(255) NOT NULL,
  `comment` text DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `allow_response` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `itemtype` (`itemtype`),
  KEY `entities_id` (`entities_id`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_notifications`
--

LOCK TABLES `glpi_notifications` WRITE;
/*!40000 ALTER TABLE `glpi_notifications` DISABLE KEYS */;
INSERT INTO `glpi_notifications` VALUES
(1,'Alert Tickets not closed',0,'Ticket','alertnotclosed',NULL,1,1,NULL,NULL,1),
(2,'New Ticket',0,'Ticket','new',NULL,1,1,NULL,NULL,1),
(3,'Update Ticket',0,'Ticket','update',NULL,1,0,NULL,NULL,1),
(4,'Close Ticket',0,'Ticket','closed',NULL,1,1,NULL,NULL,1),
(5,'Add Followup',0,'Ticket','add_followup',NULL,1,1,NULL,NULL,1),
(6,'Add Task',0,'Ticket','add_task',NULL,1,1,NULL,NULL,1),
(7,'Update Followup',0,'Ticket','update_followup',NULL,1,1,NULL,NULL,1),
(8,'Update Task',0,'Ticket','update_task',NULL,1,1,NULL,NULL,1),
(9,'Delete Followup',0,'Ticket','delete_followup',NULL,1,1,NULL,NULL,1),
(10,'Delete Task',0,'Ticket','delete_task',NULL,1,1,NULL,NULL,1),
(11,'Resolve ticket',0,'Ticket','solved',NULL,1,1,NULL,NULL,1),
(12,'Ticket Validation',0,'Ticket','validation',NULL,1,1,NULL,NULL,1),
(13,'New Reservation',0,'Reservation','new',NULL,1,1,NULL,NULL,1),
(14,'Update Reservation',0,'Reservation','update',NULL,1,1,NULL,NULL,1),
(15,'Delete Reservation',0,'Reservation','delete',NULL,1,1,NULL,NULL,1),
(16,'Alert Reservation',0,'Reservation','alert',NULL,1,1,NULL,NULL,1),
(17,'Contract Notice',0,'Contract','notice',NULL,1,1,NULL,NULL,1),
(18,'Contract End',0,'Contract','end',NULL,1,1,NULL,NULL,1),
(19,'MySQL Synchronization',0,'DBConnection','desynchronization',NULL,1,1,NULL,NULL,1),
(20,'Cartridges',0,'CartridgeItem','alert',NULL,1,1,NULL,NULL,1),
(21,'Consumables',0,'ConsumableItem','alert',NULL,1,1,NULL,NULL,1),
(22,'Infocoms',0,'Infocom','alert',NULL,1,1,NULL,NULL,1),
(23,'Software Licenses',0,'SoftwareLicense','alert',NULL,1,1,NULL,NULL,1),
(24,'Ticket Recall',0,'Ticket','recall',NULL,1,1,NULL,NULL,1),
(25,'Password Forget',0,'User','passwordforget',NULL,1,1,NULL,NULL,1),
(26,'Ticket Satisfaction',0,'Ticket','satisfaction',NULL,1,1,NULL,NULL,1),
(27,'Item not unique',0,'FieldUnicity','refuse',NULL,1,1,NULL,NULL,1),
(28,'CronTask Watcher',0,'CronTask','alert',NULL,1,1,NULL,NULL,1),
(29,'New Problem',0,'Problem','new',NULL,1,1,NULL,NULL,1),
(30,'Update Problem',0,'Problem','update',NULL,1,1,NULL,NULL,1),
(31,'Resolve Problem',0,'Problem','solved',NULL,1,1,NULL,NULL,1),
(32,'Add Task',0,'Problem','add_task',NULL,1,1,NULL,NULL,1),
(33,'Update Task',0,'Problem','update_task',NULL,1,1,NULL,NULL,1),
(34,'Delete Task',0,'Problem','delete_task',NULL,1,1,NULL,NULL,1),
(35,'Close Problem',0,'Problem','closed',NULL,1,1,NULL,NULL,1),
(36,'Delete Problem',0,'Problem','delete',NULL,1,1,NULL,NULL,1),
(37,'Ticket Validation Answer',0,'Ticket','validation_answer',NULL,1,1,NULL,NULL,1),
(38,'Contract End Periodicity',0,'Contract','periodicity',NULL,1,1,NULL,NULL,1),
(39,'Contract Notice Periodicity',0,'Contract','periodicitynotice',NULL,1,1,NULL,NULL,1),
(40,'Planning recall',0,'PlanningRecall','planningrecall',NULL,1,1,NULL,NULL,1),
(41,'Delete Ticket',0,'Ticket','delete',NULL,1,1,NULL,NULL,1),
(42,'New Change',0,'Change','new',NULL,1,1,NULL,NULL,1),
(43,'Update Change',0,'Change','update',NULL,1,1,NULL,NULL,1),
(44,'Resolve Change',0,'Change','solved',NULL,1,1,NULL,NULL,1),
(45,'Add Task',0,'Change','add_task',NULL,1,1,NULL,NULL,1),
(46,'Update Task',0,'Change','update_task',NULL,1,1,NULL,NULL,1),
(47,'Delete Task',0,'Change','delete_task',NULL,1,1,NULL,NULL,1),
(48,'Close Change',0,'Change','closed',NULL,1,1,NULL,NULL,1),
(49,'Delete Change',0,'Change','delete',NULL,1,1,NULL,NULL,1),
(50,'Ticket Satisfaction Answer',0,'Ticket','replysatisfaction',NULL,1,1,NULL,NULL,1),
(51,'Receiver errors',0,'MailCollector','error',NULL,1,1,NULL,NULL,1),
(52,'New Project',0,'Project','new',NULL,1,1,NULL,NULL,1),
(53,'Update Project',0,'Project','update',NULL,1,1,NULL,NULL,1),
(54,'Delete Project',0,'Project','delete',NULL,1,1,NULL,NULL,1),
(55,'New Project Task',0,'ProjectTask','new',NULL,1,1,NULL,NULL,1),
(56,'Update Project Task',0,'ProjectTask','update',NULL,1,1,NULL,NULL,1),
(57,'Delete Project Task',0,'ProjectTask','delete',NULL,1,1,NULL,NULL,1),
(58,'Request Unlock Items',0,'ObjectLock','unlock',NULL,1,1,NULL,NULL,1),
(59,'New user in requesters',0,'Ticket','requester_user',NULL,1,1,NULL,NULL,1),
(60,'New group in requesters',0,'Ticket','requester_group',NULL,1,1,NULL,NULL,1),
(61,'New user in observers',0,'Ticket','observer_user',NULL,1,1,NULL,NULL,1),
(62,'New group in observers',0,'Ticket','observer_group',NULL,1,1,NULL,NULL,1),
(63,'New user in assignees',0,'Ticket','assign_user',NULL,1,1,NULL,NULL,1),
(64,'New group in assignees',0,'Ticket','assign_group',NULL,1,1,NULL,NULL,1),
(65,'New supplier in assignees',0,'Ticket','assign_supplier',NULL,1,1,NULL,NULL,1),
(66,'Saved searches',0,'SavedSearch_Alert','alert',NULL,1,1,NULL,NULL,1),
(67,'Certificates',0,'Certificate','alert',NULL,1,1,NULL,NULL,1),
(68,'Alert expired domains',0,'Domain','ExpiredDomains',NULL,1,1,NULL,NULL,1),
(69,'Alert domains close expiries',0,'Domain','DomainsWhichExpire',NULL,1,1,NULL,NULL,1),
(70,'Password expires alert',0,'User','passwordexpires',NULL,1,1,NULL,NULL,1),
(71,'Check plugin updates',0,'Glpi\\Marketplace\\Controller','checkpluginsupdate',NULL,1,1,NULL,NULL,1),
(72,'New user mentioned',0,'Ticket','user_mention',NULL,1,1,NULL,NULL,1);
/*!40000 ALTER TABLE `glpi_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_notifications_notificationtemplates`
--

DROP TABLE IF EXISTS `glpi_notifications_notificationtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_notifications_notificationtemplates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notifications_id` int(10) unsigned NOT NULL DEFAULT 0,
  `mode` varchar(20) NOT NULL COMMENT 'See Notification_NotificationTemplate::MODE_* constants',
  `notificationtemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`notifications_id`,`mode`,`notificationtemplates_id`),
  KEY `notificationtemplates_id` (`notificationtemplates_id`),
  KEY `mode` (`mode`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_notifications_notificationtemplates`
--

LOCK TABLES `glpi_notifications_notificationtemplates` WRITE;
/*!40000 ALTER TABLE `glpi_notifications_notificationtemplates` DISABLE KEYS */;
INSERT INTO `glpi_notifications_notificationtemplates` VALUES
(1,1,'mailing',6),
(2,2,'mailing',4),
(3,3,'mailing',4),
(4,4,'mailing',4),
(5,5,'mailing',4),
(6,6,'mailing',4),
(7,7,'mailing',4),
(8,8,'mailing',4),
(9,9,'mailing',4),
(10,10,'mailing',4),
(11,11,'mailing',4),
(12,12,'mailing',7),
(13,13,'mailing',2),
(14,14,'mailing',2),
(15,15,'mailing',2),
(16,16,'mailing',3),
(17,17,'mailing',12),
(18,18,'mailing',12),
(19,19,'mailing',1),
(20,20,'mailing',8),
(21,21,'mailing',9),
(22,22,'mailing',10),
(23,23,'mailing',11),
(24,24,'mailing',4),
(25,25,'mailing',13),
(26,26,'mailing',14),
(27,27,'mailing',15),
(28,28,'mailing',16),
(29,29,'mailing',17),
(30,30,'mailing',17),
(31,31,'mailing',17),
(32,32,'mailing',17),
(33,33,'mailing',17),
(34,34,'mailing',17),
(35,35,'mailing',17),
(36,36,'mailing',17),
(37,37,'mailing',7),
(38,38,'mailing',12),
(39,39,'mailing',12),
(40,40,'mailing',18),
(41,41,'mailing',4),
(42,42,'mailing',19),
(43,43,'mailing',19),
(44,44,'mailing',19),
(45,45,'mailing',19),
(46,46,'mailing',19),
(47,47,'mailing',19),
(48,48,'mailing',19),
(49,49,'mailing',19),
(50,50,'mailing',14),
(51,51,'mailing',20),
(52,52,'mailing',21),
(53,53,'mailing',21),
(54,54,'mailing',21),
(55,55,'mailing',22),
(56,56,'mailing',22),
(57,57,'mailing',22),
(58,58,'mailing',23),
(59,59,'mailing',4),
(60,60,'mailing',4),
(61,61,'mailing',4),
(62,62,'mailing',4),
(63,63,'mailing',4),
(64,64,'mailing',4),
(65,65,'mailing',4),
(66,66,'mailing',24),
(67,67,'mailing',25),
(68,68,'mailing',26),
(69,69,'mailing',26),
(70,70,'mailing',27),
(71,71,'mailing',28),
(72,72,'mailing',4);
/*!40000 ALTER TABLE `glpi_notifications_notificationtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_notificationtargets`
--

DROP TABLE IF EXISTS `glpi_notificationtargets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_notificationtargets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `notifications_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `items` (`type`,`items_id`),
  KEY `notifications_id` (`notifications_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_notificationtargets`
--

LOCK TABLES `glpi_notificationtargets` WRITE;
/*!40000 ALTER TABLE `glpi_notificationtargets` DISABLE KEYS */;
INSERT INTO `glpi_notificationtargets` VALUES
(1,3,1,13),
(2,1,1,13),
(3,3,2,2),
(4,1,1,2),
(5,1,1,3),
(6,1,1,5),
(7,1,1,4),
(8,2,1,3),
(9,4,1,3),
(10,3,1,2),
(11,3,1,3),
(12,3,1,5),
(13,3,1,4),
(14,1,1,19),
(15,14,1,12),
(16,3,1,14),
(17,1,1,14),
(18,3,1,15),
(19,1,1,15),
(20,1,1,6),
(21,3,1,6),
(22,1,1,7),
(23,3,1,7),
(24,1,1,8),
(25,3,1,8),
(26,1,1,9),
(27,3,1,9),
(28,1,1,10),
(29,3,1,10),
(30,1,1,11),
(31,3,1,11),
(32,19,1,25),
(33,3,1,26),
(34,21,1,2),
(35,21,1,3),
(36,21,1,5),
(37,21,1,4),
(38,21,1,6),
(39,21,1,7),
(40,21,1,8),
(41,21,1,9),
(42,21,1,10),
(43,21,1,11),
(46,1,1,28),
(47,3,1,29),
(48,1,1,29),
(49,21,1,29),
(50,2,1,30),
(51,4,1,30),
(52,3,1,30),
(53,1,1,30),
(54,21,1,30),
(55,3,1,31),
(56,1,1,31),
(57,21,1,31),
(58,3,1,32),
(59,1,1,32),
(60,21,1,32),
(61,3,1,33),
(62,1,1,33),
(63,21,1,33),
(64,3,1,34),
(65,1,1,34),
(66,21,1,34),
(67,3,1,35),
(68,1,1,35),
(69,21,1,35),
(70,3,1,36),
(71,1,1,36),
(72,21,1,36),
(73,14,1,37),
(74,3,1,40),
(75,1,1,41),
(76,3,1,42),
(77,1,1,42),
(78,21,1,42),
(79,2,1,43),
(80,4,1,43),
(81,3,1,43),
(82,1,1,43),
(83,21,1,43),
(84,3,1,44),
(85,1,1,44),
(86,21,1,44),
(87,3,1,45),
(88,1,1,45),
(89,21,1,45),
(90,3,1,46),
(91,1,1,46),
(92,21,1,46),
(93,3,1,47),
(94,1,1,47),
(95,21,1,47),
(96,3,1,48),
(97,1,1,48),
(98,21,1,48),
(99,3,1,49),
(100,1,1,49),
(101,21,1,49),
(102,3,1,50),
(103,2,1,50),
(104,1,1,51),
(105,27,1,52),
(106,1,1,52),
(107,28,1,52),
(108,27,1,53),
(109,1,1,53),
(110,28,1,53),
(111,27,1,54),
(112,1,1,54),
(113,28,1,54),
(114,31,1,55),
(115,1,1,55),
(116,32,1,55),
(117,31,1,56),
(118,1,1,56),
(119,32,1,56),
(120,31,1,57),
(121,1,1,57),
(122,32,1,57),
(123,19,1,58),
(124,3,1,59),
(125,13,1,60),
(126,21,1,61),
(127,20,1,62),
(128,2,1,63),
(129,9,1,64),
(130,8,1,65),
(131,19,1,66),
(132,5,1,67),
(133,23,1,67),
(134,5,1,68),
(135,23,1,68),
(136,5,1,69),
(137,23,1,69),
(138,19,1,70),
(139,1,1,71),
(140,39,1,72);
/*!40000 ALTER TABLE `glpi_notificationtargets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_notificationtemplates`
--

DROP TABLE IF EXISTS `glpi_notificationtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_notificationtemplates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `itemtype` varchar(100) NOT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `css` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `itemtype` (`itemtype`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_notificationtemplates`
--

LOCK TABLES `glpi_notificationtemplates` WRITE;
/*!40000 ALTER TABLE `glpi_notificationtemplates` DISABLE KEYS */;
INSERT INTO `glpi_notificationtemplates` VALUES
(1,'MySQL Synchronization','DBConnection',NULL,NULL,NULL,NULL),
(2,'Reservations','Reservation',NULL,NULL,NULL,NULL),
(3,'Alert Reservation','Reservation',NULL,NULL,NULL,NULL),
(4,'Tickets','Ticket',NULL,NULL,NULL,NULL),
(5,'Tickets (Simple)','Ticket',NULL,NULL,NULL,NULL),
(6,'Alert Tickets not closed','Ticket',NULL,NULL,NULL,NULL),
(7,'Tickets Validation','Ticket',NULL,NULL,NULL,NULL),
(8,'Cartridges','CartridgeItem',NULL,NULL,NULL,NULL),
(9,'Consumables','ConsumableItem',NULL,NULL,NULL,NULL),
(10,'Infocoms','Infocom',NULL,NULL,NULL,NULL),
(11,'Licenses','SoftwareLicense',NULL,NULL,NULL,NULL),
(12,'Contracts','Contract',NULL,NULL,NULL,NULL),
(13,'Password Forget','User',NULL,NULL,NULL,NULL),
(14,'Ticket Satisfaction','Ticket',NULL,NULL,NULL,NULL),
(15,'Item not unique','FieldUnicity',NULL,NULL,NULL,NULL),
(16,'CronTask','CronTask',NULL,NULL,NULL,NULL),
(17,'Problems','Problem',NULL,NULL,NULL,NULL),
(18,'Planning recall','PlanningRecall',NULL,NULL,NULL,NULL),
(19,'Changes','Change',NULL,NULL,NULL,NULL),
(20,'Receiver errors','MailCollector',NULL,NULL,NULL,NULL),
(21,'Projects','Project',NULL,NULL,NULL,NULL),
(22,'Project Tasks','ProjectTask',NULL,NULL,NULL,NULL),
(23,'Unlock Item request','ObjectLock',NULL,NULL,NULL,NULL),
(24,'Saved searches alerts','SavedSearch_Alert',NULL,NULL,NULL,NULL),
(25,'Certificates','Certificate',NULL,NULL,NULL,NULL),
(26,'Alert domains','Domain',NULL,NULL,NULL,NULL),
(27,'Password expires alert','User',NULL,NULL,NULL,NULL),
(28,'Plugin updates','Glpi\\Marketplace\\Controller',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_notificationtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_notificationtemplatetranslations`
--

DROP TABLE IF EXISTS `glpi_notificationtemplatetranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_notificationtemplatetranslations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notificationtemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `language` varchar(10) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL,
  `content_text` text DEFAULT NULL,
  `content_html` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notificationtemplates_id` (`notificationtemplates_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_notificationtemplatetranslations`
--

LOCK TABLES `glpi_notificationtemplatetranslations` WRITE;
/*!40000 ALTER TABLE `glpi_notificationtemplatetranslations` DISABLE KEYS */;
INSERT INTO `glpi_notificationtemplatetranslations` VALUES
(1,1,'','##lang.dbconnection.title##','##lang.dbconnection.delay## : ##dbconnection.delay##','&lt;p&gt;##lang.dbconnection.delay## : ##dbconnection.delay##&lt;/p&gt;'),
(2,2,'','##reservation.action##','======================================================================\n##lang.reservation.user##: ##reservation.user##\n##lang.reservation.item.name##: ##reservation.itemtype## - ##reservation.item.name##\n##IFreservation.tech## ##lang.reservation.tech## ##reservation.tech## ##ENDIFreservation.tech##\n##lang.reservation.begin##: ##reservation.begin##\n##lang.reservation.end##: ##reservation.end##\n##lang.reservation.comment##: ##reservation.comment##\n======================================================================','&lt;!-- description{ color: inherit; background: #ebebeb;border-style: solid;border-color: #8d8d8d; border-width: 0px 1px 1px 0px; } --&gt;\n&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.user##:&lt;/span&gt;##reservation.user##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.item.name##:&lt;/span&gt;##reservation.itemtype## - ##reservation.item.name##&lt;br /&gt;##IFreservation.tech## ##lang.reservation.tech## ##reservation.tech####ENDIFreservation.tech##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.begin##:&lt;/span&gt; ##reservation.begin##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.end##:&lt;/span&gt;##reservation.end##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.reservation.comment##:&lt;/span&gt; ##reservation.comment##&lt;/p&gt;'),
(3,3,'','##reservation.action##  ##reservation.entity##','##lang.reservation.entity## : ##reservation.entity##\n\n\n##FOREACHreservations##\n##lang.reservation.itemtype## : ##reservation.itemtype##\n\n ##lang.reservation.item## : ##reservation.item##\n\n ##reservation.url##\n\n ##ENDFOREACHreservations##','&lt;p&gt;##lang.reservation.entity## : ##reservation.entity## &lt;br /&gt; &lt;br /&gt;\n##FOREACHreservations## &lt;br /&gt;##lang.reservation.itemtype## :  ##reservation.itemtype##&lt;br /&gt;\n ##lang.reservation.item## :  ##reservation.item##&lt;br /&gt; &lt;br /&gt;\n &lt;a href=\"##reservation.url##\"&gt; ##reservation.url##&lt;/a&gt;&lt;br /&gt;\n ##ENDFOREACHreservations##&lt;/p&gt;'),
(4,4,'','##ticket.action## ##ticket.title##',' ##IFticket.storestatus=5##\n ##lang.ticket.url## : ##ticket.urlapprove##\n ##lang.ticket.autoclosewarning##\n ##lang.ticket.solvedate## : ##ticket.solvedate##\n ##lang.ticket.solution.type## : ##ticket.solution.type##\n ##lang.ticket.solution.description## : ##ticket.solution.description## ##ENDIFticket.storestatus##\n ##ELSEticket.storestatus## ##lang.ticket.url## : ##ticket.url## ##ENDELSEticket.storestatus##\n\n ##lang.ticket.description##\n\n ##lang.ticket.title## : ##ticket.title##\n ##lang.ticket.authors## : ##IFticket.authors## ##ticket.authors## ##ENDIFticket.authors## ##ELSEticket.authors##--##ENDELSEticket.authors##\n ##lang.ticket.creationdate## : ##ticket.creationdate##\n ##lang.ticket.closedate## : ##ticket.closedate##\n ##lang.ticket.requesttype## : ##ticket.requesttype##\n##lang.ticket.item.name## :\n\n##FOREACHitems##\n\n ##IFticket.itemtype##\n  ##ticket.itemtype## - ##ticket.item.name##\n  ##IFticket.item.model## ##lang.ticket.item.model## : ##ticket.item.model## ##ENDIFticket.item.model##\n  ##IFticket.item.serial## ##lang.ticket.item.serial## : ##ticket.item.serial## ##ENDIFticket.item.serial##\n  ##IFticket.item.otherserial## ##lang.ticket.item.otherserial## : ##ticket.item.otherserial## ##ENDIFticket.item.otherserial##\n ##ENDIFticket.itemtype##\n\n##ENDFOREACHitems##\n##IFticket.assigntousers## ##lang.ticket.assigntousers## : ##ticket.assigntousers## ##ENDIFticket.assigntousers##\n ##lang.ticket.status## : ##ticket.status##\n##IFticket.assigntogroups## ##lang.ticket.assigntogroups## : ##ticket.assigntogroups## ##ENDIFticket.assigntogroups##\n ##lang.ticket.urgency## : ##ticket.urgency##\n ##lang.ticket.impact## : ##ticket.impact##\n ##lang.ticket.priority## : ##ticket.priority##\n##IFticket.user.email## ##lang.ticket.user.email## : ##ticket.user.email ##ENDIFticket.user.email##\n##IFticket.category## ##lang.ticket.category## : ##ticket.category## ##ENDIFticket.category## ##ELSEticket.category## ##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##\n ##lang.ticket.content## : ##ticket.content##\n ##IFticket.storestatus=6##\n\n ##lang.ticket.solvedate## : ##ticket.solvedate##\n ##lang.ticket.solution.type## : ##ticket.solution.type##\n ##lang.ticket.solution.description## : ##ticket.solution.description##\n ##ENDIFticket.storestatus##\n\n##FOREACHtimelineitems##\n[##timelineitems.date##]\n##lang.timelineitems.author## ##timelineitems.author##\n##lang.timelineitems.description## ##timelineitems.description##\n##lang.timelineitems.date## ##timelineitems.date##\n##lang.timelineitems.position## ##timelineitems.position##\n##lang.timelineitems.type## ##timelineitems.type##\n##lang.timelineitems.typename## ##timelineitems.typename##\n##ENDFOREACHtimelineitems##\n\n##lang.ticket.numberoffollowups## : ##ticket.numberoffollowups##\n##lang.ticket.numberoftasks## : ##ticket.numberoftasks##','&lt;!-- description{ color: inherit; background: #ebebeb; border-style: solid;border-color: #8d8d8d; border-width: 0px 1px 1px 0px; }    --&gt;\n&lt;div&gt;##IFticket.storestatus=5##&lt;/div&gt;\n&lt;div&gt;##lang.ticket.url## : &lt;a href=\"##ticket.urlapprove##\"&gt;##ticket.urlapprove##&lt;/a&gt; &lt;strong&gt;&#160;&lt;/strong&gt;&lt;/div&gt;\n&lt;div&gt;&lt;strong&gt;##lang.ticket.autoclosewarning##&lt;/strong&gt;&lt;/div&gt;\n&lt;div&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.ticket.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##ticket.solvedate##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.ticket.solution.type##&lt;/strong&gt;&lt;/span&gt; : ##ticket.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.ticket.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##ticket.solution.description## ##ENDIFticket.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEticket.storestatus## ##lang.ticket.url## : &lt;a href=\"##ticket.url##\"&gt;##ticket.url##&lt;/a&gt; ##ENDELSEticket.storestatus##&lt;/div&gt;\n&lt;p class=\"description b\"&gt;&lt;strong&gt;##lang.ticket.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.title##&lt;/span&gt;&#160;:##ticket.title## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.authors##&lt;/span&gt;&#160;:##IFticket.authors## ##ticket.authors## ##ENDIFticket.authors##    ##ELSEticket.authors##--##ENDELSEticket.authors## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.creationdate##&lt;/span&gt;&#160;:##ticket.creationdate## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.closedate##&lt;/span&gt;&#160;:##ticket.closedate## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.requesttype##&lt;/span&gt;&#160;:##ticket.requesttype##&lt;br /&gt;\n&lt;br /&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.item.name##&lt;/span&gt;&#160;:\n&lt;p&gt;##FOREACHitems##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##IFticket.itemtype## ##ticket.itemtype##&#160;- ##ticket.item.name## ##IFticket.item.model## ##lang.ticket.item.model## : ##ticket.item.model## ##ENDIFticket.item.model## ##IFticket.item.serial## ##lang.ticket.item.serial## : ##ticket.item.serial## ##ENDIFticket.item.serial## ##IFticket.item.otherserial## ##lang.ticket.item.otherserial## : ##ticket.item.otherserial## ##ENDIFticket.item.otherserial## ##ENDIFticket.itemtype## &lt;/div&gt;&lt;br /&gt;\n&lt;p&gt;##ENDFOREACHitems##&lt;/p&gt;\n##IFticket.assigntousers## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.assigntousers##&lt;/span&gt;&#160;: ##ticket.assigntousers## ##ENDIFticket.assigntousers##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.ticket.status## &lt;/span&gt;&#160;: ##ticket.status##&lt;br /&gt; ##IFticket.assigntogroups## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.assigntogroups##&lt;/span&gt;&#160;: ##ticket.assigntogroups## ##ENDIFticket.assigntogroups##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.urgency##&lt;/span&gt;&#160;: ##ticket.urgency##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.impact##&lt;/span&gt;&#160;: ##ticket.impact##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.priority##&lt;/span&gt;&#160;: ##ticket.priority## &lt;br /&gt; ##IFticket.user.email##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.user.email##&lt;/span&gt;&#160;: ##ticket.user.email ##ENDIFticket.user.email##    &lt;br /&gt; ##IFticket.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.ticket.category## &lt;/span&gt;&#160;:##ticket.category## ##ENDIFticket.category## ##ELSEticket.category## ##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##    &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.ticket.content##&lt;/span&gt;&#160;: ##ticket.content##&lt;/p&gt;\n&lt;br /&gt;##IFticket.storestatus=6##&lt;br /&gt;&lt;span style=\"text-decoration: underline;\"&gt;&lt;strong&gt;&lt;span style=\"color: #888888;\"&gt;##lang.ticket.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##ticket.solvedate##&lt;br /&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.ticket.solution.type##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##ticket.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.ticket.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##ticket.solution.description##&lt;br /&gt;##ENDIFticket.storestatus##&lt;/p&gt;\n&lt;p&gt;##FOREACHtimelineitems##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;br /&gt;&lt;strong&gt; [##timelineitems.date##]&lt;/strong&gt;&lt;br /&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.timelineitems.author## &lt;/span&gt; &lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt;##timelineitems.author##&lt;/span&gt;&lt;br /&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.timelineitems.description## &lt;/span&gt; &lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt;##timelineitems.description##&lt;/span&gt;&lt;br /&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.timelineitems.date## &lt;/span&gt; &lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt;##timelineitems.date##&lt;/span&gt;&lt;br /&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.timelineitems.position## &lt;/span&gt;&lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt; ##timelineitems.position##&lt;/span&gt;&lt;/div&gt;\n&lt;div class=\"description b\"&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.timelineitems.type## &lt;/span&gt;&lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt; ##timelineitems.type##&lt;/span&gt;&lt;/div&gt;\n&lt;div class=\"description b\"&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.timelineitems.typename## &lt;/span&gt; &lt;span style=\"color: #000000; font-weight: bold; text-decoration: underline;\"&gt;##timelineitems.typename##&lt;/span&gt;&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtimelineitems##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.ticket.numberoffollowups##&#160;: ##ticket.numberoffollowups##&lt;/div&gt;\n&lt;div class=\"description b\"&gt;##lang.ticket.numberoftasks##&#160;: ##ticket.numberoftasks##&lt;/div&gt;'),
(5,12,'','##contract.action##  ##contract.entity##','##lang.contract.entity## : ##contract.entity##\n\n##FOREACHcontracts##\n##lang.contract.name## : ##contract.name##\n##lang.contract.number## : ##contract.number##\n##lang.contract.time## : ##contract.time##\n##IFcontract.type####lang.contract.type## : ##contract.type####ENDIFcontract.type##\n##contract.url##\n##ENDFOREACHcontracts##','&lt;p&gt;##lang.contract.entity## : ##contract.entity##&lt;br /&gt;\n&lt;br /&gt;##FOREACHcontracts##&lt;br /&gt;##lang.contract.name## :\n##contract.name##&lt;br /&gt;\n##lang.contract.number## : ##contract.number##&lt;br /&gt;\n##lang.contract.time## : ##contract.time##&lt;br /&gt;\n##IFcontract.type####lang.contract.type## : ##contract.type##\n##ENDIFcontract.type##&lt;br /&gt;\n&lt;a href=\"##contract.url##\"&gt;\n##contract.url##&lt;/a&gt;&lt;br /&gt;\n##ENDFOREACHcontracts##&lt;/p&gt;'),
(6,5,'','##ticket.action## ##ticket.title##','##lang.ticket.url## : ##ticket.url##\n\n##lang.ticket.description##\n\n\n##lang.ticket.title##  :##ticket.title##\n\n##lang.ticket.authors##  :##IFticket.authors##\n##ticket.authors## ##ENDIFticket.authors##\n##ELSEticket.authors##--##ENDELSEticket.authors##\n\n##IFticket.category## ##lang.ticket.category##  :##ticket.category##\n##ENDIFticket.category## ##ELSEticket.category##\n##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##\n\n##lang.ticket.content##  : ##ticket.content##\n##IFticket.itemtype##\n##lang.ticket.item.name##  : ##ticket.itemtype## - ##ticket.item.name##\n##ENDIFticket.itemtype##','&lt;div&gt;##lang.ticket.url## : &lt;a href=\"##ticket.url##\"&gt;\n##ticket.url##&lt;/a&gt;&lt;/div&gt;\n&lt;div class=\"description b\"&gt;\n##lang.ticket.description##&lt;/div&gt;\n&lt;p&gt;&lt;span\nstyle=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.title##&lt;/span&gt;&#160;:##ticket.title##\n&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.authors##&lt;/span&gt;\n##IFticket.authors## ##ticket.authors##\n##ENDIFticket.authors##\n##ELSEticket.authors##--##ENDELSEticket.authors##\n&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n&lt;/span&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; &lt;/span&gt;\n##IFticket.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.category## &lt;/span&gt;&#160;:##ticket.category##\n##ENDIFticket.category## ##ELSEticket.category##\n##lang.ticket.nocategoryassigned## ##ENDELSEticket.category##\n&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.content##&lt;/span&gt;&#160;:\n##ticket.content##&lt;br /&gt;##IFticket.itemtype##\n&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;\n##lang.ticket.item.name##&lt;/span&gt;&#160;:\n##ticket.itemtype## - ##ticket.item.name##\n##ENDIFticket.itemtype##&lt;/p&gt;'),
(7,7,'','##ticket.action## ##ticket.title##','##FOREACHvalidations##\n\n##IFvalidation.storestatus=2##\n##validation.submission.title##\n##lang.validation.commentsubmission## : ##validation.commentsubmission##\n##ENDIFvalidation.storestatus##\n##ELSEvalidation.storestatus## ##validation.answer.title## ##ENDELSEvalidation.storestatus##\n\n##lang.ticket.url## : ##ticket.urlvalidation##\n\n##IFvalidation.status## ##lang.validation.status## : ##validation.status## ##ENDIFvalidation.status##\n##IFvalidation.commentvalidation##\n##lang.validation.commentvalidation## : ##validation.commentvalidation##\n##ENDIFvalidation.commentvalidation##\n##ENDFOREACHvalidations##','&lt;div&gt;##FOREACHvalidations##&lt;/div&gt;\n&lt;p&gt;##IFvalidation.storestatus=2##&lt;/p&gt;\n&lt;div&gt;##validation.submission.title##&lt;/div&gt;\n&lt;div&gt;##lang.validation.commentsubmission## : ##validation.commentsubmission##&lt;/div&gt;\n&lt;div&gt;##ENDIFvalidation.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEvalidation.storestatus## ##validation.answer.title## ##ENDELSEvalidation.storestatus##&lt;/div&gt;\n&lt;div&gt;&lt;/div&gt;\n&lt;div&gt;\n&lt;div&gt;##lang.ticket.url## : &lt;a href=\"##ticket.urlvalidation##\"&gt; ##ticket.urlvalidation## &lt;/a&gt;&lt;/div&gt;\n&lt;/div&gt;\n&lt;p&gt;##IFvalidation.status## ##lang.validation.status## : ##validation.status## ##ENDIFvalidation.status##\n&lt;br /&gt; ##IFvalidation.commentvalidation##&lt;br /&gt; ##lang.validation.commentvalidation## :\n&#160; ##validation.commentvalidation##&lt;br /&gt; ##ENDIFvalidation.commentvalidation##\n&lt;br /&gt;##ENDFOREACHvalidations##&lt;/p&gt;'),
(8,6,'','##ticket.action## ##ticket.entity##','##FOREACHtickets##\n##lang.ticket.authors##: ##ticket.authors##\n##lang.ticket.title##: ##ticket.title##\n##lang.ticket.priority##: ##ticket.priority##\n##lang.ticket.status##: ##ticket.status##\n##lang.ticket.attribution##: ##IFticket.assigntousers####ticket.assigntousers##\n##ENDIFticket.assigntousers####IFticket.assigntogroups##\n##ticket.assigntogroups## ##ENDIFticket.assigntogroups####IFticket.assigntosupplier##\n##ticket.assigntosupplier## ##ENDIFticket.assigntosupplier##\n##lang.ticket.creationdate##: ##ticket.creationdate##\n##lang.ticket.content##: ##ticket.content## ##ENDFOREACHtickets##','&lt;table class=\"tab_cadre\" border=\"1\" cellspacing=\"2\" cellpadding=\"3\"&gt;\n&lt;tbody&gt;\n&lt;tr&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.authors##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.title##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.priority##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.status##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.attribution##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.creationdate##&lt;/span&gt;&lt;/td&gt;\n&lt;td style=\"text-align: left;\" width=\"auto\" bgcolor=\"#cccccc\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##lang.ticket.content##&lt;/span&gt;##FOREACHtickets##&lt;/td&gt;\n&lt;/tr&gt;\n&lt;tr&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.authors##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;&lt;a href=\"##ticket.url##\"&gt;##ticket.title##&lt;/a&gt;&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.priority##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.status##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##IFticket.assigntousers####ticket.assigntousers##&lt;br /&gt;##ENDIFticket.assigntousers####IFticket.assigntogroups##&lt;br /&gt;##ticket.assigntogroups## ##ENDIFticket.assigntogroups####IFticket.assigntosupplier##&lt;br /&gt;##ticket.assigntosupplier## ##ENDIFticket.assigntosupplier##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.creationdate##&lt;/span&gt;&lt;/td&gt;\n&lt;td width=\"auto\"&gt;&lt;span style=\"font-size: 11px; text-align: left;\"&gt;##ticket.content##&lt;/span&gt;##ENDFOREACHtickets##&lt;/td&gt;\n&lt;/tr&gt;\n&lt;/tbody&gt;\n&lt;/table&gt;'),
(9,9,'','##consumable.action##  ##consumable.entity##','##lang.consumable.entity## : ##consumable.entity##\n\n\n##FOREACHconsumables##\n##lang.consumable.item## : ##consumable.item##\n\n\n##lang.consumable.reference## : ##consumable.reference##\n\n##lang.consumable.remaining## : ##consumable.remaining##\n##lang.consumable.stock_target## : ##consumable.stock_target##\n##lang.consumable.to_order## : ##consumable.to_order##\n\n##consumable.url##\n\n##ENDFOREACHconsumables##','&lt;p&gt;\n##lang.consumable.entity## : ##consumable.entity##\n&lt;br /&gt; &lt;br /&gt;##FOREACHconsumables##\n&lt;br /&gt;##lang.consumable.item## : ##consumable.item##&lt;br /&gt;\n&lt;br /&gt;##lang.consumable.reference## : ##consumable.reference##&lt;br /&gt;\n##lang.consumable.remaining## : ##consumable.remaining##&lt;br /&gt;\n##lang.consumable.stock_target## : ##consumable.stock_target##&lt;br /&gt;\n##lang.consumable.to_order## : ##consumable.to_order##&lt;br /&gt;\n&lt;a href=\"##consumable.url##\"&gt; ##consumable.url##&lt;/a&gt;&lt;br /&gt;\n   ##ENDFOREACHconsumables##&lt;/p&gt;'),
(10,8,'','##cartridge.action##  ##cartridge.entity##','##lang.cartridge.entity## : ##cartridge.entity##\n\n\n##FOREACHcartridges##\n##lang.cartridge.item## : ##cartridge.item##\n\n\n##lang.cartridge.reference## : ##cartridge.reference##\n\n##lang.cartridge.remaining## : ##cartridge.remaining##\n##lang.cartridge.stock_target## : ##cartridge.stock_target##\n##lang.cartridge.to_order## : ##cartridge.to_order##\n\n##cartridge.url##\n ##ENDFOREACHcartridges##','&lt;p&gt;##lang.cartridge.entity## : ##cartridge.entity##\n&lt;br /&gt; &lt;br /&gt;##FOREACHcartridges##\n&lt;br /&gt;##lang.cartridge.item## :\n##cartridge.item##&lt;br /&gt; &lt;br /&gt;\n##lang.cartridge.reference## :\n##cartridge.reference##&lt;br /&gt;\n##lang.cartridge.remaining## :\n##cartridge.remaining##&lt;br /&gt;\n##lang.cartridge.stock_target## :\n##cartridge.stock_target##&lt;br /&gt;\n##lang.cartridge.to_order## :\n##cartridge.to_order##&lt;br /&gt;\n&lt;a href=\"##cartridge.url##\"&gt;\n##cartridge.url##&lt;/a&gt;&lt;br /&gt;\n##ENDFOREACHcartridges##&lt;/p&gt;'),
(11,10,'','##infocom.action##  ##infocom.entity##','##lang.infocom.entity## : ##infocom.entity##\n\n\n##FOREACHinfocoms##\n\n##lang.infocom.itemtype## : ##infocom.itemtype##\n\n##lang.infocom.item## : ##infocom.item##\n\n\n##lang.infocom.expirationdate## : ##infocom.expirationdate##\n\n##infocom.url##\n ##ENDFOREACHinfocoms##','&lt;p&gt;##lang.infocom.entity## : ##infocom.entity##\n&lt;br /&gt; &lt;br /&gt;##FOREACHinfocoms##\n&lt;br /&gt;##lang.infocom.itemtype## : ##infocom.itemtype##&lt;br /&gt;\n##lang.infocom.item## : ##infocom.item##&lt;br /&gt; &lt;br /&gt;\n##lang.infocom.expirationdate## : ##infocom.expirationdate##\n&lt;br /&gt; &lt;a href=\"##infocom.url##\"&gt;\n##infocom.url##&lt;/a&gt;&lt;br /&gt;\n##ENDFOREACHinfocoms##&lt;/p&gt;'),
(12,11,'','##license.action##  ##license.entity##','##lang.license.entity## : ##license.entity##\n\n##FOREACHlicenses##\n\n##lang.license.item## : ##license.item##\n\n##lang.license.serial## : ##license.serial##\n\n##lang.license.expirationdate## : ##license.expirationdate##\n\n##license.url##\n ##ENDFOREACHlicenses##','&lt;p&gt;\n##lang.license.entity## : ##license.entity##&lt;br /&gt;\n##FOREACHlicenses##\n&lt;br /&gt;##lang.license.item## : ##license.item##&lt;br /&gt;\n##lang.license.serial## : ##license.serial##&lt;br /&gt;\n##lang.license.expirationdate## : ##license.expirationdate##\n&lt;br /&gt; &lt;a href=\"##license.url##\"&gt; ##license.url##\n&lt;/a&gt;&lt;br /&gt; ##ENDFOREACHlicenses##&lt;/p&gt;'),
(13,13,'','##user.action##','##user.realname## ##user.firstname##\n\n##lang.passwordforget.information##\n\n##lang.passwordforget.link## ##user.passwordforgeturl##','&lt;p&gt;&lt;strong&gt;##user.realname## ##user.firstname##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;##lang.passwordforget.information##&lt;/p&gt;\n&lt;p&gt;##lang.passwordforget.link## &lt;a title=\"##user.passwordforgeturl##\" href=\"##user.passwordforgeturl##\"&gt;##user.passwordforgeturl##&lt;/a&gt;&lt;/p&gt;'),
(14,14,'','##ticket.action## ##ticket.title##','##lang.ticket.title## : ##ticket.title##\n\n##lang.ticket.closedate## : ##ticket.closedate##\n\n##lang.satisfaction.text## ##ticket.urlsatisfaction##','&lt;p&gt;##lang.ticket.title## : ##ticket.title##&lt;/p&gt;\n&lt;p&gt;##lang.ticket.closedate## : ##ticket.closedate##&lt;/p&gt;\n&lt;p&gt;##lang.satisfaction.text## &lt;a href=\"##ticket.urlsatisfaction##\"&gt;##ticket.urlsatisfaction##&lt;/a&gt;&lt;/p&gt;'),
(15,15,'','##lang.unicity.action##','##lang.unicity.entity## : ##unicity.entity##\n\n##lang.unicity.itemtype## : ##unicity.itemtype##\n\n##lang.unicity.message## : ##unicity.message##\n\n##lang.unicity.action_user## : ##unicity.action_user##\n\n##lang.unicity.action_type## : ##unicity.action_type##\n\n##lang.unicity.date## : ##unicity.date##','&lt;p&gt;##lang.unicity.entity## : ##unicity.entity##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.itemtype## : ##unicity.itemtype##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.message## : ##unicity.message##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.action_user## : ##unicity.action_user##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.action_type## : ##unicity.action_type##&lt;/p&gt;\n&lt;p&gt;##lang.unicity.date## : ##unicity.date##&lt;/p&gt;'),
(16,16,'','##crontask.action##','##lang.crontask.warning##\n\n##FOREACHcrontasks##\n ##crontask.name## : ##crontask.description##\n\n##ENDFOREACHcrontasks##','&lt;p&gt;##lang.crontask.warning##&lt;/p&gt;\n&lt;p&gt;##FOREACHcrontasks## &lt;br /&gt;&lt;a href=\"##crontask.url##\"&gt;##crontask.name##&lt;/a&gt; : ##crontask.description##&lt;br /&gt; &lt;br /&gt;##ENDFOREACHcrontasks##&lt;/p&gt;'),
(17,17,'','##problem.action## ##problem.title##','##IFproblem.storestatus=5##\n ##lang.problem.url## : ##problem.urlapprove##\n ##lang.problem.solvedate## : ##problem.solvedate##\n ##lang.problem.solution.type## : ##problem.solution.type##\n ##lang.problem.solution.description## : ##problem.solution.description## ##ENDIFproblem.storestatus##\n ##ELSEproblem.storestatus## ##lang.problem.url## : ##problem.url## ##ENDELSEproblem.storestatus##\n\n ##lang.problem.description##\n\n ##lang.problem.title##  :##problem.title##\n ##lang.problem.authors##  :##IFproblem.authors## ##problem.authors## ##ENDIFproblem.authors## ##ELSEproblem.authors##--##ENDELSEproblem.authors##\n ##lang.problem.creationdate##  :##problem.creationdate##\n ##IFproblem.assigntousers## ##lang.problem.assigntousers##  : ##problem.assigntousers## ##ENDIFproblem.assigntousers##\n ##lang.problem.status##  : ##problem.status##\n ##IFproblem.assigntogroups## ##lang.problem.assigntogroups##  : ##problem.assigntogroups## ##ENDIFproblem.assigntogroups##\n ##lang.problem.urgency##  : ##problem.urgency##\n ##lang.problem.impact##  : ##problem.impact##\n ##lang.problem.priority## : ##problem.priority##\n##IFproblem.category## ##lang.problem.category##  :##problem.category## ##ENDIFproblem.category## ##ELSEproblem.category## ##lang.problem.nocategoryassigned## ##ENDELSEproblem.category##\n ##lang.problem.content##  : ##problem.content##\n\n##IFproblem.storestatus=6##\n ##lang.problem.solvedate## : ##problem.solvedate##\n ##lang.problem.solution.type## : ##problem.solution.type##\n ##lang.problem.solution.description## : ##problem.solution.description##\n##ENDIFproblem.storestatus##\n ##lang.problem.numberoffollowups## : ##problem.numberoffollowups##\n\n##FOREACHfollowups##\n\n [##followup.date##] ##lang.followup.isprivate## : ##followup.isprivate##\n ##lang.followup.author## ##followup.author##\n ##lang.followup.description## ##followup.description##\n ##lang.followup.date## ##followup.date##\n ##lang.followup.requesttype## ##followup.requesttype##\n\n##ENDFOREACHfollowups##\n ##lang.problem.numberoftickets## : ##problem.numberoftickets##\n\n##FOREACHtickets##\n [##ticket.date##] ##lang.problem.title## : ##ticket.title##\n ##lang.problem.content## ##ticket.content##\n\n##ENDFOREACHtickets##\n ##lang.problem.numberoftasks## : ##problem.numberoftasks##\n\n##FOREACHtasks##\n [##task.date##]\n ##lang.task.author## ##task.author##\n ##lang.task.description## ##task.description##\n ##lang.task.time## ##task.time##\n ##lang.task.category## ##task.category##\n\n##ENDFOREACHtasks##\n','&lt;p&gt;##IFproblem.storestatus=5##&lt;/p&gt;\n&lt;div&gt;##lang.problem.url## : &lt;a href=\"##problem.urlapprove##\"&gt;##problem.urlapprove##&lt;/a&gt;&lt;/div&gt;\n&lt;div&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.problem.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solvedate##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.problem.solution.type##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.problem.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.description## ##ENDIFproblem.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEproblem.storestatus## ##lang.problem.url## : &lt;a href=\"##problem.url##\"&gt;##problem.url##&lt;/a&gt; ##ENDELSEproblem.storestatus##&lt;/div&gt;\n&lt;p class=\"description b\"&gt;&lt;strong&gt;##lang.problem.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.title##&lt;/span&gt;&#160;:##problem.title## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.authors##&lt;/span&gt;&#160;:##IFproblem.authors## ##problem.authors## ##ENDIFproblem.authors##    ##ELSEproblem.authors##--##ENDELSEproblem.authors## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.creationdate##&lt;/span&gt;&#160;:##problem.creationdate## &lt;br /&gt; ##IFproblem.assigntousers## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.assigntousers##&lt;/span&gt;&#160;: ##problem.assigntousers## ##ENDIFproblem.assigntousers##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.problem.status## &lt;/span&gt;&#160;: ##problem.status##&lt;br /&gt; ##IFproblem.assigntogroups## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.assigntogroups##&lt;/span&gt;&#160;: ##problem.assigntogroups## ##ENDIFproblem.assigntogroups##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.urgency##&lt;/span&gt;&#160;: ##problem.urgency##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.impact##&lt;/span&gt;&#160;: ##problem.impact##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.priority##&lt;/span&gt; : ##problem.priority## &lt;br /&gt;##IFproblem.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.problem.category## &lt;/span&gt;&#160;:##problem.category##  ##ENDIFproblem.category## ##ELSEproblem.category##  ##lang.problem.nocategoryassigned## ##ENDELSEproblem.category##    &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.problem.content##&lt;/span&gt;&#160;: ##problem.content##&lt;/p&gt;\n&lt;p&gt;##IFproblem.storestatus=6##&lt;br /&gt;&lt;span style=\"text-decoration: underline;\"&gt;&lt;strong&gt;&lt;span style=\"color: #888888;\"&gt;##lang.problem.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solvedate##&lt;br /&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.problem.solution.type##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.problem.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##problem.solution.description##&lt;br /&gt;##ENDIFproblem.storestatus##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.problem.numberoffollowups##&#160;: ##problem.numberoffollowups##&lt;/div&gt;\n&lt;p&gt;##FOREACHfollowups##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;br /&gt; &lt;strong&gt; [##followup.date##] &lt;em&gt;##lang.followup.isprivate## : ##followup.isprivate## &lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.author## &lt;/span&gt; ##followup.author##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.description## &lt;/span&gt; ##followup.description##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.date## &lt;/span&gt; ##followup.date##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.requesttype## &lt;/span&gt; ##followup.requesttype##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHfollowups##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.problem.numberoftickets##&#160;: ##problem.numberoftickets##&lt;/div&gt;\n&lt;p&gt;##FOREACHtickets##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt; [##ticket.date##] &lt;em&gt;##lang.problem.title## : &lt;a href=\"##ticket.url##\"&gt;##ticket.title## &lt;/a&gt;&lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; &lt;/span&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.problem.content## &lt;/span&gt; ##ticket.content##\n&lt;p&gt;##ENDFOREACHtickets##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.problem.numberoftasks##&#160;: ##problem.numberoftasks##&lt;/div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;strong&gt;[##task.date##] &lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.author##&lt;/span&gt; ##task.author##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.description##&lt;/span&gt; ##task.description##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.time##&lt;/span&gt; ##task.time##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.category##&lt;/span&gt; ##task.category##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),
(18,18,'','##recall.action##: ##recall.item.name##','##recall.action##: ##recall.item.name##\n\n##recall.item.content##\n\n##lang.recall.planning.begin##: ##recall.planning.begin##\n##lang.recall.planning.end##: ##recall.planning.end##\n##lang.recall.planning.state##: ##recall.planning.state##\n##lang.recall.item.private##: ##recall.item.private##','&lt;p&gt;##recall.action##: &lt;a href=\"##recall.item.url##\"&gt;##recall.item.name##&lt;/a&gt;&lt;/p&gt;\n&lt;p&gt;##recall.item.content##&lt;/p&gt;\n&lt;p&gt;##lang.recall.planning.begin##: ##recall.planning.begin##&lt;br /&gt;##lang.recall.planning.end##: ##recall.planning.end##&lt;br /&gt;##lang.recall.planning.state##: ##recall.planning.state##&lt;br /&gt;##lang.recall.item.private##: ##recall.item.private##&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;\n&lt;p&gt;&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;'),
(19,19,'','##change.action## ##change.title##','##IFchange.storestatus=5##\n ##lang.change.url## : ##change.urlapprove##\n ##lang.change.solvedate## : ##change.solvedate##\n ##lang.change.solution.type## : ##change.solution.type##\n ##lang.change.solution.description## : ##change.solution.description## ##ENDIFchange.storestatus##\n ##ELSEchange.storestatus## ##lang.change.url## : ##change.url## ##ENDELSEchange.storestatus##\n\n ##lang.change.description##\n\n ##lang.change.title##  :##change.title##\n ##lang.change.authors##  :##IFchange.authors## ##change.authors## ##ENDIFchange.authors## ##ELSEchange.authors##--##ENDELSEchange.authors##\n ##lang.change.creationdate##  :##change.creationdate##\n ##IFchange.assigntousers## ##lang.change.assigntousers##  : ##change.assigntousers## ##ENDIFchange.assigntousers##\n ##lang.change.status##  : ##change.status##\n ##IFchange.assigntogroups## ##lang.change.assigntogroups##  : ##change.assigntogroups## ##ENDIFchange.assigntogroups##\n ##lang.change.urgency##  : ##change.urgency##\n ##lang.change.impact##  : ##change.impact##\n ##lang.change.priority## : ##change.priority##\n##IFchange.category## ##lang.change.category##  :##change.category## ##ENDIFchange.category## ##ELSEchange.category## ##lang.change.nocategoryassigned## ##ENDELSEchange.category##\n ##lang.change.content##  : ##change.content##\n\n##IFchange.storestatus=6##\n ##lang.change.solvedate## : ##change.solvedate##\n ##lang.change.solution.type## : ##change.solution.type##\n ##lang.change.solution.description## : ##change.solution.description##\n##ENDIFchange.storestatus##\n ##lang.change.numberoffollowups## : ##change.numberoffollowups##\n\n##FOREACHfollowups##\n\n [##followup.date##] ##lang.followup.isprivate## : ##followup.isprivate##\n ##lang.followup.author## ##followup.author##\n ##lang.followup.description## ##followup.description##\n ##lang.followup.date## ##followup.date##\n ##lang.followup.requesttype## ##followup.requesttype##\n\n##ENDFOREACHfollowups##\n ##lang.change.numberofproblems## : ##change.numberofproblems##\n\n##FOREACHproblems##\n [##problem.date##] ##lang.change.title## : ##problem.title##\n ##lang.change.content## ##problem.content##\n\n##ENDFOREACHproblems##\n ##lang.change.numberoftasks## : ##change.numberoftasks##\n\n##FOREACHtasks##\n [##task.date##]\n ##lang.task.author## ##task.author##\n ##lang.task.description## ##task.description##\n ##lang.task.time## ##task.time##\n ##lang.task.category## ##task.category##\n\n##ENDFOREACHtasks##\n','&lt;p&gt;##IFchange.storestatus=5##&lt;/p&gt;\n&lt;div&gt;##lang.change.url## : &lt;a href=\"##change.urlapprove##\"&gt;##change.urlapprove##&lt;/a&gt;&lt;/div&gt;\n&lt;div&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.change.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##change.solvedate##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.change.solution.type##&lt;/strong&gt;&lt;/span&gt; : ##change.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.change.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##change.solution.description## ##ENDIFchange.storestatus##&lt;/div&gt;\n&lt;div&gt;##ELSEchange.storestatus## ##lang.change.url## : &lt;a href=\"##change.url##\"&gt;##change.url##&lt;/a&gt; ##ENDELSEchange.storestatus##&lt;/div&gt;\n&lt;p class=\"description b\"&gt;&lt;strong&gt;##lang.change.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.title##&lt;/span&gt;&#160;:##change.title## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.authors##&lt;/span&gt;&#160;:##IFchange.authors## ##change.authors## ##ENDIFchange.authors##    ##ELSEchange.authors##--##ENDELSEchange.authors## &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.creationdate##&lt;/span&gt;&#160;:##change.creationdate## &lt;br /&gt; ##IFchange.assigntousers## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.assigntousers##&lt;/span&gt;&#160;: ##change.assigntousers## ##ENDIFchange.assigntousers##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.change.status## &lt;/span&gt;&#160;: ##change.status##&lt;br /&gt; ##IFchange.assigntogroups## &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.assigntogroups##&lt;/span&gt;&#160;: ##change.assigntogroups## ##ENDIFchange.assigntogroups##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.urgency##&lt;/span&gt;&#160;: ##change.urgency##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.impact##&lt;/span&gt;&#160;: ##change.impact##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.priority##&lt;/span&gt; : ##change.priority## &lt;br /&gt;##IFchange.category##&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.change.category## &lt;/span&gt;&#160;:##change.category##  ##ENDIFchange.category## ##ELSEchange.category##  ##lang.change.nocategoryassigned## ##ENDELSEchange.category##    &lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.change.content##&lt;/span&gt;&#160;: ##change.content##&lt;/p&gt;\n&lt;p&gt;##IFchange.storestatus=6##&lt;br /&gt;&lt;span style=\"text-decoration: underline;\"&gt;&lt;strong&gt;&lt;span style=\"color: #888888;\"&gt;##lang.change.solvedate##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##change.solvedate##&lt;br /&gt;&lt;span style=\"color: #888888;\"&gt;&lt;strong&gt;&lt;span style=\"text-decoration: underline;\"&gt;##lang.change.solution.type##&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt; : ##change.solution.type##&lt;br /&gt;&lt;span style=\"text-decoration: underline; color: #888888;\"&gt;&lt;strong&gt;##lang.change.solution.description##&lt;/strong&gt;&lt;/span&gt; : ##change.solution.description##&lt;br /&gt;##ENDIFchange.storestatus##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.change.numberoffollowups##&#160;: ##change.numberoffollowups##&lt;/div&gt;\n&lt;p&gt;##FOREACHfollowups##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;br /&gt; &lt;strong&gt; [##followup.date##] &lt;em&gt;##lang.followup.isprivate## : ##followup.isprivate## &lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.author## &lt;/span&gt; ##followup.author##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.description## &lt;/span&gt; ##followup.description##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.date## &lt;/span&gt; ##followup.date##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.followup.requesttype## &lt;/span&gt; ##followup.requesttype##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHfollowups##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.change.numberofproblems##&#160;: ##change.numberofproblems##&lt;/div&gt;\n&lt;p&gt;##FOREACHproblems##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt; [##problem.date##] &lt;em&gt;##lang.change.title## : &lt;a href=\"##problem.url##\"&gt;##problem.title## &lt;/a&gt;&lt;/em&gt;&lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; &lt;/span&gt;&lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt;##lang.change.content## &lt;/span&gt; ##problem.content##\n&lt;p&gt;##ENDFOREACHproblems##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;##lang.change.numberoftasks##&#160;: ##change.numberoftasks##&lt;/div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div class=\"description b\"&gt;&lt;strong&gt;[##task.date##] &lt;/strong&gt;&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.author##&lt;/span&gt; ##task.author##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.description##&lt;/span&gt; ##task.description##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.time##&lt;/span&gt; ##task.time##&lt;br /&gt; &lt;span style=\"color: #8b8c8f; font-weight: bold; text-decoration: underline;\"&gt; ##lang.task.category##&lt;/span&gt; ##task.category##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),
(20,20,'','##mailcollector.action##','##FOREACHmailcollectors##\n##lang.mailcollector.name## : ##mailcollector.name##\n##lang.mailcollector.errors## : ##mailcollector.errors##\n##mailcollector.url##\n##ENDFOREACHmailcollectors##','&lt;p&gt;##FOREACHmailcollectors##&lt;br /&gt;##lang.mailcollector.name## : ##mailcollector.name##&lt;br /&gt; ##lang.mailcollector.errors## : ##mailcollector.errors##&lt;br /&gt;&lt;a href=\"##mailcollector.url##\"&gt;##mailcollector.url##&lt;/a&gt;&lt;br /&gt; ##ENDFOREACHmailcollectors##&lt;/p&gt;\n&lt;p&gt;&lt;/p&gt;'),
(21,21,'','##project.action## ##project.name## ##project.code##','##lang.project.url## : ##project.url##\n\n##lang.project.description##\n\n##lang.project.name## : ##project.name##\n##lang.project.code## : ##project.code##\n##lang.project.manager## : ##project.manager##\n##lang.project.managergroup## : ##project.managergroup##\n##lang.project.creationdate## : ##project.creationdate##\n##lang.project.priority## : ##project.priority##\n##lang.project.state## : ##project.state##\n##lang.project.type## : ##project.type##\n##lang.project.description## : ##project.description##\n\n##lang.project.numberoftasks## : ##project.numberoftasks##\n\n\n\n##FOREACHtasks##\n\n[##task.creationdate##]\n##lang.task.name## : ##task.name##\n##lang.task.state## : ##task.state##\n##lang.task.type## : ##task.type##\n##lang.task.percent## : ##task.percent##\n##lang.task.description## : ##task.description##\n\n##ENDFOREACHtasks##','&lt;p&gt;##lang.project.url## : &lt;a href=\"##project.url##\"&gt;##project.url##&lt;/a&gt;&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;##lang.project.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;##lang.project.name## : ##project.name##&lt;br /&gt;##lang.project.code## : ##project.code##&lt;br /&gt; ##lang.project.manager## : ##project.manager##&lt;br /&gt;##lang.project.managergroup## : ##project.managergroup##&lt;br /&gt; ##lang.project.creationdate## : ##project.creationdate##&lt;br /&gt;##lang.project.priority## : ##project.priority## &lt;br /&gt;##lang.project.state## : ##project.state##&lt;br /&gt;##lang.project.type## : ##project.type##&lt;br /&gt;##lang.project.description## : ##project.description##&lt;/p&gt;\n&lt;p&gt;##lang.project.numberoftasks## : ##project.numberoftasks##&lt;/p&gt;\n&lt;div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt;[##task.creationdate##] &lt;/strong&gt;&lt;br /&gt; ##lang.task.name## : ##task.name##&lt;br /&gt;##lang.task.state## : ##task.state##&lt;br /&gt;##lang.task.type## : ##task.type##&lt;br /&gt;##lang.task.percent## : ##task.percent##&lt;br /&gt;##lang.task.description## : ##task.description##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),
(22,22,'','##projecttask.action## ##projecttask.name##','##lang.projecttask.url## : ##projecttask.url##\n\n##lang.projecttask.description##\n\n##lang.projecttask.name## : ##projecttask.name##\n##lang.projecttask.project## : ##projecttask.project##\n##lang.projecttask.creationdate## : ##projecttask.creationdate##\n##lang.projecttask.state## : ##projecttask.state##\n##lang.projecttask.type## : ##projecttask.type##\n##lang.projecttask.description## : ##projecttask.description##\n\n##lang.projecttask.numberoftasks## : ##projecttask.numberoftasks##\n\n\n\n##FOREACHtasks##\n\n[##task.creationdate##]\n##lang.task.name## : ##task.name##\n##lang.task.state## : ##task.state##\n##lang.task.type## : ##task.type##\n##lang.task.percent## : ##task.percent##\n##lang.task.description## : ##task.description##\n\n##ENDFOREACHtasks##','&lt;p&gt;##lang.projecttask.url## : &lt;a href=\"##projecttask.url##\"&gt;##projecttask.url##&lt;/a&gt;&lt;/p&gt;\n&lt;p&gt;&lt;strong&gt;##lang.projecttask.description##&lt;/strong&gt;&lt;/p&gt;\n&lt;p&gt;##lang.projecttask.name## : ##projecttask.name##&lt;br /&gt;##lang.projecttask.project## : &lt;a href=\"##projecttask.projecturl##\"&gt;##projecttask.project##&lt;/a&gt;&lt;br /&gt;##lang.projecttask.creationdate## : ##projecttask.creationdate##&lt;br /&gt;##lang.projecttask.state## : ##projecttask.state##&lt;br /&gt;##lang.projecttask.type## : ##projecttask.type##&lt;br /&gt;##lang.projecttask.description## : ##projecttask.description##&lt;/p&gt;\n&lt;p&gt;##lang.projecttask.numberoftasks## : ##projecttask.numberoftasks##&lt;/p&gt;\n&lt;div&gt;\n&lt;p&gt;##FOREACHtasks##&lt;/p&gt;\n&lt;div&gt;&lt;strong&gt;[##task.creationdate##] &lt;/strong&gt;&lt;br /&gt;##lang.task.name## : ##task.name##&lt;br /&gt;##lang.task.state## : ##task.state##&lt;br /&gt;##lang.task.type## : ##task.type##&lt;br /&gt;##lang.task.percent## : ##task.percent##&lt;br /&gt;##lang.task.description## : ##task.description##&lt;/div&gt;\n&lt;p&gt;##ENDFOREACHtasks##&lt;/p&gt;\n&lt;/div&gt;'),
(23,23,'','##objectlock.action##','##objectlock.type## ###objectlock.id## - ##objectlock.name##\n\n      ##lang.objectlock.url##\n      ##objectlock.url##\n\n      ##lang.objectlock.date_mod##\n      ##objectlock.date_mod##\n\n      Hello ##objectlock.lockedby.firstname##,\n      Could go to this item and unlock it for me?\n      Thank you,\n      Regards,\n      ##objectlock.requester.firstname##','&lt;table&gt;\n      &lt;tbody&gt;\n      &lt;tr&gt;&lt;th colspan=\"2\"&gt;&lt;a href=\"##objectlock.url##\"&gt;##objectlock.type## ###objectlock.id## - ##objectlock.name##&lt;/a&gt;&lt;/th&gt;&lt;/tr&gt;\n      &lt;tr&gt;\n      &lt;td&gt;##lang.objectlock.url##&lt;/td&gt;\n      &lt;td&gt;##objectlock.url##&lt;/td&gt;\n      &lt;/tr&gt;\n      &lt;tr&gt;\n      &lt;td&gt;##lang.objectlock.date_mod##&lt;/td&gt;\n      &lt;td&gt;##objectlock.date_mod##&lt;/td&gt;\n      &lt;/tr&gt;\n      &lt;/tbody&gt;\n      &lt;/table&gt;\n      &lt;p&gt;&lt;span style=\"font-size: small;\"&gt;Hello ##objectlock.lockedby.firstname##,&lt;br /&gt;Could go to this item and unlock it for me?&lt;br /&gt;Thank you,&lt;br /&gt;Regards,&lt;br /&gt;##objectlock.requester.firstname## ##objectlock.requester.lastname##&lt;/span&gt;&lt;/p&gt;'),
(24,24,'','##savedsearch.action## ##savedsearch.name##','##savedsearch.type## ###savedsearch.id## - ##savedsearch.name##\n\n      ##savedsearch.message##\n\n      ##lang.savedsearch.url##\n      ##savedsearch.url##\n\n      Regards,','&lt;table&gt;\n      &lt;tbody&gt;\n      &lt;tr&gt;&lt;th colspan=\"2\"&gt;&lt;a href=\"##savedsearch.url##\"&gt;##savedsearch.type## ###savedsearch.id## - ##savedsearch.name##&lt;/a&gt;&lt;/th&gt;&lt;/tr&gt;\n      &lt;tr&gt;&lt;td colspan=\"2\"&gt;&lt;a href=\"##savedsearch.url##\"&gt;##savedsearch.message##&lt;/a&gt;&lt;/td&gt;&lt;/tr&gt;\n      &lt;tr&gt;\n      &lt;td&gt;##lang.savedsearch.url##&lt;/td&gt;\n      &lt;td&gt;##savedsearch.url##&lt;/td&gt;\n      &lt;/tr&gt;\n      &lt;/tbody&gt;\n      &lt;/table&gt;\n      &lt;p&gt;&lt;span style=\"font-size: small;\"&gt;Hello &lt;br /&gt;Regards,&lt;/span&gt;&lt;/p&gt;'),
(25,25,'','##certificate.action##  ##certificate.name##','##lang.certificate.entity## : ##certificate.entity##\n\n##lang.certificate.serial## : ##certificate.serial##\n\n##lang.certificate.expirationdate## : ##certificate.expirationdate##\n\n##certificate.url##','&lt;p&gt;\n##lang.certificate.entity## : ##certificate.entity##&lt;br /&gt;\n&lt;br /&gt;##lang.certificate.name## : ##certificate.name##&lt;br /&gt;\n##lang.certificate.serial## : ##certificate.serial##&lt;br /&gt;\n##lang.certificate.expirationdate## : ##certificate.expirationdate##\n&lt;br /&gt; &lt;a href=\"##certificate.url##\"&gt; ##certificate.url##\n&lt;/a&gt;&lt;br /&gt;\n&lt;/p&gt;'),
(26,26,'','##domain.action## : ##domain.name##','##lang.domain.entity## :##domain.entity##\n   ##lang.domain.name## : ##domain.name## - ##lang.domain.dateexpiration## : ##domain.dateexpiration##','&lt;p&gt;##lang.domain.entity## :##domain.entity##&lt;br /&gt; &lt;br /&gt;\n                        ##lang.domain.name##  : ##domain.name## - ##lang.domain.dateexpiration## :  ##domain.dateexpiration##&lt;br /&gt;\n                        &lt;/p&gt;'),
(27,27,'','##user.action##','##user.realname## ##user.firstname##,\n\n##IFuser.password.has_expired=1##\n##lang.password.has_expired.information##\n##ENDIFuser.password.has_expired##\n##ELSEuser.password.has_expired##\n##lang.password.expires_soon.information##\n##ENDELSEuser.password.has_expired##\n##lang.user.password.expiration.date##: ##user.password.expiration.date##\n##IFuser.account.lock.date##\n##lang.user.account.lock.date##: ##user.account.lock.date##\n##ENDIFuser.account.lock.date##\n\n##password.update.link## ##user.password.update.url##','&lt;p&gt;&lt;strong&gt;##user.realname## ##user.firstname##&lt;/strong&gt;&lt;/p&gt;\n\n##IFuser.password.has_expired=1##\n&lt;p&gt;##lang.password.has_expired.information##&lt;/p&gt;\n##ENDIFuser.password.has_expired##\n##ELSEuser.password.has_expired##\n&lt;p&gt;##lang.password.expires_soon.information##&lt;/p&gt;\n##ENDELSEuser.password.has_expired##\n&lt;p&gt;##lang.user.password.expiration.date##: ##user.password.expiration.date##&lt;/p&gt;\n##IFuser.account.lock.date##\n&lt;p&gt;##lang.user.account.lock.date##: ##user.account.lock.date##&lt;/p&gt;\n##ENDIFuser.account.lock.date##\n\n&lt;p&gt;##lang.password.update.link## &lt;a href=\"##user.password.update.url##\"&gt;##user.password.update.url##&lt;/a&gt;&lt;/p&gt;'),
(28,28,'','##lang.plugins_updates_available##','##lang.plugins_updates_available##\n\n##FOREACHplugins##\n##plugin.name## :##plugin.old_version## -&gt; ##plugin.version##\n##ENDFOREACHplugins##\n\n##lang.marketplace.url## : ##marketplace.url##','&lt;p&gt;##lang.plugins_updates_available##&lt;/p&gt;\n&lt;ul&gt;##FOREACHplugins##\n&lt;li&gt;##plugin.name## :##plugin.old_version## -&gt; ##plugin.version##&lt;/li&gt;\n##ENDFOREACHplugins##&lt;/ul&gt;\n&lt;p&gt;##lang.marketplace.url## : &lt;a title=\"##lang.marketplace.url##\" href=\"##marketplace.url##\" target=\"_blank\" rel=\"noopener\"&gt;##marketplace.url##&lt;/a&gt;&lt;/p&gt;');
/*!40000 ALTER TABLE `glpi_notificationtemplatetranslations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_notimportedemails`
--

DROP TABLE IF EXISTS `glpi_notimportedemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_notimportedemails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `mailcollectors_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `subject` text DEFAULT NULL,
  `messageid` varchar(255) NOT NULL,
  `reason` int(11) NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `mailcollectors_id` (`mailcollectors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_notimportedemails`
--

LOCK TABLES `glpi_notimportedemails` WRITE;
/*!40000 ALTER TABLE `glpi_notimportedemails` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_notimportedemails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_objectlocks`
--

DROP TABLE IF EXISTS `glpi_objectlocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_objectlocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL COMMENT 'Type of locked object',
  `items_id` int(10) unsigned NOT NULL COMMENT 'RELATION to various tables, according to itemtype (ID)',
  `users_id` int(10) unsigned NOT NULL COMMENT 'id of the locker',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `item` (`itemtype`,`items_id`),
  KEY `users_id` (`users_id`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_objectlocks`
--

LOCK TABLES `glpi_objectlocks` WRITE;
/*!40000 ALTER TABLE `glpi_objectlocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_objectlocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_olalevelactions`
--

DROP TABLE IF EXISTS `glpi_olalevelactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_olalevelactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `olalevels_id` int(10) unsigned NOT NULL DEFAULT 0,
  `action_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `olalevels_id` (`olalevels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_olalevelactions`
--

LOCK TABLES `glpi_olalevelactions` WRITE;
/*!40000 ALTER TABLE `glpi_olalevelactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_olalevelactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_olalevelcriterias`
--

DROP TABLE IF EXISTS `glpi_olalevelcriterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_olalevelcriterias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `olalevels_id` int(10) unsigned NOT NULL DEFAULT 0,
  `criteria` varchar(255) DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `olalevels_id` (`olalevels_id`),
  KEY `condition` (`condition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_olalevelcriterias`
--

LOCK TABLES `glpi_olalevelcriterias` WRITE;
/*!40000 ALTER TABLE `glpi_olalevelcriterias` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_olalevelcriterias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_olalevels`
--

DROP TABLE IF EXISTS `glpi_olalevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_olalevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `olas_id` int(10) unsigned NOT NULL DEFAULT 0,
  `execution_time` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `match` char(10) DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `olas_id` (`olas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_olalevels`
--

LOCK TABLES `glpi_olalevels` WRITE;
/*!40000 ALTER TABLE `glpi_olalevels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_olalevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_olalevels_tickets`
--

DROP TABLE IF EXISTS `glpi_olalevels_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_olalevels_tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `olalevels_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`olalevels_id`),
  KEY `olalevels_id` (`olalevels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_olalevels_tickets`
--

LOCK TABLES `glpi_olalevels_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_olalevels_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_olalevels_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_olas`
--

DROP TABLE IF EXISTS `glpi_olas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_olas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `number_time` int(11) NOT NULL,
  `use_ticket_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `calendars_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `definition_time` varchar(255) DEFAULT NULL,
  `end_of_working_day` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `slms_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `calendars_id` (`calendars_id`),
  KEY `slms_id` (`slms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_olas`
--

LOCK TABLES `glpi_olas` WRITE;
/*!40000 ALTER TABLE `glpi_olas` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_olas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_operatingsystemarchitectures`
--

DROP TABLE IF EXISTS `glpi_operatingsystemarchitectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_operatingsystemarchitectures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_operatingsystemarchitectures`
--

LOCK TABLES `glpi_operatingsystemarchitectures` WRITE;
/*!40000 ALTER TABLE `glpi_operatingsystemarchitectures` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_operatingsystemarchitectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_operatingsystemeditions`
--

DROP TABLE IF EXISTS `glpi_operatingsystemeditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_operatingsystemeditions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_operatingsystemeditions`
--

LOCK TABLES `glpi_operatingsystemeditions` WRITE;
/*!40000 ALTER TABLE `glpi_operatingsystemeditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_operatingsystemeditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_operatingsystemkernels`
--

DROP TABLE IF EXISTS `glpi_operatingsystemkernels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_operatingsystemkernels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_operatingsystemkernels`
--

LOCK TABLES `glpi_operatingsystemkernels` WRITE;
/*!40000 ALTER TABLE `glpi_operatingsystemkernels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_operatingsystemkernels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_operatingsystemkernelversions`
--

DROP TABLE IF EXISTS `glpi_operatingsystemkernelversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_operatingsystemkernelversions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operatingsystemkernels_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `operatingsystemkernels_id` (`operatingsystemkernels_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_operatingsystemkernelversions`
--

LOCK TABLES `glpi_operatingsystemkernelversions` WRITE;
/*!40000 ALTER TABLE `glpi_operatingsystemkernelversions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_operatingsystemkernelversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_operatingsystems`
--

DROP TABLE IF EXISTS `glpi_operatingsystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_operatingsystems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_operatingsystems`
--

LOCK TABLES `glpi_operatingsystems` WRITE;
/*!40000 ALTER TABLE `glpi_operatingsystems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_operatingsystems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_operatingsystemservicepacks`
--

DROP TABLE IF EXISTS `glpi_operatingsystemservicepacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_operatingsystemservicepacks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_operatingsystemservicepacks`
--

LOCK TABLES `glpi_operatingsystemservicepacks` WRITE;
/*!40000 ALTER TABLE `glpi_operatingsystemservicepacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_operatingsystemservicepacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_operatingsystemversions`
--

DROP TABLE IF EXISTS `glpi_operatingsystemversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_operatingsystemversions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_operatingsystemversions`
--

LOCK TABLES `glpi_operatingsystemversions` WRITE;
/*!40000 ALTER TABLE `glpi_operatingsystemversions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_operatingsystemversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_passivedcequipmentmodels`
--

DROP TABLE IF EXISTS `glpi_passivedcequipmentmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_passivedcequipmentmodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_passivedcequipmentmodels`
--

LOCK TABLES `glpi_passivedcequipmentmodels` WRITE;
/*!40000 ALTER TABLE `glpi_passivedcequipmentmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_passivedcequipmentmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_passivedcequipments`
--

DROP TABLE IF EXISTS `glpi_passivedcequipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_passivedcequipments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `passivedcequipmentmodels_id` int(10) unsigned DEFAULT NULL,
  `passivedcequipmenttypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'RELATION to states (id)',
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `passivedcequipmentmodels_id` (`passivedcequipmentmodels_id`),
  KEY `passivedcequipmenttypes_id` (`passivedcequipmenttypes_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `group_id_tech` (`groups_id_tech`),
  KEY `is_template` (`is_template`),
  KEY `is_deleted` (`is_deleted`),
  KEY `states_id` (`states_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_passivedcequipments`
--

LOCK TABLES `glpi_passivedcequipments` WRITE;
/*!40000 ALTER TABLE `glpi_passivedcequipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_passivedcequipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_passivedcequipmenttypes`
--

DROP TABLE IF EXISTS `glpi_passivedcequipmenttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_passivedcequipmenttypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_passivedcequipmenttypes`
--

LOCK TABLES `glpi_passivedcequipmenttypes` WRITE;
/*!40000 ALTER TABLE `glpi_passivedcequipmenttypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_passivedcequipmenttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_pcivendors`
--

DROP TABLE IF EXISTS `glpi_pcivendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_pcivendors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `vendorid` varchar(4) NOT NULL,
  `deviceid` varchar(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`vendorid`,`deviceid`),
  KEY `deviceid` (`deviceid`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_pcivendors`
--

LOCK TABLES `glpi_pcivendors` WRITE;
/*!40000 ALTER TABLE `glpi_pcivendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_pcivendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_pdumodels`
--

DROP TABLE IF EXISTS `glpi_pdumodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_pdumodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `max_power` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `is_rackable` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_rackable` (`is_rackable`),
  KEY `product_number` (`product_number`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_pdumodels`
--

LOCK TABLES `glpi_pdumodels` WRITE;
/*!40000 ALTER TABLE `glpi_pdumodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_pdumodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_pdus`
--

DROP TABLE IF EXISTS `glpi_pdus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_pdus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `pdumodels_id` int(10) unsigned DEFAULT NULL,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'RELATION to states (id)',
  `comment` text DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `pdutypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `pdumodels_id` (`pdumodels_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `group_id_tech` (`groups_id_tech`),
  KEY `is_template` (`is_template`),
  KEY `is_deleted` (`is_deleted`),
  KEY `states_id` (`states_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `pdutypes_id` (`pdutypes_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_pdus`
--

LOCK TABLES `glpi_pdus` WRITE;
/*!40000 ALTER TABLE `glpi_pdus` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_pdus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_pdus_plugs`
--

DROP TABLE IF EXISTS `glpi_pdus_plugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_pdus_plugs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plugs_id` int(10) unsigned NOT NULL DEFAULT 0,
  `pdus_id` int(10) unsigned NOT NULL DEFAULT 0,
  `number_plugs` int(11) DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugs_id` (`plugs_id`),
  KEY `pdus_id` (`pdus_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_pdus_plugs`
--

LOCK TABLES `glpi_pdus_plugs` WRITE;
/*!40000 ALTER TABLE `glpi_pdus_plugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_pdus_plugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_pdus_racks`
--

DROP TABLE IF EXISTS `glpi_pdus_racks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_pdus_racks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `racks_id` int(10) unsigned NOT NULL DEFAULT 0,
  `pdus_id` int(10) unsigned NOT NULL DEFAULT 0,
  `side` int(11) DEFAULT 0,
  `position` int(11) NOT NULL,
  `bgcolor` varchar(7) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `racks_id` (`racks_id`),
  KEY `pdus_id` (`pdus_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_pdus_racks`
--

LOCK TABLES `glpi_pdus_racks` WRITE;
/*!40000 ALTER TABLE `glpi_pdus_racks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_pdus_racks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_pdutypes`
--

DROP TABLE IF EXISTS `glpi_pdutypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_pdutypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_pdutypes`
--

LOCK TABLES `glpi_pdutypes` WRITE;
/*!40000 ALTER TABLE `glpi_pdutypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_pdutypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_pendingreasons`
--

DROP TABLE IF EXISTS `glpi_pendingreasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_pendingreasons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `followup_frequency` int(11) NOT NULL DEFAULT 0,
  `followups_before_resolution` int(11) NOT NULL DEFAULT 0,
  `itilfollowuptemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `solutiontemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `itilfollowuptemplates_id` (`itilfollowuptemplates_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `solutiontemplates_id` (`solutiontemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_pendingreasons`
--

LOCK TABLES `glpi_pendingreasons` WRITE;
/*!40000 ALTER TABLE `glpi_pendingreasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_pendingreasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_pendingreasons_items`
--

DROP TABLE IF EXISTS `glpi_pendingreasons_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_pendingreasons_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pendingreasons_id` int(10) unsigned NOT NULL DEFAULT 0,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL DEFAULT '',
  `followup_frequency` int(11) NOT NULL DEFAULT 0,
  `followups_before_resolution` int(11) NOT NULL DEFAULT 0,
  `bump_count` int(11) NOT NULL DEFAULT 0,
  `last_bump_date` timestamp NULL DEFAULT NULL,
  `previous_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`items_id`,`itemtype`),
  KEY `pendingreasons_id` (`pendingreasons_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_pendingreasons_items`
--

LOCK TABLES `glpi_pendingreasons_items` WRITE;
/*!40000 ALTER TABLE `glpi_pendingreasons_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_pendingreasons_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_peripheralmodels`
--

DROP TABLE IF EXISTS `glpi_peripheralmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_peripheralmodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `required_units` int(11) NOT NULL DEFAULT 1,
  `depth` float NOT NULL DEFAULT 1,
  `power_connections` int(11) NOT NULL DEFAULT 0,
  `power_consumption` int(11) NOT NULL DEFAULT 0,
  `is_half_rack` tinyint(4) NOT NULL DEFAULT 0,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_peripheralmodels`
--

LOCK TABLES `glpi_peripheralmodels` WRITE;
/*!40000 ALTER TABLE `glpi_peripheralmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_peripheralmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_peripherals`
--

DROP TABLE IF EXISTS `glpi_peripherals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_peripherals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `peripheraltypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `peripheralmodels_id` int(10) unsigned NOT NULL DEFAULT 0,
  `brand` varchar(255) DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_global` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `peripheralmodels_id` (`peripheralmodels_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `peripheraltypes_id` (`peripheraltypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_peripherals`
--

LOCK TABLES `glpi_peripherals` WRITE;
/*!40000 ALTER TABLE `glpi_peripherals` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_peripherals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_peripheraltypes`
--

DROP TABLE IF EXISTS `glpi_peripheraltypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_peripheraltypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_peripheraltypes`
--

LOCK TABLES `glpi_peripheraltypes` WRITE;
/*!40000 ALTER TABLE `glpi_peripheraltypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_peripheraltypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_phonemodels`
--

DROP TABLE IF EXISTS `glpi_phonemodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_phonemodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_phonemodels`
--

LOCK TABLES `glpi_phonemodels` WRITE;
/*!40000 ALTER TABLE `glpi_phonemodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_phonemodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_phonepowersupplies`
--

DROP TABLE IF EXISTS `glpi_phonepowersupplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_phonepowersupplies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_phonepowersupplies`
--

LOCK TABLES `glpi_phonepowersupplies` WRITE;
/*!40000 ALTER TABLE `glpi_phonepowersupplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_phonepowersupplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_phones`
--

DROP TABLE IF EXISTS `glpi_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_phones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `phonetypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `phonemodels_id` int(10) unsigned NOT NULL DEFAULT 0,
  `brand` varchar(255) DEFAULT NULL,
  `phonepowersupplies_id` int(10) unsigned NOT NULL DEFAULT 0,
  `number_line` varchar(255) DEFAULT NULL,
  `have_headset` tinyint(4) NOT NULL DEFAULT 0,
  `have_hp` tinyint(4) NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_global` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `phonemodels_id` (`phonemodels_id`),
  KEY `phonepowersupplies_id` (`phonepowersupplies_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `phonetypes_id` (`phonetypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_phones`
--

LOCK TABLES `glpi_phones` WRITE;
/*!40000 ALTER TABLE `glpi_phones` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_phonetypes`
--

DROP TABLE IF EXISTS `glpi_phonetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_phonetypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_phonetypes`
--

LOCK TABLES `glpi_phonetypes` WRITE;
/*!40000 ALTER TABLE `glpi_phonetypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_phonetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_planningeventcategories`
--

DROP TABLE IF EXISTS `glpi_planningeventcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_planningeventcategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_planningeventcategories`
--

LOCK TABLES `glpi_planningeventcategories` WRITE;
/*!40000 ALTER TABLE `glpi_planningeventcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_planningeventcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_planningexternalevents`
--

DROP TABLE IF EXISTS `glpi_planningexternalevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_planningexternalevents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `planningexternaleventtemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 1,
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_guests` text DEFAULT NULL,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `rrule` text DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `planningeventcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `background` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `name` (`name`),
  KEY `planningexternaleventtemplates_id` (`planningexternaleventtemplates_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date` (`date`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `users_id` (`users_id`),
  KEY `groups_id` (`groups_id`),
  KEY `state` (`state`),
  KEY `planningeventcategories_id` (`planningeventcategories_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_planningexternalevents`
--

LOCK TABLES `glpi_planningexternalevents` WRITE;
/*!40000 ALTER TABLE `glpi_planningexternalevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_planningexternalevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_planningexternaleventtemplates`
--

DROP TABLE IF EXISTS `glpi_planningexternaleventtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_planningexternaleventtemplates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `text` mediumtext DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `before_time` int(11) NOT NULL DEFAULT 0,
  `rrule` text DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `planningeventcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `background` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `state` (`state`),
  KEY `planningeventcategories_id` (`planningeventcategories_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_planningexternaleventtemplates`
--

LOCK TABLES `glpi_planningexternaleventtemplates` WRITE;
/*!40000 ALTER TABLE `glpi_planningexternaleventtemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_planningexternaleventtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_planningrecalls`
--

DROP TABLE IF EXISTS `glpi_planningrecalls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_planningrecalls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `before_time` int(11) NOT NULL DEFAULT -10,
  `when` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`,`users_id`),
  KEY `users_id` (`users_id`),
  KEY `before_time` (`before_time`),
  KEY `when` (`when`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_planningrecalls`
--

LOCK TABLES `glpi_planningrecalls` WRITE;
/*!40000 ALTER TABLE `glpi_planningrecalls` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_planningrecalls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugins`
--

DROP TABLE IF EXISTS `glpi_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `directory` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `state` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php PLUGIN_* constant',
  `author` varchar(255) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`directory`),
  KEY `name` (`name`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugins`
--

LOCK TABLES `glpi_plugins` WRITE;
/*!40000 ALTER TABLE `glpi_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_plugs`
--

DROP TABLE IF EXISTS `glpi_plugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_plugs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_plugs`
--

LOCK TABLES `glpi_plugs` WRITE;
/*!40000 ALTER TABLE `glpi_plugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_plugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_printerlogs`
--

DROP TABLE IF EXISTS `glpi_printerlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_printerlogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `printers_id` int(10) unsigned NOT NULL,
  `total_pages` int(11) NOT NULL DEFAULT 0,
  `bw_pages` int(11) NOT NULL DEFAULT 0,
  `color_pages` int(11) NOT NULL DEFAULT 0,
  `rv_pages` int(11) NOT NULL DEFAULT 0,
  `prints` int(11) NOT NULL DEFAULT 0,
  `bw_prints` int(11) NOT NULL DEFAULT 0,
  `color_prints` int(11) NOT NULL DEFAULT 0,
  `copies` int(11) NOT NULL DEFAULT 0,
  `bw_copies` int(11) NOT NULL DEFAULT 0,
  `color_copies` int(11) NOT NULL DEFAULT 0,
  `scanned` int(11) NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `faxed` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`printers_id`,`date`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_printerlogs`
--

LOCK TABLES `glpi_printerlogs` WRITE;
/*!40000 ALTER TABLE `glpi_printerlogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_printerlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_printermodels`
--

DROP TABLE IF EXISTS `glpi_printermodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_printermodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `picture_front` text DEFAULT NULL,
  `picture_rear` text DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `product_number` (`product_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_printermodels`
--

LOCK TABLES `glpi_printermodels` WRITE;
/*!40000 ALTER TABLE `glpi_printermodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_printermodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_printers`
--

DROP TABLE IF EXISTS `glpi_printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_printers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `have_serial` tinyint(4) NOT NULL DEFAULT 0,
  `have_parallel` tinyint(4) NOT NULL DEFAULT 0,
  `have_usb` tinyint(4) NOT NULL DEFAULT 0,
  `have_wifi` tinyint(4) NOT NULL DEFAULT 0,
  `have_ethernet` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `memory_size` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `networks_id` int(10) unsigned NOT NULL DEFAULT 0,
  `printertypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `printermodels_id` int(10) unsigned NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_global` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `init_pages_counter` int(11) NOT NULL DEFAULT 0,
  `last_pages_counter` int(11) NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `sysdescr` text DEFAULT NULL,
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  `snmpcredentials_id` int(10) unsigned NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_global` (`is_global`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `printermodels_id` (`printermodels_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `printertypes_id` (`printertypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `last_pages_counter` (`last_pages_counter`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `uuid` (`uuid`),
  KEY `date_creation` (`date_creation`),
  KEY `snmpcredentials_id` (`snmpcredentials_id`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_printers`
--

LOCK TABLES `glpi_printers` WRITE;
/*!40000 ALTER TABLE `glpi_printers` DISABLE KEYS */;
INSERT INTO `glpi_printers` VALUES
(1,0,0,'Dot matrix printer 1','2025-01-27 13:11:42','','',0,0,'','',0,0,0,0,0,'','0',0,0,1,0,0,0,0,0,NULL,0,0,0,0,1,0.0000,0,'','2025-01-27 13:11:42','',NULL,0,0),
(2,0,0,'Jet printer operational','2025-01-27 13:12:07','','',0,0,'','',0,0,0,0,0,'','0',0,0,2,0,0,0,0,0,NULL,0,0,0,0,1,0.0000,0,'','2025-01-27 13:12:07','',NULL,0,0),
(3,0,0,'Jet printer defective','2025-01-27 13:12:20','','',0,0,'','',0,0,0,0,0,'','0',0,0,2,0,0,0,0,0,NULL,0,0,0,0,2,0.0000,0,'','2025-01-27 13:12:20','',NULL,0,0),
(4,0,0,'Laser printer 1','2025-01-27 13:12:31','','',0,0,'','',0,0,0,0,0,'','0',0,0,3,0,0,0,0,0,NULL,0,0,0,0,1,0.0000,0,'','2025-01-27 13:12:31','',NULL,0,0);
/*!40000 ALTER TABLE `glpi_printers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_printers_cartridgeinfos`
--

DROP TABLE IF EXISTS `glpi_printers_cartridgeinfos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_printers_cartridgeinfos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `printers_id` int(10) unsigned NOT NULL,
  `property` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `printers_id` (`printers_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_printers_cartridgeinfos`
--

LOCK TABLES `glpi_printers_cartridgeinfos` WRITE;
/*!40000 ALTER TABLE `glpi_printers_cartridgeinfos` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_printers_cartridgeinfos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_printertypes`
--

DROP TABLE IF EXISTS `glpi_printertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_printertypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_printertypes`
--

LOCK TABLES `glpi_printertypes` WRITE;
/*!40000 ALTER TABLE `glpi_printertypes` DISABLE KEYS */;
INSERT INTO `glpi_printertypes` VALUES
(1,'Dot matrix','','2025-01-27 13:11:00','2025-01-27 13:11:00'),
(2,'Inkjet','','2025-01-27 13:11:12','2025-01-27 13:11:12'),
(3,'Laser','','2025-01-27 13:11:27','2025-01-27 13:11:27');
/*!40000 ALTER TABLE `glpi_printertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_problemcosts`
--

DROP TABLE IF EXISTS `glpi_problemcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_problemcosts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `cost_time` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_material` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `budgets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `problems_id` (`problems_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_problemcosts`
--

LOCK TABLES `glpi_problemcosts` WRITE;
/*!40000 ALTER TABLE `glpi_problemcosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_problemcosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_problems`
--

DROP TABLE IF EXISTS `glpi_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_problems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `content` longtext DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `solvedate` timestamp NULL DEFAULT NULL,
  `closedate` timestamp NULL DEFAULT NULL,
  `time_to_resolve` timestamp NULL DEFAULT NULL,
  `users_id_recipient` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_lastupdater` int(10) unsigned NOT NULL DEFAULT 0,
  `urgency` int(11) NOT NULL DEFAULT 1,
  `impact` int(11) NOT NULL DEFAULT 1,
  `priority` int(11) NOT NULL DEFAULT 1,
  `itilcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `impactcontent` longtext DEFAULT NULL,
  `causecontent` longtext DEFAULT NULL,
  `symptomcontent` longtext DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `begin_waiting_date` timestamp NULL DEFAULT NULL,
  `waiting_duration` int(11) NOT NULL DEFAULT 0,
  `close_delay_stat` int(11) NOT NULL DEFAULT 0,
  `solve_delay_stat` int(11) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `date_mod` (`date_mod`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `solvedate` (`solvedate`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `time_to_resolve` (`time_to_resolve`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `date_creation` (`date_creation`),
  KEY `locations_id` (`locations_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_problems`
--

LOCK TABLES `glpi_problems` WRITE;
/*!40000 ALTER TABLE `glpi_problems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_problems_suppliers`
--

DROP TABLE IF EXISTS `glpi_problems_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_problems_suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `suppliers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 0,
  `alternative_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`suppliers_id`),
  KEY `group` (`suppliers_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_problems_suppliers`
--

LOCK TABLES `glpi_problems_suppliers` WRITE;
/*!40000 ALTER TABLE `glpi_problems_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_problems_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_problems_tickets`
--

DROP TABLE IF EXISTS `glpi_problems_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_problems_tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tickets_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`tickets_id`),
  KEY `tickets_id` (`tickets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_problems_tickets`
--

LOCK TABLES `glpi_problems_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_problems_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_problems_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_problems_users`
--

DROP TABLE IF EXISTS `glpi_problems_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_problems_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 0,
  `alternative_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problems_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_problems_users`
--

LOCK TABLES `glpi_problems_users` WRITE;
/*!40000 ALTER TABLE `glpi_problems_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_problems_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_problemtasks`
--

DROP TABLE IF EXISTS `glpi_problemtasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_problemtasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `problems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `taskcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_editor` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `state` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `tasktemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  `is_private` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `problems_id` (`problems_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `state` (`state`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `tasktemplates_id` (`tasktemplates_id`),
  KEY `is_private` (`is_private`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_problemtasks`
--

LOCK TABLES `glpi_problemtasks` WRITE;
/*!40000 ALTER TABLE `glpi_problemtasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_problemtasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_problemtemplatehiddenfields`
--

DROP TABLE IF EXISTS `glpi_problemtemplatehiddenfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_problemtemplatehiddenfields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problemtemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problemtemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_problemtemplatehiddenfields`
--

LOCK TABLES `glpi_problemtemplatehiddenfields` WRITE;
/*!40000 ALTER TABLE `glpi_problemtemplatehiddenfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_problemtemplatehiddenfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_problemtemplatemandatoryfields`
--

DROP TABLE IF EXISTS `glpi_problemtemplatemandatoryfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_problemtemplatemandatoryfields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problemtemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`problemtemplates_id`,`num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_problemtemplatemandatoryfields`
--

LOCK TABLES `glpi_problemtemplatemandatoryfields` WRITE;
/*!40000 ALTER TABLE `glpi_problemtemplatemandatoryfields` DISABLE KEYS */;
INSERT INTO `glpi_problemtemplatemandatoryfields` VALUES
(1,1,21);
/*!40000 ALTER TABLE `glpi_problemtemplatemandatoryfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_problemtemplatepredefinedfields`
--

DROP TABLE IF EXISTS `glpi_problemtemplatepredefinedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_problemtemplatepredefinedfields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problemtemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `problemtemplates_id` (`problemtemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_problemtemplatepredefinedfields`
--

LOCK TABLES `glpi_problemtemplatepredefinedfields` WRITE;
/*!40000 ALTER TABLE `glpi_problemtemplatepredefinedfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_problemtemplatepredefinedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_problemtemplates`
--

DROP TABLE IF EXISTS `glpi_problemtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_problemtemplates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_problemtemplates`
--

LOCK TABLES `glpi_problemtemplates` WRITE;
/*!40000 ALTER TABLE `glpi_problemtemplates` DISABLE KEYS */;
INSERT INTO `glpi_problemtemplates` VALUES
(1,'Default',0,1,NULL);
/*!40000 ALTER TABLE `glpi_problemtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_profilerights`
--

DROP TABLE IF EXISTS `glpi_profilerights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_profilerights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profiles_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `rights` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`profiles_id`,`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=754 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_profilerights`
--

LOCK TABLES `glpi_profilerights` WRITE;
/*!40000 ALTER TABLE `glpi_profilerights` DISABLE KEYS */;
INSERT INTO `glpi_profilerights` VALUES
(1,1,'computer',0),
(2,1,'monitor',0),
(3,1,'software',0),
(4,1,'networking',0),
(5,1,'internet',0),
(6,1,'printer',0),
(7,1,'peripheral',0),
(8,1,'cartridge',0),
(9,1,'consumable',0),
(10,1,'phone',0),
(11,6,'queuednotification',0),
(12,1,'contact_enterprise',0),
(13,1,'document',0),
(14,1,'contract',0),
(15,1,'infocom',0),
(16,1,'knowbase',2048),
(17,1,'reservation',1024),
(18,1,'reports',0),
(19,1,'dropdown',0),
(20,1,'device',0),
(21,1,'typedoc',0),
(22,1,'link',0),
(23,1,'config',0),
(24,1,'rule_ticket',0),
(25,1,'rule_import',0),
(26,1,'rule_location',0),
(27,1,'rule_ldap',0),
(28,1,'rule_softwarecategories',0),
(29,1,'search_config',0),
(30,5,'location',0),
(31,7,'domain',31),
(32,1,'profile',0),
(33,1,'user',0),
(34,1,'group',0),
(35,1,'entity',0),
(36,1,'transfer',0),
(37,1,'logs',0),
(38,1,'reminder_public',1),
(39,1,'rssfeed_public',1),
(40,1,'bookmark_public',0),
(41,1,'backup',0),
(42,1,'ticket',5),
(43,1,'followup',5),
(44,1,'task',1),
(45,1,'planning',0),
(46,2,'state',0),
(47,2,'taskcategory',0),
(48,1,'statistic',0),
(49,1,'password_update',1),
(50,1,'show_group_hardware',0),
(51,1,'rule_dictionnary_software',0),
(52,1,'rule_dictionnary_dropdown',0),
(53,1,'budget',0),
(54,1,'notification',0),
(55,1,'rule_mailcollector',0),
(56,7,'solutiontemplate',23),
(57,7,'itilfollowuptemplate',23),
(58,1,'calendar',0),
(59,1,'slm',0),
(60,1,'rule_dictionnary_printer',0),
(61,1,'problem',0),
(62,2,'cable_management',0),
(63,4,'knowbasecategory',23),
(64,5,'itilcategory',0),
(65,1,'itiltemplate',0),
(66,1,'ticketrecurrent',0),
(67,1,'ticketcost',0),
(68,6,'changevalidation',20),
(69,1,'ticketvalidation',0),
(70,2,'computer',33),
(71,2,'monitor',33),
(72,2,'software',33),
(73,2,'networking',33),
(74,2,'internet',1),
(75,2,'printer',33),
(76,2,'peripheral',33),
(77,2,'cartridge',33),
(78,2,'consumable',33),
(79,2,'phone',33),
(80,5,'queuednotification',0),
(81,2,'contact_enterprise',33),
(82,2,'document',33),
(83,2,'contract',33),
(84,2,'infocom',1),
(85,2,'knowbase',10241),
(86,2,'reservation',1025),
(87,2,'reports',1),
(88,2,'dropdown',0),
(89,2,'device',0),
(90,2,'typedoc',1),
(91,2,'link',1),
(92,2,'config',0),
(93,2,'rule_ticket',0),
(94,2,'rule_import',0),
(95,2,'rule_location',0),
(96,2,'rule_ldap',0),
(97,2,'rule_softwarecategories',0),
(98,2,'search_config',1024),
(99,4,'location',23),
(100,6,'domain',0),
(101,2,'profile',0),
(102,2,'user',2049),
(103,2,'group',33),
(104,2,'entity',0),
(105,2,'transfer',0),
(106,2,'logs',0),
(107,2,'reminder_public',129),
(108,2,'rssfeed_public',129),
(109,2,'bookmark_public',0),
(110,2,'backup',0),
(111,2,'ticket',168989),
(112,2,'followup',5),
(113,2,'task',1),
(114,6,'projecttask',1025),
(115,7,'projecttask',1025),
(116,2,'planning',1),
(117,1,'state',0),
(118,1,'taskcategory',0),
(119,2,'statistic',1),
(120,2,'password_update',1),
(121,2,'show_group_hardware',0),
(122,2,'rule_dictionnary_software',0),
(123,2,'rule_dictionnary_dropdown',0),
(124,2,'budget',33),
(125,2,'notification',0),
(126,2,'rule_mailcollector',0),
(127,5,'solutiontemplate',0),
(128,5,'itilfollowuptemplate',0),
(129,6,'solutiontemplate',0),
(130,6,'itilfollowuptemplate',0),
(131,2,'calendar',0),
(132,2,'slm',0),
(133,2,'rule_dictionnary_printer',0),
(134,2,'problem',1057),
(135,1,'cable_management',0),
(136,3,'knowbasecategory',23),
(137,4,'itilcategory',23),
(138,2,'itiltemplate',0),
(139,2,'ticketrecurrent',0),
(140,2,'ticketcost',1),
(141,4,'changevalidation',1044),
(142,5,'changevalidation',20),
(143,2,'ticketvalidation',15376),
(144,3,'computer',127),
(145,3,'monitor',127),
(146,3,'software',127),
(147,3,'networking',127),
(148,3,'internet',31),
(149,3,'printer',127),
(150,3,'peripheral',127),
(151,3,'cartridge',127),
(152,3,'consumable',127),
(153,3,'phone',127),
(154,4,'queuednotification',31),
(155,3,'contact_enterprise',127),
(156,3,'document',127),
(157,3,'contract',127),
(158,3,'infocom',23),
(159,3,'knowbase',14359),
(160,3,'reservation',1055),
(161,3,'reports',1),
(162,3,'dropdown',23),
(163,3,'device',23),
(164,3,'typedoc',23),
(165,3,'link',23),
(166,3,'config',0),
(167,3,'rule_ticket',1047),
(168,3,'rule_import',0),
(169,3,'rule_location',0),
(170,3,'rule_ldap',0),
(171,3,'rule_softwarecategories',0),
(172,3,'search_config',3072),
(173,3,'location',23),
(174,5,'domain',0),
(175,3,'profile',1),
(176,3,'user',7199),
(177,3,'group',119),
(178,3,'entity',33),
(179,3,'transfer',1),
(180,3,'logs',1),
(181,3,'reminder_public',151),
(182,3,'rssfeed_public',151),
(183,3,'bookmark_public',23),
(184,3,'backup',1024),
(185,3,'ticket',261151),
(186,3,'followup',31767),
(187,3,'task',13329),
(188,3,'projecttask',1121),
(189,4,'projecttask',1121),
(190,5,'projecttask',0),
(191,3,'planning',3073),
(192,7,'taskcategory',23),
(193,7,'cable_management',31),
(194,3,'statistic',1),
(195,3,'password_update',1),
(196,3,'show_group_hardware',0),
(197,3,'rule_dictionnary_software',0),
(198,3,'rule_dictionnary_dropdown',0),
(199,3,'budget',127),
(200,3,'notification',0),
(201,3,'rule_mailcollector',23),
(202,3,'solutiontemplate',23),
(203,3,'itilfollowuptemplate',23),
(204,4,'solutiontemplate',23),
(205,4,'itilfollowuptemplate',23),
(206,3,'calendar',23),
(207,3,'slm',23),
(208,3,'rule_dictionnary_printer',0),
(209,3,'problem',1151),
(210,2,'knowbasecategory',0),
(211,3,'itilcategory',23),
(212,3,'itiltemplate',23),
(213,3,'ticketrecurrent',1),
(214,3,'ticketcost',23),
(215,2,'changevalidation',1044),
(216,3,'changevalidation',1044),
(217,3,'ticketvalidation',15376),
(218,4,'computer',255),
(219,4,'monitor',255),
(220,4,'software',255),
(221,4,'networking',255),
(222,4,'internet',159),
(223,4,'printer',255),
(224,4,'peripheral',255),
(225,4,'cartridge',255),
(226,4,'consumable',255),
(227,4,'phone',255),
(228,4,'contact_enterprise',255),
(229,4,'document',255),
(230,4,'contract',255),
(231,4,'infocom',23),
(232,4,'knowbase',15383),
(233,4,'reservation',1055),
(234,4,'reports',1),
(235,4,'dropdown',23),
(236,4,'device',23),
(237,4,'typedoc',23),
(238,4,'link',159),
(239,4,'config',3),
(240,4,'rule_ticket',1047),
(241,4,'rule_import',23),
(242,4,'rule_location',23),
(243,4,'rule_ldap',23),
(244,4,'rule_softwarecategories',23),
(245,4,'search_config',3072),
(246,2,'location',0),
(247,4,'domain',31),
(248,4,'profile',23),
(249,4,'user',7327),
(250,4,'group',119),
(251,4,'entity',3327),
(252,4,'transfer',23),
(253,4,'logs',1),
(254,4,'reminder_public',159),
(255,4,'rssfeed_public',159),
(256,4,'bookmark_public',23),
(257,4,'backup',1045),
(258,4,'ticket',261151),
(259,4,'followup',31767),
(260,4,'task',13329),
(261,7,'project',1151),
(262,1,'projecttask',0),
(263,2,'projecttask',1025),
(264,4,'planning',3073),
(265,6,'taskcategory',0),
(266,6,'cable_management',0),
(267,4,'statistic',1),
(268,4,'password_update',1),
(269,4,'show_group_hardware',1),
(270,4,'rule_dictionnary_software',23),
(271,4,'rule_dictionnary_dropdown',23),
(272,4,'budget',127),
(273,4,'notification',23),
(274,4,'rule_mailcollector',23),
(275,1,'solutiontemplate',0),
(276,1,'itilfollowuptemplate',0),
(277,2,'solutiontemplate',0),
(278,2,'itilfollowuptemplate',0),
(279,4,'calendar',23),
(280,4,'slm',23),
(281,4,'rule_dictionnary_printer',23),
(282,4,'problem',1151),
(283,1,'knowbasecategory',0),
(284,2,'itilcategory',0),
(285,4,'itiltemplate',23),
(286,4,'ticketrecurrent',23),
(287,4,'ticketcost',23),
(288,7,'change',1151),
(289,1,'changevalidation',0),
(290,4,'ticketvalidation',15376),
(291,5,'computer',0),
(292,5,'monitor',0),
(293,5,'software',0),
(294,5,'networking',0),
(295,5,'internet',0),
(296,5,'printer',0),
(297,5,'peripheral',0),
(298,5,'cartridge',0),
(299,5,'consumable',0),
(300,5,'phone',0),
(301,3,'queuednotification',0),
(302,5,'contact_enterprise',0),
(303,5,'document',0),
(304,5,'contract',0),
(305,5,'infocom',0),
(306,5,'knowbase',10240),
(307,5,'reservation',0),
(308,5,'reports',0),
(309,5,'dropdown',0),
(310,5,'device',0),
(311,5,'typedoc',0),
(312,5,'link',0),
(313,5,'config',0),
(314,5,'rule_ticket',0),
(315,5,'rule_import',0),
(316,5,'rule_location',0),
(317,5,'rule_ldap',0),
(318,5,'rule_softwarecategories',0),
(319,5,'search_config',0),
(320,1,'location',0),
(321,3,'domain',31),
(322,5,'profile',0),
(323,5,'user',1025),
(324,5,'group',0),
(325,5,'entity',0),
(326,5,'transfer',0),
(327,5,'logs',0),
(328,5,'reminder_public',128),
(329,5,'rssfeed_public',128),
(330,5,'bookmark_public',0),
(331,5,'backup',0),
(332,5,'ticket',140295),
(333,5,'followup',12295),
(334,5,'task',8193),
(335,4,'project',1151),
(336,5,'project',1151),
(337,6,'project',1151),
(338,5,'planning',1),
(339,5,'taskcategory',0),
(340,5,'cable_management',0),
(341,5,'statistic',1),
(342,5,'password_update',1),
(343,5,'show_group_hardware',0),
(344,5,'rule_dictionnary_software',0),
(345,5,'rule_dictionnary_dropdown',0),
(346,5,'budget',0),
(347,5,'notification',0),
(348,5,'rule_mailcollector',0),
(349,6,'state',0),
(350,7,'state',23),
(351,5,'calendar',0),
(352,5,'slm',0),
(353,5,'rule_dictionnary_printer',0),
(354,5,'problem',1024),
(355,7,'knowbasecategory',23),
(356,1,'itilcategory',0),
(357,5,'itiltemplate',0),
(358,5,'ticketrecurrent',0),
(359,5,'ticketcost',23),
(360,5,'change',1054),
(361,6,'change',1151),
(362,5,'ticketvalidation',3088),
(363,6,'computer',127),
(364,6,'monitor',127),
(365,6,'software',127),
(366,6,'networking',127),
(367,6,'internet',31),
(368,6,'printer',127),
(369,6,'peripheral',127),
(370,6,'cartridge',127),
(371,6,'consumable',127),
(372,6,'phone',127),
(373,2,'queuednotification',0),
(374,6,'contact_enterprise',96),
(375,6,'document',127),
(376,6,'contract',96),
(377,6,'infocom',0),
(378,6,'knowbase',14359),
(379,6,'reservation',1055),
(380,6,'reports',1),
(381,6,'dropdown',0),
(382,6,'device',0),
(383,6,'typedoc',0),
(384,6,'link',0),
(385,6,'config',0),
(386,6,'rule_ticket',0),
(387,6,'rule_import',0),
(388,6,'rule_location',0),
(389,6,'rule_ldap',0),
(390,6,'rule_softwarecategories',0),
(391,6,'search_config',0),
(392,2,'domain',0),
(393,6,'profile',0),
(394,6,'user',1055),
(395,6,'group',1),
(396,6,'entity',33),
(397,6,'transfer',1),
(398,6,'logs',0),
(399,6,'reminder_public',151),
(400,6,'rssfeed_public',151),
(401,6,'bookmark_public',0),
(402,6,'backup',0),
(403,6,'ticket',166919),
(404,6,'followup',13319),
(405,6,'task',13329),
(406,1,'project',0),
(407,2,'project',1025),
(408,3,'project',1151),
(409,6,'planning',1),
(410,4,'taskcategory',23),
(411,4,'cable_management',31),
(412,6,'statistic',1),
(413,6,'password_update',1),
(414,6,'show_group_hardware',0),
(415,6,'rule_dictionnary_software',0),
(416,6,'rule_dictionnary_dropdown',0),
(417,6,'budget',96),
(418,6,'notification',0),
(419,6,'rule_mailcollector',0),
(420,4,'state',23),
(421,5,'state',0),
(422,6,'calendar',0),
(423,6,'slm',1),
(424,6,'rule_dictionnary_printer',0),
(425,6,'problem',1121),
(426,6,'knowbasecategory',0),
(427,7,'itilcategory',23),
(428,7,'location',23),
(429,6,'itiltemplate',1),
(430,6,'ticketrecurrent',1),
(431,6,'ticketcost',23),
(432,3,'change',1151),
(433,4,'change',1151),
(434,6,'ticketvalidation',3088),
(435,7,'computer',127),
(436,7,'monitor',127),
(437,7,'software',127),
(438,7,'networking',127),
(439,7,'internet',31),
(440,7,'printer',127),
(441,7,'peripheral',127),
(442,7,'cartridge',127),
(443,7,'consumable',127),
(444,7,'phone',127),
(445,1,'queuednotification',0),
(446,7,'contact_enterprise',96),
(447,7,'document',127),
(448,7,'contract',96),
(449,7,'infocom',0),
(450,7,'knowbase',14359),
(451,7,'reservation',1055),
(452,7,'reports',1),
(453,7,'dropdown',0),
(454,7,'device',0),
(455,7,'typedoc',0),
(456,7,'link',0),
(457,7,'config',0),
(458,7,'rule_ticket',1047),
(459,7,'rule_import',0),
(460,7,'rule_location',0),
(461,7,'rule_ldap',0),
(462,7,'rule_softwarecategories',0),
(463,7,'search_config',0),
(464,1,'domain',0),
(465,7,'profile',0),
(466,7,'user',1055),
(467,7,'group',1),
(468,7,'entity',33),
(469,7,'transfer',1),
(470,7,'logs',1),
(471,7,'reminder_public',151),
(472,7,'rssfeed_public',151),
(473,7,'bookmark_public',0),
(474,7,'backup',0),
(475,7,'ticket',261151),
(476,7,'followup',31767),
(477,7,'task',13329),
(478,7,'queuednotification',0),
(479,7,'planning',3073),
(480,3,'taskcategory',23),
(481,3,'cable_management',31),
(482,7,'statistic',1),
(483,7,'password_update',1),
(484,7,'show_group_hardware',0),
(485,7,'rule_dictionnary_software',0),
(486,7,'rule_dictionnary_dropdown',0),
(487,7,'budget',96),
(488,7,'notification',0),
(489,7,'rule_mailcollector',23),
(490,7,'changevalidation',1044),
(491,3,'state',23),
(492,7,'calendar',23),
(493,7,'slm',23),
(494,7,'rule_dictionnary_printer',0),
(495,7,'problem',1151),
(496,5,'knowbasecategory',0),
(497,6,'itilcategory',0),
(498,6,'location',0),
(499,7,'itiltemplate',23),
(500,7,'ticketrecurrent',1),
(501,7,'ticketcost',23),
(502,1,'change',0),
(503,2,'change',1057),
(504,7,'ticketvalidation',15376),
(505,8,'backup',1),
(506,8,'bookmark_public',1),
(507,8,'budget',33),
(508,8,'calendar',1),
(509,8,'cartridge',33),
(510,8,'change',1057),
(511,8,'changevalidation',0),
(512,8,'computer',33),
(513,8,'config',1),
(514,8,'consumable',33),
(515,8,'contact_enterprise',33),
(516,8,'contract',33),
(517,8,'device',1),
(518,8,'document',33),
(519,8,'domain',1),
(520,8,'dropdown',1),
(521,8,'entity',33),
(522,8,'followup',8193),
(523,8,'global_validation',0),
(524,8,'group',33),
(525,8,'infocom',1),
(526,8,'internet',1),
(527,8,'itilcategory',1),
(528,8,'knowbase',10241),
(529,8,'knowbasecategory',1),
(530,8,'link',1),
(531,8,'location',1),
(532,8,'logs',1),
(533,8,'monitor',33),
(534,8,'cable_management',1),
(535,8,'networking',33),
(536,8,'notification',1),
(537,8,'password_update',0),
(538,8,'peripheral',33),
(539,8,'phone',33),
(540,8,'planning',3073),
(541,8,'printer',33),
(542,8,'problem',1057),
(543,8,'profile',1),
(544,8,'project',1057),
(545,8,'projecttask',33),
(546,8,'queuednotification',1),
(547,8,'reminder_public',1),
(548,8,'reports',1),
(549,8,'reservation',129),
(550,8,'rssfeed_public',129),
(551,8,'rule_dictionnary_dropdown',1),
(552,8,'rule_dictionnary_printer',1),
(553,8,'rule_dictionnary_software',1),
(554,8,'rule_import',1),
(555,8,'rule_location',1),
(556,8,'rule_ldap',1),
(557,8,'rule_mailcollector',1),
(558,8,'rule_softwarecategories',1),
(559,8,'rule_ticket',1),
(560,8,'search_config',0),
(561,8,'show_group_hardware',1),
(562,8,'slm',1),
(563,8,'software',33),
(564,8,'solutiontemplate',1),
(565,8,'itilfollowuptemplate',1),
(566,8,'state',1),
(567,8,'statistic',1),
(568,8,'task',8193),
(569,8,'taskcategory',1),
(570,8,'ticket',138241),
(571,8,'ticketcost',1),
(572,8,'ticketrecurrent',1),
(573,8,'itiltemplate',1),
(574,8,'ticketvalidation',0),
(575,8,'transfer',1),
(576,8,'typedoc',1),
(577,8,'user',1),
(578,1,'license',0),
(579,2,'license',33),
(580,3,'license',127),
(581,4,'license',255),
(582,5,'license',0),
(583,6,'license',127),
(584,7,'license',127),
(585,8,'license',33),
(586,1,'line',0),
(587,2,'line',33),
(588,3,'line',127),
(589,4,'line',255),
(590,5,'line',0),
(591,6,'line',127),
(592,7,'line',127),
(593,8,'line',33),
(594,1,'lineoperator',0),
(595,2,'lineoperator',33),
(596,3,'lineoperator',23),
(597,4,'lineoperator',23),
(598,5,'lineoperator',0),
(599,6,'lineoperator',0),
(600,7,'lineoperator',23),
(601,8,'lineoperator',1),
(602,1,'devicesimcard_pinpuk',0),
(603,2,'devicesimcard_pinpuk',1),
(604,3,'devicesimcard_pinpuk',3),
(605,4,'devicesimcard_pinpuk',3),
(606,5,'devicesimcard_pinpuk',0),
(607,6,'devicesimcard_pinpuk',3),
(608,7,'devicesimcard_pinpuk',3),
(609,8,'devicesimcard_pinpuk',1),
(610,1,'certificate',0),
(611,2,'certificate',33),
(612,3,'certificate',127),
(613,4,'certificate',255),
(614,5,'certificate',0),
(615,6,'certificate',127),
(616,7,'certificate',127),
(617,8,'certificate',33),
(618,1,'datacenter',0),
(619,2,'datacenter',1),
(620,3,'datacenter',31),
(621,4,'datacenter',31),
(622,5,'datacenter',0),
(623,6,'datacenter',31),
(624,7,'datacenter',31),
(625,8,'datacenter',1),
(626,4,'rule_asset',1047),
(627,1,'personalization',3),
(628,2,'personalization',3),
(629,3,'personalization',3),
(630,4,'personalization',3),
(631,5,'personalization',3),
(632,6,'personalization',3),
(633,7,'personalization',3),
(634,8,'personalization',3),
(635,1,'rule_asset',0),
(636,2,'rule_asset',0),
(637,3,'rule_asset',0),
(638,5,'rule_asset',0),
(639,6,'rule_asset',0),
(640,7,'rule_asset',0),
(641,8,'rule_asset',0),
(642,1,'global_validation',0),
(643,2,'global_validation',0),
(644,3,'global_validation',0),
(645,4,'global_validation',0),
(646,5,'global_validation',0),
(647,6,'global_validation',0),
(648,7,'global_validation',0),
(649,1,'cluster',0),
(650,2,'cluster',1),
(651,3,'cluster',31),
(652,4,'cluster',31),
(653,5,'cluster',0),
(654,6,'cluster',31),
(655,7,'cluster',31),
(656,8,'cluster',1),
(657,1,'externalevent',0),
(658,2,'externalevent',1),
(659,3,'externalevent',1055),
(660,4,'externalevent',1055),
(661,5,'externalevent',0),
(662,6,'externalevent',1),
(663,7,'externalevent',31),
(664,8,'externalevent',1),
(665,1,'dashboard',0),
(666,2,'dashboard',0),
(667,3,'dashboard',0),
(668,4,'dashboard',23),
(669,5,'dashboard',0),
(670,6,'dashboard',0),
(671,7,'dashboard',0),
(672,8,'dashboard',0),
(673,1,'appliance',0),
(674,2,'appliance',1),
(675,3,'appliance',31),
(676,4,'appliance',31),
(677,5,'appliance',0),
(678,6,'appliance',31),
(679,7,'appliance',31),
(680,8,'appliance',1),
(681,1,'inventory',0),
(682,2,'inventory',0),
(683,3,'inventory',3073),
(684,4,'inventory',3073),
(685,5,'inventory',0),
(686,6,'inventory',0),
(687,7,'inventory',0),
(688,8,'inventory',0),
(689,1,'pendingreason',0),
(690,2,'pendingreason',0),
(691,3,'pendingreason',31),
(692,4,'pendingreason',31),
(693,5,'pendingreason',1),
(694,6,'pendingreason',1),
(695,7,'pendingreason',1),
(696,8,'pendingreason',1),
(697,1,'database',0),
(698,2,'database',1),
(699,3,'database',31),
(700,4,'database',31),
(701,5,'database',0),
(702,6,'database',31),
(703,7,'database',31),
(704,8,'database',1),
(705,1,'recurrentchange',0),
(706,2,'recurrentchange',0),
(707,3,'recurrentchange',1),
(708,4,'recurrentchange',31),
(709,5,'recurrentchange',0),
(710,6,'recurrentchange',1),
(711,7,'recurrentchange',1),
(712,8,'recurrentchange',1),
(713,1,'locked_field',0),
(714,2,'locked_field',0),
(715,3,'locked_field',0),
(716,4,'locked_field',6),
(717,5,'locked_field',0),
(718,6,'locked_field',0),
(719,7,'locked_field',0),
(720,8,'locked_field',0),
(721,1,'snmpcredential',0),
(722,2,'snmpcredential',0),
(723,3,'snmpcredential',0),
(724,4,'snmpcredential',31),
(725,5,'snmpcredential',0),
(726,6,'snmpcredential',0),
(727,7,'snmpcredential',0),
(728,8,'snmpcredential',0),
(729,1,'refusedequipment',0),
(730,2,'refusedequipment',0),
(731,3,'refusedequipment',0),
(732,4,'refusedequipment',19),
(733,5,'refusedequipment',0),
(734,6,'refusedequipment',0),
(735,7,'refusedequipment',0),
(736,8,'refusedequipment',0),
(737,1,'agent',0),
(738,2,'agent',0),
(739,3,'agent',0),
(740,4,'agent',19),
(741,5,'agent',0),
(742,6,'agent',0),
(743,7,'agent',0),
(744,8,'agent',0),
(745,1,'unmanaged',0),
(746,2,'unmanaged',0),
(747,3,'unmanaged',0),
(748,4,'unmanaged',27),
(749,5,'unmanaged',0),
(750,6,'unmanaged',0),
(751,7,'unmanaged',0),
(752,8,'unmanaged',0),
(753,4,'system_logs',1);
/*!40000 ALTER TABLE `glpi_profilerights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_profiles`
--

DROP TABLE IF EXISTS `glpi_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `interface` varchar(255) DEFAULT 'helpdesk',
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `helpdesk_hardware` int(11) NOT NULL DEFAULT 0,
  `helpdesk_item_type` text DEFAULT NULL,
  `ticket_status` text DEFAULT NULL COMMENT 'json encoded array of from/dest allowed status change',
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `problem_status` text DEFAULT NULL COMMENT 'json encoded array of from/dest allowed status change',
  `create_ticket_on_login` tinyint(4) NOT NULL DEFAULT 0,
  `tickettemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `changetemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `problemtemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `change_status` text DEFAULT NULL COMMENT 'json encoded array of from/dest allowed status change',
  `managed_domainrecordtypes` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `interface` (`interface`),
  KEY `is_default` (`is_default`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `tickettemplates_id` (`tickettemplates_id`),
  KEY `changetemplates_id` (`changetemplates_id`),
  KEY `problemtemplates_id` (`problemtemplates_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_profiles`
--

LOCK TABLES `glpi_profiles` WRITE;
/*!40000 ALTER TABLE `glpi_profiles` DISABLE KEYS */;
INSERT INTO `glpi_profiles` VALUES
(1,'Self-Service','helpdesk',1,1,'[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]','{\"1\":{\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"2\":{\"1\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"3\":{\"1\":0,\"2\":0,\"4\":0,\"5\":0,\"6\":0},\"4\":{\"1\":0,\"2\":0,\"3\":0,\"5\":0,\"6\":0},\"5\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0},\"6\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}}',NULL,'','[]',0,0,0,0,NULL,'[]',NULL),
(2,'Observer','central',0,1,'[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]','[]',NULL,'','[]',0,0,0,0,NULL,'[]',NULL),
(3,'Admin','central',0,3,'[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]','[]',NULL,'','[]',0,0,0,0,NULL,'[-1]',NULL),
(4,'Super-Admin','central',0,3,'[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]','[]',NULL,'','[]',0,0,0,0,NULL,'[-1]',NULL),
(5,'Hotliner','central',0,3,'[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]','[]',NULL,'','[]',1,0,0,0,NULL,'[]',NULL),
(6,'Technician','central',0,3,'[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]','[]',NULL,'','[]',0,0,0,0,NULL,'[]',NULL),
(7,'Supervisor','central',0,3,'[\"Computer\",\"Monitor\",\"NetworkEquipment\",\"Peripheral\",\"Phone\",\"Printer\",\"Software\", \"DCRoom\", \"Rack\", \"Enclosure\", \"Database\"]','[]',NULL,'','[]',0,0,0,0,NULL,'[]',NULL),
(8,'Read-Only','central',0,0,'[]','{\"1\":{\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"2\":{\"1\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"3\":{\"1\":0,\"2\":0,\"4\":0,\"5\":0,\"6\":0},\"4\":{\"1\":0,\"2\":0,\"3\":0,\"5\":0,\"6\":0},\"5\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"6\":0},\"6\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0}}',NULL,'This profile defines read-only access. It is used when objects are locked. It can also be used to give to users rights to unlock objects.','{\"1\":{\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\"7\":{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\"2\":{\"1\":0,\"7\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\"3\":{\"1\":0,\"7\":0,\"2\":0,\"4\":0,\"5\":0,\"8\":0,\"6\":0},\"4\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"5\":0,\"8\":0,\"6\":0},\"5\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"8\":0,\"6\":0},\"8\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0},\"6\":{\"1\":0,\"7\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"8\":0}}',0,0,0,0,'{\"1\":{\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"9\":{\"1\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"10\":{\"1\":0,\"9\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"7\":{\"1\":0,\"9\":0,\"10\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"4\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"11\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"12\":0,\"5\":0,\"8\":0,\"6\":0},\"12\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"5\":0,\"8\":0,\"6\":0},\"5\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"8\":0,\"6\":0},\"8\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"6\":0},\"6\":{\"1\":0,\"9\":0,\"10\":0,\"7\":0,\"4\":0,\"11\":0,\"12\":0,\"5\":0,\"8\":0}}','[]',NULL);
/*!40000 ALTER TABLE `glpi_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_profiles_reminders`
--

DROP TABLE IF EXISTS `glpi_profiles_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_profiles_reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reminders_id` int(10) unsigned NOT NULL DEFAULT 0,
  `profiles_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_profiles_reminders`
--

LOCK TABLES `glpi_profiles_reminders` WRITE;
/*!40000 ALTER TABLE `glpi_profiles_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_profiles_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_profiles_rssfeeds`
--

DROP TABLE IF EXISTS `glpi_profiles_rssfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_profiles_rssfeeds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int(10) unsigned NOT NULL DEFAULT 0,
  `profiles_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `no_entity_restriction` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_profiles_rssfeeds`
--

LOCK TABLES `glpi_profiles_rssfeeds` WRITE;
/*!40000 ALTER TABLE `glpi_profiles_rssfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_profiles_rssfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_profiles_users`
--

DROP TABLE IF EXISTS `glpi_profiles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_profiles_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `profiles_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 1,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `is_default_profile` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `users_id` (`users_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_profiles_users`
--

LOCK TABLES `glpi_profiles_users` WRITE;
/*!40000 ALTER TABLE `glpi_profiles_users` DISABLE KEYS */;
INSERT INTO `glpi_profiles_users` VALUES
(2,2,4,0,1,0,0),
(3,3,1,0,1,0,0),
(4,4,6,0,1,0,0),
(5,5,2,0,1,0,0),
(6,4,4,0,0,0,0);
/*!40000 ALTER TABLE `glpi_profiles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projectcosts`
--

DROP TABLE IF EXISTS `glpi_projectcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projectcosts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projects_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `cost` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `budgets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `projects_id` (`projects_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projectcosts`
--

LOCK TABLES `glpi_projectcosts` WRITE;
/*!40000 ALTER TABLE `glpi_projectcosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projectcosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projects`
--

DROP TABLE IF EXISTS `glpi_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 1,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `projects_id` int(10) unsigned NOT NULL DEFAULT 0,
  `projectstates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `projecttypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `plan_start_date` timestamp NULL DEFAULT NULL,
  `plan_end_date` timestamp NULL DEFAULT NULL,
  `real_start_date` timestamp NULL DEFAULT NULL,
  `real_end_date` timestamp NULL DEFAULT NULL,
  `percent_done` int(11) NOT NULL DEFAULT 0,
  `auto_percent_done` tinyint(4) NOT NULL DEFAULT 0,
  `show_on_global_gantt` tinyint(4) NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `projecttemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `code` (`code`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_deleted` (`is_deleted`),
  KEY `projects_id` (`projects_id`),
  KEY `projectstates_id` (`projectstates_id`),
  KEY `projecttypes_id` (`projecttypes_id`),
  KEY `priority` (`priority`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `users_id` (`users_id`),
  KEY `groups_id` (`groups_id`),
  KEY `plan_start_date` (`plan_start_date`),
  KEY `plan_end_date` (`plan_end_date`),
  KEY `real_start_date` (`real_start_date`),
  KEY `real_end_date` (`real_end_date`),
  KEY `percent_done` (`percent_done`),
  KEY `show_on_global_gantt` (`show_on_global_gantt`),
  KEY `date_creation` (`date_creation`),
  KEY `projecttemplates_id` (`projecttemplates_id`),
  KEY `is_template` (`is_template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projects`
--

LOCK TABLES `glpi_projects` WRITE;
/*!40000 ALTER TABLE `glpi_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projectstates`
--

DROP TABLE IF EXISTS `glpi_projectstates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projectstates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `is_finished` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_finished` (`is_finished`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projectstates`
--

LOCK TABLES `glpi_projectstates` WRITE;
/*!40000 ALTER TABLE `glpi_projectstates` DISABLE KEYS */;
INSERT INTO `glpi_projectstates` VALUES
(1,'New',NULL,'#06ff00',0,NULL,NULL),
(2,'Processing',NULL,'#ffb800',0,NULL,NULL),
(3,'Closed',NULL,'#ff0000',1,NULL,NULL);
/*!40000 ALTER TABLE `glpi_projectstates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projecttasklinks`
--

DROP TABLE IF EXISTS `glpi_projecttasklinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projecttasklinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projecttasks_id_source` int(10) unsigned NOT NULL,
  `source_uuid` varchar(255) NOT NULL,
  `projecttasks_id_target` int(10) unsigned NOT NULL,
  `target_uuid` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `lag` smallint(6) DEFAULT 0,
  `lead` smallint(6) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `projecttasks_id_source` (`projecttasks_id_source`),
  KEY `projecttasks_id_target` (`projecttasks_id_target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projecttasklinks`
--

LOCK TABLES `glpi_projecttasklinks` WRITE;
/*!40000 ALTER TABLE `glpi_projecttasklinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projecttasklinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projecttasks`
--

DROP TABLE IF EXISTS `glpi_projecttasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projecttasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `projects_id` int(10) unsigned NOT NULL DEFAULT 0,
  `projecttasks_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `plan_start_date` timestamp NULL DEFAULT NULL,
  `plan_end_date` timestamp NULL DEFAULT NULL,
  `real_start_date` timestamp NULL DEFAULT NULL,
  `real_end_date` timestamp NULL DEFAULT NULL,
  `planned_duration` int(11) NOT NULL DEFAULT 0,
  `effective_duration` int(11) NOT NULL DEFAULT 0,
  `projectstates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `projecttasktypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `percent_done` int(11) NOT NULL DEFAULT 0,
  `auto_percent_done` tinyint(4) NOT NULL DEFAULT 0,
  `is_milestone` tinyint(4) NOT NULL DEFAULT 0,
  `projecttasktemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `projects_id` (`projects_id`),
  KEY `projecttasks_id` (`projecttasks_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `users_id` (`users_id`),
  KEY `plan_start_date` (`plan_start_date`),
  KEY `plan_end_date` (`plan_end_date`),
  KEY `real_start_date` (`real_start_date`),
  KEY `real_end_date` (`real_end_date`),
  KEY `percent_done` (`percent_done`),
  KEY `projectstates_id` (`projectstates_id`),
  KEY `projecttasktypes_id` (`projecttasktypes_id`),
  KEY `projecttasktemplates_id` (`projecttasktemplates_id`),
  KEY `is_template` (`is_template`),
  KEY `is_milestone` (`is_milestone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projecttasks`
--

LOCK TABLES `glpi_projecttasks` WRITE;
/*!40000 ALTER TABLE `glpi_projecttasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projecttasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projecttasks_tickets`
--

DROP TABLE IF EXISTS `glpi_projecttasks_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projecttasks_tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `projecttasks_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`projecttasks_id`),
  KEY `projects_id` (`projecttasks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projecttasks_tickets`
--

LOCK TABLES `glpi_projecttasks_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_projecttasks_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projecttasks_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projecttaskteams`
--

DROP TABLE IF EXISTS `glpi_projecttaskteams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projecttaskteams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projecttasks_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`projecttasks_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projecttaskteams`
--

LOCK TABLES `glpi_projecttaskteams` WRITE;
/*!40000 ALTER TABLE `glpi_projecttaskteams` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projecttaskteams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projecttasktemplates`
--

DROP TABLE IF EXISTS `glpi_projecttasktemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projecttasktemplates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `projects_id` int(10) unsigned NOT NULL DEFAULT 0,
  `projecttasks_id` int(10) unsigned NOT NULL DEFAULT 0,
  `plan_start_date` timestamp NULL DEFAULT NULL,
  `plan_end_date` timestamp NULL DEFAULT NULL,
  `real_start_date` timestamp NULL DEFAULT NULL,
  `real_end_date` timestamp NULL DEFAULT NULL,
  `planned_duration` int(11) NOT NULL DEFAULT 0,
  `effective_duration` int(11) NOT NULL DEFAULT 0,
  `projectstates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `projecttasktypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `percent_done` int(11) NOT NULL DEFAULT 0,
  `is_milestone` tinyint(4) NOT NULL DEFAULT 0,
  `comments` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `projects_id` (`projects_id`),
  KEY `projecttasks_id` (`projecttasks_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`),
  KEY `users_id` (`users_id`),
  KEY `plan_start_date` (`plan_start_date`),
  KEY `plan_end_date` (`plan_end_date`),
  KEY `real_start_date` (`real_start_date`),
  KEY `real_end_date` (`real_end_date`),
  KEY `percent_done` (`percent_done`),
  KEY `projectstates_id` (`projectstates_id`),
  KEY `projecttasktypes_id` (`projecttasktypes_id`),
  KEY `is_milestone` (`is_milestone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projecttasktemplates`
--

LOCK TABLES `glpi_projecttasktemplates` WRITE;
/*!40000 ALTER TABLE `glpi_projecttasktemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projecttasktemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projecttasktypes`
--

DROP TABLE IF EXISTS `glpi_projecttasktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projecttasktypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projecttasktypes`
--

LOCK TABLES `glpi_projecttasktypes` WRITE;
/*!40000 ALTER TABLE `glpi_projecttasktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projecttasktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projectteams`
--

DROP TABLE IF EXISTS `glpi_projectteams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projectteams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projects_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`projects_id`,`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projectteams`
--

LOCK TABLES `glpi_projectteams` WRITE;
/*!40000 ALTER TABLE `glpi_projectteams` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projectteams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_projecttypes`
--

DROP TABLE IF EXISTS `glpi_projecttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_projecttypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_projecttypes`
--

LOCK TABLES `glpi_projecttypes` WRITE;
/*!40000 ALTER TABLE `glpi_projecttypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_projecttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_queuednotifications`
--

DROP TABLE IF EXISTS `glpi_queuednotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_queuednotifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `notificationtemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `sent_try` int(11) NOT NULL DEFAULT 0,
  `create_time` timestamp NULL DEFAULT NULL,
  `send_time` timestamp NULL DEFAULT NULL,
  `sent_time` timestamp NULL DEFAULT NULL,
  `name` text DEFAULT NULL,
  `sender` text DEFAULT NULL,
  `sendername` text DEFAULT NULL,
  `recipient` text DEFAULT NULL,
  `recipientname` text DEFAULT NULL,
  `replyto` text DEFAULT NULL,
  `replytoname` text DEFAULT NULL,
  `headers` text DEFAULT NULL,
  `body_html` longtext DEFAULT NULL,
  `body_text` longtext DEFAULT NULL,
  `messageid` text DEFAULT NULL,
  `documents` text DEFAULT NULL,
  `mode` varchar(20) NOT NULL COMMENT 'See Notification_NotificationTemplate::MODE_* constants',
  `event` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`itemtype`,`items_id`,`notificationtemplates_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `entities_id` (`entities_id`),
  KEY `sent_try` (`sent_try`),
  KEY `create_time` (`create_time`),
  KEY `send_time` (`send_time`),
  KEY `sent_time` (`sent_time`),
  KEY `mode` (`mode`),
  KEY `notificationtemplates_id` (`notificationtemplates_id`),
  KEY `recipient` (`recipient`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_queuednotifications`
--

LOCK TABLES `glpi_queuednotifications` WRITE;
/*!40000 ALTER TABLE `glpi_queuednotifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_queuednotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_rackmodels`
--

DROP TABLE IF EXISTS `glpi_rackmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_rackmodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `product_number` (`product_number`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_rackmodels`
--

LOCK TABLES `glpi_rackmodels` WRITE;
/*!40000 ALTER TABLE `glpi_rackmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_rackmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_racks`
--

DROP TABLE IF EXISTS `glpi_racks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_racks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `rackmodels_id` int(10) unsigned DEFAULT NULL,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `racktypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `number_units` int(11) DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `dcrooms_id` int(10) unsigned NOT NULL DEFAULT 0,
  `room_orientation` int(11) NOT NULL DEFAULT 0,
  `position` varchar(50) DEFAULT NULL,
  `bgcolor` varchar(7) DEFAULT NULL,
  `max_power` int(11) NOT NULL DEFAULT 0,
  `mesured_power` int(11) NOT NULL DEFAULT 0,
  `max_weight` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `locations_id` (`locations_id`),
  KEY `rackmodels_id` (`rackmodels_id`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `racktypes_id` (`racktypes_id`),
  KEY `states_id` (`states_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `group_id_tech` (`groups_id_tech`),
  KEY `is_template` (`is_template`),
  KEY `is_deleted` (`is_deleted`),
  KEY `dcrooms_id` (`dcrooms_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_racks`
--

LOCK TABLES `glpi_racks` WRITE;
/*!40000 ALTER TABLE `glpi_racks` DISABLE KEYS */;
INSERT INTO `glpi_racks` VALUES
(1,'rack1','somelog',0,0,0,'','',0,0,0,0,0,0,0,0,0,42,0,NULL,0,0,1,NULL,'#fec95c',0,0,0,'2024-11-25 14:28:01','2024-11-25 14:27:39');
/*!40000 ALTER TABLE `glpi_racks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_racktypes`
--

DROP TABLE IF EXISTS `glpi_racktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_racktypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `name` (`name`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_racktypes`
--

LOCK TABLES `glpi_racktypes` WRITE;
/*!40000 ALTER TABLE `glpi_racktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_racktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_recurrentchanges`
--

DROP TABLE IF EXISTS `glpi_recurrentchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_recurrentchanges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `changetemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `begin_date` timestamp NULL DEFAULT NULL,
  `periodicity` varchar(255) DEFAULT NULL,
  `create_before` int(11) NOT NULL DEFAULT 0,
  `next_creation_date` timestamp NULL DEFAULT NULL,
  `calendars_id` int(10) unsigned NOT NULL DEFAULT 0,
  `end_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `changetemplates_id` (`changetemplates_id`),
  KEY `next_creation_date` (`next_creation_date`),
  KEY `calendars_id` (`calendars_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_recurrentchanges`
--

LOCK TABLES `glpi_recurrentchanges` WRITE;
/*!40000 ALTER TABLE `glpi_recurrentchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_recurrentchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_refusedequipments`
--

DROP TABLE IF EXISTS `glpi_refusedequipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_refusedequipments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `itemtype` varchar(100) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ip` text DEFAULT NULL,
  `mac` text DEFAULT NULL,
  `rules_id` int(10) unsigned NOT NULL DEFAULT 0,
  `method` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `agents_id` int(10) unsigned NOT NULL DEFAULT 0,
  `autoupdatesystems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `agents_id` (`agents_id`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `rules_id` (`rules_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_refusedequipments`
--

LOCK TABLES `glpi_refusedequipments` WRITE;
/*!40000 ALTER TABLE `glpi_refusedequipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_refusedequipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_registeredids`
--

DROP TABLE IF EXISTS `glpi_registeredids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_registeredids` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `device_type` varchar(100) NOT NULL COMMENT 'USB, PCI ...',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `device_type` (`device_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_registeredids`
--

LOCK TABLES `glpi_registeredids` WRITE;
/*!40000 ALTER TABLE `glpi_registeredids` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_registeredids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_reminders`
--

DROP TABLE IF EXISTS `glpi_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `is_planned` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `begin_view_date` timestamp NULL DEFAULT NULL,
  `end_view_date` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `name` (`name`),
  KEY `date` (`date`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `users_id` (`users_id`),
  KEY `is_planned` (`is_planned`),
  KEY `state` (`state`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_reminders`
--

LOCK TABLES `glpi_reminders` WRITE;
/*!40000 ALTER TABLE `glpi_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_reminders_users`
--

DROP TABLE IF EXISTS `glpi_reminders_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_reminders_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reminders_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `reminders_id` (`reminders_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_reminders_users`
--

LOCK TABLES `glpi_reminders_users` WRITE;
/*!40000 ALTER TABLE `glpi_reminders_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_reminders_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_remindertranslations`
--

DROP TABLE IF EXISTS `glpi_remindertranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_remindertranslations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reminders_id` int(10) unsigned NOT NULL DEFAULT 0,
  `language` varchar(5) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `text` longtext DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`reminders_id`,`language`),
  KEY `users_id` (`users_id`),
  KEY `date_creation` (`date_creation`),
  KEY `date_mod` (`date_mod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_remindertranslations`
--

LOCK TABLES `glpi_remindertranslations` WRITE;
/*!40000 ALTER TABLE `glpi_remindertranslations` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_remindertranslations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_requesttypes`
--

DROP TABLE IF EXISTS `glpi_requesttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_requesttypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `is_helpdesk_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_followup_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_mail_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_mailfollowup_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `is_ticketheader` tinyint(4) NOT NULL DEFAULT 1,
  `is_itilfollowup` tinyint(4) NOT NULL DEFAULT 1,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_helpdesk_default` (`is_helpdesk_default`),
  KEY `is_followup_default` (`is_followup_default`),
  KEY `is_mail_default` (`is_mail_default`),
  KEY `is_mailfollowup_default` (`is_mailfollowup_default`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_active` (`is_active`),
  KEY `is_ticketheader` (`is_ticketheader`),
  KEY `is_itilfollowup` (`is_itilfollowup`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_requesttypes`
--

LOCK TABLES `glpi_requesttypes` WRITE;
/*!40000 ALTER TABLE `glpi_requesttypes` DISABLE KEYS */;
INSERT INTO `glpi_requesttypes` VALUES
(1,'Helpdesk',1,1,0,0,1,1,1,NULL,NULL,NULL),
(2,'E-Mail',0,0,1,1,1,1,1,NULL,NULL,NULL),
(3,'Phone',0,0,0,0,1,1,1,NULL,NULL,NULL),
(4,'Direct',0,0,0,0,1,1,1,NULL,NULL,NULL),
(5,'Written',0,0,0,0,1,1,1,NULL,NULL,NULL),
(6,'Other',0,0,0,0,1,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_requesttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_reservationitems`
--

DROP TABLE IF EXISTS `glpi_reservationitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_reservationitems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) NOT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  KEY `is_active` (`is_active`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_reservationitems`
--

LOCK TABLES `glpi_reservationitems` WRITE;
/*!40000 ALTER TABLE `glpi_reservationitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_reservationitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_reservations`
--

DROP TABLE IF EXISTS `glpi_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_reservations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reservationitems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `group` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `users_id` (`users_id`),
  KEY `resagroup` (`reservationitems_id`,`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_reservations`
--

LOCK TABLES `glpi_reservations` WRITE;
/*!40000 ALTER TABLE `glpi_reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_rssfeeds`
--

DROP TABLE IF EXISTS `glpi_rssfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_rssfeeds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `refresh_rate` int(11) NOT NULL DEFAULT 86400,
  `max_items` int(11) NOT NULL DEFAULT 20,
  `have_error` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `users_id` (`users_id`),
  KEY `date_mod` (`date_mod`),
  KEY `have_error` (`have_error`),
  KEY `is_active` (`is_active`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_rssfeeds`
--

LOCK TABLES `glpi_rssfeeds` WRITE;
/*!40000 ALTER TABLE `glpi_rssfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_rssfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_rssfeeds_users`
--

DROP TABLE IF EXISTS `glpi_rssfeeds_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_rssfeeds_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rssfeeds_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `rssfeeds_id` (`rssfeeds_id`),
  KEY `users_id` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_rssfeeds_users`
--

LOCK TABLES `glpi_rssfeeds_users` WRITE;
/*!40000 ALTER TABLE `glpi_rssfeeds_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_rssfeeds_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ruleactions`
--

DROP TABLE IF EXISTS `glpi_ruleactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ruleactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rules_id` int(10) unsigned NOT NULL DEFAULT 0,
  `action_type` varchar(255) DEFAULT NULL COMMENT 'VALUE IN (assign, regex_result, append_regex_result, affectbyip, affectbyfqdn, affectbymac)',
  `field` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rules_id` (`rules_id`),
  KEY `field_value` (`field`(50),`value`(50))
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ruleactions`
--

LOCK TABLES `glpi_ruleactions` WRITE;
/*!40000 ALTER TABLE `glpi_ruleactions` DISABLE KEYS */;
INSERT INTO `glpi_ruleactions` VALUES
(1,1,'assign','_ignore_import','1'),
(2,2,'assign','_inventory','0'),
(3,3,'assign','_inventory','0'),
(4,4,'assign','_inventory','0'),
(5,5,'assign','_inventory','0'),
(6,6,'assign','_inventory','0'),
(7,7,'assign','_inventory','0'),
(8,8,'assign','_inventory','0'),
(9,9,'assign','_inventory','0'),
(10,10,'assign','_ignore_import','1'),
(11,11,'assign','_inventory','0'),
(12,12,'assign','_inventory','0'),
(13,13,'assign','_inventory','0'),
(14,14,'assign','_inventory','0'),
(15,15,'assign','_inventory','0'),
(16,16,'assign','_inventory','0'),
(17,17,'assign','_inventory','0'),
(18,18,'assign','_inventory','0'),
(19,19,'assign','_inventory','0'),
(20,20,'assign','_inventory','0'),
(21,21,'assign','_inventory','0'),
(22,22,'assign','_ignore_import','1'),
(23,23,'assign','_ignore_import','1'),
(24,24,'assign','_inventory','0'),
(25,25,'assign','_inventory','0'),
(26,26,'assign','_inventory','0'),
(27,27,'assign','_inventory','0'),
(28,28,'assign','_ignore_import','1'),
(29,29,'assign','_ignore_import','1'),
(30,30,'assign','_inventory','0'),
(31,31,'assign','_inventory','0'),
(32,32,'assign','_inventory','0'),
(33,33,'assign','_inventory','0'),
(34,34,'assign','_ignore_import','1'),
(35,35,'assign','_inventory','0'),
(36,36,'assign','_inventory','0'),
(37,37,'assign','_ignore_import','1'),
(38,38,'assign','_inventory','0'),
(39,39,'assign','_inventory','0'),
(40,40,'assign','_ignore_import','1'),
(41,41,'assign','_ignore_import','1'),
(42,42,'assign','_inventory','0'),
(43,43,'assign','_inventory','0'),
(44,44,'assign','_inventory','0'),
(45,45,'assign','_inventory','0'),
(46,46,'assign','_inventory','0'),
(47,47,'assign','_inventory','0'),
(48,48,'assign','_inventory','0'),
(49,49,'assign','_inventory','0'),
(50,50,'assign','_inventory','0'),
(51,51,'assign','_inventory','0'),
(52,52,'assign','_inventory','0'),
(53,53,'assign','_ignore_import','1'),
(54,54,'assign','_inventory','0'),
(55,55,'assign','_inventory','0'),
(56,56,'assign','_ignore_import','1'),
(57,57,'assign','_inventory','0'),
(58,58,'assign','_inventory','0'),
(59,59,'assign','_ignore_import','1'),
(60,60,'assign','_ignore_import','1'),
(61,61,'assign','_inventory','0'),
(62,62,'assign','_inventory','0'),
(63,63,'assign','_inventory','0'),
(64,64,'assign','_inventory','0'),
(65,65,'assign','_ignore_import','1'),
(66,66,'assign','_inventory','0'),
(67,67,'assign','_inventory','0'),
(68,68,'assign','_ignore_import','1'),
(69,69,'assign','_inventory','0'),
(70,70,'assign','_inventory','0'),
(71,71,'assign','_ignore_import','1'),
(72,72,'assign','entities_id','0'),
(73,73,'assign','_refuse_email_no_response','1'),
(74,74,'assign','_refuse_email_no_response','1'),
(75,75,'assign','entities_id','0'),
(76,76,'assign','_import_category','1'),
(77,77,'fromitem','locations_id','1'),
(78,78,'fromuser','locations_id','1'),
(79,79,'regex_result','_affect_user_by_regex','#0'),
(80,80,'regex_result','_affect_user_by_regex','#0'),
(81,81,'regex_result','_affect_user_by_regex','#0'),
(82,82,'append_regex_result','name','#0'),
(83,83,'append_regex_result','name','#1'),
(84,84,'append_regex_result','name','#1 #2'),
(85,85,'append_regex_result','name','#1'),
(86,86,'append_regex_result','name','#2'),
(87,87,'append_regex_result','name','#3'),
(88,88,'append_regex_result','name','#2'),
(89,89,'append_regex_result','name','#4'),
(90,90,'append_regex_result','name','#4');
/*!40000 ALTER TABLE `glpi_ruleactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_rulecriterias`
--

DROP TABLE IF EXISTS `glpi_rulecriterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_rulecriterias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rules_id` int(10) unsigned NOT NULL DEFAULT 0,
  `criteria` varchar(255) DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rules_id` (`rules_id`),
  KEY `condition` (`condition`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_rulecriterias`
--

LOCK TABLES `glpi_rulecriterias` WRITE;
/*!40000 ALTER TABLE `glpi_rulecriterias` DISABLE KEYS */;
INSERT INTO `glpi_rulecriterias` VALUES
(1,1,'partial',0,'1'),
(2,1,'itemtype',9,'1'),
(3,2,'itemtype',9,'1'),
(4,2,'mac',10,'1'),
(5,2,'mac',8,'1'),
(6,2,'ifnumber',10,'1'),
(7,2,'ifnumber',8,'1'),
(8,2,'link_criteria_port',203,'1'),
(9,3,'itemtype',9,'1'),
(10,3,'mac',10,'1'),
(11,3,'mac',8,'1'),
(12,3,'ifnumber',10,'1'),
(13,3,'ifnumber',8,'1'),
(14,4,'itemtype',9,'1'),
(15,4,'mac',8,'1'),
(16,4,'ifnumber',8,'1'),
(17,5,'itemtype',9,'1'),
(18,5,'ip',10,'1'),
(19,5,'ip',8,'1'),
(20,5,'ifdescr',10,'1'),
(21,5,'ifdescr',8,'1'),
(22,5,'link_criteria_port',203,'1'),
(23,6,'itemtype',9,'1'),
(24,6,'ip',10,'1'),
(25,6,'ip',8,'1'),
(26,6,'ifdescr',10,'1'),
(27,6,'ifdescr',8,'1'),
(28,7,'itemtype',9,'1'),
(29,7,'ip',8,'1'),
(30,7,'ifdescr',8,'1'),
(31,8,'itemtype',9,'1'),
(32,8,'mac',10,'1'),
(33,8,'mac',8,'1'),
(34,8,'only_these_criteria',204,'1'),
(35,9,'itemtype',9,'1'),
(36,9,'mac',8,'1'),
(37,9,'only_these_criteria',204,'1'),
(38,10,'itemtype',0,'Computer'),
(39,10,'name',9,'1'),
(40,11,'itemtype',0,'Computer'),
(41,11,'serial',10,'1'),
(42,11,'serial',8,'1'),
(43,11,'uuid',10,'1'),
(44,11,'uuid',8,'1'),
(45,12,'itemtype',0,'Computer'),
(46,12,'serial',10,'1'),
(47,12,'serial',8,'1'),
(48,12,'uuid',30,'1'),
(49,13,'itemtype',0,'Computer'),
(50,13,'uuid',8,'1'),
(51,13,'serial',8,'1'),
(52,14,'itemtype',0,'Computer'),
(53,14,'serial',10,'1'),
(54,14,'serial',8,'1'),
(55,15,'itemtype',0,'Computer'),
(56,15,'uuid',10,'1'),
(57,15,'uuid',8,'1'),
(58,16,'itemtype',0,'Computer'),
(59,16,'mac',10,'1'),
(60,16,'mac',8,'1'),
(61,17,'itemtype',0,'Computer'),
(62,17,'name',10,'1'),
(63,17,'name',8,'1'),
(64,18,'itemtype',0,'Computer'),
(65,18,'serial',8,'1'),
(66,19,'itemtype',0,'Computer'),
(67,19,'uuid',8,'1'),
(68,20,'itemtype',0,'Computer'),
(69,20,'mac',8,'1'),
(70,21,'itemtype',0,'Computer'),
(71,21,'name',8,'1'),
(72,22,'itemtype',0,'Computer'),
(73,23,'itemtype',0,'Printer'),
(74,23,'name',9,'1'),
(75,24,'itemtype',0,'Printer'),
(76,24,'serial',8,'1'),
(77,24,'serial',10,'1'),
(78,25,'itemtype',0,'Printer'),
(79,25,'mac',8,'1'),
(80,25,'mac',10,'1'),
(81,26,'itemtype',0,'Printer'),
(82,26,'serial',8,'1'),
(83,27,'itemtype',0,'Printer'),
(84,27,'mac',8,'1'),
(85,28,'itemtype',0,'Printer'),
(86,29,'itemtype',0,'NetworkEquipment'),
(87,29,'name',9,'1'),
(88,30,'itemtype',0,'NetworkEquipment'),
(89,30,'serial',8,'1'),
(90,30,'serial',10,'1'),
(91,31,'itemtype',0,'NetworkEquipment'),
(92,31,'mac',8,'1'),
(93,31,'mac',10,'1'),
(94,32,'itemtype',0,'NetworkEquipment'),
(95,32,'serial',8,'1'),
(96,33,'itemtype',0,'NetworkEquipment'),
(97,33,'mac',8,'1'),
(98,34,'itemtype',0,'NetworkEquipment'),
(99,35,'itemtype',0,'Peripheral'),
(100,35,'serial',8,'1'),
(101,35,'serial',10,'1'),
(102,36,'itemtype',0,'Peripheral'),
(103,36,'serial',8,'1'),
(104,37,'itemtype',0,'Peripheral'),
(105,38,'itemtype',0,'Monitor'),
(106,38,'serial',8,'1'),
(107,38,'serial',10,'1'),
(108,39,'itemtype',0,'Monitor'),
(109,39,'serial',8,'1'),
(110,40,'itemtype',0,'Monitor'),
(111,41,'itemtype',0,'Phone'),
(112,41,'name',9,'1'),
(113,42,'itemtype',0,'Phone'),
(114,42,'serial',10,'1'),
(115,42,'serial',8,'1'),
(116,42,'uuid',10,'1'),
(117,42,'uuid',8,'1'),
(118,43,'itemtype',0,'Phone'),
(119,43,'serial',10,'1'),
(120,43,'serial',8,'1'),
(121,43,'uuid',30,'1'),
(122,44,'itemtype',0,'Phone'),
(123,44,'uuid',8,'1'),
(124,44,'serial',8,'1'),
(125,45,'itemtype',0,'Phone'),
(126,45,'serial',10,'1'),
(127,45,'serial',8,'1'),
(128,46,'itemtype',0,'Phone'),
(129,46,'uuid',10,'1'),
(130,46,'uuid',8,'1'),
(131,47,'itemtype',0,'Phone'),
(132,47,'mac',10,'1'),
(133,47,'mac',8,'1'),
(134,48,'itemtype',0,'Phone'),
(135,48,'name',10,'1'),
(136,48,'name',8,'1'),
(137,49,'itemtype',0,'Phone'),
(138,49,'serial',8,'1'),
(139,50,'itemtype',0,'Phone'),
(140,50,'uuid',8,'1'),
(141,51,'itemtype',0,'Phone'),
(142,51,'mac',8,'1'),
(143,52,'itemtype',0,'Phone'),
(144,52,'name',8,'1'),
(145,53,'itemtype',0,'Phone'),
(146,54,'itemtype',0,'Cluster'),
(147,54,'uuid',8,'1'),
(148,54,'uuid',10,'1'),
(149,55,'itemtype',0,'Cluster'),
(150,55,'uuid',8,'1'),
(151,56,'itemtype',0,'Cluster'),
(152,57,'itemtype',0,'Enclosure'),
(153,57,'serial',8,'1'),
(154,57,'serial',10,'1'),
(155,58,'itemtype',0,'Enclosure'),
(156,58,'serial',8,'1'),
(157,59,'itemtype',0,'Enclosure'),
(158,60,'name',9,'1'),
(159,61,'serial',8,'1'),
(160,61,'serial',10,'1'),
(161,62,'mac',8,'1'),
(162,62,'mac',10,'1'),
(163,63,'serial',8,'1'),
(164,64,'mac',8,'1'),
(165,65,'itemtype',0,''),
(166,66,'itemtype',0,'DatabaseInstance'),
(167,66,'name',8,'1'),
(168,66,'name',10,'1'),
(169,66,'linked_item',10,'1'),
(170,67,'itemtype',0,'DatabaseInstance'),
(171,67,'name',8,'1'),
(172,68,'itemtype',0,'DatabaseInstance'),
(173,69,'itemtype',0,'Unmanaged'),
(174,69,'name',8,'1'),
(175,69,'name',10,'1'),
(176,70,'itemtype',0,'Unmanaged'),
(177,70,'name',8,'1'),
(178,71,'itemtype',0,'Unmanaged'),
(179,72,'subject',6,'/.*/'),
(180,73,'x-auto-response-suppress',6,'/\\S+/'),
(181,74,'auto-submitted',6,'/^(?!.*no).+$/i'),
(182,75,'TYPE',0,'3'),
(183,75,'TYPE',0,'2'),
(184,76,'name',0,'*'),
(185,77,'locations_id',9,'1'),
(186,77,'_locations_id_of_item',8,'1'),
(187,78,'locations_id',9,'1'),
(188,78,'_locations_id_of_requester',8,'1'),
(189,79,'_itemtype',0,'Computer'),
(190,79,'_auto',0,'1'),
(191,79,'contact',6,'/(.*)@/'),
(192,80,'_itemtype',0,'Computer'),
(193,80,'_auto',0,'1'),
(194,80,'contact',6,'/(.*)[,|\\/]/'),
(195,81,'_itemtype',0,'Computer'),
(196,81,'_auto',0,'1'),
(197,81,'contact',6,'/(.*)/'),
(198,82,'os_name',6,'/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle|Amazon Linux)(?:\\D+|)([\\d.]*) ?(?:\\(?([\\w ]+)\\)?)?/'),
(199,83,'os_name',6,'/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/'),
(200,84,'os_name',6,'/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/'),
(201,85,'os_name',6,'/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle)(?:\\D+|)([\\d.]+) ?(?:\\(?([\\w ]+)\\)?)?/'),
(202,86,'os_name',6,'/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/'),
(203,87,'os_name',6,'/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/'),
(204,88,'os_name',6,'/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle)(?:\\D+|)([\\d.]+) ?(?:\\(?([\\w ]+)\\)?)?/'),
(205,89,'os_name',6,'/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/'),
(206,90,'os_name',6,'/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/');
/*!40000 ALTER TABLE `glpi_rulecriterias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_rulematchedlogs`
--

DROP TABLE IF EXISTS `glpi_rulematchedlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_rulematchedlogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `rules_id` int(10) unsigned DEFAULT NULL,
  `agents_id` int(10) unsigned NOT NULL DEFAULT 0,
  `method` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agents_id` (`agents_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `rules_id` (`rules_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_rulematchedlogs`
--

LOCK TABLES `glpi_rulematchedlogs` WRITE;
/*!40000 ALTER TABLE `glpi_rulematchedlogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_rulematchedlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_rulerightparameters`
--

DROP TABLE IF EXISTS `glpi_rulerightparameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_rulerightparameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_rulerightparameters`
--

LOCK TABLES `glpi_rulerightparameters` WRITE;
/*!40000 ALTER TABLE `glpi_rulerightparameters` DISABLE KEYS */;
INSERT INTO `glpi_rulerightparameters` VALUES
(1,'(LDAP)Organization','o',NULL,NULL,NULL),
(2,'(LDAP)Common Name','cn',NULL,NULL,NULL),
(3,'(LDAP)Department Number','departmentnumber',NULL,NULL,NULL),
(4,'(LDAP)Email','mail',NULL,NULL,NULL),
(5,'Object Class','objectclass',NULL,NULL,NULL),
(6,'(LDAP)User ID','uid',NULL,NULL,NULL),
(7,'(LDAP)Telephone Number','phone',NULL,NULL,NULL),
(8,'(LDAP)Employee Number','employeenumber',NULL,NULL,NULL),
(9,'(LDAP)Manager','manager',NULL,NULL,NULL),
(10,'(LDAP)DistinguishedName','dn',NULL,NULL,NULL),
(12,'(AD)User ID','samaccountname',NULL,NULL,NULL),
(13,'(LDAP) Title','title',NULL,NULL,NULL),
(14,'(LDAP) MemberOf','memberof',NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_rulerightparameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_rules`
--

DROP TABLE IF EXISTS `glpi_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sub_type` varchar(255) NOT NULL DEFAULT '',
  `ranking` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `match` char(10) DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `uuid` varchar(255) DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_active` (`is_active`),
  KEY `sub_type` (`sub_type`),
  KEY `date_mod` (`date_mod`),
  KEY `is_recursive` (`is_recursive`),
  KEY `condition` (`condition`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_rules`
--

LOCK TABLES `glpi_rules` WRITE;
/*!40000 ALTER TABLE `glpi_rules` DISABLE KEYS */;
INSERT INTO `glpi_rules` VALUES
(1,0,'RuleImportAsset',1,'No creation on partial import','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_no_creation_on_partial_import',0,'2024-11-19 10:17:34'),
(2,0,'RuleImportAsset',2,'Global update (by mac+ifnumber restricted port)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_global_update_mac_ifnumber_restricted_port',0,'2024-11-19 10:17:34'),
(3,0,'RuleImportAsset',3,'Global update (by mac+ifnumber not restricted port)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_global_update_mac_ifnumber_no_restricted_port',0,'2024-11-19 10:17:34'),
(4,0,'RuleImportAsset',4,'Global import (by mac+ifnumber)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_global_import_mac_ifnumber',0,'2024-11-19 10:17:34'),
(5,0,'RuleImportAsset',5,'Global update (by ip+ifdescr restricted port)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_global_update_mac_ifdescr_restricted_port',0,'2024-11-19 10:17:34'),
(6,0,'RuleImportAsset',6,'Global update (by ip+ifdescr not restricted port)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_global_update_ip_ifdescr_no_restricted_port',0,'2024-11-19 10:17:34'),
(7,0,'RuleImportAsset',7,'Global import (by ip+ifdescr)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_global_import_ip_ifdescr',0,'2024-11-19 10:17:34'),
(8,0,'RuleImportAsset',8,'Update only mac address (mac on switch port)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_update_only_mac_adress',0,'2024-11-19 10:17:34'),
(9,0,'RuleImportAsset',9,'Import only mac address (mac on switch port)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_import_only_mac_adress',0,'2024-11-19 10:17:34'),
(10,0,'RuleImportAsset',10,'Computer constraint (name)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_computer_constraint_name',0,'2024-11-19 10:17:34'),
(11,0,'RuleImportAsset',11,'Computer update (by serial + uuid)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_computer_update_serial_uuid',0,'2024-11-19 10:17:34'),
(12,0,'RuleImportAsset',12,'Computer update (by serial + uuid is empty in GLPI)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_computer_update_serial_uuid_empty',0,'2024-11-19 10:17:34'),
(13,0,'RuleImportAsset',13,'Computer import (by serial + uuid)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_computer_import_serial_uuid',0,'2024-11-19 10:17:34'),
(14,0,'RuleImportAsset',14,'Computer update (by serial)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_computer_update_serial',0,'2024-11-19 10:17:34'),
(15,0,'RuleImportAsset',15,'Computer update (by uuid)','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_computer_update_uuid',0,'2024-11-19 10:17:34'),
(16,0,'RuleImportAsset',16,'Computer update (by mac)','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_computer_update_mac',0,'2024-11-19 10:17:34'),
(17,0,'RuleImportAsset',17,'Computer update (by name)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_computer_update_name',0,'2024-11-19 10:17:34'),
(18,0,'RuleImportAsset',18,'Computer import (by serial)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_computer_import_serial',0,'2024-11-19 10:17:34'),
(19,0,'RuleImportAsset',19,'Computer import (by uuid)','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_computer_import_uuid',0,'2024-11-19 10:17:34'),
(20,0,'RuleImportAsset',20,'Computer import (by mac)','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_computer_import_mac',0,'2024-11-19 10:17:34'),
(21,0,'RuleImportAsset',21,'Computer import (by name)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_computer_import_name',0,'2024-11-19 10:17:34'),
(22,0,'RuleImportAsset',22,'Computer import denied','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_computer_import_denied',0,'2024-11-19 10:17:34'),
(23,0,'RuleImportAsset',23,'Printer constraint (name)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_printer_constraint_name',0,'2024-11-19 10:17:34'),
(24,0,'RuleImportAsset',24,'Printer update (by serial)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_printer_update_serial',0,'2024-11-19 10:17:34'),
(25,0,'RuleImportAsset',25,'Printer update (by mac)','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_printer_update_mac',0,'2024-11-19 10:17:34'),
(26,0,'RuleImportAsset',26,'Printer import (by serial)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_printer_import_serial',0,'2024-11-19 10:17:34'),
(27,0,'RuleImportAsset',27,'Printer import (by mac)','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_printer_import_mac',0,'2024-11-19 10:17:34'),
(28,0,'RuleImportAsset',28,'Printer import denied','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_printer_import_denied',0,'2024-11-19 10:17:34'),
(29,0,'RuleImportAsset',29,'NetworkEquipment constraint (name)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_networkequipment_constraint_name',0,'2024-11-19 10:17:34'),
(30,0,'RuleImportAsset',30,'NetworkEquipment update (by serial)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_networkequipment_update_serial',0,'2024-11-19 10:17:34'),
(31,0,'RuleImportAsset',31,'NetworkEquipment update (by mac)','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_networkequipment_update_mac',0,'2024-11-19 10:17:34'),
(32,0,'RuleImportAsset',32,'NetworkEquipment import (by serial)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_networkequipment_import_serial',0,'2024-11-19 10:17:34'),
(33,0,'RuleImportAsset',33,'NetworkEquipment import (by mac)','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_networkequipment_import_mac',0,'2024-11-19 10:17:34'),
(34,0,'RuleImportAsset',34,'NetworkEquipment import denied','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_networkequipment_import_denied',0,'2024-11-19 10:17:34'),
(35,0,'RuleImportAsset',35,'Device update (by serial)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_device_update_serial',0,'2024-11-19 10:17:34'),
(36,0,'RuleImportAsset',36,'Device import (by serial)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_device_importe_serial',0,'2024-11-19 10:17:34'),
(37,0,'RuleImportAsset',37,'Device import denied','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_device_import_denied',0,'2024-11-19 10:17:34'),
(38,0,'RuleImportAsset',38,'Monitor update (by serial)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_monitor_update_serial',0,'2024-11-19 10:17:34'),
(39,0,'RuleImportAsset',39,'Monitor import (by serial)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_monitor_import_serial',0,'2024-11-19 10:17:34'),
(40,0,'RuleImportAsset',40,'Monitor import denied','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_monitor_import_denied',0,'2024-11-19 10:17:34'),
(41,0,'RuleImportAsset',41,'Phone constraint (name)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_phone_constraint_name',0,'2024-11-19 10:17:34'),
(42,0,'RuleImportAsset',42,'Phone update (by serial + uuid)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_phone_update_serial_uuid',0,'2024-11-19 10:17:34'),
(43,0,'RuleImportAsset',43,'Phone update (by serial + uuid is empty in GLPI)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_phone_update_serial_uuid_empty',0,'2024-11-19 10:17:34'),
(44,0,'RuleImportAsset',44,'Phone import (by serial + uuid)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_phone_import_serial_uuid',0,'2024-11-19 10:17:34'),
(45,0,'RuleImportAsset',45,'Phone update (by serial)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_phone_update_serial',0,'2024-11-19 10:17:34'),
(46,0,'RuleImportAsset',46,'Phone update (by uuid)','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_phone_update_uuid',0,'2024-11-19 10:17:34'),
(47,0,'RuleImportAsset',47,'Phone update (by mac)','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_phone_update_mac',0,'2024-11-19 10:17:34'),
(48,0,'RuleImportAsset',48,'Phone update (by name)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_phone_update_name',0,'2024-11-19 10:17:34'),
(49,0,'RuleImportAsset',49,'Phone import (by serial)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_phone_import_serial',0,'2024-11-19 10:17:34'),
(50,0,'RuleImportAsset',50,'Phone import (by uuid)','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_phone_import_uuid',0,'2024-11-19 10:17:34'),
(51,0,'RuleImportAsset',51,'Phone import (by mac)','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_phone_import_mac',0,'2024-11-19 10:17:34'),
(52,0,'RuleImportAsset',52,'Phone import (by name)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_phone_import_name',0,'2024-11-19 10:17:34'),
(53,0,'RuleImportAsset',53,'Phone import denied','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_phone_import_denied',0,'2024-11-19 10:17:34'),
(54,0,'RuleImportAsset',54,'Cluster update (by uuid)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_cluster_update_uuid',0,'2024-11-19 10:17:34'),
(55,0,'RuleImportAsset',55,'Cluster import (by uuid)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_cluster_import_uuid',0,'2024-11-19 10:17:34'),
(56,0,'RuleImportAsset',56,'Cluster import denied','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_cluster_import_denied',0,'2024-11-19 10:17:34'),
(57,0,'RuleImportAsset',57,'Enclosure update (by serial)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_enclosure_update_serial',0,'2024-11-19 10:17:34'),
(58,0,'RuleImportAsset',58,'Enclosure import (by serial)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_enclosure_import_serial',0,'2024-11-19 10:17:34'),
(59,0,'RuleImportAsset',59,'Enclosure import denied','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_enclosure_import_denied',0,'2024-11-19 10:17:34'),
(60,0,'RuleImportAsset',60,'Global constraint (name)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_global_constraint_name',0,'2024-11-19 10:17:34'),
(61,0,'RuleImportAsset',61,'Global update (by serial)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_global_update_serial',0,'2024-11-19 10:17:34'),
(62,0,'RuleImportAsset',62,'Global update (by mac)','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_global_update_mac',0,'2024-11-19 10:17:34'),
(63,0,'RuleImportAsset',63,'Global import (by serial)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_global_import_serial',0,'2024-11-19 10:17:34'),
(64,0,'RuleImportAsset',64,'Global import (by mac)','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_global_import_mac',0,'2024-11-19 10:17:34'),
(65,0,'RuleImportAsset',65,'Global import denied','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_global_import_denied',0,'2024-11-19 10:17:34'),
(66,0,'RuleImportAsset',66,'Database update (by name)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_database_update_name',0,'2024-11-19 10:17:34'),
(67,0,'RuleImportAsset',67,'Database import (by name)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_database_import_name',0,'2024-11-19 10:17:34'),
(68,0,'RuleImportAsset',68,'Database import denied','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_database_import_denied',0,'2024-11-19 10:17:34'),
(69,0,'RuleImportAsset',69,'Unmanaged update (by name)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_unmanaged_update_name',0,'2024-11-19 10:17:34'),
(70,0,'RuleImportAsset',70,'Unmanaged import (by name)','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_unmanaged_import_name',0,'2024-11-19 10:17:34'),
(71,0,'RuleImportAsset',71,'Unmanaged import denied','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_import_asset_unmanaged_import_denied',0,'2024-11-19 10:17:34'),
(72,0,'RuleMailCollector',3,'Root','','OR',1,'','2024-11-19 10:17:34',0,'glpi_rule_mail_collector_root',0,'2024-11-19 10:17:34'),
(73,0,'RuleMailCollector',1,'X-Auto-Response-Suppress','Exclude Auto-Reply emails using X-Auto-Response-Suppress header','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_mail_collector_x_auto_response_suppress',0,'2024-11-19 10:17:34'),
(74,0,'RuleMailCollector',2,'Auto-Reply Auto-Submitted','Exclude Auto-Reply emails using Auto-Submitted header','OR',1,'','2024-11-19 10:17:34',1,'glpi_rule_mail_collector_auto_reply_auto_submitted',0,'2024-11-19 10:17:34'),
(75,0,'RuleRight',1,'Root','','OR',1,'','2024-11-19 10:17:34',0,'glpi_rule_right_root',0,'2024-11-19 10:17:34'),
(76,0,'RuleSoftwareCategory',1,'Import category from inventory tool','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_rule_software_category_import_category_from_inventory_tool',1,'2024-11-19 10:17:34'),
(77,0,'RuleTicket',1,'Ticket location from item','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_rule_ticket_location_from_item',1,'2024-11-19 10:17:34'),
(78,0,'RuleTicket',2,'Ticket location from user','','AND',0,'','2024-11-19 10:17:34',1,'glpi_rule_rule_ticket_location_from_user',1,'2024-11-19 10:17:34'),
(79,0,'RuleAsset',1,'Domain user assignation','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_rule_asset_domain_user_assignation',3,'2024-11-19 10:17:34'),
(80,0,'RuleAsset',2,'Multiple users: assign to the first','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_rule_asset_multiple_user_assign_to_first',3,'2024-11-19 10:17:34'),
(81,0,'RuleAsset',3,'One user assignation','','AND',1,'','2024-11-19 10:17:34',1,'glpi_rule_rule_asset_one_user_assignation',3,'2024-11-19 10:17:34'),
(82,0,'RuleDictionnaryOperatingSystem',1,'Clean Linux OS Name','','AND',0,'/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle|Amazon Linux)(?:\\D+|)([\\d.]*) ?(?:\\(?([\\w ]+)\\)?)?/\n\n            Example :\n            Ubuntu 22.04.1 LTS -&#62; #0 = Ubuntu\n            SUSE Linux Enterprise Server 11 (x86_64)  -&#62;#0 = SUSE\n            SunOS -&#62; #0 = SunOS\n            Red Hat Enterprise Linux Server release 7.9 (Maipo) -&#62; #0 = Red Hat\n            Oracle Linux Server release 7.3 -&#62; #0 = Oracle\n            Fedora release 36 (Thirty Six) -&#62; #0 = Fedora\n            Debian GNU/Linux 9.5 (stretch) -&#62; #0 = Debian\n            CentOS Stream release 8 -&#62; #0 = CentOS\n            AlmaLinux 9.0 (Emerald Puma) -&#62; #0 = AlmaLinux\n            Amazon Linux 2023 -&#62; #0 = Amazon Linux','2024-11-19 10:17:34',1,'clean_linux_os_name',0,'2024-11-19 10:17:34'),
(83,0,'RuleDictionnaryOperatingSystem',2,'Clean Windows OS Name','','AND',0,'/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/\n\n            Example :\n            Microsoft Windows XP Professionnel -&#62; #1 : Windows\n            Microsoft Windows 7 Enterprise  -&#62; #1 : Windows\n            Microsoft® Windows Vista Professionnel  -&#62; #1 : Windows\n            Microsoft Windows XP Édition familiale  -&#62; #1 : Windows\n            Microsoft Windows 10 Entreprise  -&#62; #1 : Windows\n            Microsoft Windows 10 Professionnel  -&#62; #1 : Windows\n            Microsoft Windows 11 Professionnel  -&#62; #1 : Windows','2024-11-19 10:17:34',1,'clean_windows_os_name',0,'2024-11-19 10:17:34'),
(84,0,'RuleDictionnaryOperatingSystem',3,'Clean Windows Server OS Name','','AND',0,'/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/\n\n            Example :\n            Microsoft Windows Server 2012 R2 Datacenter -&#62; #1 #2 : Windows Server\n            Microsoft(R) Windows(R) Server 2003, Standard Edition x64 -&#62; #1 #2 : Windows Server\n            Microsoft Hyper-V Server 2012 R2 -&#62; #1 #2 : Hyper-V Server\n            Microsoft® Windows Server® 2008 Standard -&#62; #1 #2 : Windows Server','2024-11-19 10:17:34',1,'clean_windows_server_os_name',0,'2024-11-19 10:17:34'),
(85,0,'RuleDictionnaryOperatingSystemVersion',1,'Clean Linux OS Version','','AND',0,'/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle)(?:\\D+|)([\\d.]+) ?(?:\\(?([\\w ]+)\\)?)?/\n\n            Example :\n            Ubuntu 22.04.1 LTS -&#62; #1 = 22.04.1\n            SUSE Linux Enterprise Server 11 (x86_64) -&#62; #1 =  11\n            SunOS 5.10 -&#62; #1 = 5.10\n            Red Hat Enterprise Linux Server release 7.9 (Maipo) -&#62; #1 = 7.9\n            Oracle Linux Server release 7.3 -&#62; #1 = 7.3\n            Fedora release 36 (Thirty Six) -&#62; #1 =  36\n            Debian GNU/Linux 9.5 (stretch) -&#62; #1 = 9.5\n            CentOS release 6.9 (Final) -&#62; #1 = 6.9\n            AlmaLinux 9.0 (Emerald Puma) -&#62; #1 = 9.0','2024-11-19 10:17:34',1,'clean_linux_os_version',0,'2024-11-19 10:17:34'),
(86,0,'RuleDictionnaryOperatingSystemVersion',2,'Clean Windows OS Version','','AND',0,'/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/\n\n            Example :\n            Microsoft Windows XP Professionnel -&#62; #2 : XP\n            Microsoft Windows 7 Enterprise  -&#62; #2 : 7\n            Microsoft® Windows Vista Professionnel  -&#62; #2 : Vista\n            Microsoft Windows XP Édition familiale  -&#62; #2 : XP\n            Microsoft Windows 10 Entreprise  -&#62; #2 : 10\n            Microsoft Windows 10 Professionnel  -&#62; #2 : 10\n            Microsoft Windows 11 Professionnel  -&#62; #2 : 11','2024-11-19 10:17:34',1,'clean_windows_os_version',0,'2024-11-19 10:17:34'),
(87,0,'RuleDictionnaryOperatingSystemVersion',3,'Clean Windows Server OS Version','','AND',0,'/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/\n\n            Example :\n            Microsoft Windows Server 2012 R2 Datacenter -&#62; #3 : 2012 R2\n            Microsoft(R) Windows(R) Server 2003, Standard Edition x64 -&#62; #3 : 2003\n            Microsoft Hyper-V Server 2012 R2 -&#62; #3 : 2012 R2\n            Microsoft® Windows Server® 2008 Standard -&#62; #3 : 2008','2024-11-19 10:17:34',1,'clean_windows_server_os_version',0,'2024-11-19 10:17:34'),
(88,0,'RuleDictionnaryOperatingSystemEdition',1,'Clean Linux OS Edition','','AND',0,'/(SUSE|SunOS|Red Hat|CentOS|Ubuntu|Debian|Fedora|AlmaLinux|Oracle)(?:\\D+|)([\\d.]+) ?(?:\\(?([\\w ]+)\\)?)?/\n\n        Example :\n        Ubuntu 22.04.1 LTS -&#62; #2 = LTS\n        SUSE Linux Enterprise Server 11 (x86_64) -&#62; #2 = x86_64\n        Red Hat Enterprise Linux Server release 7.9 (Maipo) -&#62; #2 = Maipo\n        Red Hat Enterprise Linux Server release 6.10 (Santiago) -&#62; #2 = Santiago\n        Fedora release 36 (Thirty Six) -&#62; #2 = Thirty Six\n        Debian GNU/Linux 9.5 (stretch) -&#62; #2 = stretch\n        Debian GNU/Linux 8.9 (jessie) -&#62; #2 = jessie\n        CentOS Linux release 7.2.1511 (Core) -&#62; #2 = Core\n        AlmaLinux 9.0 (Emerald Puma) -&#62; #2 = Emerald Puma\n        AlmaLinux 8.6 (Sky Tiger) -&#62; #2 = Sky Tiger','2024-11-19 10:17:34',1,'clean_linux_os_edition',0,'2024-11-19 10:17:34'),
(89,0,'RuleDictionnaryOperatingSystemEdition',2,'Clean Windows OS Edition','','AND',0,'/(Microsoft)(?&#62;\\(R\\)|®)? (Windows) (XP|\\d\\.\\d|\\d{1,4}|Vista)(™)? ?(.*)/\n\n        Example :\n        Microsoft Windows XP Professionnel -&#62; #4 : Professionnel\n        Microsoft Windows 7 Enterprise  -&#62; #4 : Enterprise\n        Microsoft® Windows Vista Professionnel  -&#62; #4 : Professionnel\n        Microsoft Windows XP Édition familiale  -&#62; #4 : Édition familiale\n        Microsoft Windows 10 Entreprise  -&#62; #4 : Entreprise\n        Microsoft Windows 10 Professionnel  -&#62; #4 : Professionnel\n        Microsoft Windows 11 Professionnel  -&#62; #4 : Professionnel','2024-11-19 10:17:34',1,'clean_windows_os_edition',0,'2024-11-19 10:17:34'),
(90,0,'RuleDictionnaryOperatingSystemEdition',3,'Clean Windows Server OS Edition','','AND',0,'/(Microsoft)(?&#62;\\(R\\)|®)? (?:(Hyper-V|Windows)(?:\\(R\\))?) ((?:Server|))(?:\\(R\\)|®)? (\\d{4}(?: R2)?)(?:[,\\s]++)?([^\\s]*)(?: Edition(?: x64)?)?$/\n\n        Example :\n        Microsoft Windows Server 2012 R2 Datacenter -&#62; #4 : Datacenter\n        Microsoft(R) Windows(R) Server 2003, Standard Edition x64 -&#62; #4 : Standard\n        Microsoft Hyper-V Server 2012 R2 -&#62; #4 :\n        Microsoft® Windows Server® 2008 Standard -&#62; #4: Standard','2024-11-19 10:17:34',1,'clean_windows_server_os_edition',0,'2024-11-19 10:17:34');
/*!40000 ALTER TABLE `glpi_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_savedsearches`
--

DROP TABLE IF EXISTS `glpi_savedsearches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_savedsearches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT 'see SavedSearch:: constants',
  `itemtype` varchar(100) NOT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_private` tinyint(4) NOT NULL DEFAULT 1,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `query` text DEFAULT NULL,
  `last_execution_time` int(11) DEFAULT NULL,
  `do_count` tinyint(4) NOT NULL DEFAULT 2 COMMENT 'Do or do not count results on list display see SavedSearch::COUNT_* constants',
  `last_execution_date` timestamp NULL DEFAULT NULL,
  `counter` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `type` (`type`),
  KEY `itemtype` (`itemtype`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id` (`users_id`),
  KEY `is_private` (`is_private`),
  KEY `is_recursive` (`is_recursive`),
  KEY `last_execution_time` (`last_execution_time`),
  KEY `last_execution_date` (`last_execution_date`),
  KEY `do_count` (`do_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_savedsearches`
--

LOCK TABLES `glpi_savedsearches` WRITE;
/*!40000 ALTER TABLE `glpi_savedsearches` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_savedsearches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_savedsearches_alerts`
--

DROP TABLE IF EXISTS `glpi_savedsearches_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_savedsearches_alerts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `savedsearches_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `operator` tinyint(4) NOT NULL,
  `value` int(11) NOT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `frequency` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`savedsearches_id`,`operator`,`value`),
  KEY `name` (`name`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_savedsearches_alerts`
--

LOCK TABLES `glpi_savedsearches_alerts` WRITE;
/*!40000 ALTER TABLE `glpi_savedsearches_alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_savedsearches_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_savedsearches_users`
--

DROP TABLE IF EXISTS `glpi_savedsearches_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_savedsearches_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) NOT NULL,
  `savedsearches_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`itemtype`),
  KEY `savedsearches_id` (`savedsearches_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_savedsearches_users`
--

LOCK TABLES `glpi_savedsearches_users` WRITE;
/*!40000 ALTER TABLE `glpi_savedsearches_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_savedsearches_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_slalevelactions`
--

DROP TABLE IF EXISTS `glpi_slalevelactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_slalevelactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slalevels_id` int(10) unsigned NOT NULL DEFAULT 0,
  `action_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slalevels_id` (`slalevels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_slalevelactions`
--

LOCK TABLES `glpi_slalevelactions` WRITE;
/*!40000 ALTER TABLE `glpi_slalevelactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_slalevelactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_slalevelcriterias`
--

DROP TABLE IF EXISTS `glpi_slalevelcriterias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_slalevelcriterias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slalevels_id` int(10) unsigned NOT NULL DEFAULT 0,
  `criteria` varchar(255) DEFAULT NULL,
  `condition` int(11) NOT NULL DEFAULT 0 COMMENT 'see define.php PATTERN_* and REGEX_* constant',
  `pattern` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slalevels_id` (`slalevels_id`),
  KEY `condition` (`condition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_slalevelcriterias`
--

LOCK TABLES `glpi_slalevelcriterias` WRITE;
/*!40000 ALTER TABLE `glpi_slalevelcriterias` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_slalevelcriterias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_slalevels`
--

DROP TABLE IF EXISTS `glpi_slalevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_slalevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `slas_id` int(10) unsigned NOT NULL DEFAULT 0,
  `execution_time` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `match` char(10) DEFAULT NULL COMMENT 'see define.php *_MATCHING constant',
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `slas_id` (`slas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_slalevels`
--

LOCK TABLES `glpi_slalevels` WRITE;
/*!40000 ALTER TABLE `glpi_slalevels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_slalevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_slalevels_tickets`
--

DROP TABLE IF EXISTS `glpi_slalevels_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_slalevels_tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `slalevels_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`slalevels_id`),
  KEY `slalevels_id` (`slalevels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_slalevels_tickets`
--

LOCK TABLES `glpi_slalevels_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_slalevels_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_slalevels_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_slas`
--

DROP TABLE IF EXISTS `glpi_slas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_slas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `number_time` int(11) NOT NULL,
  `use_ticket_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `calendars_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `definition_time` varchar(255) DEFAULT NULL,
  `end_of_working_day` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `slms_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `calendars_id` (`calendars_id`),
  KEY `slms_id` (`slms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_slas`
--

LOCK TABLES `glpi_slas` WRITE;
/*!40000 ALTER TABLE `glpi_slas` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_slas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_slms`
--

DROP TABLE IF EXISTS `glpi_slms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_slms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `use_ticket_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `calendars_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `calendars_id` (`calendars_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_slms`
--

LOCK TABLES `glpi_slms` WRITE;
/*!40000 ALTER TABLE `glpi_slms` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_slms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_snmpcredentials`
--

DROP TABLE IF EXISTS `glpi_snmpcredentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_snmpcredentials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `snmpversion` varchar(8) NOT NULL DEFAULT '1',
  `community` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `authentication` varchar(255) DEFAULT NULL,
  `auth_passphrase` varchar(255) DEFAULT NULL,
  `encryption` varchar(255) DEFAULT NULL,
  `priv_passphrase` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `snmpversion` (`snmpversion`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_snmpcredentials`
--

LOCK TABLES `glpi_snmpcredentials` WRITE;
/*!40000 ALTER TABLE `glpi_snmpcredentials` DISABLE KEYS */;
INSERT INTO `glpi_snmpcredentials` VALUES
(1,'Public community v1','1','public',NULL,NULL,NULL,NULL,NULL,0),
(2,'Public community v2c','2','public',NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `glpi_snmpcredentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_socketmodels`
--

DROP TABLE IF EXISTS `glpi_socketmodels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_socketmodels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_socketmodels`
--

LOCK TABLES `glpi_socketmodels` WRITE;
/*!40000 ALTER TABLE `glpi_socketmodels` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_socketmodels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_sockets`
--

DROP TABLE IF EXISTS `glpi_sockets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_sockets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `socketmodels_id` int(10) unsigned NOT NULL DEFAULT 0,
  `wiring_side` tinyint(4) DEFAULT 1,
  `itemtype` varchar(255) DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `networkports_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `socketmodels_id` (`socketmodels_id`),
  KEY `location_name` (`locations_id`,`name`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `networkports_id` (`networkports_id`),
  KEY `wiring_side` (`wiring_side`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_sockets`
--

LOCK TABLES `glpi_sockets` WRITE;
/*!40000 ALTER TABLE `glpi_sockets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_sockets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_softwarecategories`
--

DROP TABLE IF EXISTS `glpi_softwarecategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_softwarecategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `softwarecategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `softwarecategories_id` (`softwarecategories_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_softwarecategories`
--

LOCK TABLES `glpi_softwarecategories` WRITE;
/*!40000 ALTER TABLE `glpi_softwarecategories` DISABLE KEYS */;
INSERT INTO `glpi_softwarecategories` VALUES
(1,'Inventoried',NULL,0,'Software from inventories',1,NULL,NULL);
/*!40000 ALTER TABLE `glpi_softwarecategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_softwarelicenses`
--

DROP TABLE IF EXISTS `glpi_softwarelicenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_softwarelicenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `softwares_id` int(10) unsigned NOT NULL DEFAULT 0,
  `softwarelicenses_id` int(10) unsigned NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `number` int(11) NOT NULL DEFAULT 0,
  `softwarelicensetypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `softwareversions_id_buy` int(10) unsigned NOT NULL DEFAULT 0,
  `softwareversions_id_use` int(10) unsigned NOT NULL DEFAULT 0,
  `expire` date DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `is_valid` tinyint(4) NOT NULL DEFAULT 1,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_helpdesk_visible` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `allow_overquota` tinyint(4) NOT NULL DEFAULT 0,
  `pictures` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `expire` (`expire`),
  KEY `softwareversions_id_buy` (`softwareversions_id_buy`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `softwarelicensetypes_id` (`softwarelicensetypes_id`),
  KEY `softwareversions_id_use` (`softwareversions_id_use`),
  KEY `date_mod` (`date_mod`),
  KEY `softwares_id_expire_number` (`softwares_id`,`expire`,`number`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `users_id` (`users_id`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `groups_id` (`groups_id`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_creation` (`date_creation`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `states_id` (`states_id`),
  KEY `allow_overquota` (`allow_overquota`),
  KEY `softwarelicenses_id` (`softwarelicenses_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_softwarelicenses`
--

LOCK TABLES `glpi_softwarelicenses` WRITE;
/*!40000 ALTER TABLE `glpi_softwarelicenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_softwarelicenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_softwarelicensetypes`
--

DROP TABLE IF EXISTS `glpi_softwarelicensetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_softwarelicensetypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `softwarelicensetypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `softwarelicensetypes_id` (`softwarelicensetypes_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_softwarelicensetypes`
--

LOCK TABLES `glpi_softwarelicensetypes` WRITE;
/*!40000 ALTER TABLE `glpi_softwarelicensetypes` DISABLE KEYS */;
INSERT INTO `glpi_softwarelicensetypes` VALUES
(1,'OEM',NULL,NULL,NULL,0,0,NULL,NULL,0,1,'OEM');
/*!40000 ALTER TABLE `glpi_softwarelicensetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_softwares`
--

DROP TABLE IF EXISTS `glpi_softwares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_softwares` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `is_update` tinyint(4) NOT NULL DEFAULT 0,
  `softwares_id` int(10) unsigned NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `is_template` tinyint(4) NOT NULL DEFAULT 0,
  `template_name` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ticket_tco` decimal(20,4) DEFAULT 0.0000,
  `is_helpdesk_visible` tinyint(4) NOT NULL DEFAULT 1,
  `softwarecategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_valid` tinyint(4) NOT NULL DEFAULT 1,
  `date_creation` timestamp NULL DEFAULT NULL,
  `pictures` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date_mod` (`date_mod`),
  KEY `name` (`name`),
  KEY `is_template` (`is_template`),
  KEY `is_update` (`is_update`),
  KEY `softwarecategories_id` (`softwarecategories_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `softwares_id` (`softwares_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_helpdesk_visible` (`is_helpdesk_visible`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_softwares`
--

LOCK TABLES `glpi_softwares` WRITE;
/*!40000 ALTER TABLE `glpi_softwares` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_softwares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_softwareversions`
--

DROP TABLE IF EXISTS `glpi_softwareversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_softwareversions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `softwares_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `arch` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `operatingsystems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `arch` (`arch`),
  KEY `softwares_id` (`softwares_id`),
  KEY `states_id` (`states_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `operatingsystems_id` (`operatingsystems_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_softwareversions`
--

LOCK TABLES `glpi_softwareversions` WRITE;
/*!40000 ALTER TABLE `glpi_softwareversions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_softwareversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_solutiontemplates`
--

DROP TABLE IF EXISTS `glpi_solutiontemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_solutiontemplates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `solutiontypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `solutiontypes_id` (`solutiontypes_id`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_solutiontemplates`
--

LOCK TABLES `glpi_solutiontemplates` WRITE;
/*!40000 ALTER TABLE `glpi_solutiontemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_solutiontemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_solutiontypes`
--

DROP TABLE IF EXISTS `glpi_solutiontypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_solutiontypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_solutiontypes`
--

LOCK TABLES `glpi_solutiontypes` WRITE;
/*!40000 ALTER TABLE `glpi_solutiontypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_solutiontypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ssovariables`
--

DROP TABLE IF EXISTS `glpi_ssovariables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ssovariables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ssovariables`
--

LOCK TABLES `glpi_ssovariables` WRITE;
/*!40000 ALTER TABLE `glpi_ssovariables` DISABLE KEYS */;
INSERT INTO `glpi_ssovariables` VALUES
(1,'HTTP_AUTH_USER',NULL,NULL,NULL),
(2,'REMOTE_USER',NULL,NULL,NULL),
(3,'PHP_AUTH_USER',NULL,NULL,NULL),
(4,'USERNAME',NULL,NULL,NULL),
(5,'REDIRECT_REMOTE_USER',NULL,NULL,NULL),
(6,'HTTP_REMOTE_USER',NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_ssovariables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_states`
--

DROP TABLE IF EXISTS `glpi_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `completename` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `is_visible_computer` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_monitor` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_networkequipment` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_peripheral` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_phone` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_printer` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_softwareversion` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_softwarelicense` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_line` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_certificate` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_rack` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_passivedcequipment` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_enclosure` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_pdu` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_cluster` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_contract` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_appliance` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_databaseinstance` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_cable` tinyint(4) NOT NULL DEFAULT 1,
  `is_visible_unmanaged` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`states_id`,`name`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_visible_computer` (`is_visible_computer`),
  KEY `is_visible_monitor` (`is_visible_monitor`),
  KEY `is_visible_networkequipment` (`is_visible_networkequipment`),
  KEY `is_visible_peripheral` (`is_visible_peripheral`),
  KEY `is_visible_phone` (`is_visible_phone`),
  KEY `is_visible_printer` (`is_visible_printer`),
  KEY `is_visible_softwareversion` (`is_visible_softwareversion`),
  KEY `is_visible_softwarelicense` (`is_visible_softwarelicense`),
  KEY `is_visible_line` (`is_visible_line`),
  KEY `is_visible_certificate` (`is_visible_certificate`),
  KEY `is_visible_rack` (`is_visible_rack`),
  KEY `is_visible_passivedcequipment` (`is_visible_passivedcequipment`),
  KEY `is_visible_enclosure` (`is_visible_enclosure`),
  KEY `is_visible_pdu` (`is_visible_pdu`),
  KEY `is_visible_cluster` (`is_visible_cluster`),
  KEY `is_visible_contract` (`is_visible_contract`),
  KEY `is_visible_appliance` (`is_visible_appliance`),
  KEY `is_visible_databaseinstance` (`is_visible_databaseinstance`),
  KEY `is_visible_cable` (`is_visible_cable`),
  KEY `is_visible_unmanaged` (`is_visible_unmanaged`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `level` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_states`
--

LOCK TABLES `glpi_states` WRITE;
/*!40000 ALTER TABLE `glpi_states` DISABLE KEYS */;
INSERT INTO `glpi_states` VALUES
(1,'Operational',0,0,'',0,'Operational',1,'[]',NULL,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,'2025-01-27 13:08:50','2025-01-27 13:08:50'),
(2,'Defective',0,0,'',0,'Defective',1,'[]',NULL,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,'2025-01-27 13:09:00','2025-01-27 13:09:00');
/*!40000 ALTER TABLE `glpi_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_suppliers`
--

DROP TABLE IF EXISTS `glpi_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_suppliers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `suppliertypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `registration_number` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `pictures` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `suppliertypes_id` (`suppliertypes_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_suppliers`
--

LOCK TABLES `glpi_suppliers` WRITE;
/*!40000 ALTER TABLE `glpi_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_suppliers_tickets`
--

DROP TABLE IF EXISTS `glpi_suppliers_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_suppliers_tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `suppliers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 1,
  `alternative_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`suppliers_id`),
  KEY `group` (`suppliers_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_suppliers_tickets`
--

LOCK TABLES `glpi_suppliers_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_suppliers_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_suppliers_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_suppliertypes`
--

DROP TABLE IF EXISTS `glpi_suppliertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_suppliertypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_suppliertypes`
--

LOCK TABLES `glpi_suppliertypes` WRITE;
/*!40000 ALTER TABLE `glpi_suppliertypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_suppliertypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_taskcategories`
--

DROP TABLE IF EXISTS `glpi_taskcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_taskcategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `taskcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `completename` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `ancestors_cache` longtext DEFAULT NULL,
  `sons_cache` longtext DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `is_helpdeskvisible` tinyint(4) NOT NULL DEFAULT 1,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `knowbaseitemcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `is_helpdeskvisible` (`is_helpdeskvisible`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `knowbaseitemcategories_id` (`knowbaseitemcategories_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_taskcategories`
--

LOCK TABLES `glpi_taskcategories` WRITE;
/*!40000 ALTER TABLE `glpi_taskcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_taskcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tasktemplates`
--

DROP TABLE IF EXISTS `glpi_tasktemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tasktemplates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `taskcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `is_private` tinyint(4) NOT NULL DEFAULT 0,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `is_recursive` (`is_recursive`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `entities_id` (`entities_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `is_private` (`is_private`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tasktemplates`
--

LOCK TABLES `glpi_tasktemplates` WRITE;
/*!40000 ALTER TABLE `glpi_tasktemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_tasktemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ticketcosts`
--

DROP TABLE IF EXISTS `glpi_ticketcosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ticketcosts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `cost_time` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_fixed` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `cost_material` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `budgets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `tickets_id` (`tickets_id`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `entities_id` (`entities_id`),
  KEY `budgets_id` (`budgets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ticketcosts`
--

LOCK TABLES `glpi_ticketcosts` WRITE;
/*!40000 ALTER TABLE `glpi_ticketcosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_ticketcosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ticketrecurrents`
--

DROP TABLE IF EXISTS `glpi_ticketrecurrents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ticketrecurrents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `tickettemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `begin_date` timestamp NULL DEFAULT NULL,
  `periodicity` varchar(255) DEFAULT NULL,
  `create_before` int(11) NOT NULL DEFAULT 0,
  `next_creation_date` timestamp NULL DEFAULT NULL,
  `calendars_id` int(10) unsigned NOT NULL DEFAULT 0,
  `end_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `is_active` (`is_active`),
  KEY `tickettemplates_id` (`tickettemplates_id`),
  KEY `next_creation_date` (`next_creation_date`),
  KEY `calendars_id` (`calendars_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ticketrecurrents`
--

LOCK TABLES `glpi_ticketrecurrents` WRITE;
/*!40000 ALTER TABLE `glpi_ticketrecurrents` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_ticketrecurrents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickets`
--

DROP TABLE IF EXISTS `glpi_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `closedate` timestamp NULL DEFAULT NULL,
  `solvedate` timestamp NULL DEFAULT NULL,
  `takeintoaccountdate` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `users_id_lastupdater` int(10) unsigned NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `users_id_recipient` int(10) unsigned NOT NULL DEFAULT 0,
  `requesttypes_id` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `urgency` int(11) NOT NULL DEFAULT 1,
  `impact` int(11) NOT NULL DEFAULT 1,
  `priority` int(11) NOT NULL DEFAULT 1,
  `itilcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `global_validation` int(11) NOT NULL DEFAULT 1,
  `slas_id_ttr` int(10) unsigned NOT NULL DEFAULT 0,
  `slas_id_tto` int(10) unsigned NOT NULL DEFAULT 0,
  `slalevels_id_ttr` int(10) unsigned NOT NULL DEFAULT 0,
  `time_to_resolve` timestamp NULL DEFAULT NULL,
  `time_to_own` timestamp NULL DEFAULT NULL,
  `begin_waiting_date` timestamp NULL DEFAULT NULL,
  `sla_waiting_duration` int(11) NOT NULL DEFAULT 0,
  `ola_waiting_duration` int(11) NOT NULL DEFAULT 0,
  `olas_id_tto` int(10) unsigned NOT NULL DEFAULT 0,
  `olas_id_ttr` int(10) unsigned NOT NULL DEFAULT 0,
  `olalevels_id_ttr` int(10) unsigned NOT NULL DEFAULT 0,
  `ola_tto_begin_date` timestamp NULL DEFAULT NULL,
  `ola_ttr_begin_date` timestamp NULL DEFAULT NULL,
  `internal_time_to_resolve` timestamp NULL DEFAULT NULL,
  `internal_time_to_own` timestamp NULL DEFAULT NULL,
  `waiting_duration` int(11) NOT NULL DEFAULT 0,
  `close_delay_stat` int(11) NOT NULL DEFAULT 0,
  `solve_delay_stat` int(11) NOT NULL DEFAULT 0,
  `takeintoaccount_delay_stat` int(11) NOT NULL DEFAULT 0,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `validation_percent` int(11) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `closedate` (`closedate`),
  KEY `status` (`status`),
  KEY `priority` (`priority`),
  KEY `request_type` (`requesttypes_id`),
  KEY `date_mod` (`date_mod`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id_recipient` (`users_id_recipient`),
  KEY `solvedate` (`solvedate`),
  KEY `takeintoaccountdate` (`takeintoaccountdate`),
  KEY `urgency` (`urgency`),
  KEY `impact` (`impact`),
  KEY `global_validation` (`global_validation`),
  KEY `slas_id_tto` (`slas_id_tto`),
  KEY `slas_id_ttr` (`slas_id_ttr`),
  KEY `time_to_resolve` (`time_to_resolve`),
  KEY `time_to_own` (`time_to_own`),
  KEY `olas_id_tto` (`olas_id_tto`),
  KEY `olas_id_ttr` (`olas_id_ttr`),
  KEY `slalevels_id_ttr` (`slalevels_id_ttr`),
  KEY `internal_time_to_resolve` (`internal_time_to_resolve`),
  KEY `internal_time_to_own` (`internal_time_to_own`),
  KEY `users_id_lastupdater` (`users_id_lastupdater`),
  KEY `type` (`type`),
  KEY `itilcategories_id` (`itilcategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `name` (`name`),
  KEY `locations_id` (`locations_id`),
  KEY `date_creation` (`date_creation`),
  KEY `ola_waiting_duration` (`ola_waiting_duration`),
  KEY `olalevels_id_ttr` (`olalevels_id_ttr`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickets`
--

LOCK TABLES `glpi_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_tickets` DISABLE KEYS */;
INSERT INTO `glpi_tickets` VALUES
(1,0,'ticket1','2024-11-19 10:27:53',NULL,NULL,'2024-11-19 10:27:53','2024-11-25 14:13:28',2,2,2,1,'&#60;p&#62;Hello World!&#60;/p&#62;',3,3,3,0,1,1,0,0,0,NULL,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,0,0,1,0,0,0,0,'2024-11-19 10:27:53'),
(2,0,'Deleted ticket','2024-11-25 14:21:33',NULL,NULL,'2024-11-25 14:21:33','2024-11-25 14:21:41',2,2,2,1,'&#60;p&#62;Text&#60;/p&#62;',3,3,3,0,1,1,0,0,0,NULL,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,0,0,0,1,0,1,0,0,'2024-11-25 14:21:33');
/*!40000 ALTER TABLE `glpi_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickets_contracts`
--

DROP TABLE IF EXISTS `glpi_tickets_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickets_contracts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `contracts_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`contracts_id`),
  KEY `contracts_id` (`contracts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickets_contracts`
--

LOCK TABLES `glpi_tickets_contracts` WRITE;
/*!40000 ALTER TABLE `glpi_tickets_contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_tickets_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickets_tickets`
--

DROP TABLE IF EXISTS `glpi_tickets_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickets_tickets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id_1` int(10) unsigned NOT NULL DEFAULT 0,
  `tickets_id_2` int(10) unsigned NOT NULL DEFAULT 0,
  `link` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id_1`,`tickets_id_2`),
  KEY `tickets_id_2` (`tickets_id_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickets_tickets`
--

LOCK TABLES `glpi_tickets_tickets` WRITE;
/*!40000 ALTER TABLE `glpi_tickets_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_tickets_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickets_users`
--

DROP TABLE IF EXISTS `glpi_tickets_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickets_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `use_notification` tinyint(4) NOT NULL DEFAULT 1,
  `alternative_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickets_id`,`type`,`users_id`,`alternative_email`),
  KEY `user` (`users_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickets_users`
--

LOCK TABLES `glpi_tickets_users` WRITE;
/*!40000 ALTER TABLE `glpi_tickets_users` DISABLE KEYS */;
INSERT INTO `glpi_tickets_users` VALUES
(1,1,2,1,0,''),
(2,1,2,2,0,''),
(3,2,2,1,0,''),
(4,2,2,2,0,'');
/*!40000 ALTER TABLE `glpi_tickets_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ticketsatisfactions`
--

DROP TABLE IF EXISTS `glpi_ticketsatisfactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ticketsatisfactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tickets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 1,
  `date_begin` timestamp NULL DEFAULT NULL,
  `date_answered` timestamp NULL DEFAULT NULL,
  `satisfaction` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tickets_id` (`tickets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ticketsatisfactions`
--

LOCK TABLES `glpi_ticketsatisfactions` WRITE;
/*!40000 ALTER TABLE `glpi_ticketsatisfactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_ticketsatisfactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickettasks`
--

DROP TABLE IF EXISTS `glpi_tickettasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickettasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `tickets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `taskcategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date` timestamp NULL DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_editor` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `is_private` tinyint(4) NOT NULL DEFAULT 0,
  `actiontime` int(11) NOT NULL DEFAULT 0,
  `begin` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 1,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `tasktemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  `sourceitems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sourceof_items_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `date` (`date`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`),
  KEY `users_id` (`users_id`),
  KEY `users_id_editor` (`users_id_editor`),
  KEY `tickets_id` (`tickets_id`),
  KEY `is_private` (`is_private`),
  KEY `taskcategories_id` (`taskcategories_id`),
  KEY `state` (`state`),
  KEY `users_id_tech` (`users_id_tech`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `begin` (`begin`),
  KEY `end` (`end`),
  KEY `tasktemplates_id` (`tasktemplates_id`),
  KEY `sourceitems_id` (`sourceitems_id`),
  KEY `sourceof_items_id` (`sourceof_items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickettasks`
--

LOCK TABLES `glpi_tickettasks` WRITE;
/*!40000 ALTER TABLE `glpi_tickettasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_tickettasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickettemplatehiddenfields`
--

DROP TABLE IF EXISTS `glpi_tickettemplatehiddenfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickettemplatehiddenfields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickettemplates_id`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickettemplatehiddenfields`
--

LOCK TABLES `glpi_tickettemplatehiddenfields` WRITE;
/*!40000 ALTER TABLE `glpi_tickettemplatehiddenfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_tickettemplatehiddenfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickettemplatemandatoryfields`
--

DROP TABLE IF EXISTS `glpi_tickettemplatemandatoryfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickettemplatemandatoryfields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`tickettemplates_id`,`num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickettemplatemandatoryfields`
--

LOCK TABLES `glpi_tickettemplatemandatoryfields` WRITE;
/*!40000 ALTER TABLE `glpi_tickettemplatemandatoryfields` DISABLE KEYS */;
INSERT INTO `glpi_tickettemplatemandatoryfields` VALUES
(1,1,21);
/*!40000 ALTER TABLE `glpi_tickettemplatemandatoryfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickettemplatepredefinedfields`
--

DROP TABLE IF EXISTS `glpi_tickettemplatepredefinedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickettemplatepredefinedfields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tickettemplates_id` int(10) unsigned NOT NULL DEFAULT 0,
  `num` int(11) NOT NULL DEFAULT 0,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickettemplates_id` (`tickettemplates_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickettemplatepredefinedfields`
--

LOCK TABLES `glpi_tickettemplatepredefinedfields` WRITE;
/*!40000 ALTER TABLE `glpi_tickettemplatepredefinedfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_tickettemplatepredefinedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_tickettemplates`
--

DROP TABLE IF EXISTS `glpi_tickettemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_tickettemplates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_tickettemplates`
--

LOCK TABLES `glpi_tickettemplates` WRITE;
/*!40000 ALTER TABLE `glpi_tickettemplates` DISABLE KEYS */;
INSERT INTO `glpi_tickettemplates` VALUES
(1,'Default',0,1,NULL);
/*!40000 ALTER TABLE `glpi_tickettemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_ticketvalidations`
--

DROP TABLE IF EXISTS `glpi_ticketvalidations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_ticketvalidations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tickets_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_validate` int(10) unsigned NOT NULL DEFAULT 0,
  `comment_submission` text DEFAULT NULL,
  `comment_validation` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `submission_date` timestamp NULL DEFAULT NULL,
  `validation_date` timestamp NULL DEFAULT NULL,
  `timeline_position` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `users_id` (`users_id`),
  KEY `users_id_validate` (`users_id_validate`),
  KEY `tickets_id` (`tickets_id`),
  KEY `submission_date` (`submission_date`),
  KEY `validation_date` (`validation_date`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_ticketvalidations`
--

LOCK TABLES `glpi_ticketvalidations` WRITE;
/*!40000 ALTER TABLE `glpi_ticketvalidations` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_ticketvalidations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_transfers`
--

DROP TABLE IF EXISTS `glpi_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `keep_ticket` int(11) NOT NULL DEFAULT 0,
  `keep_networklink` int(11) NOT NULL DEFAULT 0,
  `keep_reservation` int(11) NOT NULL DEFAULT 0,
  `keep_history` int(11) NOT NULL DEFAULT 0,
  `keep_device` int(11) NOT NULL DEFAULT 0,
  `keep_infocom` int(11) NOT NULL DEFAULT 0,
  `keep_dc_monitor` int(11) NOT NULL DEFAULT 0,
  `clean_dc_monitor` int(11) NOT NULL DEFAULT 0,
  `keep_dc_phone` int(11) NOT NULL DEFAULT 0,
  `clean_dc_phone` int(11) NOT NULL DEFAULT 0,
  `keep_dc_peripheral` int(11) NOT NULL DEFAULT 0,
  `clean_dc_peripheral` int(11) NOT NULL DEFAULT 0,
  `keep_dc_printer` int(11) NOT NULL DEFAULT 0,
  `clean_dc_printer` int(11) NOT NULL DEFAULT 0,
  `keep_supplier` int(11) NOT NULL DEFAULT 0,
  `clean_supplier` int(11) NOT NULL DEFAULT 0,
  `keep_contact` int(11) NOT NULL DEFAULT 0,
  `clean_contact` int(11) NOT NULL DEFAULT 0,
  `keep_contract` int(11) NOT NULL DEFAULT 0,
  `clean_contract` int(11) NOT NULL DEFAULT 0,
  `keep_software` int(11) NOT NULL DEFAULT 0,
  `clean_software` int(11) NOT NULL DEFAULT 0,
  `keep_document` int(11) NOT NULL DEFAULT 0,
  `clean_document` int(11) NOT NULL DEFAULT 0,
  `keep_cartridgeitem` int(11) NOT NULL DEFAULT 0,
  `clean_cartridgeitem` int(11) NOT NULL DEFAULT 0,
  `keep_cartridge` int(11) NOT NULL DEFAULT 0,
  `keep_consumable` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `keep_disk` int(11) NOT NULL DEFAULT 0,
  `keep_certificate` int(11) NOT NULL DEFAULT 0,
  `clean_certificate` int(11) NOT NULL DEFAULT 0,
  `lock_updated_fields` int(11) NOT NULL DEFAULT 0,
  `keep_location` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_transfers`
--

LOCK TABLES `glpi_transfers` WRITE;
/*!40000 ALTER TABLE `glpi_transfers` DISABLE KEYS */;
INSERT INTO `glpi_transfers` VALUES
(1,'complete',2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,NULL,NULL,NULL,1,1,1,0,1);
/*!40000 ALTER TABLE `glpi_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_unmanageds`
--

DROP TABLE IF EXISTS `glpi_unmanageds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_unmanageds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `serial` varchar(255) DEFAULT NULL,
  `otherserial` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `contact_num` varchar(255) DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `networks_id` int(10) unsigned NOT NULL DEFAULT 0,
  `manufacturers_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `states_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `groups_id_tech` int(10) unsigned NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `date_creation` timestamp NULL DEFAULT NULL,
  `autoupdatesystems_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sysdescr` text DEFAULT NULL,
  `agents_id` int(10) unsigned NOT NULL DEFAULT 0,
  `itemtype` varchar(100) DEFAULT NULL,
  `accepted` tinyint(4) NOT NULL DEFAULT 0,
  `hub` tinyint(4) NOT NULL DEFAULT 0,
  `ip` varchar(255) DEFAULT NULL,
  `snmpcredentials_id` int(10) unsigned NOT NULL DEFAULT 0,
  `last_inventory_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `manufacturers_id` (`manufacturers_id`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id` (`users_id`),
  KEY `locations_id` (`locations_id`),
  KEY `networks_id` (`networks_id`),
  KEY `states_id` (`states_id`),
  KEY `groups_id_tech` (`groups_id_tech`),
  KEY `is_deleted` (`is_deleted`),
  KEY `date_mod` (`date_mod`),
  KEY `is_dynamic` (`is_dynamic`),
  KEY `serial` (`serial`),
  KEY `otherserial` (`otherserial`),
  KEY `date_creation` (`date_creation`),
  KEY `autoupdatesystems_id` (`autoupdatesystems_id`),
  KEY `agents_id` (`agents_id`),
  KEY `snmpcredentials_id` (`snmpcredentials_id`),
  KEY `users_id_tech` (`users_id_tech`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_unmanageds`
--

LOCK TABLES `glpi_unmanageds` WRITE;
/*!40000 ALTER TABLE `glpi_unmanageds` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_unmanageds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_usbvendors`
--

DROP TABLE IF EXISTS `glpi_usbvendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_usbvendors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `vendorid` varchar(4) NOT NULL,
  `deviceid` varchar(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`vendorid`,`deviceid`),
  KEY `deviceid` (`deviceid`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_usbvendors`
--

LOCK TABLES `glpi_usbvendors` WRITE;
/*!40000 ALTER TABLE `glpi_usbvendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_usbvendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_usercategories`
--

DROP TABLE IF EXISTS `glpi_usercategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_usercategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_usercategories`
--

LOCK TABLES `glpi_usercategories` WRITE;
/*!40000 ALTER TABLE `glpi_usercategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_usercategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_useremails`
--

DROP TABLE IF EXISTS `glpi_useremails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_useremails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_dynamic` tinyint(4) NOT NULL DEFAULT 0,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`users_id`,`email`),
  KEY `email` (`email`),
  KEY `is_default` (`is_default`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_useremails`
--

LOCK TABLES `glpi_useremails` WRITE;
/*!40000 ALTER TABLE `glpi_useremails` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_useremails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_users`
--

DROP TABLE IF EXISTS `glpi_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_last_update` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `locations_id` int(10) unsigned NOT NULL DEFAULT 0,
  `language` char(10) DEFAULT NULL COMMENT 'see define.php CFG_GLPI[language] array',
  `use_mode` int(11) NOT NULL DEFAULT 0,
  `list_limit` int(11) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `comment` text DEFAULT NULL,
  `auths_id` int(10) unsigned NOT NULL DEFAULT 0,
  `authtype` int(11) NOT NULL DEFAULT 0,
  `last_login` timestamp NULL DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_sync` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0,
  `profiles_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entities_id` int(10) unsigned DEFAULT 0,
  `usertitles_id` int(10) unsigned NOT NULL DEFAULT 0,
  `usercategories_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_format` int(11) DEFAULT NULL,
  `number_format` int(11) DEFAULT NULL,
  `names_format` int(11) DEFAULT NULL,
  `csv_delimiter` char(1) DEFAULT NULL,
  `is_ids_visible` tinyint(4) DEFAULT NULL,
  `use_flat_dropdowntree` tinyint(4) DEFAULT NULL,
  `use_flat_dropdowntree_on_search_result` tinyint(4) DEFAULT NULL,
  `show_jobs_at_login` tinyint(4) DEFAULT NULL,
  `priority_1` char(20) DEFAULT NULL,
  `priority_2` char(20) DEFAULT NULL,
  `priority_3` char(20) DEFAULT NULL,
  `priority_4` char(20) DEFAULT NULL,
  `priority_5` char(20) DEFAULT NULL,
  `priority_6` char(20) DEFAULT NULL,
  `followup_private` tinyint(4) DEFAULT NULL,
  `task_private` tinyint(4) DEFAULT NULL,
  `default_requesttypes_id` int(10) unsigned DEFAULT NULL,
  `password_forget_token` char(40) DEFAULT NULL,
  `password_forget_token_date` timestamp NULL DEFAULT NULL,
  `user_dn` text DEFAULT NULL,
  `user_dn_hash` varchar(32) DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `show_count_on_tabs` tinyint(4) DEFAULT NULL,
  `refresh_views` int(11) DEFAULT NULL,
  `set_default_tech` tinyint(4) DEFAULT NULL,
  `personal_token` varchar(255) DEFAULT NULL,
  `personal_token_date` timestamp NULL DEFAULT NULL,
  `api_token` varchar(255) DEFAULT NULL,
  `api_token_date` timestamp NULL DEFAULT NULL,
  `cookie_token` varchar(255) DEFAULT NULL,
  `cookie_token_date` timestamp NULL DEFAULT NULL,
  `display_count_on_home` int(11) DEFAULT NULL,
  `notification_to_myself` tinyint(4) DEFAULT NULL,
  `duedateok_color` varchar(255) DEFAULT NULL,
  `duedatewarning_color` varchar(255) DEFAULT NULL,
  `duedatecritical_color` varchar(255) DEFAULT NULL,
  `duedatewarning_less` int(11) DEFAULT NULL,
  `duedatecritical_less` int(11) DEFAULT NULL,
  `duedatewarning_unit` varchar(255) DEFAULT NULL,
  `duedatecritical_unit` varchar(255) DEFAULT NULL,
  `display_options` text DEFAULT NULL,
  `is_deleted_ldap` tinyint(4) NOT NULL DEFAULT 0,
  `pdffont` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `begin_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `keep_devices_when_purging_item` tinyint(4) DEFAULT NULL,
  `privatebookmarkorder` longtext DEFAULT NULL,
  `backcreated` tinyint(4) DEFAULT NULL,
  `task_state` int(11) DEFAULT NULL,
  `palette` char(20) DEFAULT NULL,
  `page_layout` char(20) DEFAULT NULL,
  `fold_menu` tinyint(4) DEFAULT NULL,
  `fold_search` tinyint(4) DEFAULT NULL,
  `savedsearches_pinned` text DEFAULT NULL,
  `timeline_order` char(20) DEFAULT NULL,
  `itil_layout` text DEFAULT NULL,
  `richtext_layout` char(20) DEFAULT NULL,
  `set_default_requester` tinyint(4) DEFAULT NULL,
  `lock_autolock_mode` tinyint(4) DEFAULT NULL,
  `lock_directunlock_notification` tinyint(4) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `highcontrast_css` tinyint(4) DEFAULT 0,
  `plannings` text DEFAULT NULL,
  `sync_field` varchar(255) DEFAULT NULL,
  `groups_id` int(10) unsigned NOT NULL DEFAULT 0,
  `users_id_supervisor` int(10) unsigned NOT NULL DEFAULT 0,
  `timezone` varchar(50) DEFAULT NULL,
  `default_dashboard_central` varchar(100) DEFAULT NULL,
  `default_dashboard_assets` varchar(100) DEFAULT NULL,
  `default_dashboard_helpdesk` varchar(100) DEFAULT NULL,
  `default_dashboard_mini_ticket` varchar(100) DEFAULT NULL,
  `default_central_tab` tinyint(4) DEFAULT 0,
  `nickname` varchar(255) DEFAULT NULL,
  `timeline_action_btn_layout` tinyint(4) DEFAULT NULL,
  `timeline_date_format` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicityloginauth` (`name`,`authtype`,`auths_id`),
  KEY `firstname` (`firstname`),
  KEY `realname` (`realname`),
  KEY `entities_id` (`entities_id`),
  KEY `profiles_id` (`profiles_id`),
  KEY `locations_id` (`locations_id`),
  KEY `usertitles_id` (`usertitles_id`),
  KEY `usercategories_id` (`usercategories_id`),
  KEY `is_deleted` (`is_deleted`),
  KEY `is_active` (`is_active`),
  KEY `date_mod` (`date_mod`),
  KEY `authitem` (`authtype`,`auths_id`),
  KEY `is_deleted_ldap` (`is_deleted_ldap`),
  KEY `date_creation` (`date_creation`),
  KEY `begin_date` (`begin_date`),
  KEY `end_date` (`end_date`),
  KEY `sync_field` (`sync_field`),
  KEY `groups_id` (`groups_id`),
  KEY `users_id_supervisor` (`users_id_supervisor`),
  KEY `auths_id` (`auths_id`),
  KEY `default_requesttypes_id` (`default_requesttypes_id`),
  KEY `user_dn_hash` (`user_dn_hash`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_users`
--

LOCK TABLES `glpi_users` WRITE;
/*!40000 ALTER TABLE `glpi_users` DISABLE KEYS */;
INSERT INTO `glpi_users` VALUES
(2,'glpi','$2y$10$rXXzbc2ShaiCldwkw4AZL.n.9QSH7c0c9XJAyyjrbL9BwmWditAYm',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,20,1,NULL,0,1,'2025-01-27 12:34:48','2025-01-27 12:34:48',NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$10$ZLmGzR00ZJGW05LFoJaojOg3w2p6UL7ePP2T6wnARKs3EGMlI2kAa','2025-01-27 12:34:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,'post-only','$2y$10$dTMar1F3ef5X/H1IjX9gYOjQWBR1K4bERGf4/oTPxFtJE/c3vXILm',NULL,NULL,NULL,NULL,NULL,NULL,0,'en_GB',0,20,1,NULL,0,1,NULL,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),
(4,'tech','$2y$10$.xEgErizkp6Az0z.DHyoeOoenuh0RcsX4JapBk2JMD6VI17KtB1lO',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,20,1,NULL,0,1,'2024-11-25 14:52:17','2024-11-25 13:42:36',NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'LoU4vhqZ2pRZRyoNe8PpxyTDxkPzBVh6JD4rx6zy','2024-11-19 10:21:49',NULL,'2024-11-19 10:20:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'8a/4_67447ecce048a.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,'normal','$2y$10$Z6doq4zVHkSPZFbPeXTCluN1Q/r0ryZ3ZsSJncJqkN3.8cRiN0NV.',NULL,NULL,NULL,NULL,NULL,NULL,0,'en_GB',0,20,1,NULL,0,1,NULL,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),
(6,'glpi-system','',NULL,NULL,NULL,NULL,'Support',NULL,0,NULL,0,NULL,1,NULL,0,1,NULL,NULL,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `glpi_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_usertitles`
--

DROP TABLE IF EXISTS `glpi_usertitles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_usertitles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_usertitles`
--

LOCK TABLES `glpi_usertitles` WRITE;
/*!40000 ALTER TABLE `glpi_usertitles` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_usertitles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_virtualmachinestates`
--

DROP TABLE IF EXISTS `glpi_virtualmachinestates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_virtualmachinestates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_virtualmachinestates`
--

LOCK TABLES `glpi_virtualmachinestates` WRITE;
/*!40000 ALTER TABLE `glpi_virtualmachinestates` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_virtualmachinestates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_virtualmachinesystems`
--

DROP TABLE IF EXISTS `glpi_virtualmachinesystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_virtualmachinesystems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_virtualmachinesystems`
--

LOCK TABLES `glpi_virtualmachinesystems` WRITE;
/*!40000 ALTER TABLE `glpi_virtualmachinesystems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_virtualmachinesystems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_virtualmachinetypes`
--

DROP TABLE IF EXISTS `glpi_virtualmachinetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_virtualmachinetypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_virtualmachinetypes`
--

LOCK TABLES `glpi_virtualmachinetypes` WRITE;
/*!40000 ALTER TABLE `glpi_virtualmachinetypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_virtualmachinetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_vlans`
--

DROP TABLE IF EXISTS `glpi_vlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_vlans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `tag` int(11) NOT NULL DEFAULT 0,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `tag` (`tag`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_vlans`
--

LOCK TABLES `glpi_vlans` WRITE;
/*!40000 ALTER TABLE `glpi_vlans` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_vlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_vobjects`
--

DROP TABLE IF EXISTS `glpi_vobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_vobjects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `itemtype` varchar(100) DEFAULT NULL,
  `items_id` int(10) unsigned NOT NULL DEFAULT 0,
  `data` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`itemtype`,`items_id`),
  KEY `item` (`itemtype`,`items_id`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_vobjects`
--

LOCK TABLES `glpi_vobjects` WRITE;
/*!40000 ALTER TABLE `glpi_vobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_vobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glpi_wifinetworks`
--

DROP TABLE IF EXISTS `glpi_wifinetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glpi_wifinetworks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entities_id` int(10) unsigned NOT NULL DEFAULT 0,
  `is_recursive` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `essid` varchar(255) DEFAULT NULL,
  `mode` varchar(255) DEFAULT NULL COMMENT 'ad-hoc, access_point',
  `comment` text DEFAULT NULL,
  `date_mod` timestamp NULL DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`),
  KEY `is_recursive` (`is_recursive`),
  KEY `essid` (`essid`),
  KEY `name` (`name`),
  KEY `date_mod` (`date_mod`),
  KEY `date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glpi_wifinetworks`
--

LOCK TABLES `glpi_wifinetworks` WRITE;
/*!40000 ALTER TABLE `glpi_wifinetworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `glpi_wifinetworks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-01-27 13:14:42
