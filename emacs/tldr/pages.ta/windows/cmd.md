# cmd

> விண்டோஸ் கட்டளை மொழிபெயர்ப்பாளர்.
> மேலும் விவரத்திற்கு: <https://learn.microsoft.com/windows-server/administration/windows-commands/cmd>.

- ஊடாடக்கூடிய ஷெல் அமர்வைத் தொடங்கவும்:

`cmd`

- குறிப்பிட்ட கட்டளையை இயக்கவும்:

`cmd /c {{echo வணக்கம் உலகம்}}`

- ஒரு குறிப்பிட்ட ஸ்கிரிப்டை இயக்கவும்:

`cmd {{ஸ்கிரிப்ட்.bat\பாதை}}`

- குறிப்பிட்ட கட்டளையை இயக்கவும், பின்னர் ஒரு ஊடாடும் ஷெல்லை உள்ளிடவும்:

`cmd /k {{echo வணக்கம் உலகம்}}`

- கட்டளை வெளியீட்டில் `echo` முடக்கப்பட்டிருக்கும் ஊடாடும் ஷெல் அமர்வைத் தொடங்கவும்:

`cmd /q`

- தாமதமான மாறி விரிவாக்கம் இயக்கப்பட்ட அல்லது முடக்கப்பட்ட ஒரு ஊடாடும் ஷெல் அமர்வைத் தொடங்கவும்:

`cmd /v:{{on|off}}`

- கட்டளை நீட்டிப்புகள் இயக்கப்பட்ட அல்லது முடக்கப்பட்ட ஒரு ஊடாடும் ஷெல் அமர்வைத் தொடங்கவும்:

`cmd /e:{{on|off}}`

- யூனிகோட் குறியாக்கத்தைப் பயன்படுத்தி ஊடாடும் ஷெல் அமர்வைத் தொடங்கவும்:

`cmd /u`