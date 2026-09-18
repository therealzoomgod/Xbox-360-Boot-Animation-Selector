# BootAnimSelector for Xbox 360 Aurora

The **BootAnimSelector** script allows you to choose from a collection of custom boot animations on demand, without dealing with unintended random video cycles on boot.

> [!IMPORTANT]  
> **Prerequisite:** Make sure you have **fakeanim** installed, configured, and working correctly **BEFORE** attempting the steps below.

---

## 🛠️ Installation & Configuration Guide

*The steps below assume your Aurora dashboard is located in your **Apps** folder. If your directory layout is different, please adjust the paths to match your custom setup.*

### Step 1: Install the Script
Copy or upload the entire `BootAnimSelector` folder directly to your console path:
```text
HDD1:\Apps\Aurora\User\Scripts\Utility\
```

### Step 2: Deploy the Video Assets
Copy or upload the `wmv_files` directory containing your custom animations into your fakeanim directory:
```text
HDD1:\fakeanim\
```

### Step 3: Configure the Default Boot File
1. Locate your active `jukebox` directory inside your fakeanim structure.
2. Rename your currently active boot animation file to **`boot.wmv`**.
3. Ensure `boot.wmv` is the **only file** sitting inside that target folder.

### Step 4: Verify fakeanim.ini Configuration
Open your `fakeanim.ini` file in a text editor and verify your settings. Because the script handles the file selection dynamically:
* There **should be no `movie =` entry** specified in your `fakeanim.ini`.
* Leave the movie line entirely blank or remove it so that fakeanim defaults cleanly to your target path structure.

---

## 🎮 How to Use

1. Launch **Aurora Dashboard**.
2. Press the **Back / View** button on your controller to open the dashboard overlay menu.
3. Navigate to **Scripts** and run **Boot Animation Selector**.
4. The script will automatically execute internal sanity checks—including verifying that `Bootanim Fall 2010.wmv` exists to ensure there is at least one alternative file available.
5. Use your D-Pad or Left Thumbstick to scroll through the native visual pop-up menu.
6. Press **A** on your controller to select your desired animation.

**What happens next:** The script safely deletes the old active video and copies your selected animation from `wmv_files` straight into `jukebox/boot.wmv`, giving you a true, seamless jukebox experience!

Note: The supplied wmv files are not mine.  Some are Garzol's and the rest I got from re-uploads by various people.