# micropo
Microprocesseur de type RISC avec pipeline

## Export en projet ISE

Tous les fichiers commençant par test_*.vhd doivent être déclarées en Simulation, les fichiers VHDL restants en Implémentation. 
Contenu du projet  :
- Le compteur d'instructions est implémenté avec  ip.vhd
- La mémoire des instructions est implémentée par mem_instr.vhd
- Les valeurs des registres sont gérées via banc_registre.vhd
- Les valeurs de la mémoire de données sont gérées via mem_donnees.vhd
- Les opérations arithmétiques se font grâce à l’UAL (fichier ual.vhd)
- Les aléas sont détectés avec  controleur_aleas.vhd
- Les différentes logiques de contrôles (LC) sont nommées par lc_*.vhd
- Les différents multiplexeurs (MUX) sont nommés par mux_*.vhd
- Les quatre pipelines sont représentés dans les fichiers ppl_*.vhd
- Ces différentes entitées sont liées pour former notre processeur dans le fichier micropo.vhd
- Un fichier du type test_[compo].vhd est un fichier qui simule le comportement du composant compo. 

## Utilisation de notre processeur “maison” 

1.	Vous pouvez, avant de lancer le processeur, initialiser les valeurs de registres, les valeurs de la mémoire et les instructions comme bon vous semble.
-  Nous avons mis des instructions (code ASM)  dans le fichier mem_instr.vhd mais il est possible de mettre d’autres instructions. Il faut pour celà changer les valeurs données au  signal MEM : MEM_TAB
-  Pour modifier les valeurs initiales des registres il faut modifier l’initialisation du signal BANC_REGISTRES : MEM_REG dans le fichier banc_registre.vhd
-  La mémoire de données peut être initalisée avec d’autres valeurs en modifiant  signal MEM_DONNEES : MEM_TAB  dans  mem_donnees.vhd

2.	Dans l’onglet “Simulation” de ISE, cliquer sur test_micropo et dans le panel en dessous, double-cliquer sur “Simulate Behavioural Model” . 


3.	ISim sera lancé et affichera le chronogramme résultant la simulation de notre processeur. Sur le côté il est possible de sélectionner les composants dont on veut voir les valeurs s’afficher sur le chronogramme (clic droit, Add Wave To Window). 
Gestion des aléas :
On s’intéresse dans ce projet uniquement à des aléas de type données. Pour résoudre cette classe d’aléas, il faut intervenir dans deux processus : lecture/écriture simultanées sur le banc de registre et contrôle des instructions circulants dans les pipelines.

-  Pour éviter de rajouter des décalages d’horloge (liés aux aléas), le banc de registre et la mémoire de données sont en lecture asynchrone et écriture synchrone. Comme indiqué dans le polycopié, nous avons fait un “bypass Q <= D” lorsqu’il qu’il y a une lecture et écriture concurrentielles détectées sur le même registre. 
-  Nous avons également implémenté un composant (asynchrone) controleur_aleas qui intervient la chaîne d’instructions circulés entre la mémoire des instructions et le premier pipeline LI/DI. Ce module compare les instructions (une instruction est de type OP A B C) aux 3 niveaux de pipeline (avant LI/DI, avant DI/EX et avant EX/MEM).
Avant d’arriver dans le premier pipeline LI/DI, si une instruction requiert une information sur un registre qui va être modifié par deux instructions qui la précèdent (instructions qui sont avant DI/EX et EX/MEM), alors le contrôleur considère qu’il y a un aléa. 
Si une situation d’aléa est détectée pour une instruction I, alors le contrôleur des aléas désactive l’incrémentation du compteur d’instruction et bloque la modification de la sortie de la mémoire des instructions en mettant le signal enable à ‘0’,  et injecte un NOP en entrée du pipeline LI/DI. 
L’instruction I sera injectée dans le pipeline LI/DI une fois qu’il n’y aura plus d’aléas.  Pour toute instruction d’entrée avec comme code d’opération NOP, AFC et LOAD ou “UU” (non initialisé) il n’y a donc jamais d’aléas. 
