# winscan - Windows Repair Tool

WinScan is a batch file portable tool designed to repair corrupt Windows OS (10/11) files and fix disk errors. It achieves this by executing the following commands in the specified order:

1. `SFC /ScanNow`: Scans and repairs Windows system files.
2. `DISM /Online /Cleanup-Image /CheckHealth`: Checks the health of the Windows image.
3. `DISM /Online /Cleanup-Image /ScanHealth`: Scans for component store corruption.
4. `DISM /Online /Cleanup-Image /RestoreHealth`: Restores the Windows image from known good files.
5. `CHKDSK :drive /F /X`: Optionally, you can run this command to scan local drives for bad sectors (use the `/R` parameter for HDD drives).

## Features

- Automated repair process: Execute all repair commands with a single click.
- Sequential execution: Ensures that the commands run in the correct order.
- Optional CHKDSK scan: Choose whether to scan for bad sectors.

## Usage

1. **Installation**:
   - Download the `winscan.bat` file from the releases page.
   - Save it to a convenient location on your system.

2. **Run as Administrator**:
   - Right-click on `winscan.bat`.
   - Select "Run as administrator."

3. **Follow the prompts**:
   - The tool will guide you through the repair process.
   - You can choose whether to run the optional CHKDSK scan.

## Support

If you encounter any issues or have questions, feel free to open an issue on the GitHub repository.

## License

This project is licensed under the MIT License.

---

**Note**: Always create a system restore point before running any repair tools. Use this tool at your own risk and use ONLY the release tool.
