CONST DICTDIR = "\dict"
CONST DEFAULTPATH = "resources\\WordNet\\2.1\\dict"
CONST DATAFILE = "%s\data.%s"
CONST INDEXFILE = "%s\index.%s"
CONST SENSEIDXFILE = "%s\index.sense"
CONST KEYIDXFILE = "%s\index.key"
CONST REVKEYIDXFILE = "%s\index.key.rev"
CONST VRBSENTFILE = "%s\sents.vrb"
CONST VRBIDXFILE = "%s\sentidx.vrb"
CONST CNTLISTFILE = "%s\cntlist.rev"
CONST SEARCHBUF = (200& * 1024)
CONST LINEBUF = (15 * 1024)
CONST SMLINEBUF = (3 * 1024)
CONST WORDBUF = 256
CONST ALLSENSES = 0
CONST MAXID = 1
CONST MAXDEPTH = 20
CONST MAXSENSE = 75
CONST MAX_FORMS = 5
CONST MAXFNUM = 44
CONST ANTPTR = 1
CONST HYPERPTR = 2
CONST HYPOPTR = 3
CONST ENTAILPTR = 4
CONST SIMPTR = 5
CONST ISMEMBERPTR = 6
CONST ISSTUFFPTR = 7
CONST ISPARTPTR = 8
CONST HASMEMBERPTR = 9
CONST HASSTUFFPTR = 10
CONST HASPARTPTR = 11
CONST MERONYM = 12
CONST HOLONYM = 13
CONST CAUSETO = 14
CONST PPLPTR = 15
CONST SEEALSOPTR = 16
CONST PERTPTR = 17
CONST ATTRIBUTE = 18
CONST VERBGROUP = 19
CONST DERIVATION = 20
CONST CLASSIFICATION = 21
CONST CLASS = 22
CONST LASTTYPE = CLASS
CONST SYNS = (LASTTYPE + 1)
CONST FREQ = (LASTTYPE + 2)
CONST FRAMES = (LASTTYPE + 3)
CONST COORDS = (LASTTYPE + 4)
CONST RELATIVES = (LASTTYPE + 5)
CONST HMERONYM = (LASTTYPE + 6)
CONST HHOLONYM = (LASTTYPE + 7)
CONST WNGREP = (LASTTYPE + 8)
CONST OVERVIEW = (LASTTYPE + 9)
CONST MAXSEARCH = OVERVIEW
CONST CLASSIF_START = (MAXSEARCH + 1)
CONST CLASSIF_CATEGORY = (CLASSIF_START)
CONST CLASSIF_USAGE = (CLASSIF_START + 1)
CONST CLASSIF_REGIONAL = (CLASSIF_START + 2)
CONST CLASSIF_END = CLASSIF_REGIONAL
CONST CLASS_START = (CLASSIF_END + 1)
CONST CLASS_CATEGORY = (CLASS_START)
CONST CLASS_USAGE = (CLASS_START + 1)
CONST CLASS_REGIONAL = (CLASS_START + 2)
CONST CLASS_END = CLASS_REGIONAL
CONST INSTANCE = (CLASS_END + 1)
CONST INSTANCES = (CLASS_END + 2)
CONST MAXPTR = INSTANCES
CONST NUMPARTS = 4
CONST NUMFRAMES = 35
CONST NOUN = 1
CONST VERB = 2
CONST ADJ = 3
CONST ADV = 4
CONST SATELLITE = 5
CONST ADJSAT = SATELLITE
CONST ALL_POS = 0
CONST PADJ = 1
CONST NPADJ = 2
CONST IPADJ = 3
CONST UNKNOWN_MARKER = 0
CONST ATTRIBUTIVE = NPADJ
CONST PREDICATIVE = PADJ
CONST IMMED_POSTNOMINAL = IPADJ
CONST DBLICENSE_SIZE = (1741)

