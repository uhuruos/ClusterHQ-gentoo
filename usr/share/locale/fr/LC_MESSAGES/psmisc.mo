??    S      ?  q   L        Q    `   c
  b   ?
  0   '  p   X  k   ?  #   5     Y     v     ?  )   ?  	   ?  3   ?       ?   '      ?  ,   ?  $        )      >     _       #   ?  !   ?     ?     ?  <     <   N  <   ?  %   ?      ?          .     I     `     o     ?     ?     ?  ?   ?  &   ?     ?     ?     ?  ?     d   ?     N  $   e  u   ?  C      =   D     ?  &   ?     ?  )   ?     ?  ?    H   ?  (     E  0  ?   v  .   2  F   a  "   ?  -   ?     ?  
        $  2   7  $   j  ,   ?  '   ?  '   ?               '     <     P     X     a     h     p  ?  w  ?  -  t   #  v   ?#  B   $  ?   E$  ?   ?$  %   W%     }%     ?%     ?%  -   ?%  	   ?%  J   &  &   S&  ?   z&  5   '  C   T'  ?   ?'     ?'  -   ?'  (   "(  '   K(  4   s(  '   ?(  (   ?(  0   ?(  ;   *)  ;   f)  ;   ?)  %   ?)      *  (   %*  '   N*  )   v*     ?*     ?*     ?*     ?*      +  ?   #+  0   ?+  *   ,     B,  %   \,  ?   ?,  j   q-  *   ?-  *   .     2.  E   ?.  I   ?.  !   B/  #   d/     ?/  3   ?/     ?/  ~  ?/  Q   m4  )   ?4  ?  ?4  ?   t6  M   J7  V   ?7  &   ?7  E   8  $   \8     ?8     ?8  ;   ?8  /   ?8  F   9  *   V9  3   ?9     ?9     ?9     ?9     ?9     :     :     :     :     ":     0                &       1   5       =       /      ,   7   K   M   @   :      2                    8      G           H           '      Q   6           S   3       E       I                  9   #   %       ;   !   >   D                         .       A   "            O      	      $   R   B      +   C   (      
   *         )           P              -   F       <   N                           ?   L      J   4           killall -l, --list
       killall -V, --version

  -e,--exact          require exact match for very long names
  -I,--ignore-case    case insensitive process name match
  -g,--process-group  kill process group instead of process
  -y,--younger-than   kill processes younger than TIME
  -o,--older-than     kill processes older than TIME
  -i,--interactive    ask for confirmation before killing
  -l,--list           list all known signal names
  -q,--quiet          don't print complaints
  -r,--regexp         interpret NAME as an extended regular expression
  -s,--signal SIGNAL  send this signal instead of SIGTERM
  -u,--user USER      kill only process(es) running as USER
  -v,--verbose        report if the signal was successfully sent
  -V,--version        display version information
  -w,--wait           wait for processes to die
   -                     reset options

  udp/tcp names: [local_port][,[rmt_host][,[rmt_port]]]

   -4,--ipv4             search IPv4 sockets only
  -6,--ipv6             search IPv6 sockets only
   -Z     show         SELinux security contexts
   -Z,--context REGEXP kill only process(es) having context
                      (must precede other arguments)
   PID    start at this PID; default is 1 (init)
  USER   show only trees rooted at processes of this user

 %*s USER        PID ACCESS COMMAND
 %s is empty (not mounted ?)
 %s: Invalid option %s
 %s: no process found
 %s: unknown signal; %s -l lists signals.
 (unknown) /proc is not mounted, cannot stat /proc/self/stat.
 Bad regular expression: %s
 CPU Times
  This Process    (user system guest blkio): %6.2f %6.2f %6.2f %6.2f
  Child processes (user system guest):       %6.2f %6.2f %6.2f
 Can't get terminal capabilities
 Cannot allocate memory for matched proc: %s
 Cannot find socket's device number.
 Cannot find user %s
 Cannot open /proc directory: %s
 Cannot open /proc/net/unix: %s
 Cannot open a network socket.
 Cannot open protocol file "%s": %s
 Cannot resolve local port %s: %s
 Cannot stat %s: %s
 Cannot stat file %s: %s
 Copyright (C) 1993-2009 Werner Almesberger and Craig Small

 Copyright (C) 1993-2010 Werner Almesberger and Craig Small

 Copyright (C) 1993-2012 Werner Almesberger and Craig Small

 Copyright (C) 2007 Trent Waddington

 Copyright (C) 2009 Craig Small

 Could not kill process %d: %s
 Error attaching to pid %i
 Invalid namespace name Invalid option Invalid time format Kill %s(%s%d) ? (y/N)  Kill process %d ? (y/N)  Killed %s(%s%d) with signal %d
 Memory
  Vsize:       %-10s
  RSS:         %-10s 		 RSS Limit: %s
  Code Start:  %#-10lx		 Code Stop:  %#-10lx
  Stack Start: %#-10lx
  Stack Pointer (ESP): %#10lx	 Inst Pointer (EIP): %#10lx
 Namespace option requires an argument. No process specification given No processes found.
 No such user name: %s
 PSmisc comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to redistribute it under
the terms of the GNU General Public License.
For more information about these matters, see the files named COPYING.
 Page Faults
  This Process    (minor major): %8lu  %8lu
  Child Processes (minor major): %8lu  %8lu
 Press return to close
 Process with pid %d does not exist.
 Process, Group and Session IDs
  Process ID: %d		  Parent ID: %d
    Group ID: %d		 Session ID: %d
  T Group ID: %d

 Process: %-14s		State: %c (%s)
  CPU#:  %-3d		TTY: %s	Threads: %ld
 Scheduling
  Policy: %s
  Nice:   %ld 		 RT Priority: %ld %s
 Signal %s(%s%d) ? (y/N)  Specified filename %s does not exist.
 TERM is not set
 Unable to open stat file for pid %d (%s)
 Unknown local port AF %d
 Usage: fuser [-fMuvw] [-a|-s] [-4|-6] [-c|-m|-n SPACE] [-k [-i] [-SIGNAL]] NAME...
       fuser -l
       fuser -V
Show which processes use the named files, sockets, or filesystems.

  -a,--all              display unused files too
  -i,--interactive      ask before killing (ignored without -k)
  -k,--kill             kill processes accessing the named file
  -l,--list-signals     list available signal names
  -m,--mount            show all processes using the named filesystems or block device
  -M,--ismountpoint     fulfill request only if NAME is a mount point
  -n,--namespace SPACE  search in this name space (file, udp, or tcp)
  -s,--silent           silent operation
  -SIGNAL               send this signal instead of SIGKILL
  -u,--user             display user IDs
  -v,--verbose          verbose output
  -w,--writeonly        kill only processes with write access
  -V,--version          display version information
 Usage: killall [-Z CONTEXT] [-u USER] [ -eIgiqrvw ] [ -SIGNAL ] NAME...
 Usage: killall [OPTION]... [--] NAME...
 Usage: peekfd [-8] [-n] [-c] [-d] [-V] [-h] <pid> [<fd> ..]
    -8 output 8 bit clean streams.
    -n don't display read/write from fd headers.
    -c peek at any new child processes too.
    -d remove duplicate read/writes from the output.
    -V prints version info.
    -h prints this help.

  Press CTRL-C to end output.
 Usage: prtstat [options] PID ...
       prtstat -V
Print information about a process
    -r,--raw       Raw display of information
    -V,--version   Display version information and exit
 You can only use files with mountpoint options You cannot search for only IPv4 and only IPv6 sockets at the same time You must provide at least one PID. all option cannot be used with silent option. asprintf in print_stat failed.
 disk sleep fuser (PSmisc) %s
 killall: %s lacks process entries (not mounted ?)
 killall: Bad regular expression: %s
 killall: Cannot get UID from process status
 killall: Maximum number of names is %d
 killall: skipping partial match %s(%d)
 paging peekfd (PSmisc) %s
 prtstat (PSmisc) %s
 pstree (PSmisc) %s
 running sleeping traced unknown zombie Project-Id-Version: psmisc-22.20rc1
Report-Msgid-Bugs-To: csmall@small.dropbear.id.au
POT-Creation-Date: 2013-10-09 17:30+1100
PO-Revision-Date: 2012-08-31 22:39+0200
Last-Translator: Frédéric Marchal <fmarchal@perso.be>
Language-Team: French <traduc@traduc.org>
Language: fr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: Lokalize 1.4
Plural-Forms:  nplurals=2; plural=(n > 1);
        killall -l, --list
       killall -V, --version

  -e,--exact            requiert une concordance parfaite des noms très longs
  -I,--ignore-case      recherche en ignorant la casse
  -g,--process-group    tue le groupe associé au programme au lieu de celui-ci
  -y,--younger-than     tue les programmes créés avant HEURE
  -o,--older-than       tue les programmes créés après HEURE
  -i,--interactive      demande une confirmation avant de tuer
  -l,--list             affiche tous les noms de signaux connus
  -q,--quiet            n'affiche pas les remarques
  -r,--regexp           interprète NOM comme une expression régulière étendue
  -s,--signal SIGNAL    envoie ce signal au lieu de SIGTERM
  -u,--user UTILISATEUR ne tue que le(s) programme(s) utilisé(s) par UTILISATEUR
  -v,--verbose          informe si le signal a été correctement envoyé
  -V,--version          affiche les informations sur la version
  -w,--wait             attend que les programmes s'arrêtent
   -                     réinitialise les options

  noms udp/tcp: [port_local][,[hôte_distant][,[port_distant]]]

   -4,--ipv4             cherche des sockets IPv4 seulement
  -6,--ipv6             cherche des sockets IPv6 seulement
   -Z     show         montrer les contextes de sécurité SELinux
   -Z,--context REGEXP ferme seulement le(s) processus ayant l'argument context
                      (doit précéder les autres arguments)
   PID    commence à ce PID; le défaut est 1 (init)
  USER   montre seulement les arbres nichés aux processus de cet utilisateur

 %*s UTIL.       PID ACCÈS  COMMANDE
 %s est vide (pas monté ?)
 %s: Option %s incorrecte
 %s: aucun processus trouvé
 %s: signal inconnu; %s -l liste les signaux.
 (inconnu) /proc n'est pas monté, impossible d'obtenir les stat de /proc/self/stat.
 Mauvaise expression régulière : %s
 Temps CPU
  Ce processus   (utilisateur système invité blkio): %6.2f %6.2f %6.2f %6.2f
  Processus fils (utilisateur système invitéà:       %6.2f %6.2f %6.2f
 Impossible d'obtenir les spécifications du terminal
 Impossible d'allouer de la mémoire au processus correspondant: %s
 Impossible de trouver le numéro du périphérique des sockets
 Utilisateur %s introuvable
 Impossible d'ouvrir le répertoire /proc: %s
 Impossible d'ouvrir /proc/net/unix : %s
 Impossible d'ouvrir un socket réseau.
 Impossible d'ouvrir le fichier protocole «%s»: %s
 Ne peut résoudre le port local %s: %s
 Impossible d'obtenir les stat de %s: %s
 Impossible d'obtenir les stat du fichier %s: %s
 Copyright (C) 1993-2009 Werner Almesberger et Craig Small

 Copyright (C) 1993-2010 Werner Almesberger et Craig Small

 Copyright (C) 1993-2012 Werner Almesberger et Craig Small

 Copyright (C) 2007 Trent Waddington

 Copyright (C) 2009 Craig Small

 Impossible de tuer le processus %d : %s
 Erreur lors de l'attachement au pid %i
 Paramètre incorrect pour «--namespace» Option incorrecte Format de temps incorrect Tuer %s(%s%d) ? (y/N)  Tuer le processus %d ? (y/N)  Tué %s(%s%d) avec le signal %d
 Mémoire
  Vsize:      %-10s
  RSS:        %-10s 		 Limite RSS: %s
  Début code: %#-10lx		 Fin code:  %#-10lx
  Début pile: %#-10lx
  Pointeur pile (ESP): %#10lx	 Pointeur inst. (EIP): %#10lx
 L'option «--namespace» requiert un paramètre. Aucune spécification de processus donnée Aucun processus trouvé.
 Aucun utilisateur portant ce nom: %s
 PSmisc ne fait l'objet d'AUCUNE GARANTIE.
C'est un logiciel libre, et vous pouvez le redistribuer
en respectant les termes de la licence GNU General Public License.
Pour plus de précisions à ce sujet, voir les fichiers nommés COPYING.
 Erreurs de page
  Ce processus   (mineur majeur): %8lu  %8lu
  Processus fils (mineur majeur): %8lu  %8lu
 Appuyez sur la touche Entrée pour fermer
 Le processus avec le pid %d n'existe pas.
 Processus, Groupe et ID de session
  ID processus: %d		  ID parent: %d
     ID groupe: %d		 ID session: %d
   ID groupe T: %d

 Processus: %-14s		État: %c (%s)
  CPU#:  %-3d		TTY: %s	Threads: %ld
 Ordonancement
  Politique:  %s
  Courtoisie: %ld 		 Priorité TR: %ld %s
 Envoyer signal %s(%s%d) ? (y/N)  Le nom de fichier %s n'existe pas.
 TERM n'est pas défini
 Impossible d'ouvrir le fichier stat du pid %d (%s)
 Port local AF inconnu %d
 Utilisation : fuser [-fMuvw] [-a|-s] [-4|-6] [-c|-m|-n ESPACE] [-k [-i] [-SIGNAL]] NOM...
              fuser -l
              fuser -V
Affiche les processus utilisant les fichiers, sockets ou systèmes de fichiers nommés.

  -a,--all              montre les fichiers inutilisés
  -i,--interactive      demande avant de fermer un processus (ignoré sans -k)
  -k,--kill             ferme les processus accédant au fichier spécifié
  -l,--list-signals     liste les noms des signaux
  -m,--mount            affiche les processus utilisant les systèmes de fichiers
                        ou les périphériques blocs spécifiés
  -M,--ismountpoint     exécute la requête seulement si NOM est un point de montage
  -n,--namespace ESPACE cherche dans l'espace de noms spécifiés (file, udp ou tcp)
  -s,--silent           mode silencieux
  -SIGNAL               envoie ce signal au lieu de SIGKILL
  -u,--user             affiche la liste des utilisateurs
  -v,--verbose          mode bavard
  -w,--writeonly        ferme uniquement les processus avec la permission en écriture
  -V,--version          affiche des informations sur la version
 Usage : killall [-Z CONTEXTE] [-u UTILISATEUR] [ -eIgiqrvw ] [ -SIGNAL ] NOM...
 Usage : killall [OPTION]... [--] NOM...
 Usage: peekfd [-8] [-n] [-c] [-d] [-V] [-h] <pid> [<fd> ..]
    -8 écrit des caractères sur 8 bits dans la sortie.
    -n n'affiche pas les lectures/écritures dans les en-têtes fd.
    -c examine également chaque nouveau processus fils.
    -d ignore les lectures/écritures dupliquées.
    -V affiche la version.
    -h affiche cet aide-mémoire.

  Appuyez sur CTRL-C pour interrompre.
 Usage: prtstat [options] PID ...
       prtstat -V
Affiche les informations au sujet d'un processus
    -r,--raw       Affiche les informations brutes
    -V,--version   Affiche la version et ne fait rien d'autre
 Vous ne pouvez utiliser que des fichiers avec les options de point de montage Vous ne pouvez pas rechercher simultanément et exclusivement les sockets IPv4 et IPv6 Vous devez spécifier au moins un PID. l'option «--all» ne peut être utilisée avec l'option «--silent» échec de asprintf dans print_stat.
 attente disque fuser (PSmisc) %s
 killall: %s n'a aucune entrée de processus (pas monté ?)
 killall: Mauvaise expression régulière : %s
 killall: Impossible d'obtenir l'UID à partir de l'état du processus
 killall: Le nombre maximum de noms est %d
 killall: Ignore la correspondance partielle %s(%d)
 demande de page peekfd (PSmisc) %s
 prtstat (PSmisc) %s
 pstree (PSmisc) %s
 en cours endormi tracé inconnu zombie 