# Plugged-In

## Plugged-In is a simple to use Plugin Rebuilder tool For Unreal Engine 5.3.2 to make life easier. 

### Simply dubbed PLUGIN REBUILD ASSISTANT Although for ease of use amongst the community it renames itself to RebuildPlugin.bat when finished as to keep with common naming converntions and ue5 terminology / lingo.

## Plugin Rebuild Assistant v1

### Overview

This script serves as a helpful assistant for rebuilding plugins, ensuring everything is in the right place and creating shortcuts to save time later on.

### Workflow

1. **Check Script Location:**
   - The script starts by verifying if it's in the right place, specifically the BatchFiles folder. If not, it displays an error message and stops.

2. **Find Engine Paths:**
   - It then looks for essential paths like BatchFiles and Marketplace. If they're not found, it creates the Marketplace directory.

3. **User Chooses a Plugin:**
   - The user interacts with the script, selecting a plugin file from the Marketplace directory for rebuilding.

4. **Save Configuration:**
   - The script preserves the user's choices and essential paths in a temporary configuration file.

5. **Generate New Rebuild Script:**
   - Utilizing the saved details, a new script (RebuildPlugin.bat) is crafted in the temporary folder.

6. **Move New Script to BatchFiles:**
   - The freshly generated script is then moved to the BatchFiles folder, ready for future use.

7. **Notify Success and Pause:**
   - The script communicates the successful rebuild and takes a moment to let the user absorb the message.

8. **Create Desktop Shortcut (Optional):**
   - Optionally, it goes the extra mile and sets up a desktop shortcut for easy access.

9. **Exit Original Script:**

    
### __________________________________________________________________________________________________________________________________________________


## Instructions for First-Time Execution

### Prerequisites

- Make sure you have Unreal Engine 5.3.2 installed.
- Ensure that the script is placed in the `BatchFiles` folder of your Unreal Engine installation.

### First-Time Setup

1. **Drag and Drop:**
   - Drag the script (`Plugged_In.bat`) into the main folder of your Unreal Engine installation.

2. **Run the Script:**
   - Double-click on `Plugged_In.bat` to run the script.

3. **Follow On-Screen Prompts:**
   - The script will guide you through locating necessary directories and setting up the initial configuration.
   - Choose a plugin for rebuilding and specify a folder name.

4. **Automatic Script Generation:**
   - After the first run, a new script (`RebuildPlugin.bat`) will be created in the `BatchFiles` folder.
   - This new script will contain your saved settings for subsequent use.

### Subsequent Rebuilds

- For subsequent plugin rebuilds, run `RebuildPlugin.bat` in the `BatchFiles` folder.
- The script will automatically use your saved settings from the previous run.

### Desktop Shortcut

- The script automatically creates a desktop shortcut for `RebuildPlugin.bat` after the first successful rebuild.
- Double-click the shortcut for quick access to the rebuilding tool.

## Troubleshooting

- If you encounter issues, ensure that the script is in the correct folder and that the necessary directories exist.

- othrwise you can contact me here
-
- ## My Discord Server: [Click here to Join Now](https://discord.gg/truU4z6RhM)
- ## alternate server backup [Otherwise Try our Backup Discord](https://discord.gg/wxkVKnEaSy)
   - The original script exits and tidies up by deleting itself, leaving behind the streamlined RebuildPlugin.bat for the user's convenience.

