
FORMATOS = [["N/A","Elegir Formato"],
            ["TS","DVD TS"],
            ["ISO","DVD ISO"],
            ["MKV","MKV"],
            ["AVI","AVI"],
            ["MP4","MP4"],
            ["VHS","VHS"]]

MEDIAS = [["N/A","Elegir Medio"],
          ["DVDGR","DVD Gr"],
          ["DVDCH","DVD Ch"],
          ["DSK01","QNAP"],
          ["VHS","VHS"]]

DECADAS = [["0000~1939","Anterior a 1940"],
           ["1940~1949","Decada 1940"],
           ["1950~1959","Decada 1950"],
           ["1960~1969","Decada 1960"],
           ["1970~1979","Decada 1970"],
           ["1980~1989","Decada 1980"],
           ["1990~1999","Decada 1990"],
           ["2000~2009","Decada 2000"],
           ["2010~9999","Decada 2010"]]

COLECCIONES = [["OMP","Oscar Mejor Película"],
			   ["OPE","Oscar Película Extranjera"],
               ["T250","Top 250 IMDB"],
			   ["007","James Bond 007"]]


ISO_COUNTRIES = [{"name":"Afghanistan","alpha-2":"AF","country-code":"004"},
				 {"name":"Åland Islands","alpha-2":"AX","country-code":"248"},
				 {"name":"Albania","alpha-2":"AL","country-code":"008"},
				 {"name":"Algeria","alpha-2":"DZ","country-code":"012"},
				 {"name":"American Samoa","alpha-2":"AS","country-code":"016"},
				 {"name":"Andorra","alpha-2":"AD","country-code":"020"},
				 {"name":"Angola","alpha-2":"AO","country-code":"024"},
				 {"name":"Anguilla","alpha-2":"AI","country-code":"660"},
				 {"name":"Antarctica","alpha-2":"AQ","country-code":"010"},
				 {"name":"Antigua and Barbuda","alpha-2":"AG","country-code":"028"},
				 {"name":"Argentina","alpha-2":"AR","country-code":"032"},
				 {"name":"Armenia","alpha-2":"AM","country-code":"051"},
				 {"name":"Aruba","alpha-2":"AW","country-code":"533"},
				 {"name":"Australia","alpha-2":"AU","country-code":"036"},
				 {"name":"Austria","alpha-2":"AT","country-code":"040"},
				 {"name":"Azerbaijan","alpha-2":"AZ","country-code":"031"},
				 {"name":"Bahamas","alpha-2":"BS","country-code":"044"},
				 {"name":"Bahrain","alpha-2":"BH","country-code":"048"},
				 {"name":"Bangladesh","alpha-2":"BD","country-code":"050"},
				 {"name":"Barbados","alpha-2":"BB","country-code":"052"},
				 {"name":"Belarus","alpha-2":"BY","country-code":"112"},
				 {"name":"Belgium","alpha-2":"BE","country-code":"056"},
				 {"name":"Belize","alpha-2":"BZ","country-code":"084"},
				 {"name":"Benin","alpha-2":"BJ","country-code":"204"},
				 {"name":"Bermuda","alpha-2":"BM","country-code":"060"},
				 {"name":"Bhutan","alpha-2":"BT","country-code":"064"},
				 {"name":"Bolivia (Plurinational State of)","alpha-2":"BO","country-code":"068"},
				 {"name":"Bonaire, Sint Eustatius and Saba","alpha-2":"BQ","country-code":"535"},
				 {"name":"Bosnia and Herzegovina","alpha-2":"BA","country-code":"070"},
				 {"name":"Botswana","alpha-2":"BW","country-code":"072"},
				 {"name":"Bouvet Island","alpha-2":"BV","country-code":"074"},
				 {"name":"Brazil","alpha-2":"BR","country-code":"076"},
				 {"name":"British Indian Ocean Territory","alpha-2":"IO","country-code":"086"},
				 {"name":"Brunei Darussalam","alpha-2":"BN","country-code":"096"},
				 {"name":"Bulgaria","alpha-2":"BG","country-code":"100"},
				 {"name":"Burkina Faso","alpha-2":"BF","country-code":"854"},
				 {"name":"Burundi","alpha-2":"BI","country-code":"108"},
				 {"name":"Cabo Verde","alpha-2":"CV","country-code":"132"},
				 {"name":"Cambodia","alpha-2":"KH","country-code":"116"},
				 {"name":"Cameroon","alpha-2":"CM","country-code":"120"},
				 {"name":"Canada","alpha-2":"CA","country-code":"124"},
				 {"name":"Cayman Islands","alpha-2":"KY","country-code":"136"},
				 {"name":"Central African Republic","alpha-2":"CF","country-code":"140"},
				 {"name":"Chad","alpha-2":"TD","country-code":"148"},
				 {"name":"Chile","alpha-2":"CL","country-code":"152"},
				 {"name":"China","alpha-2":"CN","country-code":"156"},
				 {"name":"Christmas Island","alpha-2":"CX","country-code":"162"},
				 {"name":"Cocos (Keeling) Islands","alpha-2":"CC","country-code":"166"},
				 {"name":"Colombia","alpha-2":"CO","country-code":"170"},
				 {"name":"Comoros","alpha-2":"KM","country-code":"174"},
				 {"name":"Congo","alpha-2":"CG","country-code":"178"},
				 {"name":"Congo, Democratic Republic of the","alpha-2":"CD","country-code":"180"},
				 {"name":"Cook Islands","alpha-2":"CK","country-code":"184"},
				 {"name":"Costa Rica","alpha-2":"CR","country-code":"188"},
				 {"name":"Côte d'Ivoire","alpha-2":"CI","country-code":"384"},
				 {"name":"Croatia","alpha-2":"HR","country-code":"191"},
				 {"name":"Cuba","alpha-2":"CU","country-code":"192"},
				 {"name":"Curaçao","alpha-2":"CW","country-code":"531"},
				 {"name":"Cyprus","alpha-2":"CY","country-code":"196"},
				 {"name":"Czechia","alpha-2":"CZ","country-code":"203"},
				 {"name":"Denmark","alpha-2":"DK","country-code":"208"},
				 {"name":"Djibouti","alpha-2":"DJ","country-code":"262"},
				 {"name":"Dominica","alpha-2":"DM","country-code":"212"},
				 {"name":"Dominican Republic","alpha-2":"DO","country-code":"214"},
				 {"name":"Ecuador","alpha-2":"EC","country-code":"218"},
				 {"name":"Egypt","alpha-2":"EG","country-code":"818"},
				 {"name":"El Salvador","alpha-2":"SV","country-code":"222"},
				 {"name":"Equatorial Guinea","alpha-2":"GQ","country-code":"226"},
				 {"name":"Eritrea","alpha-2":"ER","country-code":"232"},
				 {"name":"Estonia","alpha-2":"EE","country-code":"233"},
				 {"name":"Eswatini","alpha-2":"SZ","country-code":"748"},
				 {"name":"Ethiopia","alpha-2":"ET","country-code":"231"},
				 {"name":"Falkland Islands (Malvinas)","alpha-2":"FK","country-code":"238"},
				 {"name":"Faroe Islands","alpha-2":"FO","country-code":"234"},
				 {"name":"Fiji","alpha-2":"FJ","country-code":"242"},
				 {"name":"Finland","alpha-2":"FI","country-code":"246"},
				 {"name":"France","alpha-2":"FR","country-code":"250"},
				 {"name":"French Guiana","alpha-2":"GF","country-code":"254"},
				 {"name":"French Polynesia","alpha-2":"PF","country-code":"258"},
				 {"name":"French Southern Territories","alpha-2":"TF","country-code":"260"},
				 {"name":"Gabon","alpha-2":"GA","country-code":"266"},
				 {"name":"Gambia","alpha-2":"GM","country-code":"270"},
				 {"name":"Georgia","alpha-2":"GE","country-code":"268"},
				 {"name":"Germany","alpha-2":"DE","country-code":"276"},
				 {"name":"Ghana","alpha-2":"GH","country-code":"288"},
				 {"name":"Gibraltar","alpha-2":"GI","country-code":"292"},
				 {"name":"Greece","alpha-2":"GR","country-code":"300"},
				 {"name":"Greenland","alpha-2":"GL","country-code":"304"},
				 {"name":"Grenada","alpha-2":"GD","country-code":"308"},
				 {"name":"Guadeloupe","alpha-2":"GP","country-code":"312"},
				 {"name":"Guam","alpha-2":"GU","country-code":"316"},
				 {"name":"Guatemala","alpha-2":"GT","country-code":"320"},
				 {"name":"Guernsey","alpha-2":"GG","country-code":"831"},
				 {"name":"Guinea","alpha-2":"GN","country-code":"324"},
				 {"name":"Guinea-Bissau","alpha-2":"GW","country-code":"624"},
				 {"name":"Guyana","alpha-2":"GY","country-code":"328"},
				 {"name":"Haiti","alpha-2":"HT","country-code":"332"},
				 {"name":"Heard Island and McDonald Islands","alpha-2":"HM","country-code":"334"},
				 {"name":"Holy See","alpha-2":"VA","country-code":"336"},
				 {"name":"Honduras","alpha-2":"HN","country-code":"340"},
				 {"name":"Hong Kong","alpha-2":"HK","country-code":"344"},
				 {"name":"Hungary","alpha-2":"HU","country-code":"348"},
				 {"name":"Iceland","alpha-2":"IS","country-code":"352"},
				 {"name":"India","alpha-2":"IN","country-code":"356"},
				 {"name":"Indonesia","alpha-2":"ID","country-code":"360"},
				 {"name":"Iran (Islamic Republic of)","alpha-2":"IR","country-code":"364"},
				 {"name":"Iraq","alpha-2":"IQ","country-code":"368"},
				 {"name":"Ireland","alpha-2":"IE","country-code":"372"},
				 {"name":"Isle of Man","alpha-2":"IM","country-code":"833"},
				 {"name":"Israel","alpha-2":"IL","country-code":"376"},
				 {"name":"Italy","alpha-2":"IT","country-code":"380"},
				 {"name":"Jamaica","alpha-2":"JM","country-code":"388"},
				 {"name":"Japan","alpha-2":"JP","country-code":"392"},
				 {"name":"Jersey","alpha-2":"JE","country-code":"832"},
				 {"name":"Jordan","alpha-2":"JO","country-code":"400"},
				 {"name":"Kazakhstan","alpha-2":"KZ","country-code":"398"},
				 {"name":"Kenya","alpha-2":"KE","country-code":"404"},
				 {"name":"Kiribati","alpha-2":"KI","country-code":"296"},
				 {"name":"Korea (Democratic People's Republic of)","alpha-2":"KP","country-code":"408"},
				 {"name":"Korea, Republic of","alpha-2":"KR","country-code":"410"},
				 {"name":"Kuwait","alpha-2":"KW","country-code":"414"},
				 {"name":"Kyrgyzstan","alpha-2":"KG","country-code":"417"},
				 {"name":"Lao People's Democratic Republic","alpha-2":"LA","country-code":"418"},
				 {"name":"Latvia","alpha-2":"LV","country-code":"428"},
				 {"name":"Lebanon","alpha-2":"LB","country-code":"422"},
				 {"name":"Lesotho","alpha-2":"LS","country-code":"426"},
				 {"name":"Liberia","alpha-2":"LR","country-code":"430"},
				 {"name":"Libya","alpha-2":"LY","country-code":"434"},
				 {"name":"Liechtenstein","alpha-2":"LI","country-code":"438"},
				 {"name":"Lithuania","alpha-2":"LT","country-code":"440"},
				 {"name":"Luxembourg","alpha-2":"LU","country-code":"442"},
				 {"name":"Macao","alpha-2":"MO","country-code":"446"},
				 {"name":"Madagascar","alpha-2":"MG","country-code":"450"},
				 {"name":"Malawi","alpha-2":"MW","country-code":"454"},
				 {"name":"Malaysia","alpha-2":"MY","country-code":"458"},
				 {"name":"Maldives","alpha-2":"MV","country-code":"462"},
				 {"name":"Mali","alpha-2":"ML","country-code":"466"},
				 {"name":"Malta","alpha-2":"MT","country-code":"470"},
				 {"name":"Marshall Islands","alpha-2":"MH","country-code":"584"},
				 {"name":"Martinique","alpha-2":"MQ","country-code":"474"},
				 {"name":"Mauritania","alpha-2":"MR","country-code":"478"},
				 {"name":"Mauritius","alpha-2":"MU","country-code":"480"},
				 {"name":"Mayotte","alpha-2":"YT","country-code":"175"},
				 {"name":"Mexico","alpha-2":"MX","country-code":"484"},
				 {"name":"Micronesia (Federated States of)","alpha-2":"FM","country-code":"583"},
				 {"name":"Moldova, Republic of","alpha-2":"MD","country-code":"498"},{"name":"Monaco","alpha-2":"MC","country-code":"492"},{"name":"Mongolia","alpha-2":"MN","country-code":"496"},{"name":"Montenegro","alpha-2":"ME","country-code":"499"},{"name":"Montserrat","alpha-2":"MS","country-code":"500"},{"name":"Morocco","alpha-2":"MA","country-code":"504"},{"name":"Mozambique","alpha-2":"MZ","country-code":"508"},{"name":"Myanmar","alpha-2":"MM","country-code":"104"},{"name":"Namibia","alpha-2":"NA","country-code":"516"},{"name":"Nauru","alpha-2":"NR","country-code":"520"},{"name":"Nepal","alpha-2":"NP","country-code":"524"},{"name":"Netherlands","alpha-2":"NL","country-code":"528"},{"name":"New Caledonia","alpha-2":"NC","country-code":"540"},{"name":"New Zealand","alpha-2":"NZ","country-code":"554"},{"name":"Nicaragua","alpha-2":"NI","country-code":"558"},{"name":"Niger","alpha-2":"NE","country-code":"562"},{"name":"Nigeria","alpha-2":"NG","country-code":"566"},{"name":"Niue","alpha-2":"NU","country-code":"570"},{"name":"Norfolk Island","alpha-2":"NF","country-code":"574"},{"name":"North Macedonia","alpha-2":"MK","country-code":"807"},{"name":"Northern Mariana Islands","alpha-2":"MP","country-code":"580"},{"name":"Norway","alpha-2":"NO","country-code":"578"},{"name":"Oman","alpha-2":"OM","country-code":"512"},{"name":"Pakistan","alpha-2":"PK","country-code":"586"},{"name":"Palau","alpha-2":"PW","country-code":"585"},{"name":"Palestine, State of","alpha-2":"PS","country-code":"275"},{"name":"Panama","alpha-2":"PA","country-code":"591"},{"name":"Papua New Guinea","alpha-2":"PG","country-code":"598"},{"name":"Paraguay","alpha-2":"PY","country-code":"600"},{"name":"Peru","alpha-2":"PE","country-code":"604"},{"name":"Philippines","alpha-2":"PH","country-code":"608"},{"name":"Pitcairn","alpha-2":"PN","country-code":"612"},{"name":"Poland","alpha-2":"PL","country-code":"616"},{"name":"Portugal","alpha-2":"PT","country-code":"620"},{"name":"Puerto Rico","alpha-2":"PR","country-code":"630"},{"name":"Qatar","alpha-2":"QA","country-code":"634"},{"name":"Réunion","alpha-2":"RE","country-code":"638"},{"name":"Romania","alpha-2":"RO","country-code":"642"},{"name":"Russian Federation","alpha-2":"RU","country-code":"643"},{"name":"Rwanda","alpha-2":"RW","country-code":"646"},{"name":"Saint Barthélemy","alpha-2":"BL","country-code":"652"},{"name":"Saint Helena, Ascension and Tristan da Cunha","alpha-2":"SH","country-code":"654"},{"name":"Saint Kitts and Nevis","alpha-2":"KN","country-code":"659"},{"name":"Saint Lucia","alpha-2":"LC","country-code":"662"},{"name":"Saint Martin (French part)","alpha-2":"MF","country-code":"663"},{"name":"Saint Pierre and Miquelon","alpha-2":"PM","country-code":"666"},{"name":"Saint Vincent and the Grenadines","alpha-2":"VC","country-code":"670"},{"name":"Samoa","alpha-2":"WS","country-code":"882"},{"name":"San Marino","alpha-2":"SM","country-code":"674"},{"name":"Sao Tome and Principe","alpha-2":"ST","country-code":"678"},{"name":"Saudi Arabia","alpha-2":"SA","country-code":"682"},{"name":"Senegal","alpha-2":"SN","country-code":"686"},{"name":"Serbia","alpha-2":"RS","country-code":"688"},{"name":"Seychelles","alpha-2":"SC","country-code":"690"},{"name":"Sierra Leone","alpha-2":"SL","country-code":"694"},{"name":"Singapore","alpha-2":"SG","country-code":"702"},{"name":"Sint Maarten (Dutch part)","alpha-2":"SX","country-code":"534"},{"name":"Slovakia","alpha-2":"SK","country-code":"703"},{"name":"Slovenia","alpha-2":"SI","country-code":"705"},{"name":"Solomon Islands","alpha-2":"SB","country-code":"090"},{"name":"Somalia","alpha-2":"SO","country-code":"706"},{"name":"South Africa","alpha-2":"ZA","country-code":"710"},{"name":"South Georgia and the South Sandwich Islands","alpha-2":"GS","country-code":"239"},{"name":"South Sudan","alpha-2":"SS","country-code":"728"},{"name":"Spain","alpha-2":"ES","country-code":"724"},{"name":"Sri Lanka","alpha-2":"LK","country-code":"144"},{"name":"Sudan","alpha-2":"SD","country-code":"729"},{"name":"Suriname","alpha-2":"SR","country-code":"740"},{"name":"Svalbard and Jan Mayen","alpha-2":"SJ","country-code":"744"},{"name":"Sweden","alpha-2":"SE","country-code":"752"},{"name":"Switzerland","alpha-2":"CH","country-code":"756"},{"name":"Syrian Arab Republic","alpha-2":"SY","country-code":"760"},{"name":"Taiwan, Province of China","alpha-2":"TW","country-code":"158"},{"name":"Tajikistan","alpha-2":"TJ","country-code":"762"},{"name":"Tanzania, United Republic of","alpha-2":"TZ","country-code":"834"},{"name":"Thailand","alpha-2":"TH","country-code":"764"},{"name":"Timor-Leste","alpha-2":"TL","country-code":"626"},{"name":"Togo","alpha-2":"TG","country-code":"768"},{"name":"Tokelau","alpha-2":"TK","country-code":"772"},{"name":"Tonga","alpha-2":"TO","country-code":"776"},{"name":"Trinidad and Tobago","alpha-2":"TT","country-code":"780"},{"name":"Tunisia","alpha-2":"TN","country-code":"788"},{"name":"Turkey","alpha-2":"TR","country-code":"792"},{"name":"Turkmenistan","alpha-2":"TM","country-code":"795"},{"name":"Turks and Caicos Islands","alpha-2":"TC","country-code":"796"},{"name":"Tuvalu","alpha-2":"TV","country-code":"798"},{"name":"Uganda","alpha-2":"UG","country-code":"800"},{"name":"Ukraine","alpha-2":"UA","country-code":"804"},{"name":"United Arab Emirates","alpha-2":"AE","country-code":"784"},{"name":"United Kingdom of Great Britain and Northern Ireland","alpha-2":"GB","country-code":"826"},{"name":"United States of America","alpha-2":"US","country-code":"840"},{"name":"United States Minor Outlying Islands","alpha-2":"UM","country-code":"581"},{"name":"Uruguay","alpha-2":"UY","country-code":"858"},{"name":"Uzbekistan","alpha-2":"UZ","country-code":"860"},{"name":"Vanuatu","alpha-2":"VU","country-code":"548"},{"name":"Venezuela (Bolivarian Republic of)","alpha-2":"VE","country-code":"862"},{"name":"Viet Nam","alpha-2":"VN","country-code":"704"},{"name":"Virgin Islands (British)","alpha-2":"VG","country-code":"092"},{"name":"Virgin Islands (U.S.)","alpha-2":"VI","country-code":"850"},{"name":"Wallis and Futuna","alpha-2":"WF","country-code":"876"},{"name":"Western Sahara","alpha-2":"EH","country-code":"732"},{"name":"Yemen","alpha-2":"YE","country-code":"887"},{"name":"Zambia","alpha-2":"ZM","country-code":"894"},{"name":"Zimbabwe","alpha-2":"ZW","country-code":"716"}]

