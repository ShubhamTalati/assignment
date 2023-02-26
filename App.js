import React, { useState } from "react";
import { data } from "./Data";
import Form from "./Form";
import ReadOnly from "./ReadOnly";
import EditRow from "./EditRow";
import Pagination from "./Pagination";
import Filter from "./Filter";

const App = () => {
  const [tableData, setTableData] = useState(data); // input data for table
  const [toggle, setToggle] = useState(null); //for data ids
  const [search, setSearch] = useState(""); //for filtering data
  const [editData, setEditData] = useState({
    // for editing data
    FirstName:"",
    LastName:"",
    Email:"",
    phoneNumber:"",
    Gender:"",
    Department:"",
    Skills:"",
    About:"",
  });
  const [order, setOrder] = useState("asc"); //for sorting
  const [number, setNumber] = useState(1); // No of pages
  const [postPerPage] = useState(4);

  const Delete = (del) => {
    const delData = tableData.filter((tbd) => {
      return del !== tbd.id;
    });
    setTableData(delData);
  };

  const Edit = (data) => {
    // for opening the editable row
    setToggle(data);
    setEditData(data);
  };

  const Cancel = () => {
    setToggle(null);
  };

  const Sort = (sort) => {
    if (order === "asc") {
      const sorted = [
        ...tableData.sort((a, b) => (a[sort] > b[sort] ? 1 : -1)),
      ];
      console.log(sorted);
      setTableData(sorted);
      setOrder("desc");
    } else if (order === "desc") {
      const sorted = [
        ...tableData.sort((a, b) => (a[sort] < b[sort] ? 1 : -1)),
      ];
      console.log(sorted);
      setTableData(sorted);
      setOrder("asc");
    }
  };
  //for Pagination
  const lastPost = number * postPerPage;
  const firstPost = lastPost - postPerPage;
  const currentData = tableData.slice(firstPost, lastPost);

  return (
    <>
      <div className="container-fluid">
        <div className="row">
          <h1 className="text-center display-3 text-black my-3">React Table</h1>
          <Filter search={search} setSearch={setSearch} />
          <form>
            <table className="table table-striped table-primary table-hover text-center fs-5 table-bordered border-dark">
              <thead>
                <tr>
                  <th id="tr" onClick={() => Sort("FirstName")}>
                  FirstName
                  </th>
                  <th id="tr" onClick={() => Sort("LastName")}>
                  LastName
                  </th>
                  <th id="tr" onClick={() => Sort("Email")}>
                  Email
                  </th>
                  <th id="tr" onClick={() => Sort("phoneNumber")}>
                  phoneNumber
                  </th>
                  <th id="tr" onClick={() => Sort("Gender")}>
                  Gender
                  </th>
                  <th id="tr" onClick={() => Sort("Department")}>
                  Department
                  </th>
                  <th id="tr" onClick={() => Sort("Skills")}>
                  Skills
                  </th>

                  <th id="tr" onClick={() => Sort("About")}>
                  About
                  </th>
                  <th id="tr">Action</th>
                </tr>
              </thead>
              <tbody>
                {currentData
                  .filter((val) => {
                    if (search === "") {
                      return val;
                    } else if (
                      val.FirstName.toLowerCase().includes(search.toLowerCase())
                    ) {
                      return val;
                    }
                  })
                  .map((data) => {
                    return (
                      <>
                        {toggle === data ? (
                          <EditRow
                            key={data.id}
                            tableData={tableData}
                            setTableData={setTableData}
                            Cancel={Cancel}
                            setEditData={setEditData}
                            editData={editData}
                          />
                        ) : (
                          <ReadOnly
                            key={data.id}
                            data={data}
                            currentData={currentData}
                            Edit={Edit}
                            Delete={Delete}
                          />
                        )}
                      </>
                    );
                  })}
              </tbody>
            </table>
          </form>

          <Pagination
            number={number}
            setNumber={setNumber}
            tableData={tableData}
            postPerPage={postPerPage}
          />

          <h1 className="mx-3 mt-4">Add a contact</h1>
          <Form tableData={tableData} setTableData={setTableData} />
        </div>
      </div>
    </>
  );
};

export default App;
