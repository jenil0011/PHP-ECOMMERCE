<?php
error_reporting(0);
include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

include 'components/wishlist_cart.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>home</title>

   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

   <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js" defer></script>

   <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

   <style>

@import url("https://fonts.googleapis.com/css2?family=Inter:wght@400;800&display=swap");

:root {
/* --bg: #000000; */
--clr-1: #00c2ff;
--clr-2: #33ff8c;
--clr-3: #ffc640;
--clr-4: #e54cff;
--blur: 1rem;
--fs: clamp(3rem, 8vw, 7rem);
--ls: clamp(-1.75px, -0.25vw,
-3.5px);
}


*,
*::before,
*::after {
font-family: inherit;
box-sizing: border-box;
}

.name-plate {
text-align: center;
}

.title {
font-size: var(--fs);
font-weight: 800;
letter-spacing: var(--ls);
position: relative;
overflow: hidden;
background: var(--bg);
margin: 0;
}

.subtitle {
}

.aurora {
position: absolute;
top: 0;
left: 0;
width: 100%;
height: 100%;
z-index: 2;
mix-blend-mode: darken;
pointer-events: none;
}

.aurora__item {
overflow: hidden;
position: absolute;
width: 60vw;
height: 60vw;
background-color: var(--clr-1);
border-radius: 37% 29% 27% 27% / 28% 25% 41% 37%;
filter: blur(var(--blur));
mix-blend-mode: overlay;
}

.aurora__item:nth-of-type(1) {
top: -50%;
animation: aurora-border 6s ease-in-out infinite,
aurora-1 5s ease-in-out infinite alternate;
}

.aurora__item:nth-of-type(2) {
background-color: var(--clr-3);
right: 0;
top: 0;
animation: aurora-border 6s ease-in-out infinite,
aurora-2 5s ease-in-out infinite alternate;
}

.aurora__item:nth-of-type(3) {
background-color: var(--clr-2);
left: 0;
bottom: 0;
animation: aurora-border 6s ease-in-out infinite,
aurora-3 3s ease-in-out infinite alternate;
}

.aurora__item:nth-of-type(4) {
background-color: var(--clr-4);
right: 0;
bottom: -50%;
animation: aurora-border 6s ease-in-out infinite,
aurora-4 13s ease-in-out infinite alternate;
}

@keyframes aurora-1 {
0% {
top: 0;
right: 0;
}

50% {
top: 100%;
right: 75%;
}

75% {
top: 100%;
right: 25%;
}

100% {
top: 0;
right: 0;
}
}

@keyframes aurora-2 {
0% {
top: -50%;
left: 0%;
}

60% {
top: 100%;
left: 75%;
}

85% {
top: 100%;
left: 25%;
}

100% {
top: -50%;
left: 0%;
}
}

@keyframes aurora-3 {
0% {
bottom: 0;
left: 0;
}

40% {
bottom: 100%;
left: 75%;
}

65% {
bottom: 40%;
left: 50%;
}

100% {
bottom: 0;
left: 0;
}
}

@keyframes aurora-4 {
0% {
bottom: -50%;
right: 0;
}

50% {
bottom: 0%;
right: 40%;
}

90% {
bottom: 50%;
right: 25%;
}

100% {
bottom: -50%;
right: 0;
}
}

@keyframes aurora-border {
0% {
border-radius: 37% 29% 27% 27% / 28% 25% 41% 37%;
}

25% {
border-radius: 47% 29% 39% 49% / 61% 19% 66% 26%;
}

50% {
border-radius: 57% 23% 47% 72% / 63% 17% 66% 33%;
}

75% {
border-radius: 28% 49% 29% 100% / 93% 20% 64% 25%;
}

100% {
border-radius: 37% 29% 27% 27% / 28% 25% 41% 37%;
}
}


/* -- YouTube Link Styles -- */

#source-link {
  top: 60px;
}

#source-link > i {
  color: rgb(94, 106, 210);
}

#yt-link {  
  top: 10px;
}

#yt-link > i {
  color: rgb(219, 31, 106); 

}

