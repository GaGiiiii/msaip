import React, { useCallback, useContext, useEffect, useState } from 'react'
import { Card, Col, Container, Row, Button, Form } from 'react-bootstrap'
import { useNavigate } from 'react-router-dom';
import { ApiContext, CurrentUserContext } from '../../App';
import { logout } from '../../Helpers';
import './home.css';
import axios from "axios";

interface Manufacturer {
  id: number,
  name: string
}

interface Model {
  id: number,
  name: string,
  manufacturer: Manufacturer,
}

interface Type {
  id: number,
  make: Make,
  model: Model,
}

interface Make {
  id: number,
  name: string
}

const Home: React.FC = () => {
  const [manufacturers, setManufacturers] = useState<Manufacturer[]>([]);
  const [manufacturer, setManufacturer] = useState<Manufacturer>();

  const [models, setModels] = useState<Model[]>([]);
  const [model, setModel] = useState<Model>();

  const [types, setTypes] = useState<Type[]>([]);
  const [type, setType] = useState<Model>();


  const { currentUser, setCurrentUser } = useContext(CurrentUserContext);
  const api = useContext(ApiContext);
  const navigate = useNavigate();

  const handleLogout = useCallback((event: React.FormEvent) => {
    logout(api, currentUser);
    setCurrentUser!(null);
    navigate('/');
  }, [api, currentUser, navigate, setCurrentUser]);

  const getManufacturers = useCallback(async () => {
    try {
      let mfs: Manufacturer[] = [];
      let response = await axios.get(`${api}/manufacturers`);
      response.data.manufacturers.forEach((manufacturer: Manufacturer) => {
        let mf: Manufacturer = {
          id: manufacturer.id,
          name: manufacturer.name
        }
        mfs.push(mf);
      });
      setManufacturers(mfs);
    } catch (error) {
      console.log(error);
    }
  }, [api]);

  const getModels = useCallback(async (manufacturer: Manufacturer) => {
    try {
      let modelsG: Model[] = [];
      let response = await axios.get(`${api}/models?manufacturer=${manufacturer.id}`);
      response.data.models.forEach((model: Model) => {
        let m: Model = {
          id: model.id,
          manufacturer,
          name: model.name
        }
        modelsG.push(m);
      });
      setModels(modelsG);
      setModel(modelsG[0]);
    } catch (error) {
      console.log(error);
    }
  }, [api]);

  const getTypes = useCallback(async (model: Model) => {
    try {
      let typesG: Type[] = [];
      let response = await axios.get(`${api}/types?model=${model.id}`);
      console.log(response.data);
      response.data.types.forEach((type: Type) => {
        let t: Type = {
          id: type.id,
          make: type.make,
          model,
        }
        typesG.push(t);
      });
      setTypes(typesG);
    } catch (error) {
      console.log(error);
    }
  }, [api]);

  const handleManufacturerChanged = useCallback((e) => {
    let foundManufacturer = manufacturers.find((m: Manufacturer) => m.id === +e.target.value);
    setManufacturer(foundManufacturer);
  }, [manufacturers]);

  const handleModelChanged = useCallback((e) => {
    let foundModel = models.find((m: Model) => m.id === +e.target.value);
    setModel(foundModel);
  }, [models]);

  const handleSubmit = useCallback((e) => {
    console.log("A");

    e.preventDefault();
    console.log(manufacturer, model, type);
  }, [manufacturer, model, type]);

  useEffect(() => {
    getManufacturers();
  }, [getManufacturers]);

  useEffect(() => {
    if (manufacturer) {
      getModels(manufacturer);
    } else {
      setModels([]);
      setTypes([]);
    }
  }, [manufacturer, getModels]);

  useEffect(() => {
    if (model) {
      getTypes(model);
    }
  }, [model, getTypes]);

  return (
    <Container fluid className='px0 login-container mt-5' style={{ overflowX: 'hidden' }}>
      <Row>
        <Col xl={{ span: 4, offset: 4 }} lg={{ span: 6, offset: 3 }} md={{ span: 8, offset: 2 }} sm={{ span: 10, offset: 1 }}>
          <h3>Welcome: {currentUser!.username}</h3>
          <Card className='shadow'>
            <Card.Header as="h5" className='d-flex justify-content-between align-items-center'>Select your favorite car<span className='logout btn btn-outline-primary' onClick={handleLogout}>Logout</span>
            </Card.Header>
            <Card.Body>
              <Form onSubmit={handleSubmit}>
                <div className="mb-3">
                  <Form.Label className="text-capitalize">Manufacturer</Form.Label>
                  <Form.Select aria-label="Default select example" onChange={handleManufacturerChanged}>
                    <option value="-1">Select manufacturer</option>
                    {manufacturers.map((manufacturer: Manufacturer) => (
                      <option value={manufacturer.id} key={manufacturer.id}>{manufacturer.name}</option>
                    ))}
                  </Form.Select>
                </div>
                <div className="mb-3">
                  <Form.Label className="text-capitalize">Model</Form.Label>
                  <Form.Select aria-label="Default select example" onChange={handleModelChanged}>
                    {models.map((model: Model) => (
                      <option value={model.id} key={model.id}>{model.name}</option>
                    ))}
                  </Form.Select>
                </div>
                <div className="mb-3">
                  <Form.Label className="text-capitalize">Make</Form.Label>
                  <Form.Select aria-label="Default select example">
                    {types.map((type: Type) => (
                      <option value={type.id} key={type.id}>{type.make.name}</option>
                    ))}
                  </Form.Select>
                </div>
                <Button type="submit" className='w-100 mt-2'>Save</Button>
              </Form>
            </Card.Body>
          </Card>
        </Col >
      </Row >
    </Container >
  )
}

export default Home;