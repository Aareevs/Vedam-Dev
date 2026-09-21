import React, { useState } from "react";

function Signup() {

  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");


  async function handleSignup(e) {

    e.preventDefault();

    try {

      let response = await fetch("http://localhost:4000/signUp", {

        method: "POST",

        headers: {
          "Content-Type": "application/json",
        },

        body: JSON.stringify({
          name,
          email,
          password,
        }),

      });

      let data = await response.text();

      console.log(data);

      alert(data);

    } catch (error) {

      console.log(error);

      alert("Something went wrong");

    }
  }


  return (
    <div style={styles.page}>

      <div style={styles.card}>

        <div style={styles.logo}>MyApp.</div>

        <h1 style={styles.heading}>Create account</h1>

        <p style={styles.subtitle}>
          Enter your details to create your account.
        </p>

        <form onSubmit={handleSignup}>

          <div style={styles.inputGroup}>

            <label style={styles.label}>
              Name
            </label>

            <input
              type="text"
              name="name"
              placeholder="Enter your name"
              style={styles.input}
              value={name}
              onChange={(e) => setName(e.target.value)}
              required
            />

          </div>


          <div style={styles.inputGroup}>

            <label style={styles.label}>
              Email
            </label>

            <input
              type="email"
              name="email"
              placeholder="Enter your email"
              style={styles.input}
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />

          </div>


          <div style={styles.inputGroup}>

            <label style={styles.label}>
              Password
            </label>

            <input
              type="password"
              name="password"
              placeholder="Create a password"
              style={styles.input}
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />

          </div>


          <button type="submit" style={styles.button}>
            Create Account
          </button>

        </form>


        <p style={styles.bottomText}>

          Already have an account?{" "}

          <a href="/login" style={styles.link}>
            Login
          </a>

        </p>

      </div>

    </div>
  );
}


const styles = {
  page: {
    minHeight: "100vh",
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    background: "#f4f4f4",
    padding: "20px",
  },

  card: {
    width: "420px",
    background: "#fff",
    padding: "45px",
    borderRadius: "18px",
    boxShadow: "0 15px 40px rgba(0,0,0,0.1)",
  },

  logo: {
    textAlign: "center",
    fontSize: "26px",
    fontWeight: "bold",
    marginBottom: "35px",
  },

  heading: {
    fontSize: "30px",
    marginBottom: "8px",
    color: "#111",
  },

  subtitle: {
    color: "#777",
    fontSize: "14px",
    marginBottom: "30px",
  },

  inputGroup: {
    marginBottom: "18px",
  },

  label: {
    display: "block",
    fontSize: "14px",
    fontWeight: "600",
    marginBottom: "7px",
  },

  input: {
    width: "100%",
    padding: "13px 14px",
    border: "1px solid #ddd",
    borderRadius: "9px",
    outline: "none",
    fontSize: "14px",
    boxSizing: "border-box",
  },

  button: {
    width: "100%",
    padding: "14px",
    marginTop: "8px",
    border: "none",
    borderRadius: "9px",
    background: "#111",
    color: "#fff",
    fontSize: "15px",
    fontWeight: "600",
    cursor: "pointer",
  },

  bottomText: {
    textAlign: "center",
    marginTop: "22px",
    fontSize: "14px",
    color: "#777",
  },

  link: {
    color: "#111",
    fontWeight: "bold",
    textDecoration: "none",
  },
};

export default Signup;