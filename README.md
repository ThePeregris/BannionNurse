# BANNION NURSE | STANDALONE MODULE
**Automated Emergency Health Management System**
<a href="https://www.paypal.com/donate/?hosted_button_id=VLAFP6ZT8ATGU">
  <img src="https://github.com/ThePeregris/MainAssets/blob/main/Donate_PayPal.png" alt="Tips Appreciated!" align="right" width="120" height="75">
</a>
* **Version:** 10.3
* **Platform:** Turtle WoW (Client 1.12.1)
* **Author:** Bannion & Gemini

---

## 🇬🇧 ENGLISH INSTRUCTIONS

### 1. Technical Description
Bannion Nurse is a **"Standalone" module** (class-independent) dedicated to Emergency Health Management.

In the chaos of Vanilla combat, managing separate keybinds for Potions and different ranks of Bandages can be inefficient. This module acts as a smart decision engine that evaluates the player's combat state to determine the appropriate medical response instantly.

### 2. Key Features
* **⚔️ Combat Awareness:**
    The engine detects if you are currently affecting combat.
    * **IF IN COMBAT:** Checks if HP < 80%. Uses **Healthstones** (if available) or **Healing Potions**.
    * **IF OUT OF COMBAT:** Checks if HP < 90%. Switches to **Bandages** to conserve potions.

* **🎒 Intelligent Bag Scan:**
    Instead of requiring a macro for a specific item, the module scans your bags (0-4) in real-time. It prioritizes items based on quality:
    1.  Heavy Runecloth
    2.  Runecloth
    3.  Heavy Mageweave
    *(...down to Linen)*
    *It always selects the best available item found in your inventory.*

* **🛡️ Debuff Safety:**
    Before applying a bandage, it checks for the "Recently Bandaged" debuff to prevent wasting the action or generating error messages.

### 3. Installation Guide
1.  Navigate to your game folder: `WoW_Turtle\Interface\AddOns\`
2.  Create a new folder named: `BannionNurse`
3.  Place the **BannionNurse.toc** and **BannionNurse.lua** files inside that folder.

### 4. Commands & Usage
There is only one trigger command. You do not need arguments.

* **Command:** `/BNurse`
* **Command:** ALT + Key : Open First Aid Panel

### 5. Suggested Macros
The most efficient way to use this is to replace your standard Potion or Bandage button on your action bar with a macro.

**Macro 1: The Panic Button**
One button to save your life, regardless of the situation.
```lua
/BNurse
```

**Macro 2: Class Integration (Example: Rogue)**
You can combine it with defensive cooldowns for maximum efficiency.
```lua
/cast Evasion
/BNurse
```

### ⚠️ Technical Notes
* **Potions:** The addon looks for standard naming conventions (e.g., *Major Healing Potion*, *Superior Healing Potion*).
* **Self-Cast:** Ensure "Auto Self Cast" is enabled in your Interface Options for seamless bandage application while targeting enemies.

---

## 🇧🇷 INSTRUÇÕES EM PORTUGUÊS (PT-BR)

### 1. Descrição Técnica
O Bannion Nurse é um módulo "Standalone" (funciona independentemente da classe) dedicado à Gestão de Saúde de Emergência.

No caos do combate Vanilla, gerir atalhos separados para Poções e diferentes ranques de Ligaduras pode ser ineficiente. Este módulo atua como um motor de decisão inteligente que avalia o estado de combate do jogador para determinar a resposta médica apropriada instantaneamente.

### 2. Funcionalidades
* **⚔️ Consciência de Combate:**
    O motor detecta se você está atualmente em combate.
    * **SE EM COMBATE:** Verifica se Vida < 80%. Tenta usar **Healthstones** (se houver) ou **Poções de Cura**.
    * **SE FORA DE COMBATE:** Verifica se Vida < 90%. Alterna para **Ligaduras (Bandages)** para economizar poções.

* **🎒 Varredura Inteligente:**
    Em vez de exigir uma macro para um item específico, o módulo escaneia as suas bolsas (0-4) em tempo real. Ele prioriza itens com base na qualidade:
    1.  Heavy Runecloth
    2.  Runecloth
    3.  Heavy Mageweave
    *(...até Linen)*
    *Ele seleciona sempre o melhor item disponível no inventário.*

* **🛡️ Segurança de Debuff:**
    Antes de aplicar uma ligadura, ele verifica se você tem o debuff "Recently Bandaged" (Recentemente Enfaixado) para evitar erros e desperdício de tempo.

### 3. Instalação
1.  Navegue até a pasta do seu jogo: `WoW_Turtle\Interface\AddOns\`
2.  Crie uma pasta chamada: `BannionNurse`
3.  Coloque os ficheiros **BannionNurse.toc** e **BannionNurse.lua** dentro dessa pasta.

### 4. Comandos
Este é o comando de gatilho. Não precisa de argumentos.

* **Comando:** `/BNurse`

### 5. Macros Sugeridas
A forma mais eficiente de usar é substituir o seu botão padrão de Poção ou Ligadura na barra de ação por uma macro.

**Macro 1: O Botão de Pânico**
Um botão para salvar a sua vida, independentemente da situação.
```lua
/BNurse
```

**Macro 2: Integração de Classe (Exemplo: Rogue)**
Você pode combinar com cooldowns defensivos para máxima eficiência.
```lua
/cast Evasion
/BNurse
```

### ⚠️ Notas Técnicas
* **Poções:** O addon busca itens pelos nomes padrão em inglês (ex: *Major Healing Potion*).
* **Auto-Cast:** Certifique-se de que a opção "Auto Self Cast" esteja ativada nas Opções de Interface do jogo para aplicar ataduras sem precisar tirar o alvo do inimigo.

---
**Bannion Company - Precision is not an option, it's a requirement.**


