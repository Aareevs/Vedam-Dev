import React, { useState } from "react";
import { useNavigate, useSearchParams } from "react-router-dom";

function ResetPassword() {

  const [newPassword, setNewPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [message, setMessage] = useState("");

  const [searchParams] = useSearchParams();

  const navigate = useNavigate();

  const token = searchParams.get("token");


  async function handleResetPassword(e) {

    e.preventDefault();

    if (!token) {
      setMessage("Invalid or missing reset link.");
      return;
    }

    if (newPassword !== confirmPassword) {
      setMessage("Passwords do not match.");
      return;
    }

    try {

      let response = await fetch(
        "http://localhost:4000/resetPassword",
        {
          method: "POST",

          headers: {
            "Content-Type": "application/json",
          },

          body: JSON.stringify({
            token,
            newPassword,
          }),
        }
      );

      let data = await response.text();

      if (!response.ok) {
        setMessage(data);
        return;
      }

      setMessage("Password reset successfully!");

      setTimeout(() => {
        navigate("/login");
      }, 1500);

    } catch (error) {

      console.log(error);

      setMessage("Something went wrong.");

    }
  }


  return (
    <div style={styles.page}>

      <div style={styles.card}>

        <div style={styles.logo}>
          MyApp.
        </div>

        <h1 style={styles.heading}>
          Reset password
        </h1>

        <p style={styles.subtitle}>
          Enter your new password below.
        </p>


        <form onSubmit={handleResetPassword}>

          <div style={styles.inputGroup}>

            <label style={styles.label}>
              New Password
            </label>

            <input
              type="password"
              placeholder="Enter new password"
              style={styles.input}
              value={newPassword}
              onChange={(e) => setNewPassword(e.target.value)}
              required
            />

          </div>


          <div style={styles.inputGroup}>

            <label style={styles.label}>
              Confirm Password
            </label>

            <input
              type="password"
              placeholder="Confirm new password"
              style={styles.input}
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              required
            />

          </div>


          <button
            type="submit"
            style={styles.button}
          >
            Reset Password
          </button>

        </form>


        {message && (
          <p style={styles.message}>
            {message}
          </p>
        )}

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
    textAlign: "center",
    fontSize: "14px",
    color: "#555",
  },

};

export default ResetPassword;