DECLARE LIBRARY "..\lib\binsrch"
END DECLARE
DECLARE LIBRARY "..\lib\morph"
END DECLARE
DECLARE LIBRARY "..\lib\search"
END DECLARE
DECLARE LIBRARY "..\lib\wnglobal"
END DECLARE
DECLARE LIBRARY "..\lib\wnhelp"
END DECLARE
DECLARE LIBRARY "..\lib\wnrtl"
END DECLARE
DECLARE LIBRARY "..\lib\wnutil"
END DECLARE
DECLARE CUSTOMTYPE LIBRARY "..\lib\wncust"
    FUNCTION FmtSynset~%& (BYVAL Synset~%&, BYVAL int&)
    FUNCTION GetDataOffset& (BYVAL char~%&)
    FUNCTION GetKeyForOffset~& (BYVAL char~%&)
    FUNCTION GetOffsetForKey~%& (BYVAL uint~&)
    FUNCTION GetPolyCount& (BYVAL char~%&)
    FUNCTION GetSenseIndex~%& (BYVAL char~%&)
    FUNCTION GetSynsetForSense~%& (BYVAL char~%&)
    FUNCTION GetTagcnt& (BYVAL Index~%&, BYVAL int&)
    FUNCTION GetValidIndexPointer~%& (BYVAL char~%&, BYVAL int&)
    FUNCTION GetWNSense& (BYVAL char~%&, BYVAL char~%&)
    FUNCTION GetWNStr~%& (BYVAL char~%&, BYVAL int&)
    FUNCTION GetWORD~%& (BYVAL char~%&)
    FUNCTION Get_POS& ALIAS "GetPOS" (BYVAL char~%&)
    FUNCTION SetSearchdir~%& ()
    FUNCTION StrToPos& (BYVAL char~%&)
    FUNCTION ToLowerCase~%& (BYVAL char~%&)
    FUNCTION WNSnsToStr~%& (BYVAL Index~%&, BYVAL int&)
    FUNCTION bin_search~%& (BYVAL char~%&, BYVAL FILE~%&)
    FUNCTION cntwords& (BYVAL char~%&, char)
    FUNCTION do_trace~%& (BYVAL Synset~%&, BYVAL int&, BYVAL int&, BYVAL int&)
    FUNCTION findtheinfo_ds~%& (BYVAL char~%&, BYVAL int&, BYVAL int&, BYVAL int&)
    FUNCTION findtheinfo~%& (BYVAL char~%&, BYVAL int&, BYVAL int&, BYVAL int&)
    FUNCTION getindex~%& (BYVAL char~%&, BYVAL int&)
    FUNCTION getpos& (BYVAL char~%&)
    FUNCTION getptrtype& (BYVAL char~%&)
    FUNCTION getsstype& (BYVAL char~%&)
    FUNCTION in_wn~& (BYVAL char~%&, BYVAL int&)
    FUNCTION index_lookup~%& (BYVAL char~%&, BYVAL int&)
    FUNCTION insert_line~%& (BYVAL char~%&, BYVAL char~%&, BYVAL FILE~%&)
    FUNCTION is_defined~& (BYVAL char~%&, BYVAL int&)
    FUNCTION morphinit& ()
    FUNCTION morphstr~%& (BYVAL char~%&, BYVAL int&)
    FUNCTION morphword~%& (BYVAL char~%&, BYVAL int&)
    FUNCTION parse_index~%& (BYVAL long&, BYVAL int&, BYVAL char~%&)
    FUNCTION parse_synset~%& (BYVAL FILE~%&, BYVAL int&, BYVAL char~%&)
    FUNCTION re_morphinit& ()
    FUNCTION re_wninit& ()
    FUNCTION read_index~%& (BYVAL long&, BYVAL FILE~%&)
    FUNCTION read_synset~%& (BYVAL int&, BYVAL long&, BYVAL char~%&)
    FUNCTION replace_line~%& (BYVAL char~%&, BYVAL char~%&, BYVAL FILE~%&)
    FUNCTION strstr_getnext& ()
    FUNCTION strsubst~%& (BYVAL char~%&, char, char)
    FUNCTION strtolower~%& (BYVAL char~%&)
    FUNCTION traceptrs_ds~%& (BYVAL Synset~%&, BYVAL int&, BYVAL int&, BYVAL int&)
    FUNCTION wninit& ()
    SUB copyfile (BYVAL FILE~%&, BYVAL FILE~%&)
    SUB free_index (BYVAL Index~%&)
    SUB free_syns (BYVAL Synset~%&)
    SUB free_synset (BYVAL Synset~%&)
    SUB strstr_init (BYVAL char~%&, BYVAL char~%&)
    SUB wn_install_errmessage_handler