.meta-link {
  align-items: center;
  backdrop-filter: blur(3px);
  background-color: rgba(255, 255, 255, 0.05);
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 6px;
  box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1);
  cursor: pointer;  
  display: inline-flex;
  gap: 5px;
  left: 10px;
  padding: 10px 20px;
  position: fixed;
  text-decoration: none;
  transition: background-color 600ms, border-color 600ms;
  z-index: 10000;
}

.meta-link:hover {
  background-color: rgba(255, 255, 255, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.2);
}

.meta-link > i, .meta-link > span {
  height: 20px;
  line-height: 20px;
}

.meta-link > span {
  color: white;
  font-family: "Rubik", sans-serif;
  transition: color 600ms;
}


   </style>

</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<div class="name-plate">
    <h1 class="title">Welcome To Toy Mania
        <div class="aurora">
        <div class="aurora__item">
        </div>
        <div class="aurora__item">
        </div>
        <div class="aurora__item">
        </div>
        <div class="aurora__item">
        </div>
        </div>
    </h1>
</div>



<div class="home-bg"> 

<section class="home">

   <div class="swiper home-slider">
   
   <div class="swiper-wrapper">

      <div class="swiper-slide slide">
         <div class="image">
            <img src="images/homeimg1.png" alt="">
         </div>
         <div class="content">
            <span>upto 40% off</span>
            <h3>on latest toy cars</h3>
            <a href="shop.php" class="btn">shop now</a>
         </div>
      </div>

      <div class="swiper-slide slide">
         <div class="image">
            <img src="images/homeimg2.png" alt="">
         </div>
         <div class="content">
            <span>upto 50% off</span>
            <h3>on brand new lego toys, unlock new adventures</h3>
            <a href="shop.php" class="btn">shop now</a>
         </div>
      </div>

      <div class="swiper-slide slide">
         <div class="image">
            <img src="images/homeimg3.png" alt="">
         </div>
         <div class="content">
            <span>upto 50% off</span>
            <h3>on newly launched toy planes</h3>
            <a href="shop.php" class="btn">shop now</a>
         </div>
      </div>

   </div>

      <div class="swiper-pagination"></div>

   </div>

</section>

</div>    

<section class="home-products">

   <h1 class="heading">latest products</h1>

   <div class="swiper products-slider">

   <div class="swiper-wrapper">

<?php

$select_products = mysqli_query($conn, "SELECT * FROM `products` LIMIT 6");

if (mysqli_num_rows($select_products) > 0) {
    while ($fetch_product = mysqli_fetch_assoc($select_products)) {
        ?>
        <form action="#" method="post" class="swiper-slide slide">
            <input type="hidden" name="pid" value="<?= $fetch_product['id']; ?>">
            <input type="hidden" name="name" value="<?= $fetch_product['name']; ?>">
            <input type="hidden" name="price" value="<?= $fetch_product['price']; ?>">
            <input type="hidden" name="image" value="<?= $fetch_product['image_01']; ?>">

            <button class="fas fa-heart" type="submit" name="add_to_wishlist"></button>
            
            <a href="quick_view.php?pid=<?= $fetch_product['id']; ?>" class="fas fa-eye"></a>
            <img src="uploaded_img/<?= $fetch_product['image_01']; ?>" alt="">
            
            <div class="name"><?= $fetch_product['name']; ?></div>
            <div class="brand"><?= $fetch_product['brand']; ?></div>
            <div class="flex">
                <div class="price"><span>Rs. </span><?= $fetch_product['price']; ?><span>/-</span></div>
                <input type="number" name="qty" class="qty" min="1" max="99" onkeypress="if(this.value.length == 2) return false;" value="1">
            </div>
            <input type="submit" value="add to cart" class="btn" name="add_to_cart" >
        </form>
        <?php
    }
} else {
    echo '<p class="empty">no products added yet!</p>';
}

?>

</div>

   <div class="swiper-pagination"></div>

   </div>

</section>





<?php include 'components/footer.php'; ?>

<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<script src="js/script.js"></script>

<script>

var swiper = new Swiper(".home-slider", {
   loop:true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
    },
});


var swiper = new Swiper(".products-slider", {
   loop:true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
   },
   breakpoints: {
      550: {
        slidesPerView: 2,
      },
      768: {
        slidesPerView: 2,
      },
      1024: {
        slidesPerView: 3,
      },
   },
});



</script>

</body>
</html>