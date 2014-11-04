-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Nov 04, 2014 at 11:19 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `multiv_life`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `players`
-- 

CREATE TABLE `players` (
  `ids` int(4) unsigned zerofill NOT NULL default '0000',
  `serial` int(255) NOT NULL default '0' COMMENT 'Player Data MultIV System Serial',
  `name` varchar(255) NOT NULL,
  `perm` int(4) NOT NULL default '0' COMMENT 'Permission Access Level',
  `money` int(255) NOT NULL default '1000',
  PRIMARY KEY  (`ids`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `players`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `vehicles`
-- 

CREATE TABLE `vehicles` (
  `ids` int(6) unsigned zerofill NOT NULL,
  `model` int(4) NOT NULL,
  `color1` int(3) NOT NULL,
  `color2` int(3) NOT NULL,
  `color3` int(3) NOT NULL,
  `ownerid` int(4) NOT NULL COMMENT 'Owner ID in players table',
  `vehlicplate` varchar(255) NOT NULL COMMENT 'Vehicle License Plate',
  PRIMARY KEY  (`ids`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `vehicles`
-- 

