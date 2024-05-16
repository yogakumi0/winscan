# winscan - Windows Repair Tool

WinScan is a batch file portable tool designed to repair corrupt Windows OS (10/11) files and fix disk errors. It achieves this by executing the following commands in the specified order:

1. `SFC /ScanNow`: Scans and repairs Windows system files.
2. `DISM /Online /Cleanup-Image /RestoreHealth`: Restores the Windows image from known good files.
3. `CHKDSK`: Optionally, you can run this command to scan local drives for bad sectors (use the `/R` parameter for HDD drives).

## Features

- Automated repair process: Execute all repair commands with a single click.
- Sequential execution: Ensures that the commands run in the correct order.

## Usage

1. **Installation**:
   - Download this repository as a zip.
   - Save it to a convenient location on your system.

2. **Run as Administrator**:
   - Right-click on `winscan.bat`.
   - Select "Run as administrator."

3. **Follow the prompts**:
   - The tool will guide you through the repair process.

## Support

If you encounter any issues or have questions, feel free to open an issue on the GitHub repository.

## License

This project is licensed under the MIT License.

---

**Note**: Always create a system restore point before running any repair tools. Use this tool at your own risk and use ONLY the release tool. **AND** if this tool doesnt work, than the only option for you, is to reset your Windows.
