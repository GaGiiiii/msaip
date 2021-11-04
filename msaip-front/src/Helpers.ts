import { User } from "./App";



export function validateEmail(email: String): boolean {
  const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(String(email).toLowerCase());
}

export function isLoggedIn(api: String): User | null {
  let userLS = localStorage.getItem('user');

  if (userLS === null) {
    return null;
  }

  let parsedUser = JSON.parse(userLS);

  let user: User = {
    id: parsedUser.id,
    username: parsedUser.username,
    email: parsedUser.email,
    token: parsedUser.token,
  }

  return user || null;
}

export function logout() {
  localStorage.removeItem("user");
}

export function login(user: User) {
  localStorage.setItem("user", JSON.stringify(user));
}