import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

function ForgotPassword() {

  const [email, setEmail] = useState("");
  const [message, setMessage] = useState("");

  const navigate = useNavigate();

  async function handleForgotPassword(e) {

    e.preventDefault();

    try {

      let response = await fetch("http://localhost:4000/forgetPassword", {

        method: "POST",

        headers: {
          "Content-Type": "application/json",
        },

        body: JSON.stringify({
          email,
        }),

      });

      let data = await response.text();

      setMessage(data);

    } catch (error) {

      console.log(error);

      setMessage("Something went wrong");

    }
  }


  return (
    <div style={styles.page}>

      <div style={styles.card}>

        <div style={styles.logo}>
          MyApp.
        </div>

        <h1 style={styles.heading}>
          Forgot password?
        </h1>

        <p style={styles.subtitle}>
          Enter your email and we'll send you a link to reset your password.
        </p>


        <form onSubmit={handleForgotPassword}>

          <div style={styles.inputGroup}>

            <label style={styles.label}>
              Email
            </label>

            <input
              type="email"
              placeholder="Enter your email"
              style={styles.input}
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />

          </div>


          <button
            type="submit"
            style={styles.button}
          >
            Send Reset Link
          </button>

        </form>


        {message && (
          <p style={styles.message}>
            {message}
          </p>
        )}


        <p style={styles.bottomText}>

          Remember your password?{" "}

          <button
            onClick={() => navigate("/login")}
            style={styles.linkButton}
          >
            Login
          </button>

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
    border: "none",
    borderRadius: "9px",
    background: "#111",
    color: "#fff",
    fontSize: "15px",
    fontWeight: "600",
    cursor: "pointer",
  },

  message: {
    marginTop: "20px",
    fontSize: "14px",
    color: "#555",
    textAlign: "center",
  },

  bottomText: {
    textAlign: "center",
    marginTop: "22px",
    fontSize: "14px",
    color: "#777",
  },

  linkButton: {
    border: "none",
    background: "none",
    fontWeight: "bold",
    cursor: "pointer",
    fontSize: "14px",
  },

};

export default ForgotPassword;