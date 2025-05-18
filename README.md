# reWASD Bypass

Bypass the 7-day free trial of reWASD and reactivate it each time the trial expires.

---

## ⚠️ Disclaimer

English is not my first language, so there may be small grammar issues.  
This guide is for **educational purposes only**. Use at your own risk.

---

## 📌 One-Time Setup (Only needed the first time)

### 1. Open Device Manager

Press `Win + R`, type `devmgmt.msc`, and press Enter.

![Device Manager](https://github.com/19noam/Rewasd-Bypass/assets/69153900/30ec398d-e4b7-4321-b437-d2b3deab0469)

---

### 2. Expand "Network adapters"

Click the arrow next to **Network adapters**, then **double-click** your network device.

![Network Adapters](https://github.com/19noam/Rewasd-Bypass/assets/69153900/6bf43b3d-1ccc-42ad-8c5c-69ef3fb539f7)

---

### 3. Open the "Advanced" Tab

Go to the **Advanced** tab in the newly opened window.

![Advanced Tab](https://github.com/19noam/Rewasd-Bypass/assets/69153900/8cb3e860-477c-4e63-beaa-7b6fb1028aa8)

---

### 4. Set a Custom MAC Address

Find **Network Address**, set it to "Value", and paste: 115544DD88HH


Then click **OK**.

![Network Address](https://github.com/19noam/Rewasd-Bypass/assets/69153900/1ed07d53-38c7-40c4-b0c0-1514bd161029)

---

### 5. Refresh IP Settings

Open Command Prompt:

- Press `Ctrl + R`, type `cmd`, and hit Enter.

![CMD](https://github.com/19noam/Rewasd-Bypass/assets/69153900/ce3ec042-045a-4ec3-baff-cc10aeaeb1b5)

Run these commands:

```cmd
ipconfig /release
ipconfig /renew
```
![CMD2](https://github.com/19noam/Rewasd-Bypass/assets/69153900/164cf172-79e0-4338-9110-85f91002869a)

✅ Done! You’ve now spoofed your MAC address and refreshed your IP.



## 🚀 How to Run

### Step 1: Download & Execute

1. Go to the [**Releases** tab](https://github.com/19noam/Rewasd-Bypass/releases).
2. Download the **latest release** `.zip` file.
3. Extract the archive to any folder.
4. Run the following file:

    ```bash
    Bypass Rewasd.bat
    ```

5. Follow the instructions in the terminal window.

📺 **Video guide**: [Watch on YouTube](https://www.youtube.com/watch?v=z6322PhgJ1Y)

---

### Step 2: Create a New reWASD Account

After launching reWASD:

- **Do not** log in with an existing account.
- Select **Sign Up**.
- Use a new email address (you can use a temporary email provider).

👉 Use: [https://temp-mail.org/en/](https://temp-mail.org/en/) to receive and verify your new account.

---

### 🔁 Repeat Every 7 Days

You will need to:

1. Run the `Bypass Rewasd.bat` script again.
2. Create a new reWASD account with a different email.

---

### ⚠️ Antivirus Notice

You might need to **disable your antivirus** temporarily, as `.bat` files often trigger false positives.

📖 [Why .bat files get flagged by antivirus](https://superuser.com/questions/1331625/can-someone-explain-why-the-compiled-batch-file-detected-by-antivirus-as-a-threa)
