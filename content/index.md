---
title: Welcome to Quartz
---

This is a blank Quartz installation.
See the [documentation](https://quartz.jzhao.xyz) for how to get started.

---
title: "Добро пожаловать"
---

<div id="login-screen">
  <h2>Введите кодовое слово:</h2>
  <input type="text" id="password-input" placeholder="Кодовое слово">
  <button id="submit-password">Войти</button>
  <p id="error-msg" style="color:red;"></p>
</div>

<div id="content-links" style="display:none;">
  <h2>Доступные разделы:</h2>
  <ul id="links-list"></ul>
</div>

<script>
const mapping = {
  "master": ["master_data", "test_world"],
  "test_world": ["test_world"]
};

const input = document.getElementById("password-input");
const button = document.getElementById("submit-password");
const errorMsg = document.getElementById("error-msg");
const loginScreen = document.getElementById("login-screen");
const contentLinks = document.getElementById("content-links");
const linksList = document.getElementById("links-list");

button.addEventListener("click", () => {
  const pwd = input.value.trim();
  if (mapping[pwd]) {
    loginScreen.style.display = "none";
    contentLinks.style.display = "block";
    linksList.innerHTML = "";
    mapping[pwd].forEach(folder => {
      const li = document.createElement("li");
      const a = document.createElement("a");
      a.href = folder + "/";
      a.textContent = folder;
      li.appendChild(a);
      linksList.appendChild(li);
    });
  } else {
    errorMsg.textContent = "Неверное кодовое слово!";
  }
});
</script>