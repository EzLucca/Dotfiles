# sha512sum

> SHA512 மறையீட்டு சரிகாண்தொகையைக் கணி.
> மேலும் விவரத்திற்கு: <https://www.gnu.org/software/coreutils/manual/html_node/sha2-utilities.html>.

- ஒன்று அல்லது அதற்கு மேற்பட்ட கோப்புகளுக்கான SHA512 சரிகாண்தொகையைக் கணி:

`sha512sum {{கோப்பு1/பாதை கோப்பு2/பாதை ...}}`

- SHA512 சரிகாண்தொகை பட்டியலைக் கணக்கிட்டு ஒரு கோப்பில் சேமிக்கவும்:

`sha512sum {{கோப்பு1/பாதை கோப்பு2/பாதை ...}} > {{கோப்பு.sha512/பாதை}}`

- `stdin` (இயல் உள்ளீடு) இலிருந்து SHA512 சரிகாண்தொகையை கணி:

`{{கட்டளை}} | sha512sum`

- SHA512 தொகைகள் மற்றும் கோப்புப்பெயர்களின் கோப்பைப் படித்து, எல்லாக் கோப்புகளிலும் சரிகாண்தொகைகள் பொருந்துகின்றன என்பதைச் சரிபார்க்கவும்:

`sha512sum --check {{கோப்பு.sha512/பாதை}}`

- விடுபட்ட கோப்புகள் அல்லது சரிபார்ப்பு தோல்வியுற்றால் மட்டுமே செய்தியைக் காட்டவும்:

`sha512sum --check --quiet {{கோப்பு.sha512/பாதை}}`

- சரிபார்ப்பு தோல்வியுற்றால், விடுபட்ட கோப்புகளைப் புறக்கணித்து, செய்தியை மட்டும் காட்டவும்:

`sha512sum --ignore-missing --check --quiet {{கோப்பு.sha512/பாதை}}`