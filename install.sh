#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Array of installation scripts
scripts=(
    "docker.sh"
    "alacritty.sh"
    "openvpn.sh"
    "zoxide.sh"
    "tmux.sh"
    "gcloud.sh"
    "script.sh"
)

# Track results
successful=()
failed=()

# Execute each script
for script in "${scripts[@]}"; do
    script_path="${SCRIPT_DIR}/${script}"
    
    if [ ! -f "$script_path" ]; then
        echo "Warning: Script $script not found, skipping..."
        failed+=("$script")
        continue
    fi
    
    echo "========================================="
    echo "Running $script..."
    echo "========================================="
    
    # Execute the script and capture the exit code
    if bash "$script_path"; then
        echo "✓ $script completed successfully"
        successful+=("$script")
    else
        echo "✗ $script failed or exited early"
        failed+=("$script")
    fi
    echo ""
done

# Print summary
echo "========================================="
echo "Installation Summary"
echo "========================================="
if [ ${#successful[@]} -gt 0 ]; then
    echo ""
    echo "Successful: ${#successful[@]}"
    for script in "${successful[@]}"; do
        echo "  ✓ $script"
    done
fi

if [ ${#failed[@]} -gt 0 ]; then
    echo ""
    echo "Failed/Skipped: ${#failed[@]}"
    for script in "${failed[@]}"; do
        echo "  ✗ $script"
    done
fi
