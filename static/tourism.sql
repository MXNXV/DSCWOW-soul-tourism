-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2020 at 09:05 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tourism`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `number` text NOT NULL,
  `msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `name`, `email`, `number`, `msg`) VALUES
(1, 'Manav', 'manavmandalpune@gmail.com', '+919588412823', 'Hey guys this is my first message'),
(2, 'Mem lord', 'mem@yahoo.com', '58225896', 'Hey there just beta testing.....................');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` text NOT NULL,
  `content` text NOT NULL,
  `name` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `img_file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `content`, `name`, `date`, `img_file`) VALUES
(1, 'Sky Diving!!!', 'first-post', 'Cascading down the airplane and getting thrilled is possible when you are skydiving in Mysore. With a sport as stimulant as Skydiving, everyone who loves it wishes for more. Skydiving has become one of the most popular adventure sports off late. It is now practiced in many parts of the country and abroad too. This requires a specific training post which you are equipped to go ahead and dive into the sky. With that said, Skydiving is a rather formidable sport and requires a lot of heart. Through skydiving in Mysore, you will observe the entire Mysore city and realize how small the human creations are. Though in oblivion, you will understand the value of your life as this experience will shudder you from inside. Mysore Skydiving is more fun especially because you observe the entire city and feel like a speck. After this skydiving exposure, you will be able to comprehend the vastness of Nature and that of the sky', 'Manav Mandal', '2020-12-12 13:27:30', 'sky.jpg'),
(2, 'Moti Talab or thonnur lake', 'second-post', 'En-route to Melkote, Thonnur is a quite town of much historical and religious significance. The lake, naturally formed by the rain waters from the surrounding hills, has a pretty setting. The lake is also called as Thirumala Sagara and subsequently came to known as Moti Talab (lake of pearls). The lake and surrounding country side make for a quite picnic spot.  Tourists can reach Kere Thonnur by covering a distance of a few kilometers after reaching at Pandavapura and observe the fascinating varieties of birds on the coast of Thonnur Lake. This picturesque lake offers a great chance to view birds, like black swans and many other species. It is said that Tipu Sultan was really impressed by the beauty of this lake and named it ‘Moti Talab’. Relaxing on the side of the lake with lots of sand and watching birds flying over the lake is a wonderful experience. Mesmerizing beauty of this lake makes it a perfect spot for picnicking and camping for tourists.', 'Prachiti Bhukan', '2020-12-12 13:29:41', 'moti.jpg'),
(3, 'Blue Lagoon Island', 'third-post', 'The island totally does justice to the name Blue Lagoon – blue, beautiful and breath-taking. Around about 21 kilometres from Mysore Railway Station, this island at KRS Backwaters is not much of a tourist destination and so, you will never find it to be extremely crowded making it a perfect spot to kick back and relax – taking in the calm and peaceful surroundings. As it is not a tourist spot, naturally there is a dearth of amenities on the island, so, pack your bag with food, toiletries, water and clothes before heading here. Though we wouldn\'t recommend staying the night. Surrounded by flora and fauna, the lagoon is lush and green and is also kept neat and clean The island provides a perfect setting for a small picnic – being quite isolated, it’s an amazing place if you’re looking to take a break from the hustle and bustle of the city life. However, Blue Lagoon is not accessible during the monsoon season, so, the best time to visit is post-monsoon and early summer. You can reach this place by taking an auto from KRS dam, and boat from the Blue Lagoon viewpoint.', 'Sairaj Gondkar', '2020-12-12 13:31:56', 'blue.jpg'),
(4, 'St. Philomena\'s Church, Mysore', 'fourth-post', 'Recognized as the second tallest church of Asia, St. Philomena\'s Church was constructed to pay tribute to the Catholic Saint and martyr of Roman Catholic Church, Saint Philomena. It is one of the most important historical sites in Mysore and is frequently visited by tourists from all over the country. Being one of the most distinctive landmarks of the city, it looks even more beautiful in the evening sky and is given religious importance having a Neo-Gothic style of architecture which makes it all the more famous amongst masses.', 'Prachiti Bhukan', '2020-12-12 13:33:28', 'church.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
