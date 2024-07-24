# cmstp

> இணைப்பு சேவை சுயவிவரங்களை நிர்வகிப்பதற்கான கட்டளை வரி கருவி.
> மேலும் விவரத்திற்கு: <https://learn.microsoft.com/windows-server/administration/windows-commands/cmstp>.

- ஒரு குறிப்பிட்ட சுயவிவரத்தை நிறுவவும்:

`cmstp "{{சுயவிவரம்\பாதை}}"`

- டெஸ்க்டாப் குறுக்குவழியை உருவாக்காமல் நிறுவவும்:

`cmstp /ns "{{சுயவிவரம்\பாதை}}"`

- சார்புகளை சரிபார்க்காமல் நிறுவவும்:

`cmstp /nf "{{சுயவிவரம்\பாதை}}"`

- தற்போதைய பயனருக்கு மட்டும் நிறுவவும்:

`cmstp /su "{{சுயவிவரம்\பாதை}}"`

- அனைத்து பயனர்களுக்கும் நிறுவவும் (நிர்வாக சலுகைகள் தேவை):

`cmstp /au "{{சுயவிவரம்\பாதை}}"`

- எந்த அறிவுறுத்தலும் இல்லாமல் அமைதியாக நிறுவவும்:

`cmstp /s "{{சுயவிவரம்\பாதை}}"`

- குறிப்பிட்ட சுயவிவரத்தை நிறுவல் நீக்கவும்:

`cmstp /u "{{சுயவிவரம்\பாதை}}"`

- உறுதிப்படுத்தல் அறிவுறுத்தல் இல்லாமல் அமைதியாக நிறுவல் நீக்கவும்:

`cmstp /u /s "{{சுயவிவரம்\பாதை}}"`