import React, { useEffect, useState } from "react";

function Api() {

  const [user, setUser] = useState(null);
  const [message, setMessage] = useState("");

  useEffect(() => {

    async function getData() {

      try {

        // Get token from localStorage
        let token = localStorage.getItem("token");

        // Send token to backend
        let response = await fetch("http://localhost:4000/api", {

          method: "GET",

          headers: {
            Authorization: `Bearer ${token}`,
          },

        });

        let data = await response.json();

        console.log(data);

        if (!response.ok) {
          setMessage(data.message || "Unauthorized");
          return;
        }

        setMessage(data.message);
        setUser(data.user);

      } catch (error) {

        console.log(error);

        setMessage("Something went wrong");

      }
    }

    getData();

  }, []);


  return (
    <div style={{ padding: "40px" }}>

      <h1>API Page</h1>

      <h2>{message}</h2>

      {user && (
        <div>

          <p>
            Email: {user.email}
          </p>

          <p>
            Role: {user.role}
          </p>

        </div>
      )}

    </div>
  );
}

export default Api;