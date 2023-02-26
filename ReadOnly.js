import React from "react";

const ReadOnly = ({ data, Edit, Delete }) => {
  return (
    <>
      <tr>
        <td>{data.FirstName}</td>
        <td>{data.LastName}</td>
        <td>{data.Email}</td>
        <td>{data.phoneNumber}</td>
        <td>{data.Gender}</td>
        <td>{data.Department}</td>
        <td>{data.Skills}</td>
        <td>{data.About}</td>
        <td className="d-flex p-4">
          <button className="btn btn-dark me-3" onClick={() => Edit(data)}>
            <i className="fa-solid fa-pen-to-square"></i>
          </button>
          <button className="btn btn-danger" onClick={() => Delete(data.id)}>
            <i className="fa-solid fa-trash"></i>
          </button>
        </td>
      </tr>
    </>
  );
};

export default ReadOnly;
