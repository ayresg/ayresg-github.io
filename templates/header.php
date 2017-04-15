<!DOCTYPE html>
<html>

<head>
  <!-- Title -->
  <title>
    <?php echo $title; ?>
  </title>

  <!-- Metadata -->
  <meta lang="en">
  <meta charset="utf-8">
  <meta name="description" content=$description>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Css -->
  <link href="/style/style.css" rel=stylesheet>
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Oxygen:400" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=IM+Fell+English:400i" rel="stylesheet">
</head>

<body>
  <!--  Wrapper  -->
  <div class="dropdown-container nav-bar">

    <!-- Logo -->
    <a href="/index.php">
      <img id="logo" src="/images/campus_map.png" alt="">
    </a>

   <!-- Menu button for mobile -->
    <div class="menu dropdown-trigger">
      <div class="little-menu-bar"></div>
      <div class="little-menu-bar"></div>
      <div class="little-menu-bar"></div>
    </div>

    <!-- BIG beefy navbar -->
    <nav class="nav-bar primary-nav dropdown-content">
      <ul>
        <li><a href="/academics/index.php">Academics</a></li>
        <li><a href="/admissions/index.php">Admissions &amp; Aid</a></li>
        <li><a href="/student-life/index.php">Student Life</a></li>
        <li><a href="/about/index.php">About</a></li>
      </ul>
    </nav>
    <!-- Tiny upper navbar with search bar -->
    <nav class="nav-bar secondary-nav dropdown-content">
      <ul>
        <li>Students</li>
        <li>Faculty &amp; Staff</li>
        <li>Family</li>
        <li>Alumni</li>
        <li>Visitors</li>
        <li><input type="search" id="search" placeholder="Search"></li>
      </ul>
    </nav>
  </div>
</body>

</html>