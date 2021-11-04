import React, { useCallback, useEffect, useState } from 'react'
import { Form } from 'react-bootstrap'

interface Props {
  type: string,
  placeholder?: string,
  inputName?: string,
  validateInput?(input: any): boolean,
  onChange?(e: any): void
}

const Input: React.FC<Props> = ({ type, placeholder, inputName, validateInput, onChange }) => {
  const [inputValue, setInputValue] = useState<any>();
  const [inputError, setInputError] = useState<boolean>(false);
  const [inputColor, setInputColor] = useState<string>("");

  const handleChange = useCallback((e) => {
    if (onChange) {
      setInputValue(e.target.value);

      return onChange(e);
    }
  }, [onChange]);

  useEffect(() => {
    if (inputValue !== undefined && inputValue !== '') {
      if (validateInput && !validateInput(inputValue)) {
        setInputError(true);
        setInputColor("error-input");
      } else {
        setInputError(false);
        setInputColor("text-success");
      }
    } else {
      setInputError(false);
      setInputColor("");
    }
  }, [inputValue, validateInput]);

  return (
    <>
      <Form.Group className={`mb-4 ${inputColor}`}>
        <Form.Label className="text-capitalize">{inputName}</Form.Label>
        <Form.Control className={inputValue !== undefined && inputValue !== '' ? inputError ? 'is-invalid' : 'is-valid' : ''} onChange={handleChange} type={type} placeholder={placeholder} />
        <Form.Text className={inputError ? 'invalid-feedback' : ''} style={{ display: inputError ? 'block' : 'none' }}>The {inputName} you've entered is incorrect. Please, try again.</Form.Text>
      </Form.Group>
    </>
  )
}

export default Input;