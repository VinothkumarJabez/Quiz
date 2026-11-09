Project Overview: "Which Animal Are You?"

This is a multi-screen iOS personality quiz app built using Swift and UIKit Storyboards. It takes the user through three distinct question types to calculate and display which animal best matches their personality.<img width="1179" height="2556" alt="Simulator Screen Shot - iPhone 14 Pro - 2026-11-09 at 13 56 06" src="https://github.com/user-attachments/assets/4e2b7fc9-fd18-4144-9f2f-02e192044739" />

A welcome title ("Which Animal Are You?") and a "Start Quiz" button, anchored by four animal emojis in the corners.

A single vertical UIStackView containing 4 UIButton elements.
Tapping any button records the choice and immediately advances to the next question.
<img width="1179" height="2556" alt="Simulator Screen Shot - iPhone 14 Pro - 2026-11-09 at 13 56 19" src="https://github.com/user-attachments/assets/8a475038-a478-498e-9f50-21f3a18a31b2" />


A vertical UIStackView holding 4 horizontal sub-stack views (each containing a UILabel and a UISwitch).
A "Submit" UIButton at the bottom that reads the status of all switches at once before advancing.
A UIProgressView at the bottom showing quiz progress.
<img width="1179" height="2556" alt="Simulator Screen Shot - iPhone 14 Pro - 2026-11-09 at 13 56 53" src="https://github.com/user-attachments/assets/cb50cb0a-73c3-4331-9cd5-e6367218282b" />

 
A horizontal UIStackView for the side-by-side labels.
A UISlider element mapped to a range (e.g., 0.0 to 1.0) to capture a sliding scale response.
A final "Submit Answer" UIButton that triggers the calculation logic.
<img width="1179" height="2556" alt="Simulator Screen Shot - iPhone 14 Pro - 2026-11-09 at 13 57 06" src="https://github.com/user-attachments/assets/206cd62f-c903-4919-9281-71937616917d" />

 Two UILabel objects centered vertically and horizontally.
 A "Done" navigation/dismiss button to loop back to the introduction screen.
 <img width="1179" height="2556" alt="Simulator Screen Shot - iPhone 14 Pro - 2026-11-09 at 13 57 16" src="https://github.com/user-attachments/assets/1e274aef-2cb5-4664-8be7-878211828ee9" />


