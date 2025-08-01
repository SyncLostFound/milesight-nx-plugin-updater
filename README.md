# Milesight NX Plugin Updater

This repository contains precompiled Milesight NX `.so` plugin libraries and an auto-updater script for Linux systems.

---

## 1️⃣ Create Your GitHub Repository

1. Go to [GitHub](https://github.com/) and log in.
2. Click **New Repository**.
3. Name it: **milesight-nx-plugin-updater**
4. Set visibility to Public or Private (your choice).
5. Click **Create Repository**.

---

## 2️⃣ Prepare Your Local Files

1. Download and extract this ZIP file:
   ```bash
   cd ~/Downloads
   unzip milesight-nx-plugin-updater.zip
   ```
2. You'll see:
   ```
   milesight-nx-plugin-updater/
   ├── README.md
   ├── update_plugin.sh
   └── libs/
       ├── libmilesight_analytics_plugin.so
       ├── libMSBase.so
       └── libMSRTSP.so
   ```

---

## 3️⃣ Initialize Git Locally and Push to GitHub

Run these commands:
```bash
cd ~/Downloads/milesight-nx-plugin-updater
git init
git add .
git commit -m "Initial commit of Milesight NX plugin updater"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/milesight-nx-plugin-updater.git
git push -u origin main
```

---

## 4️⃣ Install on Your Linux System

On the target server:
```bash
cd /opt
sudo git clone https://github.com/YOUR-USERNAME/milesight-nx-plugin-updater.git
sudo chmod +x /opt/milesight-nx-plugin-updater/update_plugin.sh
sudo /opt/milesight-nx-plugin-updater/update_plugin.sh
```

---

## 5️⃣ Set Up Auto-Update (Optional)

Run:
```bash
sudo crontab -e
```
Add:
```
0 3 * * * /opt/milesight-nx-plugin-updater/update_plugin.sh
```
This will check for updates every day at 3 AM.

---

## 6️⃣ Future Updates

When you have a new `.so` plugin:
1. Replace the files in the `libs/` folder locally.
2. Run:
   ```bash
   git add libs/*
   git commit -m "Updated Milesight NX plugin"
   git push
   ```
3. On the server:
   ```bash
   sudo /opt/milesight-nx-plugin-updater/update_plugin.sh
   ```

The new files will overwrite old ones and NX Witness will restart automatically if it’s running.

---

## Notes
- Default install path for plugins is `/usr/lib/milesight-nx`. Edit `update_plugin.sh` to change.
- The script auto-restarts `networkoptix-mediaserver` if it’s active.

