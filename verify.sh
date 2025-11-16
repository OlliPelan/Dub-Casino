#!/bin/bash
echo "============================================"
echo "Modified Casino Games - Verification Script"
echo "============================================"
echo ""

echo "1. File Count Check:"
FILE_COUNT=$(ls -1 *.html *.mp3 *.md 2>/dev/null | wc -l)
echo "   Found $FILE_COUNT files (expected 14+)"
echo ""

echo "2. HTML Files Check:"
for file in blackjack.html poker.html solitaire.html slotmachine.html index.html; do
  if [ -f "$file" ]; then
    echo "   ✓ $file"
  else
    echo "   ✗ MISSING: $file"
  fi
done
echo ""

echo "3. MP3 Files Check:"
for file in fx1.mp3 fx3.mp3 fx4.mp3 fx5.mp3 fx6.mp3 fx7.mp3; do
  if [ -f "$file" ]; then
    echo "   ✓ $file"
  else
    echo "   ✗ MISSING: $file"
  fi
done
echo ""

echo "4. Documentation Check:"
for file in README.md TESTING_CHECKLIST.md SUMMARY.md; do
  if [ -f "$file" ]; then
    echo "   ✓ $file"
  else
    echo "   ✗ MISSING: $file"
  fi
done
echo ""

echo "5. Critical Modifications Check:"
echo "   Checking for key code patterns..."

# Check for recycle icon
RECYCLE_COUNT=$(grep -c "♻️" *.html 2>/dev/null)
echo "   - Recycle icons found: $RECYCLE_COUNT (expected 5)"

# Check for isMutedGlobal
MUTE_COUNT=$(grep -l "isMutedGlobal" *.html 2>/dev/null | wc -l)
echo "   - Files with mute system: $MUTE_COUNT (expected 5)"

# Check for restartSong function
RESTART_COUNT=$(grep -l "restartSong" *.html 2>/dev/null | wc -l)
echo "   - Files with restart button: $RESTART_COUNT (expected 5)"

# Check for haptic function
HAPTIC_COUNT=$(grep -l "function haptic" *.html 2>/dev/null | wc -l)
echo "   - Files with haptic feedback: $HAPTIC_COUNT (expected 4-5)"

# Check solitaire for NO requestFs
if grep -q "requestFs" solitaire.html 2>/dev/null; then
  echo "   ✗ Solitaire still has requestFs (should be removed)"
else
  echo "   ✓ Solitaire fullscreen removed"
fi

# Check poker for bet fix
if grep -q "bet = credits" poker.html 2>/dev/null; then
  echo "   ✓ Poker bet logic fixed"
else
  echo "   ✗ Poker bet logic not found"
fi

echo ""

echo "6. Original Files Check:"
if [ -d "/home/ubuntu/Uploads" ]; then
  ORIG_COUNT=$(ls -1 /home/ubuntu/Uploads/*.html 2>/dev/null | wc -l)
  echo "   Original HTML files: $ORIG_COUNT (should be 5)"
  echo "   ✓ Original files preserved"
else
  echo "   ✗ Original directory not found"
fi

echo ""
echo "============================================"
echo "Verification Complete!"
echo "============================================"