END DECLARE
DECLARE LIBRARY "..\lib\wn-getvars"
    FUNCTION getptr_OpenDB~%& ()
    FUNCTION getptr_abortsearch~%& ()
    FUNCTION getptr_adjclass~%& ()
    FUNCTION getptr_cntlistfp~%& ()
    FUNCTION getptr_datafps~%& ()
    FUNCTION getptr_dblicense~%& ()
    FUNCTION getptr_dflag~%& ()
    FUNCTION getptr_display_message~%& ()
    FUNCTION getptr_fileinfoflag~%& ()
    FUNCTION getptr_fnflag~%& ()
    FUNCTION getptr_frametext~%& ()
    FUNCTION getptr_frflag~%& ()
    FUNCTION getptr_helptext~%& ()
    FUNCTION getptr_indexfps~%& ()
    FUNCTION getptr_interface_doevents_func~%& ()
    FUNCTION getptr_keyindexfp~%& ()
    FUNCTION getptr_lexfiles~%& ()
    FUNCTION getptr_license~%& ()
    FUNCTION getptr_offsetflag~%& ()
    FUNCTION getptr_partchars~%& ()
    FUNCTION getptr_partnames~%& ()
    FUNCTION getptr_ptrtyp~%& ()
    FUNCTION getptr_revkeyindexfp~%& ()
    FUNCTION getptr_saflag~%& ()
    FUNCTION getptr_sensefp~%& ()
    FUNCTION getptr_vidxfilefp~%& ()
    FUNCTION getptr_vsentfilefp~%& ()
    FUNCTION getptr_wnrelease~%& ()
    FUNCTION getptr_wnresults~%& ()
    FUNCTION getptr_wnsnsflag~%& ()
END DECLARE

TYPE Index
    idxoffset AS LONG
    off_cnt AS LONG
    offset AS _UNSIGNED _OFFSET
    pos AS _UNSIGNED _OFFSET
    ptruse AS _UNSIGNED _OFFSET
    ptruse_cnt AS LONG
    sense_cnt AS LONG
    tagged_cnt AS LONG
    wd AS _UNSIGNED _OFFSET
END TYPE
TYPE SearchResults
    OutSenseCount0 AS LONG
    OutSenseCount1 AS LONG
    OutSenseCount2 AS LONG
    OutSenseCount3 AS LONG
    OutSenseCount4 AS LONG
    SenseCount0 AS LONG
    SenseCount1 AS LONG
    SenseCount2 AS LONG
    SenseCount3 AS LONG
    SenseCount4 AS LONG
    numforms AS LONG
    printcnt AS LONG
    searchbuf AS _UNSIGNED _OFFSET
    searchds AS _UNSIGNED _OFFSET
END TYPE
TYPE SnsIndex
    loc AS LONG
    nextsi AS _UNSIGNED _OFFSET
    sensekey AS _UNSIGNED _OFFSET
    tag_cnt AS LONG
    wnsense AS LONG
    word AS _UNSIGNED _OFFSET
END TYPE
TYPE Synset
    defn AS _UNSIGNED _OFFSET
    fcount AS LONG
    fnum AS LONG
    frmid AS _UNSIGNED _OFFSET
    frmto AS _UNSIGNED _OFFSET
    headsense AS INTEGER
    headword AS _UNSIGNED _OFFSET
    hereiam AS LONG
    key AS _UNSIGNED LONG
    lexid AS _UNSIGNED _OFFSET
    nextform AS _UNSIGNED _OFFSET
    nextss AS _UNSIGNED _OFFSET
    padding AS INTEGER
    pfrm AS _UNSIGNED _OFFSET
    pos AS _UNSIGNED _OFFSET
    ppos AS _UNSIGNED _OFFSET
    pto AS _UNSIGNED _OFFSET
    ptrcount AS LONG
    ptrlist AS _UNSIGNED _OFFSET
    ptroff AS _UNSIGNED _OFFSET
    ptrtyp AS _UNSIGNED _OFFSET
    searchtype AS LONG
    sstype AS LONG
    wcount AS LONG
    whichword AS LONG
    wnsns AS _UNSIGNED _OFFSET
    words AS _UNSIGNED _OFFSET
END TYPE