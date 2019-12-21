OPEN "resources\db\countrycode.jdb" FOR INPUT AS #1
FOR country = 1 TO NumOfCountryCode
    FOR countrydata = 1 TO NumOfCountryCodeData
        LINE INPUT #1, countrycodes$(country, countrydata)
NEXT countrydata, country
CLOSE #1
OPEN "resources\db\element.jdb" FOR INPUT AS #1
FOR element = 1 TO NumOfElement
    FOR elementdata = 1 TO NumOfElementData
        LINE INPUT #1, elements$(element, elementdata)
NEXT elementdata, element
CLOSE #1
OPEN "resources\db\event.jdb" FOR INPUT AS #1
FOR eventget = 1 TO eventnum
    FOR eventdata = 1 TO 3
        LINE INPUT #1, events$(eventget, eventdata)
NEXT eventdata, eventget
CLOSE #1
OPEN "resources\db\languagecode.jdb" FOR INPUT AS #1
FOR language = 1 TO NumOfLanguageCode
    FOR languagedata = 1 TO NumOfLanguageCodeData
        LINE INPUT #1, languagecodes$(language, languagedata)
NEXT languagedata, language
CLOSE #1
OPEN "resources\db\lexicon.jdb" FOR INPUT AS #1
FOR lex = 1 TO NumOfLexicon
    LINE INPUT #1, lex$(lex)
NEXT lex
CLOSE #1