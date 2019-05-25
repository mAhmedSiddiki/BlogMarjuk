-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2019 at 12:59 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `marjukblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone_num` varchar(15) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'first_name', '01738272727', 'Hey this is cheak for msg..', '2019-05-18 21:38:57', 'first@gmail.com'),
(2, 'Marjuk', '01736253626', 'Hey i am marjuk..and this is test message', NULL, 'marjuk@gmail.com'),
(3, 'hey', '002028', 'hey ha ha', '2019-05-18 21:53:51', 'hey@gmail.com'),
(4, 'Nazmoon Nahar', '01837264626', 'hey I am nazmoon..', '2019-05-18 23:30:11', 'nazmoon@gmail.com'),
(5, 'Musaddik', '01937352826', 'hey..I am bukacuda', '2019-05-19 01:14:10', 'musaddik@gmail.com'),
(6, 'Musaddik', '01937352826', 'hey..I am bukacuda', '2019-05-19 01:34:46', 'musaddik@gmail.com'),
(7, 'Sohana', '01928462736', 'Hey..I am in love..', '2019-05-19 02:19:07', 'sohana@gmail.com'),
(8, 'Sohana', '01928462736', 'Hey..I am in love..', '2019-05-19 02:19:39', 'sohana@gmail.com'),
(9, 'Sohana', '01928462736', 'Hey..I am in love..', '2019-05-19 02:23:38', 'sohana@gmail.com'),
(10, 'Kadery Jannah Chad', '01748274625', '..I love you...', '2019-05-19 02:27:50', 'chad@gmail.com'),
(11, 'Nazmoon Nahar', '01847264524', 'I love you very much...Really I love you...You are my life and I no live without you...plzzzz...you say \"LOVE ME\".', '2019-05-19 02:31:18', 'nazmoon12@gmail.com'),
(12, 'haila', '923273892', 'nsdjfjhsdbksbc jbabd kiused jkdhhjdsbfjyraof ', '2019-05-19 02:35:24', 'ajndjsd@gmail.com'),
(13, 'Sonia Mirja', '01794637281', 'Hey i am your lover', '2019-05-20 15:20:13', 'sonia@gmail.com'),
(14, 'Musaddik', '01837252716', 'Hey i am musaddik. And i am you youtube student..', '2019-05-24 22:15:00', 'musaddik@gmail.com'),
(15, 'Jey', '01748362826', 'Hey i am your brooo...', '2019-05-24 22:47:00', 'joy@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tag_line` varchar(30) NOT NULL,
  `slug` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(20) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`sno`, `title`, `tag_line`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'First Blog In Flask', 'This is first post', 'first_blog_1', 'Python is an interpreted, high-level, general-purpose programming language. Created by Guido van Rossum and first released in 1991, Python\'s design philosophy emphasizes code readability with its notable use of significant whitespace. Its language constructs and object-oriented approach aims to help programmers write clear, logical code for small and large-scale projects.[26]\r\n\r\nPython is dynamically typed and garbage-collected. It supports multiple programming paradigms, including procedural, object-oriented, and functional programming. Python is often described as a \"batteries included\" language due to its comprehensive standard library.[27]\r\n\r\nPython was conceived in the late 1980s as a successor to the ABC language. Python 2.0, released 2000, introduced features like list comprehensions and a garbage collection system capable of collecting reference cycles. Python 3.0, released 2008, was a major revision of the language that is not completely backward-compatible, and much Python 2 code does not run unmodified on Python 3. Due to concern about the amount of code written for Python 2, support for Python 2.7 (the last release in the 2.x series) was extended to 2020. Language developer Guido van Rossum shouldered sole responsibility for the project until July 2018 but now shares his leadership as a member of a five-person steering council.[28][29][30]\r\n\r\nPython interpreters are available for many operating systems. A global community of programmers develops and maintains CPython, an open source[31] reference implementation. A non-profit organization, the Python Software Foundation, manages and directs resources for Python and CPython development.', 'hey.jpg', '2019-05-20 15:37:34'),
