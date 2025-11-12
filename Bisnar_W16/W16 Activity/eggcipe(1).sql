-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2025 at 09:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eggcipe`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminedit`
--

CREATE TABLE `adminedit` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `info` text DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(120) NOT NULL,
  `content` text NOT NULL,
  `likes` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `recipe_id`, `user_id`, `username`, `content`, `likes`, `created_at`) VALUES
(1, 9, 23, '111', '111', 0, '2025-10-30 07:48:57'),
(2, 14, 24, '222', 'SUPER GOOOODDDDD', 1, '2025-10-30 08:10:46');

-- --------------------------------------------------------

--
-- Table structure for table `comment_likes`
--

CREATE TABLE `comment_likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment_likes`
--

INSERT INTO `comment_likes` (`id`, `comment_id`, `user_id`, `created_at`) VALUES
(1, 2, 24, '2025-10-30 08:10:52');

-- --------------------------------------------------------

--
-- Table structure for table `misinformation_reports`
--

CREATE TABLE `misinformation_reports` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `report_type` varchar(50) NOT NULL,
  `report_details` text NOT NULL,
  `page_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `misinformation_reports`
--

INSERT INTO `misinformation_reports` (`id`, `username`, `report_type`, `report_details`, `page_url`, `created_at`) VALUES
(2, 'testerr', 'Problem/Misinformation', '4tresrsdf', 'sdafdsads.com', '2025-10-13 12:43:43');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `recipe_id`, `user_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(1, 11, 23, 2, NULL, '2025-10-30 07:56:36', '2025-10-30 07:57:10'),
(2, 9, 23, 3, NULL, '2025-10-30 07:57:00', '2025-10-30 07:57:00'),
(3, 14, 24, 1, NULL, '2025-10-30 08:10:32', '2025-10-30 08:10:34');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `video_url` varchar(500) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `inventor` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `ingredients` text DEFAULT NULL,
  `steps` text DEFAULT NULL,
  `calories` varchar(50) DEFAULT NULL,
  `protein` varchar(50) DEFAULT NULL,
  `fat` varchar(50) DEFAULT NULL,
  `carbs` varchar(50) DEFAULT NULL,
  `sodium` varchar(50) DEFAULT NULL,
  `cholesterol` varchar(50) DEFAULT NULL,
  `dietary_properties` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `average_rating` decimal(3,1) DEFAULT 0.0,
  `rating_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `name`, `image_url`, `info`, `video_url`, `origin`, `inventor`, `description`, `ingredients`, `steps`, `calories`, `protein`, `fat`, `carbs`, `sodium`, `cholesterol`, `dietary_properties`, `created_at`, `average_rating`, `rating_count`) VALUES
(7, 'Sunny Side Up', 'uploads/img_69009d154a6a27.84121830.jpg', 'Sunny side up eggs are fried on one side without flipping, resulting in a runny yolk and fully cooked whites', 'https://www.youtube.com/embed/zgpK5eeZ4Jg', 'The term \"sunny side up\" for eggs dates back to at least 1887 and likely originated from the descriptive visual of the egg\'s yellow yolk looking like a \"sun\" when fried without being flipped', 'There is no known inventor of the sunny side up egg', 'it is a dish that evolved from cooking eggs over heat in ancient times and likely originated from multiple cultures without a specific inventor.', '1 medium or large egg\r\nOil\r\nSalt and pepper to taste', 'Step 1\r\nSpray a small non-stick skillet with cooking spray. Crack one egg on the counter, breaking it gently into a small prep dish. Take care not to break the yolk.\r\nStep 2\r\nPlace prepared pan over medium heat on the stove and heat pan to very hot. (Do not burn the oil.)\r\nStep 3\r\nGently slip egg into hot pan and immediately reduce heat to medium. Continue cooking for two minutes, or until egg white turns opaque and there is no clear egg white remaining. If necessary, cover pan for a minute to help cook the egg.\r\nStep 4\r\nRemove pan from heat. Gently slip a spatula around the edges of the egg to make sure it is free of the pan, then tilt the pan and carefully slip the egg onto a waiting plate. Take care not to break the loose egg yolk.\r\nStep 5\r\nSeason to taste with salt and pepper and serve immediately.', '63.7', '5.6g', '4.2g', '0.5g', '227.1mg', '163.7mg', 'Nutrient	Amount Calories	~90 kcal Protein	~6–7 g Fat	~7 g Saturated Fat	~2 g Cholesterol	~185–200 mg Carbohydrates	~0.4 g Sugars	0 g Fiber	0 g Sodium	~70 mg Vitamins & Minerals	Rich in Vitamin A, D, E, B12, Choline, Selenium, Iron', '2025-10-28 10:38:13', 0.0, 0),
(8, 'Scrambled Egg', 'uploads/img_69009e7ed56d22.49648996.jpg', 'is a culinary dish made from eggs (usually chicken eggs), where the whites and yolks have been stirred, whipped, or beaten together (typically with the addition of other ingredients), then heated so that the proteins denature and coagulate, and they form into \"curds\".', 'https://www.youtube.com/embed/7goNbTdFwNM', 'The origin of scrambled eggs is not precisely documented, but similar recipes can be traced to Ancient Rome and the 14th-century Italian cookbook.', 'similar recipes can be traced to Ancient Rome and the 14th-century Italian cookbook, Libro della cucina', 'Scrambled eggs are a dish made by beating and cooking eggs in a pan, resulting in soft curds. The eggs are typically whisked with milk, butter, or oil, and then gently stirred over medium-low heat until the proteins coagulate to a desired consistency, from runny to firm. It is a popular and simple breakfast food, often seasoned with salt and pepper', '2 eggs\r\n6 tablespoons cream or milk\r\n1 teaspoon butter\r\nsalt and pepper to taste', 'Step 1\r\nCrack the eggs into a small bowl. Add cream or milk (if desired). Add salt and pepper to taste. Whisk until well blended. Set aside.\r\nStep 2\r\nIn a medium size skillet, add butter and melt over medium-high heat. (Watch so it doesn\'t scorch or burn.) Add eggs and let cook until edges are just starting to cook. With a wooden spoon or rubber spatula, fold edges of eggs toward center and gently stir. Repeat motion to continue to scramble the eggs until most are cooked and just parts appear loose or slightly runny.\r\nStep 3\r\nRemove eggs from heat, continuing to fold and stir to cook eggs a minute more. Slide eggs onto waiting plate and serve immediately.', '250', '7g', '24g', '2g', '95mg', '255mg', 'Nutrient	Amount Calories	~180–200 kcal Protein	~12–14 g Fat	~14 g Saturated Fat	~5 g Cholesterol	~370 mg Carbohydrates	~1–2 g Sugars	~1 g Fiber	0 g Sodium	~120–150 mg Vitamins & Minerals	Rich in Vitamin A, D, B2, B12, Choline, Selenium, and Iron', '2025-10-28 10:44:14', 0.0, 0),
(9, 'Poach Egg', 'uploads/img_6900a2a8395049.09330620.jpg', 'A poached egg is cooked by gently simmering it in water until the white is set and the yolk is still runny', 'https://www.youtube.com/embed/0sl3eMAXspE', 'The term \"poached egg\" originates from the Old French word \"pochier,\" which means \"to put into a pocket\" or \"to pocket something\". This is because the egg white forms a sort of \"pocket\" for the yolk. The technique itself, called poaching, is an ancient me', 'There is no single inventor of the poached egg', 'A poached egg is an egg that has been cooked without its shell in simmering water until the white is set and the yolk remains runny. This moist-heat cooking method results in a delicate texture, and the runny yolk acts as a rich sauce when it is cut into. Poached eggs are versatile and often served for breakfast or on top of dishes like toast, salads, or Eggs Benedict.', '250ml / ½ pint of water.\r\n1 dessertspoon of vinegar.\r\n2 medium eggs.\r\n2 slices wholemeal bread.\r\n10g / ½ oz. low fat spread.\r\nBlack pepper to taste', 'bring a pot of water with a splash of vinegar to a gentle simmer, \r\ncrack an egg into a small bowl, and carefully slide it into the water.\r\nCook for 3–5 minutes until the whites are set but the yolk is still soft, \r\nthen remove with a slotted spoon and serve', '', '7.5g', '5.4g', '1 gram', '0', '0', 'Calories: ~72 Protein: ~6 grams Total Fat: ~5 grams Saturated Fat: ~1.6 grams Monounsaturated Fat: ~1.8 grams Polyunsaturated Fat: ~1 gram Carbohydrates: <1 gram Cholesterol: ~186 mg', '2025-10-28 11:02:00', 3.0, 1),
(11, 'Soft Boiled Egg', 'uploads/img_6900a5a57f7098.75640145.jpg', 'A soft-boiled egg has a firm, cooked white and a runny, liquid yolk', 'https://www.youtube.com/embed/rVZc9uT8qsI', 'Recipes for boiled eggs have existed since antiquity. The soft-boiled egg was first described in Ancient Rome, where the preparation involved poking a hole in the egg, boiling it for five minutes, and seasoning it with a mixture of pepper, pine nuts, hone', 'The specific person who first cooked a soft-boiled egg is unknown. It was a discovery likely made accidentally in prehistory, possibly through cooking eggs in hot springs or over a fire. The Malaysian inventor Datuk Hew Ah Kow did, however, invent the pop', 'A soft-boiled egg features a firm, opaque egg white and a runny, liquid, or custardy yolk. The texture and doneness depend on precise cooking time and temperature', 'Eggs (large, preferably from the refrigerator)\r\nSaucepan\r\nSlotted spoon\r\nBowl of ice water\r\nTimer', '1. Bring a pot of water to a boil.\r\nGently lower the eggs into the boiling water with a spoon.\r\nSimmer for 6 to 8 minutes, depending on desired yolk runniness.\r\nImmediately transfer the eggs to an ice bath to stop the cooking process.\r\nPeel and serve', '78 calories per large egg', '6.3 grams per large egg', '5.3 grams per large egg', '0.6 grams per large egg', '62 milligrams per large egg', '187 milligrams per large egg', 'Eggs are an excellent source of high-quality, complete protein (containing all nine essential amino acids) and healthy unsaturated fats. They are nutrient-dense, providing significant amounts of vitamins A, B12, B2 (riboflavin), B5, D, as well as minerals like selenium and phosphorus. They are also rich in choline, lutein, and zeaxanthin, which are important for brain and eye health', '2025-10-28 11:14:45', 2.0, 1),
(12, 'Frittata', 'uploads/img_69031b8754a412.97816994.jpg', 'A frittata is a thick Italian-style omelette filled with eggs, vegetables, cheese, and meats, cooked slowly until golden and set.', 'https://www.youtube.com/embed/7pnWlcayj2o', 'Italy. The word “frittata” comes from the Italian verb frigger, meaning \"to fry.\" It’s a popular dish in Italy, often made with leftovers and commonly eaten at any time of the day.', 'It doesn’t have a single inventor but is a traditional Italian dish. Over time, various regions have contributed their own twists, adding different local ingredients.', 'A frittata is similar to an omelette but typically thicker and often served in slices like a pie or quiche. It’s made by whisking eggs and mixing in ingredients like cheese, vegetables, or meats before cooking them. It’s finished in the oven or under a broiler to set and form a golden top.', '6 large eggs\r\n\r\n1/2 cup milk (optional, for creaminess)\r\n\r\n1 cup of shredded cheese (cheddar, mozzarella, or parmesan)\r\n\r\n1 cup of vegetables (e.g., spinach, mushrooms, bell peppers, onions, or zucchini)\r\n\r\n1/2 cup cooked meat (e.g., ham, bacon, sausage) (optional)\r\n\r\nSalt and pepper to taste\r\n\r\nFresh herbs like parsley or chives (optional)\r\n\r\nOlive oil or butter for cooking', 'Preheat the oven to 375°F (190°C).\r\n\r\nPrepare the ingredients: Slice the vegetables and meats, and pre-cook them in a pan if needed (e.g., sauté veggies or brown bacon).\r\n\r\nWhisk the eggs: In a bowl, whisk the eggs with milk (if using), salt, pepper, and herbs.\r\n\r\nCook the vegetables: In an oven-safe skillet, heat olive oil or butter over medium heat. Add the vegetables and cook until tender.\r\n\r\nCombine: Add the cooked vegetables and any meat into the egg mixture. Pour this into the skillet with the vegetables.\r\n\r\nCook: Allow the eggs to set around the edges, and then transfer the skillet to the oven.\r\n\r\nBake: Bake for 10-15 minutes until the frittata is golden brown on top and cooked through.\r\n\r\nServe: Let it cool slightly, slice into wedges, and serve warm.', 'Approx. 250-300 calories per serving (1/4 of the f', 'Around 18-22 grams per serving', 'Around 18-22 grams per serving', '5-8 grams per serving', 'About 400-600 mg per serving', 'Approximately 180-220 mg per serving', 'High Protein: Excellent source of protein from eggs and any added meats.  Low Carb: If made with primarily vegetables and eggs, it’s low in carbohydrates.  Gluten-Free: Naturally gluten-free, perfect for those avoiding gluten.  Low Sugar: Contains negligible amounts of sugar unless extra sweet ingredients are added.  Customizable: Can be made vegetarian, keto-friendly, or even dairy-free based on your choice of ingredients.', '2025-10-30 08:02:15', 0.0, 0),
(13, 'Egg Drop Soup', 'uploads/img_69031c6fe44072.29764930.jpg', 'A light and comforting Chinese soup made by pouring beaten eggs into hot broth, forming silky ribbons of cooked egg throughout.', 'https://www.youtube.com/embed/0PRo5vYnwP4', 'China', 'Unknown — it’s a traditional Chinese dish that has been made for centuries in various regional styles.', 'Egg Drop Soup is a classic Chinese dish featuring delicate strands of egg swirled into a flavorful chicken or vegetable broth, often seasoned with soy sauce, sesame oil, and white pepper. It’s simple, nutritious, and soothing.', '4 cups chicken or vegetable broth\r\n\r\n2 large eggs\r\n\r\n1 tbsp cornstarch (optional, for slight thickness)\r\n\r\n1 tbsp soy sauce\r\n\r\n1 tsp sesame oil\r\n\r\n1/4 tsp white pepper\r\n\r\n2 green onions, chopped\r\n\r\nSalt to taste', 'Bring the broth to a gentle boil in a pot.\r\n\r\nWhisk cornstarch with a little water (if using) and stir into the broth.\r\n\r\nBeat the eggs in a bowl.\r\n\r\nSlowly drizzle the eggs into the simmering broth while stirring gently in one direction to form thin ribbons.\r\n\r\nAdd soy sauce, sesame oil, and white pepper.\r\n\r\nGarnish with chopped green onions and serve hot.', 'Approximately 90–120 kcal per serving (1 cup).', 'Around 6–8 grams per serving.', 'Approximately 4–6 grams per serving.', 'Roughly 6–8 grams per serving.', 'About 800–1000 mg, depending on broth and soy sauc', 'Approximately 110–140 mg per serving.', 'Low calorie  High protein  Gluten-free (if using gluten-free soy sauce)  Light and easy to digest', '2025-10-30 08:06:07', 0.0, 0),
(14, 'Deviled Eggs', 'uploads/img_69031cf824c3e3.67709758.jpg', 'A popular appetizer made by halving hard-boiled eggs, removing the yolks, and mixing them with creamy, tangy seasonings before refilling the whites.', 'https://www.youtube.com/embed/hqkkwIVEE00', 'Ancient Rome (refined in the United States and Europe over time)', 'Unknown — the concept dates back to ancient Rome, where spiced boiled eggs were served as starters.', 'Deviled eggs are hard-boiled eggs cut in half with yolks mashed and blended with ingredients like mayonnaise, mustard, vinegar, and seasonings, then piped or spooned back into the egg whites. They’re often garnished with paprika, herbs, or crispy bacon.', '6 large eggs\r\n\r\n3 tbsp mayonnaise\r\n\r\n1 tsp yellow or Dijon mustard\r\n\r\n1/2 tsp white vinegar or lemon juice\r\n\r\nSalt and pepper to taste\r\n\r\nPaprika or chives for garnish', 'Boil the eggs: Place eggs in water, bring to a boil, then simmer for 10 minutes.\r\n\r\nCool and peel: Transfer eggs to cold water and peel once cool.\r\n\r\nHalve and remove yolks: Cut eggs lengthwise and place yolks in a bowl.\r\n\r\nMake the filling: Mash yolks with mayonnaise, mustard, vinegar, salt, and pepper until smooth.\r\n\r\nFill the whites: Spoon or pipe the yolk mixture into the egg white halves.\r\n\r\nGarnish: Sprinkle with paprika or chopped herbs.', 'About 70–90 kcal per egg half-pair (1 whole egg).', 'Approximately 6–7 grams per serving.', 'Around 6 grams per serving (varies with amount of ', 'Less than 1 gram per serving.', 'Roughly 150–200 mg per serving.', 'About 180–200 mg per serving.', 'High in protein  Low in carbs  Gluten-free  Keto-friendly', '2025-10-30 08:08:24', 1.0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suggestions`
--

