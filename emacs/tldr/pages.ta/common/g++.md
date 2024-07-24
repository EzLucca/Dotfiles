# g++

> C++ மூலக் கோப்புகளைத் தொகுக்கிறது.
> GCC இன் பகுதி (GNU கம்பைலர் சேகரிப்பு).
> மேலும் விவரத்திற்கு: <https://gcc.gnu.org>.

- இயங்கக்கூடிய பைனரியில் ஒரு மூலக் குறியீடு கோப்பை தொகுக்கவும்:

`g++ {{மூலம்.cpp/பாதை}} -o {{வெளியீடு_இயங்கக்கூடியது/பாதை}}`

- அனைத்து பிழைகள் மற்றும் எச்சரிக்கைகள் (கிட்டத்தட்ட) காட்சி:

`g++ {{மூலம்.cpp/பாதை}} -Wall -o {{வெளியீடு_இயங்கக்கூடியது/பாதை}}`

- (C++98/C++11/C++14/C++17) தொகுக்க ஒரு மொழித் தரத்தைத் தேர்வு செய்யவும்:

`g++ {{மூலம்.cpp/பாதை}} -std={{c++98|c++11|c++14|c++17}} -o {{வெளியீடு_இயங்கக்கூடியது/பாதை}}`

- மூலக் கோப்பை விட வேறு பாதையில் அமைந்துள்ள நூலகங்களைச் சேர்க்கவும்:

`g++ {{மூலம்.cpp/பாதை}} -o {{வெளியீடு_இயங்கக்கூடியது/பாதை}} -I{{தலைப்பு/பாதை}} -L{{நூலகம்/பாதை}} -l{{நூலகம்_பெயர்}}`

- பல மூலக் குறியீடு கோப்புகளை ஒரு இயங்கக்கூடிய பைனரியில் தொகுத்து இணைக்கவும்:

`g++ -c {{மூலம்_1.cpp/பாதை மூலம்_2.cpp/பாதை ...}} && g++ -o {{வெளியீடு_செயல்படுத்தக்கூடியது/பாதை}} {{மூலம்_1.o/பாதை மூலம்_2.o/பாதை ...}}`

- பதிப்பைக் காட்டு:

`g++ --version`