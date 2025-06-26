# FileGuard 🛡️

A simple **CMD watchdog** that monitors any sensitive file and alerts you if it is modified — using **SHA256 hash comparison**.

## 🎯 Why I built this

During red-team simulations, attackers often tamper with `.bat`, `.ps1`, or `.conf` files. On blue-team tasks, I needed something fast to detect these unauthorized changes **even without a full EDR solution**.

So I built FileGuard: a lightweight solution to watch critical files.

## ⚙️ What it does

- Takes a file path from user
- Calculates original SHA256 hash
- Monitors file in intervals (default: every 10 sec)
- Alerts you immediately if the file is changed

## 🛠 How to use

1. Open CMD and run:
```cmd
fileguard.cmd
```

2. When prompted, enter full path to the file:
```
C:\sensitive\config.ps1
```

3. Example output:
```
[INFO] Monitoring started on: C:\sensitive\config.ps1
[INFO] Original SHA256: 8A56F1...

🚨 [ALERT] File has been modified!
Timestamp: 06/22/2025 19:44:02
New SHA256: E4D43F...
```

## 💡 Use cases

- Monitor PowerShell, CMD, or EXE scripts
- Detect stealthy backdoor replacements
- Simple SOC alerting in restricted environments

---

Run FileGuard, and no file gets silently corrupted. 🔍