ISO_LANGUAJES = {
    "ab":{
        "name":"Abkhaz",
        "nativeName":"аҧсуа"
    },
    "aa":{
        "name":"Afar",
        "nativeName":"Afaraf"
    },
    "af":{
        "name":"Afrikaans",
        "nativeName":"Afrikaans"
    },
    "ak":{
        "name":"Akan",
        "nativeName":"Akan"
    },
    "sq":{
        "name":"Albanian",
        "nativeName":"Shqip"
    },
    "am":{
        "name":"Amharic",
        "nativeName":"አማርኛ"
    },
    "ar":{
        "name":"Arabic",
        "nativeName":"العربية"
    },
    "an":{
        "name":"Aragonese",
        "nativeName":"Aragonés"
    },
    "hy":{
        "name":"Armenian",
        "nativeName":"Հայերեն"
    },
    "as":{
        "name":"Assamese",
        "nativeName":"অসমীয়া"
    },
    "av":{
        "name":"Avaric",
        "nativeName":"авар мацӀ, магӀарул мацӀ"
    },
    "ae":{
        "name":"Avestan",
        "nativeName":"avesta"
    },
    "ay":{
        "name":"Aymara",
        "nativeName":"aymar aru"
    },
    "az":{
        "name":"Azerbaijani",
        "nativeName":"azərbaycan dili"
    },
    "bm":{
        "name":"Bambara",
        "nativeName":"bamanankan"
    },
    "ba":{
        "name":"Bashkir",
        "nativeName":"башҡорт теле"
    },
    "eu":{
        "name":"Basque",
        "nativeName":"euskara, euskera"
    },
    "be":{
        "name":"Belarusian",
        "nativeName":"Беларуская"
    },
    "bn":{
        "name":"Bengali",
        "nativeName":"বাংলা"
    },
    "bh":{
        "name":"Bihari",
        "nativeName":"भोजपुरी"
    },
    "bi":{
        "name":"Bislama",
        "nativeName":"Bislama"
    },
    "bs":{
        "name":"Bosnian",
        "nativeName":"bosanski jezik"
    },
    "br":{
        "name":"Breton",
        "nativeName":"brezhoneg"
    },
    "bg":{
        "name":"Bulgarian",
        "nativeName":"български език"
    },
    "my":{
        "name":"Burmese",
        "nativeName":"ဗမာစာ"
    },
    "ca":{
        "name":"Catalan, Valencian",
        "nativeName":"Català"
    },
    "ch":{
        "name":"Chamorro",
        "nativeName":"Chamoru"
    },
    "ce":{
        "name":"Chechen",
        "nativeName":"нохчийн мотт"
    },
    "ny":{
        "name":"Chichewa, Chewa, Nyanja",
        "nativeName":"chiCheŵa, chinyanja"
    },
    "zh":{
        "name":"Chinese",
        "nativeName":"中文 (Zhōngwén), 汉语, 漢語"
    },
    "cv":{
        "name":"Chuvash",
        "nativeName":"чӑваш чӗлхи"
    },
    "kw":{
        "name":"Cornish",
        "nativeName":"Kernewek"
    },
    "co":{
        "name":"Corsican",
        "nativeName":"corsu, lingua corsa"
    },
    "cr":{
        "name":"Cree",
        "nativeName":"ᓀᐦᐃᔭᐍᐏᐣ"
    },
    "hr":{
        "name":"Croatian",
        "nativeName":"hrvatski"
    },
    "cs":{
        "name":"Czech",
        "nativeName":"česky, čeština"
    },
    "da":{
        "name":"Danish",
        "nativeName":"dansk"
    },
    "dv":{
        "name":"Divehi, Dhivehi, Maldivian,",
        "nativeName":"ދިވެހި"
    },
    "nl":{
        "name":"Dutch",
        "nativeName":"Nederlands, Vlaams"
    },
    "en":{
        "name":"English",
        "nativeName":"English"
    },
    "eo":{
        "name":"Esperanto",
        "nativeName":"Esperanto"
    },
    "et":{
        "name":"Estonian",
        "nativeName":"eesti, eesti keel"
    },
    "ee":{
        "name":"Ewe",
        "nativeName":"Eʋegbe"
    },
    "fo":{
        "name":"Faroese",
        "nativeName":"føroyskt"
    },
    "fj":{
        "name":"Fijian",
        "nativeName":"vosa Vakaviti"
    },
    "fi":{
        "name":"Finnish",
        "nativeName":"suomi, suomen kieli"
    },
    "fr":{
        "name":"French",
        "nativeName":"français, langue française"
    },
    "ff":{
        "name":"Fula, Fulah, Pulaar, Pular",
        "nativeName":"Fulfulde, Pulaar, Pular"
    },
    "gl":{
        "name":"Galician",
        "nativeName":"Galego"
    },
    "ka":{
        "name":"Georgian",
        "nativeName":"ქართული"
    },
    "de":{
        "name":"German",
        "nativeName":"Deutsch"
    },
    "el":{
        "name":"Greek, Modern",
        "nativeName":"Ελληνικά"
    },
    "gn":{
        "name":"Guaraní",
        "nativeName":"Avañeẽ"
    },
    "gu":{
        "name":"Gujarati",
        "nativeName":"ગુજરાતી"
    },
    "ht":{
        "name":"Haitian, Haitian Creole",
        "nativeName":"Kreyòl ayisyen"
    },
    "ha":{
        "name":"Hausa",
        "nativeName":"Hausa, هَوُسَ"
    },
    "he":{
        "name":"Hebrew",
        "nativeName":"עברית"
    },
    "iw":{
        "name":"Hebrew",
        "nativeName":"עברית"
    },
    "hz":{
        "name":"Herero",
        "nativeName":"Otjiherero"
    },
    "hi":{
        "name":"Hindi",
        "nativeName":"हिन्दी, हिंदी"
    },
    "ho":{
        "name":"Hiri Motu",
        "nativeName":"Hiri Motu"
    },
    "hu":{
        "name":"Hungarian",
        "nativeName":"Magyar"
    },
    "ia":{
        "name":"Interlingua",
        "nativeName":"Interlingua"
    },
    "id":{
        "name":"Indonesian",
        "nativeName":"Bahasa Indonesia"
    },
    "ie":{
        "name":"Interlingue",
        "nativeName":"Originally called Occidental; then Interlingue after WWII"
    },
    "ga":{
        "name":"Irish",
        "nativeName":"Gaeilge"
    },
    "ig":{
        "name":"Igbo",
        "nativeName":"Asụsụ Igbo"
    },
    "ik":{
        "name":"Inupiaq",
        "nativeName":"Iñupiaq, Iñupiatun"
    },
    "io":{
        "name":"Ido",
        "nativeName":"Ido"
    },
    "is":{
        "name":"Icelandic",
        "nativeName":"Íslenska"
    },
    "it":{
        "name":"Italian",
        "nativeName":"Italiano"
    },
    "iu":{
        "name":"Inuktitut",
        "nativeName":"ᐃᓄᒃᑎᑐᑦ"
    },
    "ja":{
        "name":"Japanese",
        "nativeName":"日本語 (にほんご／にっぽんご)"
    },
    "jv":{
        "name":"Javanese",
        "nativeName":"basa Jawa"
    },
    "kl":{
        "name":"Kalaallisut, Greenlandic",
        "nativeName":"kalaallisut, kalaallit oqaasii"
    },
    "kn":{
        "name":"Kannada",
        "nativeName":"ಕನ್ನಡ"
    },
    "kr":{
        "name":"Kanuri",
        "nativeName":"Kanuri"
    },
    "ks":{
        "name":"Kashmiri",
        "nativeName":"कश्मीरी, كشميري‎"
    },
    "kk":{
        "name":"Kazakh",
        "nativeName":"Қазақ тілі"
    },
    "km":{
        "name":"Khmer",
        "nativeName":"ភាសាខ្មែរ"
    },
    "ki":{
        "name":"Kikuyu, Gikuyu",
        "nativeName":"Gĩkũyũ"
    },
    "rw":{
        "name":"Kinyarwanda",
        "nativeName":"Ikinyarwanda"
    },
    "ky":{
        "name":"Kirghiz, Kyrgyz",
        "nativeName":"кыргыз тили"
    },
    "kv":{
        "name":"Komi",
        "nativeName":"коми кыв"
    },
    "kg":{
        "name":"Kongo",
        "nativeName":"KiKongo"
    },
    "ko":{
        "name":"Korean",
        "nativeName":"한국어 (韓國語), 조선말 (朝鮮語)"
    },
    "ku":{
        "name":"Kurdish",
        "nativeName":"Kurdî, كوردی‎"
    },
    "kj":{
        "name":"Kwanyama, Kuanyama",
        "nativeName":"Kuanyama"
    },
    "la":{
        "name":"Latin",
        "nativeName":"latine, lingua latina"
    },
    "lb":{
        "name":"Luxembourgish, Letzeburgesch",
        "nativeName":"Lëtzebuergesch"
    },
    "lg":{
        "name":"Luganda",
        "nativeName":"Luganda"
    },
    "li":{
        "name":"Limburgish, Limburgan, Limburger",
        "nativeName":"Limburgs"
    },
    "ln":{
        "name":"Lingala",
        "nativeName":"Lingála"
    },
    "lo":{
        "name":"Lao",
        "nativeName":"ພາສາລາວ"
    },
    "lt":{
        "name":"Lithuanian",
        "nativeName":"lietuvių kalba"
    },
    "lu":{
        "name":"Luba-Katanga",
        "nativeName":""
    },
    "lv":{
        "name":"Latvian",
        "nativeName":"latviešu valoda"
    },
    "gv":{
        "name":"Manx",
        "nativeName":"Gaelg, Gailck"
    },
    "mk":{
        "name":"Macedonian",
        "nativeName":"македонски јазик"
    },
    "mg":{
        "name":"Malagasy",
        "nativeName":"Malagasy fiteny"
    },
    "ms":{
        "name":"Malay",
        "nativeName":"bahasa Melayu, بهاس ملايو‎"
    },
    "ml":{
        "name":"Malayalam",
        "nativeName":"മലയാളം"
    },
    "mt":{
        "name":"Maltese",
        "nativeName":"Malti"
    },
    "mi":{
        "name":"Māori",
        "nativeName":"te reo Māori"
    },
    "mr":{
        "name":"Marathi (Marāṭhī)",
        "nativeName":"मराठी"
    },
    "mh":{
        "name":"Marshallese",
        "nativeName":"Kajin M̧ajeļ"
    },
    "mn":{
        "name":"Mongolian",
        "nativeName":"монгол"
    },
    "na":{
        "name":"Nauru",
        "nativeName":"Ekakairũ Naoero"
    },
    "nv":{
        "name":"Navajo, Navaho",
        "nativeName":"Diné bizaad, Dinékʼehǰí"
    },
    "nb":{
        "name":"Norwegian Bokmål",
        "nativeName":"Norsk bokmål"
    },
    "nd":{
        "name":"North Ndebele",
        "nativeName":"isiNdebele"
    },
    "ne":{
        "name":"Nepali",
        "nativeName":"नेपाली"
    },
    "ng":{
        "name":"Ndonga",
        "nativeName":"Owambo"
    },
    "nn":{
        "name":"Norwegian Nynorsk",
        "nativeName":"Norsk nynorsk"
    },
    "no":{
        "name":"Norwegian",
        "nativeName":"Norsk"
    },
    "ii":{
        "name":"Nuosu",
        "nativeName":"ꆈꌠ꒿ Nuosuhxop"
    },
    "nr":{
        "name":"South Ndebele",
        "nativeName":"isiNdebele"
    },
    "oc":{
        "name":"Occitan",
        "nativeName":"Occitan"
    },
    "oj":{
        "name":"Ojibwe, Ojibwa",
        "nativeName":"ᐊᓂᔑᓈᐯᒧᐎᓐ"
    },
    "cu":{
        "name":"Old Church Slavonic, Church Slavic, Church Slavonic, Old Bulgarian, Old Slavonic",
        "nativeName":"ѩзыкъ словѣньскъ"
    },
    "om":{
        "name":"Oromo",
        "nativeName":"Afaan Oromoo"
    },
    "or":{
        "name":"Oriya",
        "nativeName":"ଓଡ଼ିଆ"
    },
    "os":{
        "name":"Ossetian, Ossetic",
        "nativeName":"ирон æвзаг"
    },
    "pa":{
        "name":"Panjabi, Punjabi",
        "nativeName":"ਪੰਜਾਬੀ, پنجابی‎"
    },
    "pi":{
        "name":"Pāli",
        "nativeName":"पाऴि"
    },
    "fa":{
        "name":"Persian",
        "nativeName":"فارسی"
    },
    "pl":{
        "name":"Polish",
        "nativeName":"polski"
    },
    "ps":{
        "name":"Pashto, Pushto",
        "nativeName":"پښتو"
    },
    "pt":{
        "name":"Portuguese",
        "nativeName":"Português"
    },
    "qu":{
        "name":"Quechua",
        "nativeName":"Runa Simi, Kichwa"
    },
    "rm":{
        "name":"Romansh",
        "nativeName":"rumantsch grischun"
    },
    "rn":{
        "name":"Kirundi",
        "nativeName":"kiRundi"
    },
    "ro":{
        "name":"Romanian, Moldavian, Moldovan",
        "nativeName":"română"
    },
    "ru":{
        "name":"Russian",
        "nativeName":"русский язык"
    },
    "sa":{
        "name":"Sanskrit (Saṁskṛta)",
        "nativeName":"संस्कृतम्"
    },
    "sc":{
        "name":"Sardinian",
        "nativeName":"sardu"
    },
    "sd":{
        "name":"Sindhi",
        "nativeName":"सिन्धी, سنڌي، سندھی‎"
    },
    "se":{
        "name":"Northern Sami",
        "nativeName":"Davvisámegiella"
    },
    "sm":{
        "name":"Samoan",
        "nativeName":"gagana faa Samoa"
    },
    "sg":{
        "name":"Sango",
        "nativeName":"yângâ tî sängö"
    },
    "sr":{
        "name":"Serbian",
        "nativeName":"српски језик"
    },
    "gd":{
        "name":"Scottish Gaelic, Gaelic",
        "nativeName":"Gàidhlig"
    },
    "sn":{
        "name":"Shona",
        "nativeName":"chiShona"
    },
    "si":{
        "name":"Sinhala, Sinhalese",
        "nativeName":"සිංහල"
    },
    "sk":{
        "name":"Slovak",
        "nativeName":"slovenčina"
    },
    "sl":{
        "name":"Slovene",
        "nativeName":"slovenščina"
    },
    "so":{
        "name":"Somali",
        "nativeName":"Soomaaliga, af Soomaali"
    },
    "st":{
        "name":"Southern Sotho",
        "nativeName":"Sesotho"
    },
    "es":{
        "name":"Spanish, Castilian",
        "nativeName":"español, castellano"
    },
    "su":{
        "name":"Sundanese",
        "nativeName":"Basa Sunda"
    },
    "sw":{
        "name":"Swahili",
        "nativeName":"Kiswahili"
    },
    "ss":{
        "name":"Swati",
        "nativeName":"SiSwati"
    },
    "sv":{
        "name":"Swedish",
        "nativeName":"svenska"
    },
    "ta":{
        "name":"Tamil",
        "nativeName":"தமிழ்"
    },
    "te":{
        "name":"Telugu",
        "nativeName":"తెలుగు"
    },
    "tg":{
        "name":"Tajik",
        "nativeName":"тоҷикӣ, toğikī, تاجیکی‎"
    },
    "th":{
        "name":"Thai",
        "nativeName":"ไทย"
    },
    "ti":{
        "name":"Tigrinya",
        "nativeName":"ትግርኛ"
    },
    "bo":{
        "name":"Tibetan Standard, Tibetan, Central",
        "nativeName":"བོད་ཡིག"
    },
    "tk":{
        "name":"Turkmen",
        "nativeName":"Türkmen, Түркмен"
    },
    "tl":{
        "name":"Tagalog",
        "nativeName":"Wikang Tagalog, ᜏᜒᜃᜅ᜔ ᜆᜄᜎᜓᜄ᜔"
    },
    "tn":{
        "name":"Tswana",
        "nativeName":"Setswana"
    },
    "to":{
        "name":"Tonga (Tonga Islands)",
        "nativeName":"faka Tonga"
    },
    "tr":{
        "name":"Turkish",
        "nativeName":"Türkçe"
    },
    "ts":{
        "name":"Tsonga",
        "nativeName":"Xitsonga"
    },
    "tt":{
        "name":"Tatar",
        "nativeName":"татарча, tatarça, تاتارچا‎"
    },
    "tw":{
        "name":"Twi",
        "nativeName":"Twi"
    },
    "ty":{
        "name":"Tahitian",
        "nativeName":"Reo Tahiti"
    },
    "ug":{
        "name":"Uighur, Uyghur",
        "nativeName":"Uyƣurqə, ئۇيغۇرچە‎"
    },
    "uk":{
        "name":"Ukrainian",
        "nativeName":"українська"
    },
    "ur":{
        "name":"Urdu",
        "nativeName":"اردو"
    },
    "uz":{
        "name":"Uzbek",
        "nativeName":"zbek, Ўзбек, أۇزبېك‎"
    },
    "ve":{
        "name":"Venda",
        "nativeName":"Tshivenḓa"
    },
    "vi":{
        "name":"Vietnamese",
        "nativeName":"Tiếng Việt"
    },
    "vo":{
        "name":"Volapük",
        "nativeName":"Volapük"
    },
    "wa":{
        "name":"Walloon",
        "nativeName":"Walon"
    },
    "cy":{
        "name":"Welsh",
        "nativeName":"Cymraeg"
    },
    "wo":{
        "name":"Wolof",
        "nativeName":"Wollof"
    },
    "fy":{
        "name":"Western Frisian",
        "nativeName":"Frysk"
    },
    "xh":{
        "name":"Xhosa",
        "nativeName":"isiXhosa"
    },
    "yi":{
        "name":"Yiddish",
        "nativeName":"ייִדיש"
    },
    "yo":{
        "name":"Yoruba",
        "nativeName":"Yorùbá"
    },
    "za":{
        "name":"Zhuang, Chuang",
        "nativeName":"Saɯ cueŋƅ, Saw cuengh"
    }
}

