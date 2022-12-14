??    C      4  Y   L      ?  )   ?  ?   ?     d  $     "   ?     ?     ?  )   ?  *   &     Q     S  !   d     ?  <   ?  b   ?  b   9  c   ?  ?    	  7   ?	  ?   ?	  ?   q
       [        t  q   ?     ?               	     &     =     T     `     q     v  !   }     ?     ?     ?     ?          %  P   8  )   ?     ?     ?     ?     ?  )     %   =      c  ?   ?  	  S  6   ]     ?  )  ?     ?     ?  W   ?  I  @  +   ?  q   ?  >   (  "   g  -   ?  ?   ?  _  ?  1   ?  ?   0     ?  %   ?  )        8     V  0   q  1   ?     ?     ?  )   ?       ]   .  ?   ?  ?     ?   ?  ?   2  8   ?  ?   '  ?     -   ?  r   ?     8  ~   T     ?     ?     ?  !   ?          $     D     [     n     s  )   y     ?  !   ?  "   ?  $      ,   -      Z   X   p   .   ?   (   ?       !!     B!     U!  3   t!  /   ?!  *   ?!  ?   "    ?"  N   ?#     >$  .  E$  (   t%  
   ?%  ?   ?%  b  *&  ,   ?'  ?   ?'  ^   M(  4   ?(  1   ?(    )     +       '                7           &   3       .       5   ?   /   =   C   @      $           >   	      *      0                -             
      #          <             A              8          B          "      )       1   9   ;      2         4       (       %   6       !                              ,      :    
Report bugs to <bug-findutils@gnu.org>.
 
default path is the current directory; default expression is -print
expression may consist of: operators, options, tests, and actions:
 %s terminated by signal %d %s: exited with status 255; aborting %s: invalid number for -%c option
 %s: stopped by signal %d %s: terminated by signal %d %s: value for -%c option should be < %ld
 %s: value for -%c option should be >= %ld
 ' < %s ... %s > ?  Database %s is in the %s format.
 Features enabled:  Invalid escape sequence %s in input delimiter specification. Invalid escape sequence %s in input delimiter specification; character values must not exceed %lo. Invalid escape sequence %s in input delimiter specification; character values must not exceed %lx. Invalid escape sequence %s in input delimiter specification; trailing characters %s not recognised. Invalid input delimiter specification %s: the delimiter must be either a single character or an escape sequence starting with \. Only one instance of {} is supported with -exec%s ... + Report (and track progress on fixing) bugs via the findutils bug-reporting
page at http://savannah.gnu.org/ or, if you have no web access, by sending
email to <bug-findutils@gnu.org>. The environment variable FIND_BLOCK_SIZE is not supported, the only thing that affects the block size is the POSIXLY_CORRECT environment variable Unknown system error Usage: %s [--version | --help]
or     %s most_common_bigrams < file-list > locate-database
 Valid arguments are: You may not use {} within the utility name for -execdir and -okdir, because this is a potential security problem. ^[nN] ^[yY] ` ambiguous argument %s for %s argument line too long argument list too long cannot fork command too long days double environment is too large for exec error waiting for %s error waiting for child process invalid -size type `%c' invalid argument %s for %s invalid argument `%s' to `%s' invalid expression invalid expression; I was expecting to find a ')' somewhere but did not see one. invalid expression; you have too many ')' invalid null argument to -size invalid predicate `%s' memory exhausted missing argument to `%s' oops -- invalid default insertion of and! oops -- invalid expression type (%d)! oops -- invalid expression type! operators (decreasing precedence; -and is implicit where no others are given):
      ( EXPR )   ! EXPR   -not EXPR   EXPR1 -a EXPR2   EXPR1 -and EXPR2
      EXPR1 -o EXPR2   EXPR1 -or EXPR2   EXPR1 , EXPR2
 positional options (always true): -daystart -follow -regextype

normal options (always true, specified before other expressions):
      -depth --help -maxdepth LEVELS -mindepth LEVELS -mount -noleaf
      --version -xdev -ignore_readdir_race -noignore_readdir_race
 sanity check of the fnmatch() library function failed. single tests (N can be +N or -N or N): -amin N -anewer FILE -atime N -cmin N
      -cnewer FILE -ctime N -empty -false -fstype TYPE -gid N -group NAME
      -ilname PATTERN -iname PATTERN -inum N -iwholename PATTERN -iregex PATTERN
      -links N -lname PATTERN -mmin N -mtime N -name PATTERN -newer FILE unexpected extra predicate unknown unmatched %s quote; by default quotes are special to xargs unless you use the -0 option warning: Unix filenames usually don't contain slashes (though pathnames do).  That means that '%s %s' will probably evaluate to false all the time on this system.  You might find the '-wholename' test more useful, or perhaps '-samefile'.  Alternatively, if you are using GNU grep, you could use 'find ... -print0 | grep -FzZ %s'. warning: not following the symbolic link %s warning: the -d option is deprecated; please use -depth instead, because the latter is a POSIX-compliant feature. warning: the locate database can only be read from stdin once. warning: unrecognized escape `\%c' warning: unrecognized format directive `%%%c' warning: you have specified the %s option after a non-option argument %s, but options are not positional (%s affects tests specified before it as well as those specified after it).  Please specify options before other arguments.
 Project-Id-Version: findutils 4.2.27
Report-Msgid-Bugs-To: bug-findutils@gnu.org
POT-Creation-Date: 2014-07-19 11:27+0100
PO-Revision-Date: 2006-05-20 14:54+0200
Last-Translator: Jordi Mallach <jordi@gnu.org>
Language-Team: Catalan <ca@dodds.net>
Language: ca
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8-bit
 
Informeu dels errors a <bug-findutils@gnu.org>.
 
el camí per defecte és el directori actual; l'expressió per defecte és -print
l'expressió pot consistir d'operadors, opcions, avaluacions i accions:
 %s finalitzat pel senyal %d %s: ha acabat amb estat 255; avortant %s: número no vàlid per a l'opció -%c
 %s: interromput pel senyal %d %s: terminat pel senyal %d %s: el valor per a l'opció -%c ha de ser < %ld
 %s: el valor per a l'opció -%c ha de ser >= %ld
 » < %s ... %s > ? La base de dades %s és en el format %s.
 Funcionalitats habilitades:  La seqüència d'escapament %s és il·legal en una especificació de delimitació d'entrada. La seqüència d'escapament %s és il·legal en una especificació de delimitació d'entrada; els valors dels caràcters no han d'excedir %lo. La seqüència d'escapament %s és il·legal en una especificació de delimitació d'entrada; els valors dels caràcters no han d'excedir %lx. La seqüència d'escapament %s és il·legal en una especificació de delimitació d'entrada; no es reconeixen el caràcters finals %s. La seqüència d'escapament %s és il·legal en una especificació de delimitació d'entrada: el delimitador ha de ser un únic caràcter o una seqüència d'escapament que comence amb \. Només es suporta una instància de {} amb -exec%s ... + Informeu (i feu un seguiment del procés de solució) dels errors a través de la
pàgina d'informes d'error de findutils en http://savannah.gnu.org/ o, si no
teniu accés a la web, enviant correu a <bug-findutils@gnu.org>. La variable d'entorn FIND_BLOCK_SIZE no està suportada, l'única cosa que afecta a la mida dels blocs és la variable d'entorn POSIXLY_CORRECT S'ha produït un error desconegut del sistema Forma d'ús: %s [--version | --help]
            %s biagrames_més_comuns < llista-fitxers > base-de-dades-locate
 Els arguments vàlids són: No pdeu utilitzar {} dins del nom de la utilitat per a -execdir i -okdir, ja que això és un problema de seguretat potencial. ^[nN] ^[sS] « l'argument %s és ambigu per a %s línia d'arguments massa llarga llista d'arguments massa llarga no es pot fer «fork» ordre massa llarga dies doble l'entorn és massa gran per a l'execució error a l'esperar al procés %s error a l'esperar al procés fill el tipus de -size «%c» no vàlid l'argument %s no és vàlid per a %s l'argument «%s» no és vàlid per a «%s» expressió no vàlida l'expressió no és vàlida; s'esperava un «)» en algun lloc però no s'ha trobat cap. l'expressió no és vàlida; teniu massa «)» l'argument nul no és vàlid per a -size el predicat «%s» no és vàlid memòria exhaurida manca un argument per a «%s» oops -- inserció per defecte d'«and» no vàlida! ep -- el tipus d'expressió (%d) no és vàlid! ep -- el tipus d'expressió no és vàlid! operadors (prioritat decreixent; -and és implícit quan no es donen altres):
      ( EXPR )   ! EXPR   -not EXPR   EXPR1 -a EXPR2   EXPR1 -and EXPR2
      EXPR1 -o EXPR2   EXPR1 -or EXPR2   EXPR1 , EXPR2
 opcions posicionals (sempre vertaderes): -daystart -follow -regextype
opcions normals (sempre vertaderes, especificades abans d'altres expressions):
      -depth -help -maxdepth NIVELLS -mindepth NIVELLS -mount -noleaf
      --version -xdev -ignore_readdir_race -noignore_readdir_race
 la comprovació de sanitat de la funció fnmatch() de la biblioteca ha fallat. simple avaluacions (N pot ser +N o -N o N): -amin N -anewer FITXER -atime N -cmin N
      -cnewer FITXER -ctime N -empty -false -fstype TIPUS -gid N -group NOM
      -ilname PATRÓ -iname PATRÓ -inum N -iwholename PATRÓ -iregex PATRÓ
      -links N -lname PATRÓ -mmin N -mtime N -name PATRÓ -newer FITXER s'ha trobat un predicat extra no esperat desconegut s'ha trobat una cometa %s no emparellada. Per defecte, les cometes són especials per a xargs a no ser que s'utilitze l'opció -O avís: els noms de fitxers de Unix no contenen barres (però sí els camins). Això vol dir que «%s %s» probablement sempre avaluarà com a fals en aquest sistema. És possible que la comprovació «-wholename» siga més útil, o potser «-samefile». Alternativament, si esteu utilitzant GNU grep, podeu utilitzar «find ... -print0 | grep -FzZ %s». avís: no es seguirà l'enllaç simbòlic %s avís: l'opció -d està desaconsellada; si us plau, utilitzeu -depth en el seu lloc, ja que aquesta és una funcionalitat que compleix amb POSIX. avís: la base de dades de locate només es pot llegir una vegada des de l'entrada estàndard. avís: seqüència d'escapament «\%c» no reconegut avís: directiva de format «%%%c» no reconeguda avís: he especificat l'opció %s després d'un argument no-opció %s, però les opcions no són posicionals (%s afecta a les comprovacions especificades abans d'ella com també aquelles especificades després d'ella). Si us plau, especifiqueu les opcions abans d'altres arguments.
 