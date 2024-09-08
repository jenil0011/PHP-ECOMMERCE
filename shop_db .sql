-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Aug 29, 2024 at 09:03 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', 'f865b53623b121fd34ee5426c792e5c33af8c227'),
(18, 'jenil', '22ac9679e907c7842bde205176990093b0f99cec');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(71, 35, 25, 'car', 75, 1, '491375436-1.webp');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(3, 12, 'jenil', '21bmiitbscit001@gmail.com', '9537074554', 'hello'),
(4, 31, 'jenil', '21bmiitbscit001@gmail.com', '9537074554', 'dfsdf'),
(5, 44, 'jenil', '21bmiitbscit001@gmail.com', '9537074554', 'hiii!');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(3, 0, 'jenil', '21bmiitbscit001@gmail.com', '9537074554', 'hello'),
(5, 12, 'jenil', '21bmiitbscit001@gmail.com', '1321321321', 'jenil'),
(6, 29, 'jenil', '21bmiitbscit001@gmail.com', '9409626626', 'update not work'),
(7, 31, 'jenil', '21bmiitbscit001@gmail.com', '32123', 'sad');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(15, 29, 'Aryan', '9409626626', '21bmiit031@gmail.com', 'cash on delivery', 'flat no. 1561, nkjljl, fdgdryt, kllkjl, India - 395001', 'car2 (700 x 1) - bike (700 x 1) - ', 1400, '2023-11-06', 'completed'),
(16, 29, 'Aryan', '9409626626', '21bmiit031@gmail.com', 'paypal', 'flat no. sddsf, nkjljl, fdgdryt, kllkjl, India - 395001', 'bike (700 x 50) - ', 35000, '2023-11-06', 'completed'),
(17, 31, 'jenil', '7575', '21bmiitbscit001@gmail.com', 'cash on delivery', 'flat no. 8/729,daxini moholla, navsari bazar, surat, gujarat, India - 3950', 'truck (700 x 1) - ', 700, '2023-11-06', 'pending'),
(18, 31, 'jenil', '9537074554', '21bmiitbscit001@gmail.com', 'cash on delivery', 'flat no. 8/729,daxini moholla, navsari bazar, surat, gujarat, India - 395001', 'truck (700 x 1) - ', 700, '2023-11-06', 'pending'),
(19, 33, 'jenil', '9537074554', '21bmiitbscit001@gmail.com', 'credit card', 'flat no. 8/729,daxini moholla, navsari bazar, surat, gujarat, India - 395001', 'truck (700 x 6) - ', 4200, '2023-11-07', 'completed'),
(20, 40, 'jenil', '9537074554', '21bmiitbscit001@gmail.com', 'cash on delivery', 'flat no. 8/729,daxini moholla, navsari bazar, surat11, gujarat, India - 395001', 'truck (700 x 1) - ', 700, '2023-12-08', 'pending'),
(21, 41, 'parth', '9537074554', '21bmiit033@gmail.com', 'cash on delivery', 'flat no. 892,sagrampura, shahid circle, sadad, gujarat, India - 398222', 'truck (700 x 1) - ', 700, '2023-12-08', 'pending'),
(22, 41, 'parth', '9533333333', '21bmiit033@gmail.com', 'cash on delivery', 'flat no. 892,sagrampura, shahid circle, surat, gujarat, India - 398222', 'monster car (555 x 1) - ', 555, '2023-12-08', 'pending'),
(23, 44, 'jenil revdiwala', '9537074554', '21bmiitbscit001@gmail.com', 'cash on delivery', 'flat no. 8/729,daxini moholla, asdsad, Surat, Gujarat, India - 395001', 'barbie doll  (700 x 3) - ', 2100, '2023-12-09', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `brand` varchar(70) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `brand`, `image_01`, `image_02`, `image_03`) VALUES
(25, 'car', 'cars', 75, 'hotwheels', '491375436-1.webp', '43c6b249ec0e41ddcae4f3f5776def3c8bd59e0c_105788_i1.jpg', '491375436-2.webp'),
(26, 'monster car', 'cars', 555, 'hotwheels', '491375436-4.webp', '491375436-4.webp', '491375436-4.webp'),
(27, 'doll', '100', 100, 'barbie', '493663411-1.jpg', '493663408-1.jpg', '493663411-3.jpg'),
(35, 'barbie doll ', 'barbie doll', 700, 'barbie', '493663411-3.jpg', '493663411-1.jpg', '493663408-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `contact` int(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `doj` date NOT NULL,
  `salary` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `address`, `city`, `contact`, `email`, `password`, `doj`, `salary`) VALUES
(29, 'jenil', '8/729,daxini moholla', 'surat', 2147483647, '21bmiitbscit001@gmai', '56e320c4b20a63059d23', '2023-12-22', 100121),
(30, 'parth', '892,sagrampura', 'surat', 2147483647, '21bmiit033@gmail.com', '3cf3c76a6d6d888f4c6c', '2023-12-12', 9666);

-- --------------------------------------------------------

--
-- Table structure for table `tblsupplier`
--

CREATE TABLE `tblsupplier` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `shopname` varchar(50) NOT NULL,
  `shopaddress` varchar(150) NOT NULL,
  `shopcity` varchar(20) NOT NULL,
  `contactno` int(10) NOT NULL,
  `emailid` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblsupplier`
--

INSERT INTO `tblsupplier` (`id`, `name`, `shopname`, `shopaddress`, `shopcity`, `contactno`, `emailid`) VALUES
(9, 'jenil', 'atmaram', '8/729,daxini moholla', 'surat', 2147483647, '21bmiitbscit001@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(44, 'jenil', '21bmiitbscit001@gmail.com', '$2y$10$bNa4wDN8uu8OfHJMwViiOOVwWrkj3bheDPxJAiCoiJbdAZhHpEnhW'),
(45, 'parth', '21bmiit033@gmail.com', '$2y$10$YoIFnfUBVLtpZrcT/ULYBOmtJkL63RCo/yxmBkyQw9T61HnSWsjve'),
(46, 'aryan', '21bmiit031@gmail.com', '$2y$10$2xlKcYM8grwT.Q8J5VvyUOqnbDHN.X88JizQUTp3RPTHq6aFxU0q2');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `pid`, `name`, `price`, `image`) VALUES
(16, 29, 25, 'car', 75, '491375436-1.webp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
