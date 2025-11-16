# Testing Checklist for Modified Casino Games

## Pre-Testing Setup
- [ ] Copy the entire `modified_games` folder to a web server
- [ ] Ensure all MP3 files are in the same directory as HTML files
- [ ] Test on multiple devices (Desktop, iPhone, Android)

## General Tests (All Games)

### Button Positioning & Design
- [ ] Mute button appears at **TOP RIGHT** corner
- [ ] Mute button displays **♻️ (recycle icon)** - not speaker icon
- [ ] Mute button is **round** (circular shape)
- [ ] Mute button is **medium size** (60px desktop, 50px mobile)
- [ ] Restart song button appears at **TOP RIGHT**, left of mute button
- [ ] Restart song button displays **⟲ (circular arrow icon)**
- [ ] Back button remains at **BOTTOM LEFT**

### Mute Functionality
- [ ] Click mute button → opacity changes to 0.5 (dimmed)
- [ ] When muted: MP3 music stops/muted
- [ ] When muted: Synth game sounds are silenced
- [ ] Click mute again → opacity returns to 1.0 (bright)
- [ ] When unmuted: MP3 music resumes
- [ ] When unmuted: Synth game sounds work
- [ ] Mute state persists across page reloads (localStorage)
- [ ] **iPhone Safari**: Verify mute works for both MP3 and synth sounds

### Restart Song Functionality
- [ ] Click restart button → current song restarts from beginning
- [ ] Song continues playing after restart
- [ ] Works whether muted or unmuted
- [ ] Provides haptic feedback on click (mobile)

### Haptic Feedback
- [ ] All buttons provide vibration feedback on mobile devices
- [ ] Light haptic (10ms) for normal buttons
- [ ] Medium haptic (20ms) for game actions
- [ ] Heavy haptic (30-50ms) for wins/special events

### Orientation Lock
- [ ] Game opens in portrait mode
- [ ] Game stays in portrait when device is rotated (on supported devices)
- [ ] No errors if orientation lock not supported

### Synth Volume
- [ ] Game sound effects are noticeably louder than original
- [ ] Sounds are clear and not distorted
- [ ] Volume appropriate for gameplay

---

## Game-Specific Tests

### 1. Solitaire (solitaire.html)
#### Critical Fix
- [ ] **First tap/click does NOT trigger fullscreen**
- [ ] Can tap cards without entering fullscreen
- [ ] Fullscreen is never automatically activated

#### Gameplay
- [ ] Cards can be dragged and dropped normally
- [ ] Sound effects play on card moves
- [ ] Haptic feedback on card interactions
- [ ] Win screen appears when all foundations complete
- [ ] New game button works

### 2. Poker (poker.html)
#### Critical Fix - Bet Logic
- [ ] Start with default credits (100) and bet (5)
- [ ] Play several hands to reduce credits
- [ ] **When credits drop to 20 or less:**
  - [ ] Bet automatically adjusts down to match credits
  - [ ] Cannot increase bet above credits
  - [ ] Bet display updates correctly
- [ ] **When credits equal bet exactly:**
  - [ ] Can still play the hand
  - [ ] Bet doesn't exceed credits
- [ ] Game handles low-credit scenarios gracefully

#### Gameplay
- [ ] Deal button works
- [ ] Can hold/unhold cards
- [ ] Draw button works
- [ ] Payout calculations correct
- [ ] Sound effects on all actions
- [ ] Bet +/- buttons have haptic feedback

### 3. Blackjack (blackjack.html)
#### Gameplay
- [ ] Deal button starts new hand
- [ ] Hit button adds card to player hand
- [ ] Stand button triggers dealer play
- [ ] Bet +/- buttons work
- [ ] Balance updates correctly
- [ ] Sound effects on all actions
- [ ] Haptic feedback on all buttons
- [ ] Win/lose detection works

