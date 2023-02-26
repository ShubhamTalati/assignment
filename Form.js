import React, { useState } from "react";

const Form = ({ tableData, setTableData }) => {
  const [newData, setNewData] = useState({
    FirstName:"",
    LastName:"",
    Email:"",
    phoneNumber:"",
    Gender:"",
    Department:"",
    Skills:"",
    About:"",
  });

  const Change = (e) => {
    const { name, value } = e.target;
    setNewData({ ...newData, [name]: value });
  };

  const Add = (e) => {
    e.preventDefault();
    setTableData([...tableData, { ...newData, id: Math.random() }]); // for giving the new data some random id
    setNewData({
      // for enptying the form
      FirstName:"",
    LastName:"",
    Email:"",
    phoneNumber:"",
    Gender:"",
    Department:"",
    Skills:"",
    About:"",
    });
  };

  return (
    <>
      <div className="container-fluid">
        <div className="row py-3">
          <form className="d-flex flex-wrap justify-content-center form">
            <input
              type="text"
              name="FirstName"
              required
              placeholder="Enter FirstName..."
              onChange={Change}
              value={newData.FirstName}
              className="form-control-sm fs-4 col-3 mx-5"
            />
            <input
              type="text"
              name="LastName"
              required
              placeholder="Enter LastName..."
              onChange={Change}
              value={newData.LastName}
              className="form-control-sm col-3 mx-5 fs-4"
            />
            <input
              type="text"
              name="Email"
              required
              placeholder="Enter a Email..."
              onChange={Change}
              value={newData.Email}
              className="form-control-sm col-3 mx-5 fs-4"
            />
            <input
              type="text"
              name="phoneNumber"
              required
              placeholder="Enter phoneNumber..."
              onChange={Change}
              value={newData.phoneNumber}
              className="form-control-sm col-3 mx-5 fs-4 mt-4"
            />
            <input
              type="text"
              name="Gender"
              required
              placeholder="Enter Gender..."
              onChange={Change}
              value={newData.Gender}
              className="form-control-sm col-3 mx-5 fs-4 mt-4"
            />
            <input
              type="text"
              name="Department"
              required
              placeholder="Enter an Department..."
              onChange={Change}
              value={newData.Department}
              className="form-control-sm col-3 mx-5 fs-4 mt-4"
            />

            <input
              type="text"
              name="Skills"
              required
              placeholder="Enter an Skills..."
              onChange={Change}
              value={newData.Skills}
              className="form-control-sm col-3 mx-5 fs-4 mt-4"
            />

            <input
              type="text"
              name="About"
              required
              placeholder="Enter an About..."
              onChange={Change}
              value={newData.About}
              className="form-control-sm col-3 mx-5 fs-4 mt-4"
            />


            <div className="w-100"></div>
            <button
              className="btn-primary px-2 mx-3 fs-3 col-2 mt-4"
              onClick={Add}
              type="submit"
            >
              Add
            </button>
          </form>
        </div>
      </div>
    </>
  );
};

export default Form;