(2, 'Second blog in flask', 'This is second post', 'second_blog', 'Python was conceived in the late 1980s[32] by Guido van Rossum at Centrum Wiskunde & Informatica (CWI) in the Netherlands as a successor to the ABC language (itself inspired by SETL)[33], capable of exception handling and interfacing with the Amoeba operating system.[7] Its implementation began in December 1989.[34] Van Rossum continued as Python\'s lead developer until July 12, 2018, when he announced his \"permanent vacation\" from his responsibilities as Python\'s Benevolent Dictator For Life, a title the Python community bestowed upon him to reflect his long-term commitment as the project\'s chief decision-maker.[35] In January, 2019, active Python core developers elected Brett Cannon, Nick Coghlan, Barry Warsaw, Carol Willing and van Rossum to a five-member \"Steering Council\" to lead the project.[36]\r\n\r\nPython 2.0 was released on 16 October 2000 with many major new features, including a cycle-detecting garbage collector and support for Unicode.[37]\r\n\r\nPython 3.0 was released on 3 December 2008. It was a major revision of the language that is not completely backward-compatible.[38] Many of its major features were backported to Python 2.6.x[39] and 2.7.x version series. Releases of Python 3 include the 2to3 utility, which automates (at least partially) the translation of Python 2 code to Python 3.[40]\r\n\r\nPython 2.7\'s end-of-life date was initially set at 2015 then postponed to 2020 out of concern that a large body of existing code could not easily be forward-ported to Python 3.[41][42] In January 2017, Google announced work on a Python 2.7 to Go transcompiler to improve performance under concurrent workloads.[43]', 'hey.jpg', '2019-05-21 13:51:07'),
(3, 'Third Blog in Flask new', 'This is third post new', 'third_blog new', 'new Python is a multi-paradigm programming language. Object-oriented programming and structured programming are fully supported, and many of its features support functional programming and aspect-oriented programming (including by metaprogramming[44] and metaobjects (magic methods)).[45] Many other paradigms are supported via extensions, including design by contract[46][47] and logic programming.[48]\r\n\r\nPython uses dynamic typing, and a combination of reference counting and a cycle-detecting garbage collector for memory management. It also features dynamic name resolution (late binding), which binds method and variable names during program execution.\r\n\r\nPython\'s design offers some support for functional programming in the Lisp tradition. It has filter, map, and reduce functions; list comprehensions, dictionaries, sets and generator expressions.[49] The standard library has two modules (itertools and functools) that implement functional tools borrowed from Haskell and Standard ML.[50]\r\n\r\nThe language\'s core philosophy is summarized in the document The Zen of Python (PEP 20), which includes aphorisms such as:[51]\r\n\r\nBeautiful is better than ugly\r\nExplicit is better than implicit\r\nSimple is better than complex\r\nComplex is better than complicated\r\nReadability counts\r\nRather than having all of its functionality built into its core, Python was designed to be highly extensible. This compact modularity has made it particularly popular as a means of adding programmable interfaces to existing applications. Van Rossum\'s vision of a small core language with a large standard library and easily extensible interpreter stemmed from his frustrations with ABC, which espoused the opposite approach.[32]\r\n\r\nPython strives for a simpler, less-cluttered syntax and grammar while giving developers a choice in their coding methodology. In contrast to Perl\'s \"there is more than one way to do it\" motto, Python embraces a \"there should be one—and preferably only one—obvious way to do it\" design philosophy.[51] Alex Martelli, a Fellow at the Python Software Foundation and Python book author, writes that \"To describe something as \'clever\' is not considered a compliment in the Python culture.', 'lala.jpg', '2019-05-25 01:32:08'),
(4, 'Fourth Blog in Flask', 'This is fourth post', 'fourth_blog', 'Python was conceived in the late 1980s[32] by Guido van Rossum at Centrum Wiskunde & Informatica (CWI) in the Netherlands as a successor to the ABC language (itself inspired by SETL)[33], capable of exception handling and interfacing with the Amoeba operating system.[7] Its implementation began in December 1989.[34] Van Rossum continued as Python\'s lead developer until July 12, 2018, when he announced his \"permanent vacation\" from his responsibilities as Python\'s Benevolent Dictator For Life, a title the Python community bestowed upon him to reflect his long-term commitment as the project\'s chief decision-maker.[35] In January, 2019, active Python core developers elected Brett Cannon, Nick Coghlan, Barry Warsaw, Carol Willing and van Rossum to a five-member \"Steering Council\" to lead the project.[36]\r\n\r\nPython 2.0 was released on 16 October 2000 with many major new features, including a cycle-detecting garbage collector and support for Unicode.[37]\r\n\r\nPython 3.0 was released on 3 December 2008. It was a major revision of the language that is not completely backward-compatible.[38] Many of its major features were backported to Python 2.6.x[39] and 2.7.x version series. Releases of Python 3 include the 2to3 utility, which automates (at least partially) the translation of Python 2 code to Python 3.[40]\r\n\r\nPython 2.7\'s end-of-life date was initially set at 2015 then postponed to 2020 out of concern that a large body of existing code could not easily be forward-ported to Python 3.[41][42] In January 2017, Google announced work on a Python 2.7 to Go transcompiler to improve performance under concurrent workloads.', 'lala.jpg', '2019-05-21 16:10:55'),
(6, 'Six Blog in Flask', 'Six post in blog', 'six_blog', 'Python\'s development is conducted largely through the Python Enhancement Proposal (PEP) process, the primary mechanism for proposing major new features, collecting community input on issues and documenting Python design decisions.[114] Python coding style is covered in PEP 8.[115] Outstanding PEPs are reviewed and commented on by the Python community and Guido Van Rossum, Python\'s Benevolent Dictator For Life.[114]\r\n\r\nEnhancement of the language corresponds with development of the CPython reference implementation. The mailing list python-dev is the primary forum for the language\'s development. Specific issues are discussed in the Roundup bug tracker maintained at python.org.[116] Development originally took place on a self-hosted source-code repository running Mercurial, until Python moved to GitHub in January 2017.[117]\r\n\r\nCPython\'s public releases come in three types, distinguished by which part of the version number is incremented:\r\n\r\nBackward-incompatible versions, where code is expected to break and need to be manually ported. The first part of the version number is incremented. These releases happen infrequently—for example, version 3.0 was released 8 years after 2.0.\r\nMajor or \"feature\" releases, about every 18 months, are largely compatible but introduce new features. The second part of the version number is incremented. Each major version is supported by bugfixes for several years after its release.[118]\r\nBugfix releases, which introduce no new features, occur about every 3 months and are made when a sufficient number of bugs have been fixed upstream since the last release. Security vulnerabilities are also patched in these releases. The third and final part of the version number is incremented.[119]\r\nMany alpha, beta, and release-candidates are also released as previews and for testing before final releases. Although there is a rough schedule for each release, they are often delayed if the code is not ready. Python\'s development team monitors the state of the code by running the large unit test suite during development, and using the BuildBot continuous integration system.[120]\r\n\r\nThe community of Python developers has also contributed over 86,000[121] software modules (as of 20 August 2016) to the Python Package Index (PyPI), the official repository of third-party Python libraries.\r\n\r\nThe major academic conference on Python is PyCon. There are also special Python mentoring programmes, such as Pyladies.', 'hey.jpg', '2019-05-21 16:12:36'),
(7, 'Seven blog in flask', 'Seven post in blog', 'seven_blog', 'Python was conceived in the late 1980s[32] by Guido van Rossum at Centrum Wiskunde & Informatica (CWI) in the Netherlands as a successor to the ABC language (itself inspired by SETL)[33], capable of exception handling and interfacing with the Amoeba operating system.[7] Its implementation began in December 1989.[34] Van Rossum continued as Python\'s lead developer until July 12, 2018, when he announced his \"permanent vacation\" from his responsibilities as Python\'s Benevolent Dictator For Life, a title the Python community bestowed upon him to reflect his long-term commitment as the project\'s chief decision-maker.[35] In January, 2019, active Python core developers elected Brett Cannon, Nick Coghlan, Barry Warsaw, Carol Willing and van Rossum to a five-member \"Steering Council\" to lead the project.[36]\r\n\r\nPython 2.0 was released on 16 October 2000 with many major new features, including a cycle-detecting garbage collector and support for Unicode.[37]\r\n\r\nPython 3.0 was released on 3 December 2008. It was a major revision of the language that is not completely backward-compatible.[38] Many of its major features were backported to Python 2.6.x[39] and 2.7.x version series. Releases of Python 3 include the 2to3 utility, which automates (at least partially) the translation of Python 2 code to Python 3.[40]\r\n\r\nPython 2.7\'s end-of-life date was initially set at 2015 then postponed to 2020 out of concern that a large body of existing code could not easily be forward-ported to Python 3.[41][42] In January 2017, Google announced work on a Python 2.7 to Go transcompiler to improve performance under concurrent workloads.', 'lala.jpg', '2019-05-25 00:52:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