CREATE TABLE `suggestions` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `recipe_name` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `status` enum('pending','reviewed','addressed') DEFAULT 'pending',
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suggestions`
--

INSERT INTO `suggestions` (`id`, `name`, `email`, `recipe_name`, `details`, `subject`, `message`, `status`, `user_id`, `created_at`) VALUES
(1, '111', '123123@gmail.com', '121231', '23', '', '', '', 23, '2025-10-30 07:53:35'),
(2, 'ASDASD', 'wasssapbro@gmail.com', 'WASSSAP', 'WASSSSAAP', '', '', '', NULL, '2025-10-30 08:11:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `role`) VALUES
(6, 'test', 'test@gmail.com', '$2y$10$fmbwGRI6NXM1gd7cKE8Q/uqqso6XQbHEuX19EHgrJ0gFLioLUDQNu', '2025-09-21 14:38:00', 'user'),
(7, 'tester', '123@gmail.com', '$2y$10$qE2nrGjiaUXeUEnJWg3aSOpUVrG84o9.9zPsjQkz45A5g6COkt8cS', '2025-09-22 08:15:24', 'user'),
(8, '123123', 'ulrique1212@gmail.com', '$2y$10$7rpqjWkui3ORv7J4WwJJCe2D.5x3iz5mtH3f50GX1uUWVypcfFff6', '2025-09-23 09:48:01', 'user'),
(9, '1233', 'uri21@gmail.com', '$2y$10$XXWLVJ7W6HBs9ZBp71PB8./WBOWxdSZhQN39ue65xln.0DeKXwULi', '2025-10-01 00:09:45', 'user'),
(13, 'ulrique123123', 'ulrique12@gmail.com', '$2y$10$NnPsxXS4HnQNQsCY63Boz.ibfLzW7diDilLgUeS0pjrKu1XBxBDGO', '2025-10-13 12:10:32', 'user'),
(19, 'ulrique', 'admin123@gmail.com', '$2y$10$KXcY2KOxN8oMNdZ8oNK5vO1.yVQ5MQUFTHdOt0wuMboU6jRNeTc6O', '2025-10-26 19:01:36', 'admin'),
(20, '123123123', 'ulrique122@gmail.com', '$2y$10$3DqZZLH4pH/jzIDiCPfjcOaj9u3MTWHIyZ.BfYGjAH6q.bYhf3T0C', '2025-10-26 19:11:35', 'admin'),
(21, 'aaa', 'aaa@gmail.com', '$2y$10$59yuvl9stbIDggnrmetqgOCVR2WxzQ5kITie3.Tw2O2NnaYcUOmFi', '2025-10-28 10:12:02', 'user'),
(22, 'asd', 'asd@gmail.com', '$2y$10$9.ifweMtt2uw/Txqx2/2JO6DV.fH1n7YwGsp2WHLmE4DhkhoOuVsO', '2025-10-28 11:22:21', 'user'),
(23, '111', 'muenriquez@tip.edu.ph', '$2y$10$AC8YrOe3L.Pwwkb8w34aGeCLpzbUTJRC4KkV.icRmwRdG/5diJN/W', '2025-10-30 07:53:55', 'admin'),
(24, '222', 'mkiteodoro@tip.edu.ph', '$2y$10$9GGt7znjk5QOhM50sYBYYe4g8h0ksY9x2TlhIyv.i19wXy9f4G22u', '2025-10-30 08:10:00', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `user_feedback`
--

CREATE TABLE `user_feedback` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `suggestion_type` varchar(50) NOT NULL,
  `feedback_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_feedback`
--

INSERT INTO `user_feedback` (`id`, `username`, `suggestion_type`, `feedback_text`, `created_at`) VALUES
(1, '1233', 'Dish/Feedback', '123', '2025-10-01 00:51:03'),
(2, 'Guest', 'Dish/Feedback', 'mama mia the eggcelent!!!', '2025-10-01 00:54:30'),
(3, 'testerr', 'Dish/Feedback', '4213232', '2025-10-13 12:43:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminedit`
--
ALTER TABLE `adminedit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`),
  ADD KEY `likes` (`likes`),
  ADD KEY `created_at` (`created_at`);

--
-- Indexes for table `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_like` (`comment_id`,`user_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Indexes for table `misinformation_reports`
--
ALTER TABLE `misinformation_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_rating` (`recipe_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suggestions`
--
ALTER TABLE `suggestions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_feedback`
--
ALTER TABLE `user_feedback`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminedit`
--
ALTER TABLE `adminedit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comment_likes`
--
ALTER TABLE `comment_likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `misinformation_reports`
--
ALTER TABLE `misinformation_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suggestions`
--
ALTER TABLE `suggestions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_feedback`
--
ALTER TABLE `user_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `suggestions`
--
ALTER TABLE `suggestions`
  ADD CONSTRAINT `suggestions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
