import React, { useCallback, useContext, useEffect, useState } from 'react'
import { Col, Container, Row, Card } from 'react-bootstrap'
import axios from 'axios';
import { ApiContext, CurrentUserContext, User } from '../../App';
import { Type } from '../Home/Home';
import { Link } from 'react-router-dom';
import './savedCars.css';
import Header from '../Header/Header';

interface ISavedCar {
  id: number,
  user: User,
  type: Type
}

const SavedCars: React.FC = () => {
  const [savedCars, setSavedCars] = useState<ISavedCar[]>([]);

  const api = useContext(ApiContext);
  const { currentUser } = useContext(CurrentUserContext);

  const getCars = useCallback(async () => {
    try {
      let response = await axios.get(`${api}/saved-cars?user=${currentUser!.id}`);
      let savedCarsG: ISavedCar[] = [];
      response.data.savedCars.forEach((savedCar: any) => {
        let sc = {
          id: savedCar.id,
          user: savedCar.user,
          type: {
            id: savedCar.type.id,
            model: savedCar.type.m_model,
            make: savedCar.type.make
          }
        }
        savedCarsG.push(sc);
      })

      setSavedCars(savedCarsG);
      console.log(savedCarsG);
    } catch (error) {
      console.log(error);
    }
  }, [api, currentUser]);

  useEffect(() => {
    getCars();
  }, [getCars]);

  return (
    <Container fluid className='px0 login-container mt-5' style={{ overflowX: 'hidden' }}>
      <Row>
        <Col xl={{ span: 4, offset: 4 }} lg={{ span: 6, offset: 3 }} md={{ span: 8, offset: 2 }} sm={{ span: 10, offset: 1 }}>
          <Header />
          <Card>
            <Card.Header as="h5" className='d-flex justify-content-between align-items-center'>List of your saved cars <Link to='/'><span className='btn btn-outline-secondary'>Browse Cars</span></Link></Card.Header>
            <Card.Body>
              <ul>
                {savedCars.map((savedCar: ISavedCar) => (
                  <li className='car-li' key={savedCar.id}>{savedCar.type.model.manufacturer.name} {savedCar.type.model.name} {savedCar.type.make.name}</li>
                ))}
              </ul>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  )
}

export default SavedCars;