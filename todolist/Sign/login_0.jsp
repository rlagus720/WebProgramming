<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<div class="container right-panel-active">
  <!-- 로그인 -->
  <div class="container__form container--signup">
    <form action="join_ok.jsp" method="post" class="form">
      <h2 class="form__title">회원가입</h2>
      <input type="text" name="name" placeholder="Name" class="input" />
      <input type="date" name="birthdate" placeholder="Birthdate" class="input" />
      <input type="text" name="email" placeholder="Email" class="input" />
      <input type="text" name="id" placeholder="Id" class="input" />
      <input type="password" name="pw" placeholder="Password" class="input" />
      <input type="submit" class="btn" value="회원가입">
    </form>
  </div>

  <!-- Sign In -->
  <div class="container__form container--signin">
    <form action="login_ok.jsp" method="post" class="form">
      <h2 class="form__title">로그인</h2>
      <input type="text" name="id" placeholder="Id" class="input" />
      <input type="password" name="pw" placeholder="Password" class="input" />
      <a href="#" class="link">비밀번호 찾기</a>
      <input type="submit" class="btn" value="로그인">
    </form>
  </div>

  <!-- Overlay -->
  <div class="container__overlay">
    <div class="overlay">
      <div class="overlay__panel overlay--left">
        <button class="btn" id="signIn">로그인</button>
      </div>
      <div class="overlay__panel overlay--right">
        <button class="btn" id="signUp">회원가입</button>
      </div>
    </div>
  </div>
</div>
<head>
<style type="text/css">
:root {
  /* COLORS */
  --white: #e9e9e9;
  --gray: #333;
  --blue: #0367a6;
  --lightblue: #008997;

  /* RADII */
  --button-radius: 0.7rem;

  /* SIZES */
  --max-width: 758px;
  --max-height: 420px;

  font-size: 16px;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
    Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
}

body {
  align-items: center;
  background-color: var(--white);
  background: url("https://c.pxhere.com/photos/4c/3b/wristwatch_watch_time_gadget_accessory_device_wrist_hand-948934.jpg!d");
  background-opacity: 0.5;
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  display: grid;
  height: 100vh;
  place-items: center;
}

.form__title {
  font-weight: 300;
  margin: 0;
  margin-bottom: 1.25rem;
}

.link {
  color: var(--gray);
  font-size: 0.9rem;
  margin: 1.5rem 0;
  text-decoration: none;
}

.container {
  background-color: var(--white);
  border-radius: var(--button-radius);
  box-shadow: 0 0.9rem 1.7rem rgba(0, 0, 0, 0.25),
    0 0.7rem 0.7rem rgba(0, 0, 0, 0.22);
  height: var(--max-height);
  max-width: var(--max-width);
  overflow: hidden;
  position: relative;
  width: 100%;
}

.container__form {
  height: 100%;
  position: absolute;
  top: 0;
  transition: all 0.6s ease-in-out;
}

.container--signin {
  left: 0;
  width: 50%;
  z-index: 2;
}

.container.right-panel-active .container--signin {
  transform: translateX(100%);
}

.container--signup {
  left: 0;
  opacity: 0;
  width: 50%;
  z-index: 1;
}

.container.right-panel-active .container--signup {
  animation: show 0.6s;
  opacity: 1;
  transform: translateX(100%);
  z-index: 5;
}

.container__overlay {
  height: 100%;
  left: 50%;
  overflow: hidden;
  position: absolute;
  top: 0;
  transition: transform 0.6s ease-in-out;
  width: 50%;
  z-index: 100;
}

.container.right-panel-active .container__overlay {
  transform: translateX(-100%);
}

.overlay {
  background-color: var(--lightblue);
  background: url("https://c.pxhere.com/photos/4c/3b/wristwatch_watch_time_gadget_accessory_device_wrist_hand-948934.jpg!d");
  background-color: #ffffff;
  opacity: 1.0;
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  height: 100%;
  left: -100%;
  position: relative;
  transform: translateX(0);
  transition: transform 0.6s ease-in-out;
  width: 200%;
}



.container.right-panel-active .overlay {
  transform: translateX(50%);
}

.overlay__panel {
  align-items: center;
  display: flex;
  flex-direction: column;
  height: 100%;
  justify-content: center;
  position: absolute;
  text-align: center;
  top: 0;
  transform: translateX(0);
  transition: transform 0.6s ease-in-out;
  width: 50%;
}

.overlay--left {
  transform: translateX(-20%);
}

.container.right-panel-active .overlay--left {
  transform: translateX(0);
}

.overlay--right {
  right: 0;
  transform: translateX(0);
}

.container.right-panel-active .overlay--right {
  transform: translateX(20%);
}

.btn {
  background-color: black;
  border-radius: 20px;
  border: 1px solid var(--white);
  color: var(--white);
  cursor: pointer;
  font-size: 0.8rem;
  font-weight: bold;
  letter-spacing: 0.1rem;
  padding: 0.9rem 4rem;
  text-transform: uppercase;
  transition: transform 80ms ease-in;
  opacity: 0.9;
}

.form > .btn {
  margin-top: 1.5rem;
}

.btn:active {
  transform: scale(0.95);
}

.btn:focus {
  outline: none;
}

.form {
  background-color: var(--white);
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0 3rem;
  height: 100%;
  text-align: center;
}

.input {
  background-color: #fff;
  border: none;
  padding: 0.9rem 0.9rem;
  margin: 0.5rem 0;
  width: 100%;
}

@keyframes show {
  0%,
  49.99% {
    opacity: 0;
    z-index: 1;
  }

  50%,
  100% {
    opacity: 1;
    z-index: 5;
  }
}
</style>
<meta charset="UTF-8">
<title>ListifyLogin</title>
</head>
 <script type="text/javascript"> 
   const signInBtn = document.getElementById("signIn");
   const signUpBtn = document.getElementById("signUp");
   const fistForm = document.getElementById("form1");
   const secondForm = document.getElementById("form2");
   const container = document.querySelector(".container");

   signInBtn.addEventListener("click", () => {
     container.classList.remove("right-panel-active");
   });

   signUpBtn.addEventListener("click", () => {
     container.classList.add("right-panel-active");
   });

   fistForm.addEventListener("submit", (e) => e.preventDefault());
   secondForm.addEventListener("submit", (e) => e.preventDefault());
 

   </script> 
<body>

</body>
</html>