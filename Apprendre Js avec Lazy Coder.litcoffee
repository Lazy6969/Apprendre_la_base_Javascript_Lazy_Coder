### 1. Les Variables (Stockage de données)
C'est comme des boîtes pour ranger des informations.
*   `const` : Pour une valeur qui **ne change pas** (à utiliser par défaut).
*   `let` : Pour une valeur qui **peut changer**.
*   `var` : Ancienne méthode (évitez de l'utiliser).

```javascript
const prenom = "Alice"; // Ne changera pas
let age = 25;           // Peut changer
age = 26;               // OK
// prenom = "Bob";      // ERREUR : const est fixe
```

### 2. Les Types de Données
JavaScript reconnaît plusieurs types d'informations :

```javascript
let texte = "Bonjour";      // String (Chaîne de caractères)
let nombre = 42;            // Number (Nombre)
let estVrai = true;         // Boolean (Vrai/Faux)
let rien = null;            // Null (Vide volontaire)
let indefini;               // Undefined (Pas encore défini)
```

### 3. Les Opérateurs
Pour faire des calculs ou des comparaisons.

```javascript
// Mathématiques
let sum = 10 + 5;   // 15
let mul = 2 * 3;    // 6

// Comparaison (Renvoie true ou false)
let egal = (5 === 5);      // true (égal)
let plusGrand = (10 > 5);  // true

// Logique
let test = (true && false); // false (ET)
let test2 = (true || false); // true (OU)
```

### 4. Les Conditions (Si... Alors...)
Permet de prendre des décisions dans le code.

```javascript
let heure = 14;

if (heure < 12) {
    console.log("Bonjour");
} else if (heure < 18) {
    console.log("Bon après-midi");
} else {
    console.log("Bonsoir");
}
```

### 5. Les Boucles (Répétition)
Pour répéter une action plusieurs fois.

```javascript
// Boucle For (la plus courante)
for (let i = 0; i < 5; i++) {
    console.log("Tour numéro : " + i); // Affiche 0 à 4
}

// Boucle While (Tant que...)
let compteur = 0;
while (compteur < 3) {
    console.log("Compteur : " + compteur);
    compteur++;
}
```

### 6. Les Fonctions
Des blocs de code réutilisables.

```javascript
// Déclaration classique
function direBonjour(nom) {
    return "Salut " + nom;
}

// Fonction Fléchée (Moderne - ES6)
const ajouter = (a, b) => {
    return a + b;
};

// Utilisation
console.log(direBonjour("Paul")); // "Salut Paul"
console.log(ajouter(2, 3));       // 5
```

### 7. Tableaux (Arrays) et Objets
Pour stocker des listes ou des données structurées.

```javascript
// Tableau (Liste ordonnée)
const fruits = ["Pomme", "Banane", "Orange"];
console.log(fruits[0]); // "Pomme" (commence à 0)
fruits.push("Kiwi");    // Ajoute à la fin

// Objet (Données avec clés)
const utilisateur = {
    nom: "Dupont",
    age: 30,
    estConnecte: true
};
console.log(utilisateur.nom); // "Dupont"
```

### 8. Le DOM (Interagir avec la page Web)
C'est ici que JavaScript modifie le HTML.

**HTML de base :**
```html
<h1 id="titre">Titre original</h1>
<button id="btn">Cliquez-moi</button>
```

**JavaScript :**
```javascript
// 1. Sélectionner un élément
const titre = document.getElementById("titre");
const bouton = document.getElementById("btn");

// 2. Modifier le contenu
titre.innerHTML = "Nouveau Titre !";
titre.style.color = "red";

// 3. Écouter un événement (Click)
bouton.addEventListener("click", () => {
    alert("Vous avez cliqué !");
    titre.innerHTML = "Click détecté !";
});
```

### 9. Astuces Modernes (ES6+)
Pour écrire du code plus propre.

*   **Template Literals** (Guillemets inverses `` ` ``) :
    ```javascript
    const nom = "Jean";
    console.log(`Bonjour ${nom}`); // Bonjour Jean
    ```
*   **Destructuring** (Extraire des données) :
    ```javascript
    const [fruit1, fruit2] = ["Pomme", "Poire"];
    // fruit1 = "Pomme", fruit2 = "Poire"
    ```

---

### 📝 Résumé pour débuter
1.  Déclarez vos variables avec `const` ou `let`.
2.  Utilisez des **fonctions** pour organiser votre code.
3.  Utilisez des **tableaux** pour les listes et des **objets** pour les profils.
4.  Utilisez le **DOM** (`document.querySelector`, `addEventListener`) pour rendre la page interactive.
5.  Ouvrez la **Console du navigateur** (F12) pour tester votre code et voir les erreurs.

**Conseil :** La meilleure façon d'apprendre est de **pratiquer**. Copiez ces exemples, modifiez-les et voyez ce qui se passe !


### ASSISTANT
Voici le guide **ultime et complet** pour maîtriser le DOM (Document Object Model) en JavaScript. Le DOM est l'interface qui permet à JavaScript de modifier la structure, le style et le contenu de votre page HTML.

Pour que les exemples fonctionnent, imaginez que vous avez ce code **HTML** de base dans votre page :

```html
<!-- HTML DE RÉFÉRENCE POUR LES EXEMPLES -->
<div id="container">
    <h1 class="titre" id="main-title">Mon Site</h1>
    <p class="texte">Ceci est un paragraphe.</p>
    <ul id="liste">
        <li class="item">Élément 1</li>
        <li class="item">Élément 2</li>
    </ul>
    <button id="btn-action">Cliquez-moi</button>
    <input type="text" id="input-nom" placeholder="Votre nom">
</div>
```

---

### 1. Sélectionner des Éléments (Selection)
C'est la première étape : trouver l'élément à modifier.

| Méthode | Description | Exemple |
| :--- | :--- | :--- |
| `getElementById` | Sélectionne par ID (le plus rapide). | `const titre = document.getElementById('main-title');` |
| `querySelector` | Sélectionne le **premier** élément (CSS selector). | `const premierLi = document.querySelector('.item');` |
| `querySelectorAll` | Sélectionne **tous** les éléments (renvoie une NodeList). | `const tousLi = document.querySelectorAll('.item');` |
| `getElementsByClassName` | Sélectionne par classe (collection "live"). | `const items = document.getElementsByClassName('item');` |

💡 **Conseil :** Privilégiez toujours `querySelector` et `querySelectorAll` pour leur flexibilité.

---

### 2. Navigation dans l'Arbre (Traversal)
Se déplacer entre les éléments (Parent, Enfant, Frère).

```javascript
const el = document.querySelector('.texte');

// PARENTS
el.parentElement;          // Le parent direct (div#container)
el.closest('div');         // Le plus proche ancêtre qui correspond (très utile !)

// ENFANTS
const container = document.getElementById('container');
container.children;        // Tous les enfants éléments (HTMLCollection)
container.firstElementChild; // Premier enfant
container.lastElementChild;  // Dernier enfant

// FRÈRES (Siblings)
el.nextElementSibling;     // L'élément suivant (ex: ul#liste)
el.previousElementSibling; // L'élément précédent (ex: h1)
```

---

### 3. Manipuler le Contenu (Content)
Changer ce qui est écrit à l'intérieur des balises.

```javascript
const titre = document.getElementById('main-title');

// 1. Texte seul (Sécurisé, échappe le HTML)
titre.textContent = "Nouveau Titre"; 

// 2. HTML autorisé (Attention aux failles XSS si contenu utilisateur)
titre.innerHTML = "<span style='color:red'>Titre Coloré</span>";

// 3. Texte visible (Prend en compte le CSS, plus lent)
titre.innerText = "Titre Visible"; 
```

---

### 4. Manipuler les Attributs et Classes
Modifier les propriétés des balises (`src`, `href`, `class`, `id`).

```javascript
const img = document.querySelector('img'); // Imaginons une image
const btn = document.getElementById('btn-action');

// ATTRIBUTS GÉNÉRAUX
img.getAttribute('src');           // Lire un attribut
img.setAttribute('src', 'photo.jpg'); // Modifier un attribut
img.removeAttribute('alt');        // Supprimer un attribut

// CLASSES (Le plus important pour le style)
btn.classList.add('active');       // Ajouter une classe
btn.classList.remove('active');    // Retirer une classe
btn.classList.toggle('active');    // Ajouter si absent, retirer si présent
btn.classList.contains('active');  // Vérifie si la classe existe (true/false)
```

---

### 5. Créer et Supprimer des Éléments (Creation/Deletion)
Ajouter ou retirer du HTML dynamiquement.

```javascript
// 1. CRÉATION
const nouveauLi = document.createElement('li'); // Crée <li></li>
nouveauLi.textContent = "Élément 3";
nouveauLi.classList.add('item');

// 2. INSERTION
const liste = document.getElementById('liste');
liste.appendChild(nouveauLi);      // Ajoute à la fin
liste.prepend(nouveauLi);          // Ajoute au début
// liste.insertBefore(nouveauLi, liste.children[1]); // Insère à une position précise

// 3. SUPPRESSION
nouveauLi.remove();                // Supprime l'élément lui-même (Moderne)
liste.removeChild(nouveauLi);      // Ancienne méthode (Parent.removeChild)
```

---

### 6. Les Événements (Events)
Réagir aux actions de l'utilisateur (clic, clavier, souris...).

```javascript
const btn = document.getElementById('btn-action');

// Écouter un événement
btn.addEventListener('click', (event) => {
    console.log("Bouton cliqué !");
    console.log(event.target); // L'élément cliqué
});

// Événements courants
// 'submit' : Formulaire envoyé
// 'input'   : Quand on tape dans un champ (à chaque lettre)
// 'change'  : Quand on quitte un champ après modification
// 'keydown' : Quand une touche est enfoncée
// 'mouseover' : Quand la souris passe dessus

// Exemple avec prévention (ex: formulaire)
const form = document.querySelector('form');
form.addEventListener('submit', (e) => {
    e.preventDefault(); // Empêche le rechargement de la page
    console.log("Formulaire soumis sans rechargement");
});
```

---

### 7. Gestion des Formulaires (Forms)
Récupérer les données saisies par l'utilisateur.

```javascript
const input = document.getElementById('input-nom');

// Récupérer la valeur
const valeur = input.value; 

// Modifier la valeur
input.value = "Jean";

// Désactiver / Activer
input.disabled = true; 

// Exemple complet : Lire et afficher
const btn = document.getElementById('btn-action');
btn.addEventListener('click', () => {
    const nom = input.value;
    if(nom) {
        alert("Bonjour " + nom);
        input.value = ""; // Vider le champ
    }
});
```

---

### 8. Dimensions et Position (Geometry)
Savoir où se trouve un élément ou sa taille (utile pour le scroll ou les animations).

```javascript
const el = document.querySelector('.titre');

// TAILLE
el.offsetWidth;   // Largeur totale (avec padding/border)
el.offsetHeight;  // Hauteur totale
el.clientWidth;   // Largeur visible (sans scrollbar)

// POSITION
el.getBoundingClientRect(); // Objet {top, left, right, bottom, width, height}
                            // Par rapport à la fenêtre visible

// SCROLL (Fenêtre)
window.scrollY;   // Position verticale du scroll
window.scrollTo(0, 0); // Remonter en haut de page
```

---

### 9. Bonne Pratique Avancée : Délégation d'Événements
Si vous avez 100 boutons, n'ajoutez pas 100 écouteurs. Ajoutez-en **un seul** sur le parent.

```javascript
const liste = document.getElementById('liste');

// On écoute les clics sur la liste UL, pas sur les LI
liste.addEventListener('click', (e) => {
    // Vérifier si ce qu'on a cliqué est un LI
    if (e.target.tagName === 'LI') {
        console.log("Item cliqué : " + e.target.textContent);
        e.target.style.color = "blue";
    }
});

// Avantage : Fonctionne même pour les éléments ajoutés dynamiquement après !
```

---

### 📋 Récapitulatif des Méthodes Indispensables

| Catégorie | Méthodes à connaître par cœur |
| :--- | :--- |
| **Sélection** | `querySelector`, `querySelectorAll` |
| **Contenu** | `textContent`, `innerHTML` |
| **Classes** | `classList.add`, `classList.toggle` |
| **Attributs** | `setAttribute`, `getAttribute` |
| **Création** | `createElement`, `appendChild` |
| **Événements** | `addEventListener`, `e.preventDefault()` |
| **Navigation** | `parentElement`, `closest`, `children` |

### 🚀 Exercice pour valider vos acquis
Créez une "To-Do List" simple :
1.  Un input pour écrire la tâche.
2.  Un bouton "Ajouter".
3.  Quand on clique, un nouvel élément `<li>` s'ajoute dans une `<ul>`.
4.  Si on clique sur un `<li>`, il devient barré (`text-decoration: line-through`).
5.  Ajoutez un bouton "Supprimer" à côté de chaque tâche.

Si vous réussissez cet exercice, **vous maîtrisez le DOM !**