#!/bin/bash

# Yggdrasil Repository Migration Script
# Reorganizes citadel-os-framework into living tree structure

echo "🌳 Starting Yggdrasil Migration..."
echo "This will reorganize your repository into ROOT/TRUNK/BRANCHES/LEAVES structure"
echo ""

# Create backup first
echo "Creating backup..."
cp -r . ../citadel-backup-$(date +%Y%m%d-%H%M%S)
echo "✓ Backup created"
echo ""

# Create main tree structure
echo "Creating tree structure..."

mkdir -p ROOT
mkdir -p TRUNK/{council-architecture,ai-logic,blade-systems,vow-protocols,core-designs/system-diagrams}
mkdir -p BRANCHES/{kintsugi-protocols,verification-systems,dissent-mechanisms,network-configuration,temporal-governance,synthesis-protocols,accountability-structures}
mkdir -p LEAVES/{daily-operations,data-processing,inspection,interfaces/assets}
mkdir -p LOGS
mkdir -p VERIFICATION/hashes

echo "✓ Directory structure created"
echo ""

# Move ROOT files
echo "Moving ROOT files..."
mv README.md ROOT/ 2>/dev/null
mv AUTHORSHIP.md ROOT/ 2>/dev/null
echo "✓ ROOT files moved"

# Move TRUNK files (blade and vow JSON files)
echo "Moving TRUNK files..."
mv *.blade.json TRUNK/blade-systems/ 2>/dev/null
mv *.vow.json TRUNK/vow-protocols/ 2>/dev/null
echo "✓ TRUNK files moved"

# Move BRANCHES files (config files)
echo "Moving BRANCHES files..."
mv *.conf BRANCHES/network-configuration/ 2>/dev/null
echo "✓ BRANCHES files moved"

# Move LEAVES files
echo "Moving LEAVES files..."
mv allowlist.txt LEAVES/daily-operations/ 2>/dev/null

# Move existing folders
if [ -d "bin" ]; then
    mv bin LEAVES/data-processing/
fi

if [ -d "chunks" ]; then
    mv chunks LEAVES/data-processing/
fi

if [ -d "inspected" ]; then
    mv inspected LEAVES/inspection/
fi

# Move all images to interfaces/assets
mv *.png LEAVES/interfaces/assets/ 2>/dev/null
mv *.webp LEAVES/interfaces/assets/ 2>/dev/null
mv *.jpg LEAVES/interfaces/assets/ 2>/dev/null
mv *.jpeg LEAVES/interfaces/assets/ 2>/dev/null

echo "✓ LEAVES files moved"

# Move all SHA256 hashes to verification
echo "Moving verification hashes..."
mv *.sha256 VERIFICATION/hashes/ 2>/dev/null
echo "✓ Verification files moved"

# Move logs if they exist
echo "Moving logs..."
if [ -d "logs" ]; then
    mv logs/* LOGS/ 2>/dev/null
    rmdir logs
fi
echo "✓ Logs moved"

# Move any remaining PDF files to appropriate location (you can adjust this)
if ls *.PDF 1> /dev/null 2>&1; then
    mkdir -p ROOT/documentation
    mv *.PDF ROOT/documentation/ 2>/dev/null
    echo "✓ PDFs moved to ROOT/documentation"
fi

echo ""
echo "🌳 Migration complete!"
echo ""
echo "Structure created:"
echo "  ROOT/        - Foundational laws and documentation"
echo "  TRUNK/       - Structural design (councils, AI logic, blades, vows)"
echo "  BRANCHES/    - Operational protocols"
echo "  LEAVES/      - Implementation and interfaces"
echo "  LOGS/        - System activity logs"
echo "  VERIFICATION/ - Integrity proofs and hashes"
echo ""
echo "⚠️  Manual review needed:"
echo "  1. Check if all files landed in correct locations"
echo "  2. Create missing ROOT documentation (core-governance.md, etc.)"
echo "  3. Review and adjust BRANCHES content"
echo "  4. Update README.md to explain tree structure"
echo ""
echo "Backup location: ../citadel-backup-[timestamp]"
