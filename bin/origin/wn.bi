CONST DICTDIR = "\dict"
CONST DEFAULTPATH = "C:\Program Files\WordNet\2.1\dict"
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

DECLARE CUSTOMTYPE LIBRARY "wncust"
' FUNCTION default_display_message& (BYVAL char~%&)
 FUNCTION findtheinfo~%& (BYVAL char~%&, BYVAL int&, BYVAL int&, BYVAL int&) ' returns char *
 FUNCTION findtheinfo_ds~%& (BYVAL char~%&, BYVAL int&, BYVAL int&, BYVAL int&) ' returns Synset *
 FUNCTION is_defined~& (BYVAL char~%&, BYVAL int&)
 FUNCTION in_wn~& (BYVAL char~%&, BYVAL int&)
 FUNCTION index_lookup~%& (BYVAL char~%&, BYVAL int&) ' returns Index *
 FUNCTION getindex~%& (BYVAL char~%&, BYVAL int&) ' returns Index *
 FUNCTION parse_index~%& (BYVAL long&, BYVAL int&, BYVAL char~%&) ' returns Index *
 FUNCTION read_synset~%& (BYVAL int&, BYVAL long&, BYVAL char~%&) ' returns Synset *
 FUNCTION parse_synset~%& (BYVAL FILE~%&, BYVAL int&, BYVAL char~%&) ' returns Synset *
 SUB free_syns (BYVAL Synset~%&)
 SUB free_synset (BYVAL Synset~%&)
 SUB free_index (BYVAL Index~%&)
 FUNCTION traceptrs_ds~%& (BYVAL Synset~%&, BYVAL int&, BYVAL int&, BYVAL int&) ' returns Synset *
 FUNCTION do_trace~%& (BYVAL Synset~%&, BYVAL int&, BYVAL int&, BYVAL int&) ' returns char *
 FUNCTION morphinit& ()
 FUNCTION re_morphinit& ()
 FUNCTION morphstr~%& (BYVAL char~%&, BYVAL int&) ' returns char *
 FUNCTION morphword~%& (BYVAL char~%&, BYVAL int&) ' returns char *
 FUNCTION wninit& ()
 FUNCTION re_wninit& ()
 FUNCTION cntwords& (BYVAL char~%&, char)
 FUNCTION strtolower~%& (BYVAL char~%&) ' returns char *
 FUNCTION ToLowerCase~%& (BYVAL char~%&) ' returns char *
 FUNCTION strsubst~%& (BYVAL char~%&, char, char) ' returns char *
 FUNCTION getptrtype& (BYVAL char~%&)
 FUNCTION getpos& (BYVAL char~%&)
 FUNCTION getsstype& (BYVAL char~%&)
 FUNCTION FmtSynset~%& (BYVAL Synset~%&, BYVAL int&) ' returns char *
 FUNCTION GetWNStr~%& (BYVAL char~%&, BYVAL int&) ' returns char *
 FUNCTION StrToPos& (BYVAL char~%&)
 FUNCTION GetSynsetForSense~%& (BYVAL char~%&) ' returns Synset *
 FUNCTION GetDataOffset& (BYVAL char~%&)
 FUNCTION GetPolyCount& (BYVAL char~%&)
 FUNCTION GetWORD~%& (BYVAL char~%&) ' returns char *
 FUNCTION Get_POS& ALIAS "GetPOS" (BYVAL char~%&)
 FUNCTION WNSnsToStr~%& (BYVAL Index~%&, BYVAL int&) ' returns char *
 FUNCTION GetValidIndexPointer~%& (BYVAL char~%&, BYVAL int&) ' returns Index *
 FUNCTION GetWNSense& (BYVAL char~%&, BYVAL char~%&)
 FUNCTION GetSenseIndex~%& (BYVAL char~%&) ' returns SnsIndex *
 FUNCTION GetOffsetForKey~%& (BYVAL uint~&) ' returns char *
 FUNCTION GetKeyForOffset~& (BYVAL char~%&)
 FUNCTION SetSearchdir~%& () ' returns char *
 FUNCTION GetTagcnt& (BYVAL Index~%&, BYVAL int&)
 SUB strstr_init (BYVAL char~%&, BYVAL char~%&)
 FUNCTION strstr_getnext& ()
 FUNCTION bin_search~%& (BYVAL char~%&, BYVAL FILE~%&) ' returns char *
 FUNCTION read_index~%& (BYVAL long&, BYVAL FILE~%&) ' returns char *
 SUB copyfile (BYVAL FILE~%&, BYVAL FILE~%&)
 FUNCTION replace_line~%& (BYVAL char~%&, BYVAL char~%&, BYVAL FILE~%&) ' returns char *
 FUNCTION insert_line~%& (BYVAL char~%&, BYVAL char~%&, BYVAL FILE~%&) ' returns char *
 SUB wn_install_errmessage_handler
END DECLARE

