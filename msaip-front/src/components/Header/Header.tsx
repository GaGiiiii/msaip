import React, { useCallback, useContext } from 'react'
import { useNavigate } from 'react-router-dom';
import { ApiContext, CurrentUserContext } from '../../App';
import { logout } from '../../Helpers';

const Header: React.FC = () => {
  const { currentUser, setCurrentUser } = useContext(CurrentUserContext);
  const api = useContext(ApiContext);
  const navigate = useNavigate();

  const handleLogout = useCallback((event: React.FormEvent) => {
    logout(api, currentUser);
    setCurrentUser!(null);
    navigate('/');
  }, [api, currentUser, navigate, setCurrentUser]);


  return (
    <div className="d-flex justify-content-between align-items-center mb-2 pe-3"><h3>Welcome: {currentUser!.username}</h3><span className='logout btn btn-outline-primary' onClick={handleLogout}>Logout</span></div>
  )
}

export default Header;