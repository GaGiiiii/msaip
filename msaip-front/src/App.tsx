import React, { useState } from 'react';
import './App.css';
import "bootswatch/dist/sandstone/bootstrap.min.css";
import { isLoggedIn } from './Helpers';
import { BrowserRouter as Router, Routes, Route, Navigate } from "react-router-dom";
import Login from './components/Login/Login';
import Register from './components/Register/Register';
import Home from './components/Home/Home';

export interface User {
  id: number,
  username: string,
  email: string,
  token: string
}

interface CurrentUserContextTypes {
  currentUser: User | null,
  setCurrentUser: React.Dispatch<React.SetStateAction<User | null>> | null,
}

const api = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1' ? "http://localhost:8000/api" : 'PRODUCTION_URL';
export const ApiContext = React.createContext<string>(api);
export const CurrentUserContext = React.createContext<CurrentUserContextTypes>({ currentUser: null, setCurrentUser: null });

function App() {
  const [currentUser, setCurrentUser] = useState<User | null>(() => isLoggedIn(api));

  return (
    <ApiContext.Provider value={api}>
      <CurrentUserContext.Provider value={{ currentUser, setCurrentUser }}>
        <Router>
          <Routes>
            {/* <Route path="/reports">
              {currentUser ? <Reports reports={reports} /> : <Redirect to='/login' />}
            </Route> */}
            <Route path="/login" element={!currentUser ? <Login /> : <Navigate to='/' />}>
            </Route>
            <Route path="/register" element={!currentUser ? <Register /> : <Navigate to='/' />}>
            </Route>
            <Route path="/" element={currentUser ? <Home /> : <Navigate to='/login' />}>
            </Route>
          </Routes>
        </Router>
      </CurrentUserContext.Provider>
    </ApiContext.Provider>
  );
}

export default App;
