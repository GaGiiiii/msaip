import React, { useCallback, useContext } from 'react'
import { Col, Container, Row } from 'react-bootstrap'
import { useNavigate } from 'react-router-dom';
import { ApiContext, CurrentUserContext } from '../../App';
import { logout } from '../../Helpers';
import './home.css';

const Home: React.FC = () => {
  const { currentUser, setCurrentUser } = useContext(CurrentUserContext);
  const api = useContext(ApiContext);
  const navigate = useNavigate();

  const handleLogout = useCallback((event: React.FormEvent) => {
    logout(api, currentUser);
    setCurrentUser!(null);
    navigate('/');
  }, [api, currentUser, navigate, setCurrentUser]);

  return (
    <Container fluid className='px0 login-container' style={{ overflowX: 'hidden' }}>
      <Row>
        <Col>
          Home
          <span onClick={handleLogout}>Logout</span>
        </Col >
      </Row >
    </Container >
  )
}

export default Home;