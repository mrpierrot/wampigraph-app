# Introduction

WampiGraph est le pendant numerique de l'oeuvre Wampicôn du collège Jean Moulin d’Aubervilliers

WampiGraph est une application composé de deux modules :

* Un site de creation et de moderation des Wampums
* Une application "bureau" permettant la visualisation de la "rivière" de Wampums

Nous parlerons ici de la rivière. Pour la riviere, voir [Wampigraph Site](https://github.com/mrpierrot/wampigraph-site)

# Avant-Propos Technique

La rivière Wampigraph est une application écrite en Actionscript 3 (Flash) et compilé pour Adobe Air. 
Le projet de developpement est à utiliser avec Flash Developp. Ce dernier est un projet classique Air Flash Develop (F5 pour compiler ) et executer PackageApp.bat pour créer un package Adobe Air.  

# Fonctionnement

A interval regulier, l'application va chercher sur http://wampigraph.net  les nouveaux motifs à afficher sur la riviere. 
La liste est triée par ordre decroissant, ce qui veut dire que les nouveaux motifs sont affichés en premier. 
