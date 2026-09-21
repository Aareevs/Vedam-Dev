import React, { useState } from "react";
import { useNavigate, Link } from "react-router-dom";

function Login() {

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const navigate = useNavigate();


  async function handleLogin(e) {

    e.preventDefault();

    try {

      let response = await fetch("http://localhost:4000/login", {

        method: "POST",

        headers: {
          "Content-Type": "application/json",
        },

        body: JSON.stringify({
          email,
          password,
        }),

      });

      let data = await response.json();

      console.log(data);

      if (!response.ok) {
        alert(data.message || "Login failed");
        return;
      }

      // Save JWT token
      localStorage.setItem("token", data.token);

      alert("Login successful");

      // Go to API page
      navigate("/api");

    } catch (error) {

      console.log(error);

      alert("Something went wrong");

    }
  }


  return (
    <div style={styles.page}>

      <div style={styles.card}>

        <div style={styles.logo}>
          MyApp.
        </div>

        <h1 style={styles.heading}>
          Welcome back
        </h1>

        <p style={styles.subtitle}>
          Enter your details to login to your account.
        </p>


        <form onSubmit={handleLogin}>

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
              placeholder="Enter your password"
              style={styles.input}
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />

          </div>


          <div style={styles.forgot}>

            <Link
              to="/forgot-password"
              style={styles.forgotLink}
            >
              Forgot password?
            </Link>

          </div>


          <button
            type="submit"
            style={styles.button}
          >
            Login
          </button>

        </form>


        <p style={styles.bottomText}>

          Don't have an account?{" "}

          <Link
            to="/signup"
            style={styles.link}
          >
            Create account
          </Link>

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

  forgot: {
    textAlign: "right",
    marginBottom: "20px",
  },

  forgotLink: {
    color: "#555",
    fontSize: "13px",
    textDecoration: "none",
  },

  button: {
    width: "100%",
    padding: "14px",
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

export default Login;