### 4. Slot Machine (slotmachine.html)
#### Gameplay
- [ ] Spin button works
- [ ] Reels spin with animation
- [ ] Bet +/- buttons work
- [ ] Credits update on win/loss
- [ ] Paytable button opens overlay
- [ ] Sound effects on spin
- [ ] Win celebrations with fireworks
- [ ] Game over screen appears when out of credits
- [ ] Haptic feedback on all interactions

### 5. Index/Lobby (index.html)
#### Navigation
- [ ] Lobby displays game selection zones
- [ ] Clicking zones opens games
- [ ] Back button returns to lobby
- [ ] Music plays in lobby
- [ ] Mute button works in lobby
- [ ] Restart song works in lobby
- [ ] Game music passes to games via localStorage

---

## iPhone-Specific Testing (Critical)

### Safari iOS
- [ ] Open each game in Safari
- [ ] Test mute button:
  - [ ] MP3 music mutes/unmutes correctly
  - [ ] Synth game sounds mute/unmutes correctly
  - [ ] Both audio types respect mute state
- [ ] Test haptic feedback (vibration)
- [ ] Test restart song button
- [ ] Verify all buttons are easily tappable
- [ ] Check button sizes are appropriate (50px)
- [ ] Test portrait orientation lock

### iOS Specific Issues to Watch For
- [ ] Audio doesn't require second tap to play
- [ ] Mute persists between games
- [ ] No console errors in Safari developer tools
- [ ] Buttons don't overlap with notch/safe areas
- [ ] Touch targets are 44x44 minimum (accessibility)

---

## Android-Specific Testing

### Chrome Android
- [ ] Open each game in Chrome
- [ ] Test all mute and restart functionality
- [ ] Verify haptic feedback works
- [ ] Test portrait orientation lock
- [ ] Check button sizing and positioning

---

## Desktop Testing

### All Major Browsers
Test in: Chrome, Firefox, Safari, Edge

For each browser:
- [ ] Open each game
- [ ] Test mute button (MP3 + synth)
- [ ] Test restart song button
- [ ] Verify button positions and sizes (60px)
- [ ] Play through each game
- [ ] Check sound effects
- [ ] Verify all gameplay functions

---

## Edge Cases

### Low Credit Scenarios (Poker)
- [ ] Credits = 1, bet = 5 → bet adjusts to 1
- [ ] Credits = 0 → cannot play
- [ ] Win with low credits → bet doesn't exceed credits after win

### Audio Edge Cases
- [ ] Mute during MP3 playback → immediately silences
- [ ] Mute during synth sound → silences immediately
- [ ] Restart song at end of track → starts over correctly
- [ ] Restart song at beginning → starts over correctly
- [ ] No audio files → no errors, mute button still works

### Fullscreen Edge Cases (Solitaire)
- [ ] First tap on any element → no fullscreen
- [ ] Multiple rapid taps → no fullscreen
- [ ] Long press → no fullscreen
- [ ] Double tap → no fullscreen

---

## Performance Testing
- [ ] Games load quickly
- [ ] No lag when clicking buttons
- [ ] Smooth animations
- [ ] No memory leaks (test extended play)
- [ ] Audio doesn't stutter or skip

---

## Accessibility Testing
- [ ] All buttons are keyboard accessible (Tab key)
- [ ] Buttons have hover states (desktop)
- [ ] Touch targets are large enough (mobile)
- [ ] Color contrast is sufficient
- [ ] Works with screen readers (bonus)

---

## Final Validation
- [ ] All original files remain untouched in `/Uploads/`
- [ ] All modified files are in `/modified_games/`
- [ ] All MP3 files are copied to `/modified_games/`
- [ ] README.md is comprehensive and accurate
- [ ] No console errors in any game
- [ ] All 8 critical requirements met
- [ ] All 2 additional enhancements implemented

---

## Sign-off

**Tester Name**: _________________________  
**Date**: _________________________  
**Device/Browser**: _________________________  

**Overall Result**: 
- [ ] PASS - All tests passed
- [ ] FAIL - Issues found (list below)

**Issues Found**:
1. 
2. 
3. 

**Notes**:


---

**Testing Status**: Ready for QA  
**Last Updated**: November 16, 2025