DECLARE LIBRARY "binsrch"
END DECLARE
DECLARE LIBRARY "morph"
END DECLARE
DECLARE LIBRARY "search"
END DECLARE
DECLARE LIBRARY "wnglobal"
END DECLARE
DECLARE LIBRARY "wnhelp"
END DECLARE
DECLARE LIBRARY "wnrtl"
END DECLARE
DECLARE LIBRARY "wnutil"
END DECLARE

TYPE Index
 idxoffset AS LONG
 wd AS _UNSIGNED _OFFSET ' char *
 pos AS _UNSIGNED _OFFSET ' char *
 sense_cnt AS LONG
 off_cnt AS LONG
 tagged_cnt AS LONG
 offset AS _UNSIGNED _OFFSET ' unsigned long *
 ptruse_cnt AS LONG
 ptruse AS _UNSIGNED _OFFSET ' int *
END TYPE

TYPE Synset
 hereiam AS LONG
 sstype AS LONG
 fnum AS LONG
 pos AS _UNSIGNED _OFFSET 'char *
 wcount AS LONG
 words AS _UNSIGNED _OFFSET ' char **
 lexid AS _UNSIGNED _OFFSET ' int *
 wnsns AS _UNSIGNED _OFFSET ' int *
 whichword AS LONG
 ptrcount AS LONG
 ptrtyp AS _UNSIGNED _OFFSET ' int *
 ptroff AS _UNSIGNED _OFFSET ' long *
 ppos AS _UNSIGNED _OFFSET ' int *
 pto AS _UNSIGNED _OFFSET ' int *
 pfrm AS _UNSIGNED _OFFSET ' int *
 fcount AS LONG
 frmid AS _UNSIGNED _OFFSET ' int *
 frmto AS _UNSIGNED _OFFSET ' int *
 defn AS _UNSIGNED _OFFSET ' char *
 key AS _UNSIGNED LONG
 nextss AS _UNSIGNED _OFFSET ' Synset *
 nextform AS _UNSIGNED _OFFSET ' Synset *
 searchtype AS LONG
 ptrlist AS _UNSIGNED _OFFSET ' Synset *
 headword AS _UNSIGNED _OFFSET ' char *
 headsense AS INTEGER
 padding AS INTEGER
END TYPE

TYPE SnsIndex
 sensekey AS _UNSIGNED _OFFSET 'char *
 word AS _UNSIGNED _OFFSET ' char *
 loc AS LONG
 wnsense AS LONG
 tag_cnt AS LONG
 nextsi AS _UNSIGNED _OFFSET ' SnsIndex *
END TYPE

TYPE SearchResults
 SenseCount0 AS LONG
 SenseCount1 AS LONG
 SenseCount2 AS LONG
 SenseCount3 AS LONG
 SenseCount4 AS LONG
 OutSenseCount0 AS LONG
 OutSenseCount1 AS LONG
 OutSenseCount2 AS LONG
 OutSenseCount3 AS LONG
 OutSenseCount4 AS LONG
 numforms AS LONG
 printcnt AS LONG
 searchbuf AS _UNSIGNED _OFFSET ' char *
 searchds AS _UNSIGNED _OFFSET ' Synset *
END TYPE

DECLARE LIBRARY "wn-getvars"
 FUNCTION getptr_wnrelease () ' returns char **
 FUNCTION getptr_lexfiles () ' returns char ***
 FUNCTION getptr_ptrtyp () ' returns char ***
 FUNCTION getptr_partnames () ' returns char ***
 FUNCTION getptr_partchars () ' returns char **
 FUNCTION getptr_adjclass () ' returns char ***
 FUNCTION getptr_frametext () ' returns char ***
 FUNCTION getptr_wnresults () ' returns SearchResults *
 FUNCTION getptr_fnflag () ' returns int *
 FUNCTION getptr_dflag () ' returns int *
 FUNCTION getptr_saflag () ' returns int *
 FUNCTION getptr_fileinfoflag () ' returns int *
 FUNCTION getptr_frflag () ' returns int *
 FUNCTION getptr_abortsearch () ' returns int *
 FUNCTION getptr_offsetflag () ' returns int *
 FUNCTION getptr_wnsnsflag () ' returns int *
 FUNCTION getptr_OpenDB () ' returns int *
 FUNCTION getptr_datafps () ' returns FILE ***
 FUNCTION getptr_indexfps () ' returns FILE ***
 FUNCTION getptr_sensefp () ' returns FILE **
 FUNCTION getptr_cntlistfp () ' returns FILE **
 FUNCTION getptr_keyindexfp () ' returns FILE **
 FUNCTION getptr_revkeyindexfp () ' returns FILE **
 FUNCTION getptr_vidxfilefp () ' returns FILE **
 FUNCTION getptr_vsentfilefp () ' returns FILE **
 FUNCTION getptr_helptext () ' returns char ****
 FUNCTION getptr_license () ' returns const char *
 FUNCTION getptr_dblicense () ' returns const char *
 FUNCTION getptr_interface_doevents_func () ' returns function **
 ' FUNCTION getptr_default_display_message () ' returns function *
 ' it's declared extern "C++"
 FUNCTION getptr_display_message () ' returns function **
END DECLARE

