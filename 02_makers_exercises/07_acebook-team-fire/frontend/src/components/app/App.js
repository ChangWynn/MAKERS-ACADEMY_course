import './App.css';
import LoginForm from '../auth/LoginForm'
import SignUpForm from '../user/SignUpForm'
import AccountPage from '../account/Account';
import React, { useState } from 'react';
import Feed from '../feed/Feed'
import {
  useNavigate,
  Routes,
  Route,
  Navigate
} from "react-router-dom";

const App = () => {
    return (
        <Routes>
          <Route path='/'  element={<Navigate to="/signup" />}/>
          <Route path='/posts'  element={<Feed navigate={ useNavigate() }/>}/>
          <Route path='/login'  element={<LoginForm  navigate={ useNavigate() }/>}/>
          <Route path='/signup' element={<SignUpForm navigate={ useNavigate() }/>}/>
          <Route path='/account' element={<AccountPage navigate={ useNavigate() }/>}/>
        </Routes>
    );
}

export default App;
