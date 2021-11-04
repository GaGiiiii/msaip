import React from 'react'
import { Col, Container, Row } from 'react-bootstrap'
import './home.css';

const Home: React.FC = () => {

  return (
    <Container fluid className='px0 login-container' style={{ overflowX: 'hidden' }}>
      <Row>
        <Col>
          Home
        </Col >
      </Row >
    </Container >
  )
}

export default Home;