' global variables:
'extern char *wnrelease;        /* WordNet release/version number */
'extern char *lexfiles[];   /* names of lexicographer files */
'extern char *ptrtyp[];     /* pointer characters */
'extern char *partnames[];  /* POS strings */
'extern char partchars[];   /* single chars for each POS */
'extern char *adjclass[];   /* adjective class strings */
'extern char *frametext[];  /* text of verb frames */

'extern SearchResults wnresults;    /* structure containing results of search */
'extern int fnflag;     /* if set, print lex filename after sense */
'extern int dflag;      /* if set, print definitional glosses */
'extern int saflag;     /* if set, print SEE ALSO pointers */
'extern int fileinfoflag;   /* if set, print lex file info on synsets */
'extern int frflag;     /* if set, print verb frames after synset */
'extern int abortsearch;        /* if set, stop search algorithm */
'extern int offsetflag;     /* if set, print byte offset of each synset */
'extern int wnsnsflag;      /* if set, print WN sense # for each word */

'extern int OpenDB;     /* if non-zero, database file are open */
'extern FILE *datafps[NUMPARTS + 1],
'            *indexfps[NUMPARTS + 1],
'            *sensefp,
'            *cntlistfp,
'            *keyindexfp, *revkeyindexfp,
'            *vidxfilefp, *vsentfilefp;

'extern char **helptext[NUMPARTS + 1];

'static char *license;
' This software and database is being provided to you, the LICENSEE, by
' Princeton University under the following license.  By obtaining, using
' and/or copying this software and database, you agree that you have
' read, understood, and will comply with these terms and conditions.:

' Permission to use, copy, modify and distribute this software and
' database and its documentation for any purpose and without fee or
' royalty is hereby granted, provided that you agree to comply with
' the following copyright notice and statements, including the disclaimer,
' and that the same appear on ALL copies of the software, database and
' documentation, including modifications that you make for internal
' use or for distribution.

' WordNet 2.1 Copyright 2005 by Princeton University.  All rights reserved.

' THIS SOFTWARE AND DATABASE IS PROVIDED \"AS IS\" AND PRINCETON
' UNIVERSITY MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
' IMPLIED.  BY WAY OF EXAMPLE, BUT NOT LIMITATION, PRINCETON
' UNIVERSITY MAKES NO REPRESENTATIONS OR WARRANTIES OF MERCHANT-
' ABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE OR THAT THE USE
' OF THE LICENSED SOFTWARE, DATABASE OR DOCUMENTATION WILL NOT
' INFRINGE ANY THIRD PARTY PATENTS, COPYRIGHTS, TRADEMARKS OR
' OTHER RIGHTS.

' The name of Princeton University or Princeton may not be used in
' advertising or publicity pertaining to distribution of the software
' and/or database.  Title to copyright in this software, database and
' any associated documentation shall at all times remain with
' Princeton University and LICENSEE agrees to preserve same.

'static char dblicense[];

'  1 This software and database is being provided to you, the LICENSEE, by
'  2 Princeton University under the following license.  By obtaining, using
'  3 and/or copying this software and database, you agree that you have
'  4 read, understood, and will comply with these terms and conditions.:
'  5
'  6 Permission to use, copy, modify and distribute this software and
'  7 database and its documentation for any purpose and without fee or
'  8 royalty is hereby granted, provided that you agree to comply with
'  9 the following copyright notice and statements, including the disclaimer,
'  10 and that the same appear on ALL copies of the software, database and
'  11 documentation, including modifications that you make for internal
'  12 use or for distribution.
'  13
'  14 WordNet 2.1 Copyright 2005 by Princeton University.  All rights reserved.
'  15
'  16 THIS SOFTWARE AND DATABASE IS PROVIDED \"AS IS\" AND PRINCETON
'  17 UNIVERSITY MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
'  18 IMPLIED.  BY WAY OF EXAMPLE, BUT NOT LIMITATION, PRINCETON
'  19 UNIVERSITY MAKES NO REPRESENTATIONS OR WARRANTIES OF MERCHANT-
'  20 ABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE OR THAT THE USE
'  21 OF THE LICENSED SOFTWARE, DATABASE OR DOCUMENTATION WILL NOT
'  22 INFRINGE ANY THIRD PARTY PATENTS, COPYRIGHTS, TRADEMARKS OR
'  23 OTHER RIGHTS.
'  24
'  25 The name of Princeton University or Princeton may not be used in
'  26 advertising or publicity pertaining to distribution of the software
'  27 and/or database.  Title to copyright in this software, database and
'  28 any associated documentation shall at all times remain with
'  29 Princeton University and LICENSEE agrees to preserve same.

'/* Method for interface to check for events while search is running */

'extern void (*interface_doevents_func)(void);
'                        /* callback for interruptable searches in */
'                        /* single-threaded interfaces */

'/* General error message handler - can be defined by interface.
'   Default function provided in library returns -1 */

'extern int default_display_message(char *);
'extern int (*display_message)(char *);


'function bit~&(n~&)
' bit = 2^n
'end function