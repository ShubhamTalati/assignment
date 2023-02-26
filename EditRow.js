import React from "react";

const EditRow = ({
  tableData,
  Cancel,
  setTableData,
  editData,
  setEditData,
}) => {
  const handleEditChange = (e) => {
    const { name, value } = e.target;
    setEditData({ ...editData, [name]: value });
  };

  const Save = (e) => {
    e.preventDefault();
    let filterData = tableData.filter((e) => e.id !== editData.id);
    let updatedData = [...filterData, { ...editData }].sort((a, b) =>
      a.id > b.id ? 1 : -1
    );
    setTableData(updatedData);
    // const delData = tableData.filter((tbd) => {
    //   return editData.id !== tbd.id;
    // });
    // setTableData(delData);
  };
  return (
    <>
      <tr>
        <td>
          <input
            type="text"
            name="FirstName"
            required
            placeholder="Enter a Firstname..."
            onChange={handleEditChange}
            value={editData.FirstName}
          />
        </td>
        <td>
          <input
            type="text"
            name="LastName"
            required
            placeholder="Enter a Lastname..."
            onChange={handleEditChange}
            value={editData.LastName}
          />
        </td>
        <td>
          <input
            type="text"
            name="Email"
            required
            placeholder="Enter an Email..."
            onChange={handleEditChange}
            value={editData.Email}
          />
        </td>
        <td>
          <input
            type="text"
            name="phoneNumber"
            required
            placeholder="Enter a phone number..."
            onChange={handleEditChange}
            value={editData.phoneNumber}
          />
        </td>
        <td>
        <input
            type="text"
            name="Gender"
            required
            placeholder="Enter a Gender..."
            onChange={handleEditChange}
            value={editData.Gender}
          />
        </td>

        <td>
        <input
            type="text"
            name="Department"
            required
            placeholder="Enter a Department..."
            onChange={handleEditChange}
            value={editData.Department}
          />
        </td>

        <td>
        <input
            type="text"
            name="Skills"
            required
            placeholder="Enter a Skills..."
            onChange={handleEditChange}
            value={editData.Skills}
          />
        </td>

        <td>
        <input
            type="text"
            name="About"
            required
            placeholder="Enter About..."
            onChange={handleEditChange}
            value={editData.About}
          />
        </td>


        <td className="d-flex justify-content-center">
          <button className="btn btn-success" type="submit" onClick={Save}>
            <i class="fa-solid fa-floppy-disk"></i>
          </button>
          <button className="btn btn-danger" type="button" onClick={Cancel}>
            <i class="fa-solid fa-ban"></i>
          </button>
        </td>
      </tr>
    </>
  );
};

export default EditRow;
