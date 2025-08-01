# Milesight NX Plugin Updater

This repository contains precompiled Milesight NX `.so` plugin libraries and an auto-updater script for Linux systems.

---

## 4️⃣ Install on Your Linux System

Before cloning, make sure **Git is installed** on your server.

### Install Git (if missing)
- **Ubuntu / Debian:**
```bash
sudo apt update
sudo apt install git -y
```
- **CentOS / Fedora:**
```bash
sudo yum install git -y
```
or
```bash
sudo dnf install git -y
```
- **OpenSUSE:**
```bash
sudo zypper install git
```
- **Verify installation:**
```bash
git --version
```

---

### Clone and Run Updater

On the target server:
```bash
cd /opt
sudo git clone https://github.com/SyncLostFound/milesight-nx-plugin-updater.git
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
