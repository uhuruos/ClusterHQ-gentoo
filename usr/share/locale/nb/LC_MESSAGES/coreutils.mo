??    ?      d  ?   ?      ?  ?   ?  9   n  t  ?  7     ?   U  ,   B  5   o  ?  ?  ?  5    ?  ?   ?  ?   ?  ?   K  ?   ?  ?   ?  ?   &  ?   ?  ?   ?  I   ?  ?   ?  ?  $  ?  ?  ?   h    c           ?  /   ?     ?     ?  B      8   R      ?      ?      ?      ?      ?   ;   ?      5!     H!     d!     ?!     ?!  "   ?!  )   ?!     ?!  1   "     N"     ]"     _"     f"  2   i"  *   ?"  $   ?"     ?"  '   #  ?   )#  &   ?#  "   ?#  "   $      1$  '   R$  Z   z$     ?$     ?$  <   ?$     7%     =%     ?%  #   \%     ?%  ,   ?%     ?%  &   ?%  !   &     1&     J&     W&  "   j&     ?&     ?&     ?&     ?&     ?&  *   ?&  -   '     J'     X'     v'     ?'      ?'     ?'     ?'     ?'  /   (  -   5(  &   c(     ?(     ?(     ?(  -   ?(     ?(     )  4   )  &   Q)     x)     ?)  >   ?)  
   ?)     ?)     ?)     
