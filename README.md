BANNION NURSE | STANDALONE MODULE

Version: 1.0

Platform: Turtle WoW (Client 1.12.1)

Author: Bannion \& Gemini



=========================================================================



ENGLISH INSTRUCTIONS



Technical Description

Bannion Nurse is a "Standalone" module (class-independent) dedicated to

Emergency Health Management.



In the chaos of Vanilla combat, managing separate keybinds for Potions

and different ranks of Bandages can be inefficient. This module acts as

a smart decision engine that evaluates the player's combat state to

determine the appropriate medical response instantly.



Features



1\. Combat Awareness:

The engine detects if you are currently affecting combat.

\* IF IN COMBAT: It attempts to use a "Healing Potion" (Instant

health, but consumes potion cooldown).

\* IF OUT OF COMBAT: It switches to First Aid logic to conserve

precious potions.





2\. Intelligent Bandage Scan:

Instead of requiring a macro for a specific item, the module scans

your bags (0-4) in real-time. It prioritizes bandages based on

healing density:

1\. Heavy Runecloth

2\. Runecloth

3\. Heavy Mageweave

... down to Linen.

It always selects the best available bandage.





3\. Self-Targeting Enforcement:

Bandages require a target. The module automatically targets the

player, applies the bandage, and (if applicable) attempts to restore

the previous target, ensuring fluid gameplay.



Installation



1\. Navigate to your game folder: WoW\_Turtle\\Interface\\AddOns\\

2\. Create a folder named: BannionNurse

3\. Place the BannionNurse.toc and BannionNurse.lua files inside that folder.



Commands

/BNurse (or /BHeal)

This is the trigger command.



\* You do not need arguments.

\* Just type or bind this command.



Suggested Macros

The most efficient way to use this is to replace your standard Potion or

Bandage button on your action bar with a macro.



Macro 1: The Panic Button

One button to save your life, regardless of the situation.



```

&nbsp; /BNurse



```



Macro 2: Class Integration (Example: Rogue)

You can combine it with defensive cooldowns for maximum efficiency.



```

&nbsp; /cast Evasion

&nbsp; /BNurse



```



Technical Note on Potions

The addon attempts to cast "Healing Potion". Ensure you are carrying

items that match the standard naming conventions (e.g., Major Healing

Potion, Superior Healing Potion) or that the server recognizes the

generic spell call.



=========================================================================



INSTRUCOES EM PORTUGUES (PT-BR)



Descricao Tecnica

O Bannion Nurse e um modulo "Standalone" (funciona independentemente da

classe) dedicado a Gestao de Saude de Emergencia.



No caos do combate Vanilla, gerir atalhos separados para Pocoes e

diferentes ranques de Ligaduras pode ser ineficiente. Este modulo atua

como um motor de decisao inteligente que avalia o estado de combate do

jogador para determinar a resposta medica apropriada instantaneamente.



Funcionalidades



1\. Consciencia de Combate:

O motor detecta se voce esta atualmente em combate.

\* SE EM COMBATE: Tenta usar "Healing Potion" (Vida instantanea, mas

consome o cooldown de pocao).

\* SE FORA DE COMBATE: Alterna para a logica de Primeiros Socorros

para economizar pocoes valiosas.





2\. Varredura Inteligente de Ligaduras:

Em vez de exigir uma macro para um item especifico, o modulo escaneia

as suas bolsas (0-4) em tempo real. Ele prioriza ligaduras com base

na densidade de cura:

1\. Heavy Runecloth

2\. Runecloth

3\. Heavy Mageweave

... ate Linen.

Ele seleciona sempre a melhor ligadura disponivel no inventario.





3\. Auto-Alvo Forcado:

Ligaduras exigem um alvo. O modulo seleciona automaticamente o

jogador, aplica a ligadura e (se aplicavel) tenta restaurar o alvo

anterior, garantindo uma jogabilidade fluida.



Instalacao



1\. Navegue ate a pasta do seu jogo: WoW\_Turtle\\Interface\\AddOns\\

2\. Crie uma pasta chamada: BannionNurse

3\. Coloque os ficheiros BannionNurse.toc e BannionNurse.lua dentro dessa pasta.



Comandos

/BNurse (ou /BHeal)

Este e o comando de gatilho.



\* Nao precisa de argumentos.

\* Basta digitar ou criar um atalho para este comando.



Macros Sugeridas

A forma mais eficiente de usar e substituir o seu botao padrao de Pocao

ou Ligadura na barra de acao por uma macro.



Macro 1: O Botao de Panico

Um botao para salvar a sua vida, independentemente da situacao.



```

&nbsp; /BNurse



```



Macro 2: Integracao de Classe (Exemplo: Rogue)

Voce pode combinar com cooldowns defensivos para maxima eficiencia.



```

&nbsp; /cast Evasion

&nbsp; /BNurse



```



Nota Tecnica sobre Pocoes

O addon tenta castar "Healing Potion". Certifique-se de que esta

carregando itens que correspondam as convencoes de nomenclatura padrao

(ex: Major Healing Potion, Superior Healing Potion) ou que o servidor

reconheca a chamada generica do feitico.



=========================================================================

Bannion Company - Precision is not an option, it's a requirement.

