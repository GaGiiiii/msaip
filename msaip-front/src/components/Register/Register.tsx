import React, { useContext, useState } from 'react'
import { Col, Container, Row, Button, Form } from 'react-bootstrap'
import axios from 'axios';
import './register.css';
import { login, validateEmail, } from '../../Helpers';
import { ApiContext, CurrentUserContext, User } from '../../App';
import { useNavigate } from 'react-router-dom';
import Input from '../Input/Input';

const Register: React.FC = () => {
  const navigate = useNavigate();

  const [email, setEmail] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [username, setUsername] = useState<string>("");

  const api = useContext(ApiContext);
  const { setCurrentUser } = useContext(CurrentUserContext);

  function handleRegister(event: React.FormEvent) {
    event.preventDefault();

    if (email === '' || password === "" || username === "") {
      return;
    }

    axios.post(`${api}/register`, { email, password, username, }).then(response => {
      console.log(response);
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
    });
  }

  return (
    <Container fluid className='px0 login-container mt-5' style={{ overflowX: 'hidden' }}>
      <Row>
        <Col xl={{ span: 4, offset: 4 }} lg={{ span: 6, offset: 3 }} md={{ span: 8, offset: 2 }} sm={{ span: 10, offset: 1 }}>
          <h1>REGISTER</h1>
          <hr />
          <Form className='auth-form' onSubmit={handleRegister}>
            <Input onChange={(e) => setUsername(e.target.value)} inputName='username' placeholder='GaGiiiii' type='text' validateInput={(inputValue) => inputValue.length > 3} />
            <Input onChange={(e) => setEmail(e.target.value)} inputName='email' placeholder='john@doe.com' type='email' validateInput={validateEmail} />
            <Input onChange={(e) => setPassword(e.target.value)} inputName='password' placeholder='123456' type='password' />
            <Button variant="primary" className='w-100' type="submit">
              Register
            </Button>
            <p onClick={() => navigate('/login')} className='text-center mt-3 fw-normal'>Already a member?&nbsp; <span className='su-span'>Login</span></p>
            <p className='agree-text text-muted text-center'>By clicking Sign up, zou agree to TIME TRACK's <br /><span className='fw-bold text-decoration-underline'>Terms and Conditions</span> and <span className='fw-bold text-decoration-underline'>Privacy Policy</span></p>
          </Form>
        </Col>
      </Row>
    </Container>
  )
}

export default Register;