*     *     (*     A*     Q*     ]*     {*  J   ?*     ?*     ?*  H   +  ?   Y+  =   ?+  >   ?+  3   ,  (   J,  /   s,     ?,  2   ?,  =   ?,  ,   -  3   G-  j   {-     ?-     ?-  7   ?-  z  7.  ?   ?/  <   a0  ?  ?0  ;   42  ?   p2  3   3  /   D3  ?  t3  ?  5    7  ?   -8  ?   ?8  ?   ?9  ?   #:  u   ?:  ?   S;  ?   M<  ?   =  C   ?=  L   ->  ?  z>  ?  ??    ?A  O  C  $   _D     ?D  0   ?D     ?D  "   ?D  C   ?D  6   ?E     vE     ?E  !   ?E     ?E     ?E  Z   ?E     @F     SF     lF     ?F     ?F  !   ?F  ,   ?F  (   G  5   /G     eG     rG     uG     zG  3   }G  '   ?G  4   ?G     H  %    H  ?   FH  $   ?H     I  "   1I     TI     rI  K   ?I     ?I     ?I  9   J     =J     CJ     FJ  (   cJ  !   ?J  .   ?J     ?J  3   ?J  '   .K     VK     lK     ?K  !   ?K     ?K     ?K     ?K     ?K     
L  -   %L  2   SL     ?L     ?L     ?L  %   ?L  !   ?L     M     !M     0M  7   HM  1   ?M  -   ?M     ?M     ?M     	N  3   N     ON     \N  7   jN  #   ?N     ?N     ?N  H   ?N     9O     BO     RO     qO     ?O     ?O     ?O     ?O      ?O     ?O  T   ?O  $   QP  '   vP  K   ?P  ?   ?P  =   *Q  :   hQ  6   ?Q  &   ?Q  3   R     5R  7   <R  B   tR  /   ?R  :   ?R  _   "S     ?S     ?S  5   ?S         3   G       i   `   E   b   Z       "   ;   o   5   ?   j       V   f      [          '   c      7       &   #   >   ?       9   2   W         1   ?      ?       J   ,   F   %   ?   .   M   p   C         U           )   }       y       B                   m   t           d      ?                     :      x   K   Y       H   X           *          s   v   ?   D   u       8   z   O   ?   <              r   ?   k   N           ?           P      /   A   L   	   e      {   l   
       \             R   S          n      $   ^   @                    -   h           6   ~       w          0                  ?       I      =   +       (                  g           a   T   !   q   ]      4       |   _       Q               
By default, selects -v1 -i1 -l1 -sTAB -w6 -nrn -hn -bt -fn.  CC are
two delimiter characters for separating logical pages, a missing
second character implies :.  Type \\ for \.  STYLE is one of:
 
Read standard input if FILE is -.  Each PATTERN may be:
 
SETs are specified as strings of characters.  Most represent themselves.
Interpreted sequences are:

  \NNN            character with octal value NNN (1 to 3 octal digits)
  \\              backslash
  \a              audible BEL
  \b              backspace
  \f              form feed
  \n              new line
  \r              return
  \t              horizontal tab
 
With no FILE, or when FILE is -, read standard input.
 
Write an unambiguous representation, octal bytes by default,
of FILE to standard output.  With more than one FILE argument,
concatenate them in the listed order to form the input.
With no FILE, or when FILE is -, read standard input.

       --help     display this help and exit
       --version  output version information and exit
   -D, --date-format=FORMAT
                    use FORMAT for the header date
  -e[CHAR[WIDTH]], --expand-tabs[=CHAR[WIDTH]]
                    expand input CHARs (TABs) to tab WIDTH (8)
  -F, -f, --form-feed
                    use form feeds instead of newlines to separate pages
                    (by a 3-line page header with -F or a 5-line header
                    and trailer without -F)
   -W, --word-regexp=REGEXP       use REGEXP to match each keyword
  -b, --break-file=FILE          word break characters in this FILE
  -f, --ignore-case              fold lower case to upper case for sorting
  -g, --gap-size=NUMBER          gap size in columns between output fields
  -i, --ignore-file=FILE         read ignore word list from FILE
  -o, --only-file=FILE           read only word list from this FILE
   -a, --across      print columns across rather than down, used together
                    with -COLUMN
  -c, --show-control-chars
                    use hat notation (^G) and octal backslash notation
  -d, --double-space
                    double space the output
   -b, --body-numbering=STYLE      use STYLE for numbering body lines
  -d, --section-delimiter=CC      use CC for separating logical pages
  -f, --footer-numbering=STYLE    use STYLE for numbering footer lines
   -b, --bytes         count bytes rather than columns
  -s, --spaces        break at spaces
  -w, --width=WIDTH   use WIDTH columns instead of 80
   -d, --delimiters=LIST   reuse characters from LIST instead of TABs
  -s, --serial            paste one file at a time instead of in parallel
   -n, --digits=DIGITS        use specified number of digits instead of 2
  -s, --quiet, --silent      do not print counts of output file sizes
  -z, --elide-empty-files    remove empty output files
   -q, --quiet, --silent    never print headers giving file names
  -v, --verbose            always print headers giving file names
   -r, --references               first field of each line is a reference
  -t, --typeset-mode               - not implemented -
  -w, --width=NUMBER             output width in columns, reference excluded
   -s, --only-delimited    do not print lines not containing delimiters
      --output-delimiter=STRING  use STRING as the output delimiter
                            the default is to use the input delimiter
   -t                       equivalent to -vT
  -T, --show-tabs          display TAB characters as ^I
  -u                       (ignored)
  -v, --show-nonprinting   use ^ and M- notation, except for LFD and TAB
   -t, --tabs=LIST     use comma separated list of explicit tab positions
   -z, --zero-terminated     end lines with 0 byte, not newline
   [:graph:]       all printable characters, not including space
  [:lower:]       all lower case letters
  [:print:]       all printable characters, including space
  [:punct:]       all punctuation characters
  [:space:]       all horizontal or vertical whitespace
  [:upper:]       all upper case letters
  [:xdigit:]      all hexadecimal digits
  [=CHAR=]        all characters which are equivalent to CHAR
   \v              vertical tab
  CHAR1-CHAR2     all characters from CHAR1 to CHAR2 in ascending order
  [CHAR*]         in SET2, copies of CHAR until length of SET1
  [CHAR*REPEAT]   REPEAT copies of CHAR, REPEAT octal if starting with 0
  [:alnum:]       all letters and digits
  [:alpha:]       all letters
  [:blank:]       all horizontal whitespace
  [:cntrl:]       all control characters
  [:digit:]       all digits
   d[SIZE]    signed decimal, SIZE bytes per integer
  f[SIZE]    floating point, SIZE bytes per integer
  o[SIZE]    octal, SIZE bytes per integer
  u[SIZE]    unsigned decimal, SIZE bytes per integer
  x[SIZE]    hexadecimal, SIZE bytes per integer
 % 1% of memory, b 1, K 1024 (default), and so on for M, G, T, P, E, Z, Y.

With no FILE, or when FILE is -, read standard input.

*** WARNING ***
The locale specified by the environment affects sort order.
Set LC_ALL=C to get the traditional sort order that uses
native byte values.
 %s exists but is not a directory %s is too large %s: %s is so large that it is not representable %s: %s:%s: disorder:  %s: FAILED open or read
 %s: cannot follow end of this type of file; giving up on this name %s: equivalence class operand must be a single character %s: file too long %s: file truncated %s: input contains a loop: %s: input file is output file %s: invalid PID %s: invalid maximum number of unchanged stats between opens %s: invalid number %s: invalid number of bytes %s: invalid number of lines %s: invalid number of seconds %s: invalid pattern %s: invalid regular expression: %s %s: line number must be greater than zero %s: line number out of range %s: no properly formatted %s checksum lines found %s: read error ' FAILED OK Print CRC checksum and byte counts of each FILE.

 Set LC_ALL='C' to work around the problem. The strings compared were %s and %s. Unknown system error Usage: %s [FILE]...
  or:  %s [OPTION]
 Usage: %s [OPTION] [FILE]
Write totally ordered list consistent with the partial ordering in FILE.
With no FILE, or when FILE is -, read standard input.

 Usage: %s [OPTION]... FILE PATTERN...
 Usage: %s [OPTION]... FILE1 FILE2
 Usage: %s [OPTION]... SET1 [SET2]
 Usage: %s [OPTION]... [FILE]...
 Usage: %s [OPTION]... [INPUT [OUTPUT]]
 Usage: %s [OPTION]... [INPUT]...   (without -G)
  or:  %s -G [OPTION]... [INPUT [OUTPUT]]
 Valid arguments are: Written by %s.
 [=c=] expressions may not appear in string2 when translating ^[nN] ` ambiguous argument %s for %s both files cannot be standard input cannot change permissions of %s cannot convert U+%04X to local character set cannot create directory %s cannot skip past end of combined input cannot split in more than one way character offset is zero close failed closing %s (fd=%d) error in regular expression search error reading %s error writing %s field number is zero input disappeared invalid argument %s for %s invalid conversion specifier in suffix: %c invalid conversion specifier in suffix: \%.3o invalid group invalid number at field start invalid number of bytes invalid number of bytes to skip invalid number of fields to skip invalid number of lines invalid user memory exhausted misaligned [:upper:] and/or [:lower:] construct missing %% conversion specification in suffix missing conversion specifier in suffix missing list of fields missing list of positions no files remaining no type may be specified when dumping strings number of bytes number of lines only one [c*] repeat construct may appear in string2 only one type of list may be specified open failed page width too narrow printing all duplicated lines and repeat counts is meaningless read error read failed separator cannot be empty standard error standard input standard input is closed standard output stat failed stray character in field spec string comparison failed suppressing non-delimited lines makes sense
	only when operating on fields tab size cannot be 0 tab sizes must be ascending the --binary and --text options are meaningless when verifying checksums the --status option is meaningful only when verifying checksums the --warn option is meaningful only when verifying checksums the [c*] construct may appear in string2 only when translating the [c*] repeat construct may not appear in string1 the delimiter must be a single character too many %% conversion specifications in suffix total warning: --pid=PID is not supported on this system warning: PID ignored; --pid=PID is useful only when following warning: invalid width %lu; using %d instead when not truncating set1, string2 must be non-empty when translating with complemented character classes,
string2 must map all characters in the domain to one write error write failed you must specify a list of bytes, characters, or fields Project-Id-Version: GNU textutils 2.0.20
Report-Msgid-Bugs-To: bug-coreutils@gnu.org
POT-Creation-Date: 2013-12-13 15:07+0000
PO-Revision-Date: 2002-01-27 21:35+0100
Last-Translator: Eivind Tagseth <eivindt@multinet.no>
Language-Team: Norwegian <i18n-nb@lister.ping.uio.no>
Language: nb
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8-bit
 
Forvalgt er -v1 -i1 -l1 -sTAB -w6 -nrn -hn -bt -fn.  CC er
to skilletegn for å skille logiske sider, et manglende andretegn
impliserer «:». Bruk \\ for \. STIL er en av:
 
Les standard inn hvis FIL er -.  Hvert MØNSTER må være:
 
SETT er spesifisert med strenger av tegn.  De fleste tegnene står for seg
selv.  Følgende sekvenser tolkes spesielt:

  \NNN            tegn med oktalverdi NNN (1 til 3 oktale siffer)
  \\              backslash
  \a              beep
  \b              backspace
  \f              sideskift (FF)
  \n              linjeskift (LF)
  \r              vognretur (CR)
  \t              horisontal tabulator
 
Når ingen FIL eller når FIL er -, les fra standard inn.
 
Skriv en entydig representasjon, oktale bytes forvalgt, av FIL
til standard ut. Dersom ingen FIL er spesifisert, eller FIL er -,
leses det fra standard inn.

       --help     vis denne hjelpteksten og avslutt
       --version  vis programversjon og avslutt
   -D, --date-format=FORMAT
                    bruk FORMAT for topptekst-dato
  -e[TEGN[BREDDE]], --expand-tabs[=TEGN[BREDDE]]
                    ekspander inn-TEGN (TAB) til tabulator-BREDDE (8)
  -F, -f, --form-feed
                    bruk sideskift isteden for linjeskift for å separere
                    sider. (ved en 3-linjers topptekst med -F eller en
                    5-linjers topptekst og bunntekst uten -F)
   -W, --word-regexp=REGEXP       bruk REGEXP for å treffe hvert nøkkelord
  -b, --break-file=FIL           tegn for orddeling i denne FILen
  -f, --ignore-case              gjør om små bokstaver til store for sortering
  -g, --gap-size=TALL            størrelse på mellomrom mellom spalter i utfelt
  -i, --ignore-file=FIL          les liste over ord som skal ignoreres fra FIL
  -o, --only-file=FIL            les liste over ord som *ikke* skal ignoreres
                                 fra FIL
   -a, --across      skriv kolonner på tvers isteden for nedover, brukes sammen
                    med -KOLONNE
  -c, --show-control-chars
                    bruk hatt-notasjon (^G) og oktal backslah-notasjon
  -d, --double-space
                    bruk dobbel linjeavstand
   -b, --body-numbering=STIL       bruk STIL for nummerering
  -d, --section-delimiter=CC      bruk CC for å skille logiske sider
  -f, --footer-numbering=STIL     bruk STIL for å nummerere bunntekst
   -b, --bytes         tell bytes istedet for kolonner
  -s, --spaces        brekk om ved mellomrom
  -w, --width=BREDDE  bruk BREDDE kolonner istedet for 80
   -d, --delimiters=LISTE  bruk tegn fra LISTE istedet for tabulatorer
  -s, --serial            ta en fil om gangen i steder for i parallell
   -n, --digits=SIFFER        bruk spesifisert antall siffer isteden for 2
  -s, --quiet, --silent      ikke skriv ut utfil-størrelser
  -z, --elide-empty-files    fjern tomme ut-filer
   -q, --quiet, --silent    ikke skriv ut filnavnene først
  -v, --verbose            skriv alltid filnavnene først
   -r, --references               første felt av hver linje er en referanse
  -t, --typeset-mode               - ikke implementert -
  -w, --width=BREDDE             utskriftbredde for spalter, eksklusive
                                 referanser
   -s, --only-delimited    skriv ikke ut linjer som ikke inneholder skilletegn
      --output-delimiter=STRENG  bruk STRENG som ut-skilletegn
                            forvalgt er å bruke inn-skilletegnet
   -t                       samme som -vT
  -T, --show-tabs          vis tabulatortegn som ^I
  -u                       (ignorert)
  -v, --show-nonprinting   bruk ^ og M-notasjon, unntatt for LFD og TAB
   -t, --tabs=LISTE    bruk komma-separert LISTE med tab-posisjoner
   -z, --zero-terminated     avslutt linjer med en 0-oktett, ikke linjeskift
   [:graph:]       alle skrivbare tegn, unntatt blanke tegn
  [:lower:]       alle små bokstaver
  [:print:]       alle skrivbare tegn, inkludert blanke tegn
  [:punct:]       alle tegnsettingstegn
  [:space:]       alle horisontale og vertikale blanke tegn
  [:upper:]       alle store bokstaver
  [:xdigit:]      alle hexadesimale siffer
  [=TEGN=]        alle tegn som er like TEGN
   \v              vertikal tabulator
  TEGN1-TEGN2     alle tegn fra TEGN1 til TEGN2, stigende
  [TEGN1-TEGN2]   samme som TEGN1-TEGN2, dersom begge sett bruker dette
  [TEGN*]         i SETT2, kopier av TEGN inntil samme lengde til SETT1
  [TEGN*ANT]      ANT kopier av TEGN, ANT er oktal, hvis det begynner med 0
  [:alnum:]       alle bokstaver og tall
  [:alpha:]       alle bokstaver
  [:blank:]       alle horisontale blanke tegn
  [:cntrl:]       alle kontrolltegn
  [:digit:]       alle siffer
   d[STØRRELSE] desimal med fortegn, STØRRELSE bytes per tall
  f[STØRRELSE] flyttall, STØRRELSE bytes per tall
  o[STØRRELSE] oktal, STØRRELSE bytes per tall
  u[STØRRELSE] desimal uten fortegn, STØRRELSE bytes per tall
  x[STØRRELSE] hexadesimal, STØRRELSE bytes per tall
 % 1% av minne, b 1, K 1024 (forvalgt) og så videre for M, G, T, P, E, Z, Y.

Dersom ingen FIL er oppgitt eller FIL er -, leses det fra standard inn.

*** ADVARSEL ***
Lokalet spesifisert av miljøet påvirker sorteringsrekkefølge.
Sett LC_ALL=C for å få den tradisjonelle sorteringsrekkefølgen som
bruker negative oktett-verdier.
 %s eksisterer men er ikke en katalog %s er for stor %s: %s er så stor at den ikke kan representeres %s: %s:%s: uorden:  %s: FEIL ved åpning eller lesing
 %s: kan ikke følge slutten av en fil av denne typen; gir opp denne %s: ekvivalensklasseoperanden må være et enkelt tegn %s: fil for lang %s: fil trunkert %s: inndata inneholder en løkke: %s: innfil er utfil %s: ugyldig prosess-id %s: ugyldig maksimum antall av uendrete resultat av kall til stat() mellom kall til open() %s: ugyldig nummer %s: ugyldig antall bytes %s: ugyldig antall linjer %s: ugyldig antall sekunder %s: ugyldig mønster %s: ugyldig regulært uttrykk: %s %s: linjenummeret må være større enn null %s: linjenummer utenfor tillatte verdier %s: ingen riktig formatterte %s-sjekksumlinjer funnet %s: lesefeil » FEIL OK Skriv CRC-sjekksum og oktett-antall for hver FIL.

 Sett LC_ALL='C' for å omgå problemet. Strengene som ble sammenlignet var «%s» og «%s». Ukjent systemfeil Bruk:  %s [FIL]...
eller: %s [FLAGG]
 Bruk: %s [FLAGG] [FIL]
Skriv en fullstendig sortert liste konsistent med den delvise sorteringen
i FIL.  Hvis ingen FIL eller hvis FIL er -, leses fra standard inn.

 Bruk: %s [FLAGG]... FIL MØNSTER...
 Bruk: %s [FLAGG]... FIL1 FIL2
 Bruk: %s [FLAGG]... SETT1 [SETT2]
 Bruk: %s [FLAGG]... [FIL]...
 Bruk: %s [FLAGG]... [INN [UT]]
 Bruk : %s [FLAGG]... [INN]... (uten -G)
eller: %s -G [FLAGG]... [INN [UT]]
 Gyldige argument er: Skrevet av %s.
 [=c=]-uttrykk kan ikke opptre i streng2 under oversetting ^[nN] « flertydig argument %s for %s begge filene kan ikke være standard inn kan ikke endre rettigheter til %s kan ikke konvertere U+%04X til lokalt tegnsett kan ikke opprette katalog %s kan ikke hoppe til bak slutten av kombinert inndata kan ikke dele opp på mer enn én måte tegn-posisjon er null feil ved lukking av fil lukker %s (fd=%d) feil i søk med regulært uttrykk feil ved lesing av %s feil ved skriving til %s felt-nummer er null input forsvant ugyldig argument %s for %s ugyldig konvertingsspesifikator i suffiks: %c ugyldig konverteringsspesifikator i suffiks: \%.3o ugyldig gruppe ugyldig tall i feltstart ugyldig antall bytes ugyldig antall oktetter å hoppe over ugyldig antall felt å hoppe over ugyldig antall linjer ugyldig bruker virtuelt minne oppbrukt feilplassert [:upper:]- og/eller [:lower:]-konstruksjon manglende %%-konverteringsspesifikasjon i suffiks manglende konverteringsspesifikator i suffiks feltliste mangler posisjonsliste mangler ingen filer igjen ingen type kan spesifiseres ved dumping av strenger antall bytes antall linjer kun ett [c*] gjentagelseskonstrukt kan opptre i streng2 bare en liste-type kan spesifiseres åpning av fil feilet sidebredde for smal å skrive alle dupliserte linjer *og* gjentagelsesantall er meningsløst lesefeil feil ved lesing separatoren kan ikke være tom standard feilkanal standard inn standard inn er lukket standard ut stat feilet ugyldig tegn i feltspesifikasjon strengsammenligning feilet fjerning av linjer uten skilletegn er meningsløst dersom en ikke opererer
	med felt tabulatorstørrelse kan ikke være 0 tabulatorstørrelser må være stigende flaggene --binary og --text er meningsløse ved verifisering av sjekksummer flagget --status har bare betydning ved sjekking av sjekksummer flagget --warn har bare betydning ved sjekking av sjekksummer [c*]-konstruktet kan bare opptre i streng2 ved oversetting gjentagelseskonstruktet [c*] kan ikke opptre i streng1 skilletegnet må være ett enkelt tegn for mange %%-konverteringsspesifikasjoner i suffiks totalt advarsel: --pid=PID er ikke støttet på dette systemet advarsel: PID ignoreres; --pid=PID er bare nyttid når man følger advarsel: ugyldig bredde %lu; bruker %d istedet når sett1 ikke blir forkortet, kan ikke streng2 være tom når det oversettes med komlementerte tegnklasser
må streng2 mappe alle tegn i domenet til én feil ved skriving feil ved skriving du må spesifisere en liste av bytes, tegn eller felt 