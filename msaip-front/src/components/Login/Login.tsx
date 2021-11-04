import React, { useContext, useState } from 'react'
import { Col, Container, Row, Button, Form } from 'react-bootstrap'
import axios from 'axios';
import './login.css';
import { login, validateEmail } from '../../Helpers';
import { ApiContext, CurrentUserContext, User } from '../../App';
import { useNavigate } from 'react-router-dom';
import Input from '../Input/Input';

const Login: React.FC = () => {
  const navigate = useNavigate();

  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [wrongCombination, setWrongCombination] = useState<boolean>(false);

  const api = useContext(ApiContext);
  const { setCurrentUser } = useContext(CurrentUserContext);

  function handleLogin(event: React.FormEvent) {
    event.preventDefault();

    if (email === '' || password === "") {
      return;
    }

    axios.post(`${api}/login`, { email, password }).then(response => {
      let user: User = {
        id: response.data.user.id,
        username: response.data.user.username,
        email: response.data.user.email,
        token: response.data.token,
      };
      login(user); // Add User to Local Storage
      setCurrentUser!(user); // Set Global State
      navigate('/'); // Redirect
    }).catch((error) => {
      console.log(error);
      setWrongCombination(true);
    });
  }

  return (
    <Container fluid className='px0 login-container mt-5' style={{ overflowX: 'hidden' }}>
      <Row>
        <Col xl={{ span: 4, offset: 4 }} lg={{ span: 6, offset: 3 }} md={{ span: 8, offset: 2 }} sm={{ span: 10, offset: 1 }}>
          <h1>LOGIN</h1>
          <hr />
          {wrongCombination && <h6 className='text-center text-danger mb-4'>Wrong Combination</h6>}
          <Form className='auth-form' onSubmit={handleLogin}>
            <Input onChange={(e) => setEmail(e.target.value)} inputName='email' placeholder='john@doe.com' type='email' validateInput={validateEmail} />
            <Input onChange={(e) => setPassword(e.target.value)} inputName='password' placeholder='123456' type='password' />
            <Button variant="primary" className='w-100' type="submit">
              Login
            </Button>
            <p onClick={() => navigate('/register')} className='text-center mt-3 fw-normal'>Not a member?&nbsp; <span className='su-span'>Register here</span></p>
          </Form>
        </Col>
      </Row>
    </Container>
  )
}

export default Login;