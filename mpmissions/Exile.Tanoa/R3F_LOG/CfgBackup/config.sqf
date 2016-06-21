/**
 * MAIN CONFIGURATION FILE
 * 
 * English and French comments
 * Commentaires anglais et français
 * 
 * (EN)
 * This file contains the configuration variables of the logistics system.
 * For the configuration of the creation factory, see the file "config_creation_factory.sqf".
 * IMPORTANT NOTE : when a logistics feature is given to an object/vehicle class name, all the classes which inherit
 *                  of the parent/generic class (according to the CfgVehicles) will also have this feature.
 *                  CfgVehicles tree view example : http://madbull.arma.free.fr/A3_stable_1.20.124746_CfgVehicles_tree.html
 * 
 * (FR)
 * Fichier contenant les variables de configuration du système de logistique.
 * Pour la configuration de l'usine de création, voir le fichier "config_creation_factory.sqf".
 * NOTE IMPORTANTE : lorsqu'une fonctionnalité logistique est accordée à un nom de classe d'objet/véhicule, les classes
 *                   héritant de cette classe mère/générique (selon le CfgVehicles) se verront également dotées de cette fonctionnalité.
 *                   Exemple d'arborescence du CfgVehicles : http://madbull.arma.free.fr/A3_stable_1.20.124746_CfgVehicles_tree.html
 */

/**
 * DISABLE LOGISTICS ON OBJECTS BY DEFAULT
 * 
 * (EN)
 * Define if objects and vehicles have logistics features by default,
 * or if it must be allowed explicitely on specific objects/vehicles.
 * 
 * If false : all objects are enabled according to the class names listed in this configuration file
 *            You can disable some objects with : object setVariable ["R3F_LOG_disabled", true];
 * If true :  all objects are disabled by default
 *            You can enable some objects with : object setVariable ["R3F_LOG_disabled", false];
 * 
 * 
 * (FR)
 * Défini si les objets et véhicules disposent des fonctionnalités logistiques par défaut,
 * ou si elles doivent être autorisés explicitement sur des objets/véhicules spécifiques.
 * 
 * Si false : tous les objets sont actifs en accord avec les noms de classes listés dans ce fichier
 *            Vous pouvez désactiver certains objets avec : objet setVariable ["R3F_LOG_disabled", true];
 * Si true :  tous les objets sont inactifs par défaut
 *            Vous pouvez activer quelques objets avec : objet setVariable ["R3F_LOG_disabled", false];
 */
R3F_LOG_CFG_disabled_by_default = false;

/**
 * LOCK THE LOGISTICS FEATURES TO SIDE, FACTION OR PLAYER
 * 
 * (EN)
 * Define the lock mode of the logistics features for an object.
 * An object can be locked to the a side, faction, a player (respawn) or a unit (life).
 * If the object is locked, the player can unlock it according to the
 * value of the config variable R3F_LOG_CFG_unlock_objects_timer.
 * 
 * If "none" : no lock features, everyone can used the logistics features.
 * If "side" : the object is locked to the last side which interacts with it.
 * If "faction" : the object is locked to the last faction which interacts with it.
 * If "player" : the object is locked to the last player which interacts with it. The lock is transmitted after respawn.
 * If "unit" : the object is locked to the last player which interacts with it. The lock is lost when the unit dies.
 * 
 * Note : for military objects (not civilian), the lock is initialized to the object's side.
 * 
 * See also the config variable R3F_LOG_CFG_unlock_objects_timer.
 * 
 * (FR)
 * Défini le mode de verrouillage des fonctionnalités logistics pour un objet donné.
 * Un objet peut être verrouillé pour une side, une faction, un joueur (respawn) ou une unité (vie).
 * Si l'objet est verrouillé, le joueur peut le déverrouiller en fonction de la
 * valeur de la variable de configiration R3F_LOG_CFG_unlock_objects_timer.
 * 
 * Si "none" : pas de verrouillage, tout le monde peut utiliser les fonctionnalités logistiques.
 * Si "side" : l'objet est verrouillé pour la dernière side ayant interagit avec lui.
 * Si "faction" : l'objet est verrouillé pour la dernière faction ayant interagit avec lui.
 * Si "player" : l'objet est verrouillé pour le dernier joueur ayant interagit avec lui. Le verrou est transmis après respawn.
 * Si "unit" : l'objet est verrouillé pour le dernier joueur ayant interagit avec lui. Le verrou est perdu quand l'unité meurt.
 * 
 * Note : pour les objets militaires (non civils), le verrou est initialisé à la side de l'objet.
 * 
 * Voir aussi la variable de configiration R3F_LOG_CFG_unlock_objects_timer.
 */
R3F_LOG_CFG_lock_objects_mode = "none";

/**
 * COUNTDOWN TO UNLOCK AN OBJECT
 * 
 * Define the countdown duration (in seconds) to unlock a locked object.
 * Set to -1 to deny the unlock of objects.
 * See also the config variable R3F_LOG_CFG_lock_objects_mode.
 * 
 * Défini la durée (en secondes) du compte-à-rebours pour déverrouiller un objet.
 * Mettre à -1 pour qu'on ne puisse pas déverrouiller les objets.
 * Voir aussi la variable de configiration R3F_LOG_CFG_lock_objects_mode.
 */
R3F_LOG_CFG_unlock_objects_timer = 30;

/**
 * ALLOW NO GRAVITY OVER GROUND
 * 
 * Define if movable objects with no gravity simulation can be set in height over the ground (no ground contact).
 * The no gravity objects corresponds to most of decoration and constructions items.
 * 
 * Défini si les objets déplaçable sans simulation de gravité peuvent être position en hauteur sans être contact avec le sol.
 * Les objets sans gravité correspondent à la plupart des objets de décors et de construction.
 */
R3F_LOG_CFG_no_gravity_objects_can_be_set_in_height_over_ground = true;

/**
 * LANGUAGE
 * 
 * Automatic language selection according to the game language.
 * New languages can be easily added (read below).
 * 
 * Sélection automatique de la langue en fonction de la langue du jeu.
 * De nouveaux langages peuvent facilement être ajoutés (voir ci-dessous).
 */
R3F_LOG_CFG_language = switch (language) do
{
	case "English":{"en"};
	case "French":{"fr"};
	
	// Feel free to create you own language file named "XX_strings_lang.sqf", where "XX" is the language code.
	// Make a copy of an existing language file (e.g. en_strings_lang.sqf) and translate it.
	// Then add a line with this syntax : case "YOUR_GAME_LANGUAGE":{"LANGUAGE_CODE"};
	// For example :
	
	//case "Czech":{"cz"}; // Not supported. Need your own "cz_strings_lang.sqf"
	//case "Polish":{"pl"}; // Not supported. Need your own "pl_strings_lang.sqf"
	//case "Portuguese":{"pt"}; // Not supported. Need your own "pt_strings_lang.sqf"
	//case "YOUR_GAME_LANGUAGE":{"LANGUAGE_CODE"};  // Need your own "LANGUAGE_CODE_strings_lang.sqf"
	
	default {"en"}; // If language is not supported, use English
};

/**
 * CONDITION TO ALLOW LOGISTICS
 * 
 * (EN)
 * This variable allow to set a dynamic SQF condition to allow/deny all logistics features only on specific clients.
 * The variable must be a STRING delimited by quotes and containing a valid SQF condition to evaluate during the game.
 * For example you can allow logistics only on few clients having a known game ID by setting the variable to :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Or based on the profile name : "profileName in [""john"", ""jack"", ""james""]"
 * Or only for the server admin : "serverCommandAvailable "#kick"""
 * The condition is evaluted in real time, so it can use condition depending on the mission progress : "alive officer && taskState task1 == ""Succeeded"""
 * Or to deny logistics in a circular area defined by a marker : "player distance getMarkerPos ""markerName"" > getMarkerSize ""markerName"" select 0"
 * Note that quotes of the strings inside the string condition must be doubled.
 * Note : if the condition depends of the aimed objects/vehicle, you can use the command cursorTarget
 * To allow the logistics to everyone, just set the condition to "true".
 * 
 * (FR)
 * Cette variable permet d'utiliser une condition SQF dynamique pour autoriser ou non les fonctions logistiques sur des clients spécifiques.
 * La variable doit être une CHAINE de caractères délimitée par des guillemets et doit contenir une condition SQF valide qui sera évaluée durant la mission.
 * Par exemple pour autoriser la logistique sur seulement quelques joueurs ayant un ID de jeu connu, la variable peut être défini comme suit :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Ou elle peut se baser sur le nom de profil : "profileName in [""maxime"", ""martin"", ""marc""]"
 * Ou pour n'autoriser que l'admin de serveur : "serverCommandAvailable "#kick"""
 * Les condition sont évaluées en temps réel, et peuvent donc dépendre du déroulement de la mission : "alive officier && taskState tache1 == ""Succeeded"""
 * Ou pour interdire la logistique dans la zone défini par un marqueur circulaire : "player distance getMarkerPos ""markerName"" > getMarkerSize ""markerName"" select 0"
 * Notez que les guillemets des chaînes de caractères dans la chaîne de condition doivent être doublés.
 * Note : si la condition dépend de l'objet/véhicule pointé, vous pouvez utiliser la commande cursorTarget
 * Pour autoriser la logistique chez tout le monde, il suffit de définir la condition à "true".
 */
R3F_LOG_CFG_string_condition_allow_logistics_on_this_client = "true";

/**
 * CONDITION TO ALLOW CREATION FACTORY
 * 
 * (EN)
 * This variable allow to set a dynamic SQF condition to allow/deny the access to the creation factory only on specific clients.
 * The variable must be a STRING delimited by quotes and containing a valid SQF condition to evaluate during the game.
 * For example you can allow the creation factory only on few clients having a known game ID by setting the variable to :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Or based on the profile name : "profileName in [""john"", ""jack"", ""james""]"
 * Or only for the server admin : "serverCommandAvailable "#kick"""
 * Note that quotes of the strings inside the string condition must be doubled.
 * Note : if the condition depends of the aimed objects/véhicule, you can use the command cursorTarget
 * Note also that the condition is evaluted in real time, so it can use condition depending on the mission progress :
 * "alive officer && taskState task1 == ""Succeeded"""
 * To allow the creation factory to everyone, just set the condition to "true".
 * 
 * (FR)
 * Cette variable permet d'utiliser une condition SQF dynamique pour rendre accessible ou non l'usine de création sur des clients spécifiques.
 * La variable doit être une CHAINE de caractères délimitée par des guillemets et doit contenir une condition SQF valide qui sera évaluée durant la mission.
 * Par exemple pour autoriser l'usine de création sur seulement quelques joueurs ayant un ID de jeu connu, la variable peut être défini comme suit :
 * "getPlayerUID player in [""76xxxxxxxxxxxxxxx"", ""76yyyyyyyyyyyyyyy"", ""76zzzzzzzzzzzzzzz""]"
 * Ou elle peut se baser sur le nom de profil : "profileName in [""maxime"", ""martin"", ""marc""]"
 * Ou pour n'autoriser que l'admin de serveur : "serverCommandAvailable "#kick"""
 * Notez que les guillemets des chaînes de caractères dans la chaîne de condition doivent être doublés.
 * Note : si la condition dépend de l'objet/véhicule pointé, vous pouvez utiliser la commande cursorTarget
 * Notez aussi que les condition sont évaluées en temps réel, et peuvent donc dépendre du déroulement de la mission :
 * "alive officier && taskState tache1 == ""Succeeded"""
 * Pour autoriser l'usine de création chez tout le monde, il suffit de définir la condition à "true".
 */
R3F_LOG_CFG_string_condition_allow_creation_factory_on_this_client = "false";

/*
 ********************************************************************************************
 * BELOW IS THE CLASS NAMES CONFIGURATION / CI-DESSOUS LA CONFIGURATION DES NOMS DE CLASSES *
 ********************************************************************************************
 * 
 * (EN)
 * There are two ways to manage new objects with the logistics system. The first one is to add these objects in the
 * following appropriate lists. The second one is to create a new external file in the /addons_config/ directory,
 * based on /addons_config/TEMPLATE.sqf, and to add a #include below to.
 * The first method is better to add/fix only some various class names.
 * The second method is better to take into account an additional addon.
 * 
 * These variables are based on the inheritance principle according to the CfgVehicles tree.
 * It means that a features accorded to a class name, is also accorded to all child classes.
 * Inheritance tree view : http://madbull.arma.free.fr/A3_1.32_CfgVehicles_tree.html
 * 
 * (FR)
 * Deux moyens existent pour gérer de nouveaux objets avec le système logistique. Le premier consiste à ajouter
 * ces objets dans les listes appropriées ci-dessous. Le deuxième est de créer un fichier externe dans le répertoire
 * /addons_config/ basé sur /addons_config/TEMPLATE.sqf, et d'ajouter un #include ci-dessous.
 * La première méthode est préférable lorsqu'il s'agit d'ajouter ou corriger quelques classes diverses.
 * La deuxième méthode est préférable s'il s'agit de prendre en compte le contenu d'un addon supplémentaire.
 * 
 * Ces variables sont basées sur le principe d'héritage utilisés dans l'arborescence du CfgVehicles.
 * Cela signifie qu'une fonctionnalité accordée à une classe, le sera aussi pour toutes ses classes filles.
 * Vue de l'arborescence d'héritage : http://madbull.arma.free.fr/A3_1.32_CfgVehicles_tree.html
 */

/****** LIST OF ADDONS CONFIG TO INCLUDE / LISTE DES CONFIG D'ADDONS A INCLURE ******/
#include "addons_config\A3_vanilla.sqf"
//#include "addons_config\All_in_Arma.sqf"
//#include "addons_config\R3F_addons.sqf"
//#include "addons_config\YOUR_ADDITIONAL_ADDON.sqf"

/****** TOW WITH VEHICLE / REMORQUER AVEC VEHICULE ******/

/**
 * List of class names of ground vehicles which can tow objects.
 * Liste des noms de classes des véhicules terrestres pouvant remorquer des objets.
 */
R3F_LOG_CFG_can_tow = R3F_LOG_CFG_can_tow +
[
	// e.g. : "MyTowingVehicleClassName1", "MyTowingVehicleClassName2"
	

			///////////////////////////////////////////////////////////////////////////////
			// Ikarus
			///////////////////////////////////////////////////////////////////////////////
			"Exile_Car_Ikarus_Blue",
			"Exile_Car_Ikarus_Red",
			"Exile_Car_Ikarus_Party",
			
			///////////////////////////////////////////////////////////////////////////////
			// SUVXL
			///////////////////////////////////////////////////////////////////////////////
			"Exile_Car_SUVXL_Black",
			
			///////////////////////////////////////////////////////////////////////////////
			// SUV
			///////////////////////////////////////////////////////////////////////////////
			"Exile_Car_SUV_Red",
			"Exile_Car_SUV_Black",
			"Exile_Car_SUV_Grey",
			"Exile_Car_SUV_Orange",
			
			///////////////////////////////////////////////////////////////////////////////
			// Ural (Open)
			///////////////////////////////////////////////////////////////////////////////
			"Exile_Car_Ural_Open_Blue",
			"Exile_Car_Ural_Open_Yellow",
			"Exile_Car_Ural_Open_Worker",
			"Exile_Car_Ural_Open_Military",

			///////////////////////////////////////////////////////////////////////////////
			// Ural (Covered)
			///////////////////////////////////////////////////////////////////////////////
			"Exile_Car_Ural_Covered_Blue",
			"Exile_Car_Ural_Covered_Yellow",
			"Exile_Car_Ural_Covered_Worker",
			"Exile_Car_Ural_Covered_Military",
			
			///////////////////////////////////////////////////////////////////////////////
			// HEMMT
			///////////////////////////////////////////////////////////////////////////////
			"Exile_Car_HEMMT",

			///////////////////////////////////////////////////////////////////////////////
			// Hunter
			///////////////////////////////////////////////////////////////////////////////
			"Exile_Car_Hunter",

			///////////////////////////////////////////////////////////////////////////////
			// Ifrit
			///////////////////////////////////////////////////////////////////////////////
			"Exile_Car_Ifrit",

			///////////////////////////////////////////////////////////////////////////////
			// Offroad
			///////////////////////////////////////////////////////////////////////////////
			"Exile_Car_Offroad_Red",
			"Exile_Car_Offroad_Beige",
			"Exile_Car_Offroad_White",
			"Exile_Car_Offroad_Blue",
			"Exile_Car_Offroad_DarkRed",
			"Exile_Car_Offroad_BlueCustom",
			"Exile_Car_Offroad_Guerilla01",
			"Exile_Car_Offroad_Guerilla02",
			"Exile_Car_Offroad_Guerilla03",
			"Exile_Car_Offroad_Guerilla04",
			"Exile_Car_Offroad_Guerilla05",
			"Exile_Car_Offroad_Guerilla06",
			"Exile_Car_Offroad_Guerilla07",
			"Exile_Car_Offroad_Guerilla08",
			"Exile_Car_Offroad_Guerilla09",
			"Exile_Car_Offroad_Guerilla10",
			"Exile_Car_Offroad_Guerilla11",
			"Exile_Car_Offroad_Guerilla12",
			"Exile_Car_Offroad_Rusty1",
			"Exile_Car_Offroad_Rusty2",
			"Exile_Car_Offroad_Rusty3",

			///////////////////////////////////////////////////////////////////////////////
			// Offroad (Armed)
			///////////////////////////////////////////////////////////////////////////////
			"Exile_Car_Offroad_Armed_Guerilla01",
			"Exile_Car_Offroad_Armed_Guerilla02",
			"Exile_Car_Offroad_Armed_Guerilla03",
			"Exile_Car_Offroad_Armed_Guerilla04",
			"Exile_Car_Offroad_Armed_Guerilla05",
			"Exile_Car_Offroad_Armed_Guerilla06",
			"Exile_Car_Offroad_Armed_Guerilla07",
			"Exile_Car_Offroad_Armed_Guerilla08",
			"Exile_Car_Offroad_Armed_Guerilla09",
			"Exile_Car_Offroad_Armed_Guerilla10",
			"Exile_Car_Offroad_Armed_Guerilla11",
			"Exile_Car_Offroad_Armed_Guerilla12",

			///////////////////////////////////////////////////////////////////////////////
			// Offroad (Repair)
			///////////////////////////////////////////////////////////////////////////////
			"Exile_Car_Offroad_Repair_Civillian",
			"Exile_Car_Offroad_Repair_Red",
			"Exile_Car_Offroad_Repair_Beige",
			"Exile_Car_Offroad_Repair_White",
			"Exile_Car_Offroad_Repair_Blue",
			"Exile_Car_Offroad_Repair_DarkRed",
			"Exile_Car_Offroad_Repair_BlueCustom",
			"Exile_Car_Offroad_Repair_Guerilla01",
			"Exile_Car_Offroad_Repair_Guerilla02",
			"Exile_Car_Offroad_Repair_Guerilla03",
			"Exile_Car_Offroad_Repair_Guerilla04",
			"Exile_Car_Offroad_Repair_Guerilla05",
			"Exile_Car_Offroad_Repair_Guerilla06",
			"Exile_Car_Offroad_Repair_Guerilla07",
			"Exile_Car_Offroad_Repair_Guerilla08",
			"Exile_Car_Offroad_Repair_Guerilla09",
			"Exile_Car_Offroad_Repair_Guerilla10",
			"Exile_Car_Offroad_Repair_Guerilla11",
			"Exile_Car_Offroad_Repair_Guerilla12",

			///////////////////////////////////////////////////////////////////////////////
			// Strider
			///////////////////////////////////////////////////////////////////////////////
			"Exile_Car_Strider",
			
			///////////////////////////////////////////////////////////////////////////////
			// Tempest
			///////////////////////////////////////////////////////////////////////////////
			"Exile_Car_Tempest",
			
			///////////////////////////////////////////////////////////////////////////////
			// Van (Box) 
			///////////////////////////////////////////////////////////////////////////////
			"Exile_Car_Van_Box_Black",
			"Exile_Car_Van_Box_White",
			"Exile_Car_Van_Box_Red",
			"Exile_Car_Van_Box_Guerilla01",
			"Exile_Car_Van_Box_Guerilla02",
			"Exile_Car_Van_Box_Guerilla03",
			"Exile_Car_Van_Box_Guerilla04",
			"Exile_Car_Van_Box_Guerilla05",
			"Exile_Car_Van_Box_Guerilla06",
			"Exile_Car_Van_Box_Guerilla07",
			"Exile_Car_Van_Box_Guerilla08",

			///////////////////////////////////////////////////////////////////////////////
			// Van (Fuel) 
			///////////////////////////////////////////////////////////////////////////////
			"Exile_Car_Van_Fuel_Black",
			"Exile_Car_Van_Fuel_White",
			"Exile_Car_Van_Fuel_Red",
			"Exile_Car_Van_Fuel_Guerilla01",
			"Exile_Car_Van_Fuel_Guerilla02",
			"Exile_Car_Van_Fuel_Guerilla03",

			///////////////////////////////////////////////////////////////////////////////
			// Zamak
			///////////////////////////////////////////////////////////////////////////////
			"Exile_Car_Zamak",
			
			///////////////////////////////////////////////////////////////////////////////
			// RHS Vehicles
			///////////////////////////////////////////////////////////////////////////////
			
			"rhs_tigr_ffv_3camo_vdv",
			"rhs_tigr_ffv_vdv",
			"rhs_tigr_3camo_vdv",
			"rhs_tigr_vdv",	
			"rhs_gaz66_r142_vmf",
			"rhs_gaz66_repair_vmf",
			"rhs_gaz66_vmf",
			"rhs_gaz66_flat_vdv",
			"rhs_gaz66o_vdv",
			"rhs_gaz66o_flat_vdv",
			"rhs_gaz66_ammo_vmf",
			"rhs_gaz66_vv",
			"rhs_gaz66_msv",
			"rhs_gaz66_flat_vmf",
			"rhs_gaz66_flat_vv",
			"rhs_gaz66_flat_msv",
			"rhs_gaz66o_vmf",
			"rhs_gaz66o_vv",
			"rhs_gaz66o_msv",
			"rhs_gaz66o_flat_vmf",
			"rhs_gaz66o_flat_vv",
			"rhs_gaz66o_flat_msv",
			"rhs_gaz66_r142_vdv",
			"rhs_gaz66_r142_msv",
			"rhs_gaz66_r142_vv",
			"rhs_gaz66_repair_vdv",
			"rhs_gaz66_repair_vv",
			"rhs_gaz66_repair_msv",
			"rhsusf_m1025_w",
			"rhsusf_m1025_w_m2",
			"rhsusf_m998_w_2dr",
			"rhsusf_m998_w_4dr",
			"rhsusf_m998_w_s_2dr_fulltop",
			"rhsusf_m998_d_s_2dr_fulltop",
			"rhsusf_m998_w_s_2dr_halftop",
			"rhsusf_m998_d_s_2dr_halftop",
			"rhsusf_m998_d_s_4dr_fulltop",
			"rhsusf_m998_w_s_4dr_fulltop",
			"rhsusf_m998_d_s_4dr_halftop",
			"rhsusf_m998_w_s_4dr_halftop",
			"rhsusf_M1078A1P2_wd_fmtv_usarmy",
			"rhsusf_M1078A1P2_d_fmtv_usarmy",
			"rhsusf_M1078A1P2_wd_open_fmtv_usarmy",
			"rhsusf_M1078A1P2_d_open_fmtv_usarmy",
			"rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy",
			"rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_d_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_wd_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_d_open_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_wd_flatbed_fmtv_usarmy",
			"rhsusf_M1078A1P2_B_d_flatbed_fmtv_usarmy",
			"rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy",
			"rhsusf_M1083A1P2_B_M2_d_Medical_fmtv_usarmy",			
			"rhsusf_rg33_d",
			"rhsusf_rg33_wd",
			"rhs_uaz_vmf",
			"rhs_uaz_open_vmf",
			"RHS_Ural_Open_Civ_01",
			"RHS_Ural_Open_Civ_02",
			"RHS_Ural_Open_Civ_03",
			"RHS_Ural_MSV_01",
			"RHS_Ural_VDV_01",
			"RHS_Ural_VMF_01",
			"RHS_Ural_VV_01",
			"RHS_Ural_Flat_MSV_01",
			"RHS_Ural_Flat_VDV_01",
			"RHS_Ural_Flat_VMF_01",
			"RHS_Ural_Flat_VV_01",
			"RHS_Ural_Open_MSV_01",
			"RHS_Ural_Open_VDV_01",
			"RHS_Ural_Open_VMF_01",
			"RHS_Ural_Open_VV_01",
			"RHS_Ural_Open_Flat_MSV_01",
			"RHS_Ural_Open_Flat_VDV_01",
			"RHS_Ural_Open_Flat_VMF_01",
			"RHS_Ural_Open_Flat_VV_01",
			"RHS_Ural_Fuel_MSV_01",
			"RHS_Ural_Fuel_VDV_01",
			"RHS_Ural_Fuel_VMF_01",
			"RHS_Ural_Fuel_VV_01",
			"rhs_btr60_vmf",
			"rhs_btr60_vdv",
			"rhs_btr60_vv",
			"rhs_btr60_msv",
			"rhsusf_rg33_m2_d",
			"rhsusf_rg33_m2_wd",
			"rhsusf_rg33_usmc_d",
			"rhsusf_rg33_usmc_wd",
			"rhsusf_rg33_m2_usmc_d",
			"rhsusf_rg33_m2_usmc_wd",
			"rhs_typhoon_vdv",
			//"RHS_BTR70",
			//"RHS_BTR70_MSV",
			"RHS_BTR70_VDV",
			//"RHS_BTR70_VMF",
			//"RHS_BTR70_VV",
			"RHS_BTR80_MSV",
			//"RHS_BTR80_VDV",
			//"RHS_BTR80_VMF",
			//"RHS_BTR80A_VDV",
			//"RHS_BTR80A_VMF",
			//"RHS_BTR80A_VV",	
			"RHS_BTR80_VV",
			"RHS_BTR80A_MSV",

			////////////////////////////////////////////////////////
			// Arma 3 Cars
			////////////////////////////////////////////////////////
			
			"B_G_Offroad_01_F",
			"B_G_Offroad_01_repair_F",
			"B_MRAP_01_F",
			"O_MRAP_02_F",
			"I_MRAP_03_F",
			
			////////////////////////////////////////////////////////
			// Arma 3 Trucks
			////////////////////////////////////////////////////////
			
			"B_Truck_01_transport_F",
			"B_Truck_01_covered_F",
			"B_Truck_01_mover_F",
			"B_Truck_01_box_F",
			"B_Truck_01_Repair_F", 
			"B_Truck_01_ammo_F",
			"B_Truck_01_fuel_F",
			"B_Truck_01_medical_F", 
			"B_G_Van_01_transport_F", 
			"B_G_Van_01_fuel_F",
			"O_G_Offroad_01_repair_F", 
			"O_G_Offroad_01_F",
			"O_Truck_02_covered_F",
			"O_Truck_02_transport_F", 
			"O_Truck_03_transport_F",
			"O_Truck_03_covered_F",
			"O_Truck_03_repair_F",
			"O_Truck_03_ammo_F",
			"O_Truck_03_fuel_F",
			"O_Truck_03_medical_F", 
			"O_Truck_03_device_F",
			"O_Truck_02_box_F",
			"O_Truck_02_medical_F", 
			"O_Truck_02_Ammo_F",
			"O_Truck_02_fuel_F",
			"O_G_Van_01_transport_F",
			"O_G_Van_01_fuel_F",
			"I_G_Offroad_01_F",
			"I_G_Offroad_01_armed_F", 
			"I_Truck_02_transport_F",
			"I_Truck_02_ammo_F",
			"I_Truck_02_box_F",
			"I_Truck_02_medical_F", 
			"I_Truck_02_fuel_F",
			"I_G_Van_01_transport_F", 
			"I_G_Van_01_fuel_F",
			
			////////////////////////////////////////////////////////
			// Arma 3 armed
			////////////////////////////////////////////////////////
			
			"B_G_Offroad_01_armed_F", 
			"O_G_Offroad_01_armed_F",
			"B_MRAP_01_gmg_F", 
			"B_MRAP_01_hmg_F",
			"O_MRAP_02_gmg_F",  
			"O_MRAP_02_hmg_F",
			"I_MRAP_03_hmg_F", 
			"I_MRAP_03_gmg_F",
			"B_APC_Wheeled_01_cannon_F", 			
			"I_APC_Wheeled_03_cannon_F",
			
			////////////////////////////////////////////////////////
			// Arma 3 Tanks
			////////////////////////////////////////////////////////
			
			"B_APC_Tracked_01_rcws_F",
			"B_APC_Tracked_01_CRV_F",
			"B_APC_Tracked_01_AA_F",
			"B_MBT_01_arty_F",
			"B_MBT_01_mlrs_F",
			"B_MBT_01_TUSK_F",
			"O_APC_Tracked_02_cannon_F", 
			"O_APC_Tracked_02_AA_F",
			"O_MBT_02_cannon_F",
			"O_MBT_02_arty_F",
			"O_APC_Wheeled_02_rcws_F", 
			"I_APC_tracked_03_cannon_F",
			"I_MBT_03_cannon_F",

			/////////////////////////////////////////////////////////
			// HVP Vehicles
			/////////////////////////////////////////////////////////

			"Mrshounka_Vandura_civ",
			"Mrshounka_Vandura_civ_bleufonce",
			"Mrshounka_Vandura_civ_grise",
			"Mrshounka_Vandura_civ_jaune",
			"Mrshounka_Vandura_civ_noir",
			"Mrshounka_Vandura_civ_orange",
			"Mrshounka_Vandura_civ_rose",
			"Mrshounka_Vandura_civ_rouge",
			"Mrshounka_Vandura_civ_violet",
			"Mr_Own_hummer_civ_noir",
			"Mr_Own_hummer_civ_bleufonce",
			"Mr_Own_hummer_civ_grise",
			"Mr_Own_hummer_civ_jaune",
			"Mr_Own_hummer_civ_orange",
			"Mr_Own_hummer_civ_rose",
			"Mr_Own_hummer_civ_rouge",
			"Mr_Own_hummer_civ_violet",
			"SIG_Roadrunner",
			"SIG_Hubcaps",
			"SIG_Magnums",
			"SIG_Hcode",
			"shounka_avalanche_bleufonce",
			"shounka_avalanche_grise",
			"shounka_avalanche_jaune",
			"shounka_avalanche_noir",
			"shounka_avalanche_orange",
			"shounka_avalanche_rose",
			"shounka_avalanche_rouge",
			"shounka_avalanche_violet",
			"SIG_Superbee",
			"SIG_SuperbeeY",
			"SIG_SuperbeeB",
			"SIG_SuperbeeL",
			"SIG_SuperbeeM",
			"SIG_SuperbeeG",
			"Mr_Own_dodge15_civ",
			"Mr_Own_dodge15_civ_bleufonce",
			"Mr_Own_dodge15_civ_grise",
			"Mr_Own_dodge15_civ_jaune",
			"Mr_Own_dodge15_civ_noir",
			"Mr_Own_dodge15_civ_orange",
			"Mr_Own_dodge15_civ_rose",
			"Mr_Own_dodge15_civ_rouge",
			"Mr_Own_dodge15_civ_violet",
			"shounka_monsteur_bleufonce",
			"shounka_monsteur_grise",
			"shounka_monsteur_jaune",
			"shounka_monsteur_noir",
			"shounka_monsteur_orange",
			"shounka_monsteur_rose",
			"shounka_monsteur_rouge",
			"shounka_monsteur_violet",
			"shounka_a3_dafxf_euro6_f",
			"shounka_ivceco_bleufonce",
			"shounka_ivceco_grise",
			"shounka_ivceco_jaune",
			"shounka_ivceco_noir",
			"shounka_ivceco_orange",
			"shounka_ivceco_rose",
			"shounka_ivceco_rouge",
			"shounka_ivceco_violet"
];

/**
 * List of class names of objects which can be towed.
 * Liste des noms de classes des objets remorquables.
 */
R3F_LOG_CFG_can_be_towed = R3F_LOG_CFG_can_be_towed +
[
	// e.g. : "MyTowableObjectClassName1", "MyTowableObjectClassName2"
			
			"Exile_Bike_QuadBike_Black",
			"Exile_Bike_QuadBike_Blue",
			"Exile_Bike_QuadBike_Red",
			"Exile_Bike_QuadBike_White",
			"Exile_Bike_QuadBike_Nato",
			"Exile_Bike_QuadBike_Csat",
			"Exile_Bike_QuadBike_Fia",
			"Exile_Bike_QuadBike_Guerilla01",
			"Exile_Bike_QuadBike_Guerilla02",
			"Exile_Car_Hatchback_Beige",
			"Exile_Car_Hatchback_Green",
			"Exile_Car_Hatchback_Blue",
			"Exile_Car_Hatchback_BlueCustom",
			"Exile_Car_Hatchback_BeigeCustom",
			"Exile_Car_Hatchback_Yellow",
			"Exile_Car_Hatchback_Grey",
			"Exile_Car_Hatchback_Black",
			"Exile_Car_Hatchback_Dark",
			"Exile_Car_Hatchback_Rusty1",
			"Exile_Car_Hatchback_Rusty2",
			"Exile_Car_Hatchback_Rusty3",
			"Exile_Car_SUVXL_Black",
			"Exile_Car_Lada_Green",
			"Exile_Car_Lada_Taxi",
			"Exile_Car_Lada_Red",
			"Exile_Car_Lada_White",
			"Exile_Car_Lada_Hipster",
			"Exile_Car_Volha_Blue",
			"Exile_Car_Volha_White",
			"Exile_Car_Volha_Black",
			"Exile_Car_Hatchback_Sport_Red",
			"Exile_Car_Hatchback_Sport_Blue",
			"Exile_Car_Hatchback_Sport_Orange",
			"Exile_Car_Hatchback_Sport_White",
			"Exile_Car_Hatchback_Sport_Beige",
			"Exile_Car_Hatchback_Sport_Green",
			"Exile_Car_Hunter",
			"Exile_Car_Ifrit",
			"Exile_Car_Offroad_Red",
			"Exile_Car_Offroad_Beige",
			"Exile_Car_Offroad_White",
			"Exile_Car_Offroad_Blue",
			"Exile_Car_Offroad_DarkRed",
			"Exile_Car_Offroad_BlueCustom",
			"Exile_Car_Offroad_Guerilla01",
			"Exile_Car_Offroad_Guerilla02",
			"Exile_Car_Offroad_Guerilla03",
			"Exile_Car_Offroad_Guerilla04",
			"Exile_Car_Offroad_Guerilla05",
			"Exile_Car_Offroad_Guerilla06",
			"Exile_Car_Offroad_Guerilla07",
			"Exile_Car_Offroad_Guerilla08",
			"Exile_Car_Offroad_Guerilla09",
			"Exile_Car_Offroad_Guerilla10",
			"Exile_Car_Offroad_Guerilla11",
			"Exile_Car_Offroad_Guerilla12",
			"Exile_Car_Offroad_Rusty1",
			"Exile_Car_Offroad_Rusty2",
			"Exile_Car_Offroad_Rusty3",
			"Exile_Car_Offroad_Armed_Guerilla01",
			"Exile_Car_Offroad_Armed_Guerilla02",
			"Exile_Car_Offroad_Armed_Guerilla03",
			"Exile_Car_Offroad_Armed_Guerilla04",
			"Exile_Car_Offroad_Armed_Guerilla05",
			"Exile_Car_Offroad_Armed_Guerilla06",
			"Exile_Car_Offroad_Armed_Guerilla07",
			"Exile_Car_Offroad_Armed_Guerilla08",
			"Exile_Car_Offroad_Armed_Guerilla09",
			"Exile_Car_Offroad_Armed_Guerilla10",
			"Exile_Car_Offroad_Armed_Guerilla11",
			"Exile_Car_Offroad_Armed_Guerilla12",
			"Exile_Car_Offroad_Repair_Civillian",
			"Exile_Car_Offroad_Repair_Red",
			"Exile_Car_Offroad_Repair_Beige",
			"Exile_Car_Offroad_Repair_White",
			"Exile_Car_Offroad_Repair_Blue",
			"Exile_Car_Offroad_Repair_DarkRed",
			"Exile_Car_Offroad_Repair_BlueCustom",
			"Exile_Car_Offroad_Repair_Guerilla01",
			"Exile_Car_Offroad_Repair_Guerilla02",
			"Exile_Car_Offroad_Repair_Guerilla03",
			"Exile_Car_Offroad_Repair_Guerilla04",
			"Exile_Car_Offroad_Repair_Guerilla05",
			"Exile_Car_Offroad_Repair_Guerilla06",
			"Exile_Car_Offroad_Repair_Guerilla07",
			"Exile_Car_Offroad_Repair_Guerilla08",
			"Exile_Car_Offroad_Repair_Guerilla09",
			"Exile_Car_Offroad_Repair_Guerilla10",
			"Exile_Car_Offroad_Repair_Guerilla11",
			"Exile_Car_Offroad_Repair_Guerilla12",
			"Exile_Car_Strider",
			"Exile_Car_SUV_Red",
			"Exile_Car_SUV_Black",
			"Exile_Car_SUV_Grey",
			"Exile_Car_SUV_Orange",
			"Exile_Car_Van_Black",
			"Exile_Car_Van_White",
			"Exile_Car_Van_Red",
			"Exile_Car_Van_Guerilla01",
			"Exile_Car_Van_Guerilla02",
			"Exile_Car_Van_Guerilla03",
			"Exile_Car_Van_Guerilla04",
			"Exile_Car_Van_Guerilla05",
			"Exile_Car_Van_Guerilla06",
			"Exile_Car_Van_Guerilla07",
			"Exile_Car_Van_Guerilla08",
			"Exile_Car_Van_Box_Black",
			"Exile_Car_Van_Box_White",
			"Exile_Car_Van_Box_Red",
			"Exile_Car_Van_Box_Guerilla01",
			"Exile_Car_Van_Box_Guerilla02",
			"Exile_Car_Van_Box_Guerilla03",
			"Exile_Car_Van_Box_Guerilla04",
			"Exile_Car_Van_Box_Guerilla05",
			"Exile_Car_Van_Box_Guerilla06",
			"Exile_Car_Van_Box_Guerilla07",
			"Exile_Car_Van_Box_Guerilla08",
			"Exile_Car_Van_Fuel_Black",
			"Exile_Car_Van_Fuel_White",
			"Exile_Car_Van_Fuel_Red",
			"Exile_Car_Van_Fuel_Guerilla01",
			"Exile_Car_Van_Fuel_Guerilla02",
			"Exile_Car_Van_Fuel_Guerilla03",
			
			///////////////////////////////////////////////////////////////////////////////
			// RHS Vehicles
			///////////////////////////////////////////////////////////////////////////////
			
			"rhs_tigr_ffv_3camo_vdv",
			"rhs_tigr_ffv_vdv",
			"rhs_tigr_3camo_vdv",
			"rhs_tigr_vdv",	
			"rhsusf_m1025_w",
			"rhsusf_m1025_w_m2",
			"rhsusf_m998_w_2dr",
			"rhsusf_m998_w_4dr",
			"rhsusf_m998_w_s_2dr_fulltop",
			"rhsusf_m998_d_s_2dr_fulltop",
			"rhsusf_m998_w_s_2dr_halftop",
			"rhsusf_m998_d_s_2dr_halftop",
			"rhsusf_m998_d_s_4dr_fulltop",
			"rhsusf_m998_w_s_4dr_fulltop",
			"rhsusf_m998_d_s_4dr_halftop",
			"rhsusf_m998_w_s_4dr_halftop",	
			"rhsusf_rg33_d",
			"rhsusf_rg33_wd",
			"rhs_uaz_vmf",
			"rhs_uaz_open_vmf",
			
			////////////////////////////////////////////////////////
			// Arma 3 Cars
			////////////////////////////////////////////////////////
			
			"B_G_Offroad_01_F",
			"B_G_Offroad_01_repair_F", 
			"B_G_Quadbike_01_F",
			"B_MRAP_01_F",
			"B_Quadbike_01_F",
			"O_G_Quadbike_01_F",
			"O_Quadbike_01_F",
			"I_Quadbike_01_F",
			"I_G_Quadbike_01_F",
			
			////////////////////////////////////////////////////////
			// Arma 3 Trucks
			////////////////////////////////////////////////////////
			
			"B_G_Van_01_transport_F", 
			"B_G_Van_01_fuel_F",
			"O_G_Offroad_01_repair_F", 
			"O_G_Offroad_01_F",
			"O_G_Van_01_transport_F",
			"O_G_Van_01_fuel_F",
			"I_G_Offroad_01_F",
			"I_G_Offroad_01_armed_F",
			"I_G_Van_01_transport_F", 
			"I_G_Van_01_fuel_F",
			
			////////////////////////////////////////////////////////
			// Arma 3 armed
			////////////////////////////////////////////////////////
			
			"B_G_Offroad_01_armed_F", 
			"O_G_Offroad_01_armed_F",
			
			////////////////////////////////////////////////////////
			// HVP Vehicles
			////////////////////////////////////////////////////////
			
			"Mrshounka_yamaha_p_bf",
			"Mrshounka_yamaha_p_g",
			"Mrshounka_yamaha_p_j",
			"Mrshounka_yamaha_p_noir",
			"Mrshounka_yamaha_p_o",
			"Mrshounka_yamaha_p_rose",
			"Mrshounka_yamaha_p_r",
			"Mrshounka_yamaha_p_v",
			"Mrshounka_a3_308_civ_bleufonce",
			"Mrshounka_a3_308_civ_grise",
			"Mrshounka_a3_308_civ_jaune",
			"Mrshounka_a3_308_civ_noir",
			"Mrshounka_a3_308_civ_orange",
			"Mrshounka_a3_308_civ_rose",
			"Mrshounka_a3_308_civ_rouge",
			"Mrshounka_a3_308_civ_violet",
			"shounka_buggy_bleufonce",
			"shounka_buggy_grise",
			"shounka_buggy_jaune",
			"shounka_buggy_noir",
			"shounka_buggy_orange",
			"shounka_buggy_rose",
			"shounka_buggy_rouge",
			"shounka_buggy_violet",
			"Mrshounka_corbillard_c_bleufonce",
			"Mrshounka_corbillard_c_grise",
			"Mrshounka_corbillard_c_jaune",
			"Mrshounka_corbillard_c_noir",
			"Mrshounka_corbillard_c_orange",
			"Mrshounka_corbillard_c_rose",
			"Mrshounka_corbillard_c_rouge",
			"Mrshounka_corbillard_c_violet",
			"Mr_Own_buggy_bleufonce",
			"Mr_Own_buggy_grise",
			"Mr_Own_buggy_jaune",
			"Mr_Own_buggy_noir",
			"Mr_Own_buggy_orange",
			"Mr_Own_buggy_rose",
			"Mr_Own_buggy_rouge",
			"Mr_Own_buggy_violet",
			"shounka_limo_civ_bleufonce",
			"shounka_limo_civ_grise",
			"shounka_limo_civ_jaune",
			"shounka_limo_civ_noir",
			"shounka_limo_civ_orange",
			"shounka_limo_civ_rose",
			"shounka_limo_civ_violet",
			"shounka_f430_spider_bleufonce",
			"shounka_f430_spider_grise",
			"shounka_f430_spider_jaune",
			"shounka_f430_spider_noir",
			"shounka_f430_spider_rose",
			"shounka_f430_spider_rouge",
			"shounka_f430_spider_violet",
			"Mrshounka_lykan_c_bleufonce",
			"Mrshounka_lykan_c_grise",
			"Mrshounka_lykan_c_jaune",
			"Mrshounka_lykan_c_noir",
			"Mrshounka_lykan_c_orange",
			"Mrshounka_lykan_c_rose",
			"Mrshounka_lykan_c_rouge",
			"Mrshounka_lykan_c_violet",
			"Mrshounka_Vandura_civ",
			"Mrshounka_Vandura_civ_bleufonce",
			"Mrshounka_Vandura_civ_grise",
			"Mrshounka_Vandura_civ_jaune",
			"Mrshounka_Vandura_civ_noir",
			"Mrshounka_Vandura_civ_orange",
			"Mrshounka_Vandura_civ_rose",
			"Mrshounka_Vandura_civ_rouge",
			"Mrshounka_Vandura_civ_violet",
			"Mr_Own_hummer_civ_noir",
			"Mr_Own_hummer_civ_bleufonce",
			"Mr_Own_hummer_civ_grise",
			"Mr_Own_hummer_civ_jaune",
			"Mr_Own_hummer_civ_orange",
			"Mr_Own_hummer_civ_rose",
			"Mr_Own_hummer_civ_rouge",
			"Mr_Own_hummer_civ_violet",
			"SIG_Roadrunner",
			"SIG_Hubcaps",
			"SIG_Magnums",
			"SIG_Hcode",
			"shounka_avalanche_bleufonce",
			"shounka_avalanche_grise",
			"shounka_avalanche_jaune",
			"shounka_avalanche_noir",
			"shounka_avalanche_orange",
			"shounka_avalanche_rose",
			"shounka_avalanche_rouge",
			"shounka_avalanche_violet",
			"SIG_Superbee",
			"SIG_SuperbeeY",
			"SIG_SuperbeeB",
			"SIG_SuperbeeL",
			"SIG_SuperbeeM",
			"SIG_SuperbeeG",
			"Mr_Own_dodge15_civ",
			"Mr_Own_dodge15_civ_bleufonce",
			"Mr_Own_dodge15_civ_grise",
			"Mr_Own_dodge15_civ_jaune",
			"Mr_Own_dodge15_civ_noir",
			"Mr_Own_dodge15_civ_orange",
			"Mr_Own_dodge15_civ_rose",
			"Mr_Own_dodge15_civ_rouge",
			"Mr_Own_dodge15_civ_violet"
];


/****** LIFT WITH VEHICLE / HELIPORTER AVEC VEHICULE ******/

/**
 * List of class names of helicopters which can lift objects.
 * Liste des noms de classes des hélicoptères pouvant héliporter des objets.
 */
R3F_LOG_CFG_can_lift = R3F_LOG_CFG_can_lift +
[
	// e.g. : "MyLifterVehicleClassName1", "MyLifterVehicleClassName2"
	// Here comes the Classname for the Chopper can Lift
	
];

/**
 * List of class names of objects which can be lifted.
 * Liste des noms de classes des objets héliportables.
 */
R3F_LOG_CFG_can_be_lifted = R3F_LOG_CFG_can_be_lifted +
[
	// e.g. : "MyLiftableObjectClassName1", "MyLiftableObjectClassName2"
	// Here comes the Classname for the Vehicle which can be Lifted
	
];


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/

/*
* (EN)
 * This section uses a numeric quantification of capacity and cost of the objets.
 * For example, in a vehicle has a capacity of 100, we will be able to load in 5 objects costing 20 capacity units.
 * The capacity doesn't represent a real volume or weight, but a choice made for gameplay.
 * 
 * (FR)
 * Cette section utilise une quantification numérique de la capacité et du coût des objets.
 * Par exemple, dans un véhicule d'une capacité de 100, nous pouvons charger 5 objets coûtant 20 unités de capacité.
 * La capacité ne représente ni un poids, ni un volume, mais un choix fait pour la jouabilité.
 */

/**
 * List of class names of vehicles or cargo objects which can transport objects.
 * The second element of the nested arrays is the load capacity (in relation with the capacity cost of the objects).
 * 
 * Liste des noms de classes des véhicules ou "objets contenant" pouvant transporter des objets.
 * Le deuxième élément des sous-tableaux est la capacité de chargement (en relation avec le coût de capacité des objets).
 */
R3F_LOG_CFG_can_transport_cargo = R3F_LOG_CFG_can_transport_cargo +
[
	// e.g. : ["MyTransporterClassName1", itsCapacity], ["MyTransporterClassName2", itsCapacity]
	// Here Comes the Vehicle which can Load Stuff 	
	
			["Exile_Bike_QuadBike_Black",50],
			["Exile_Bike_QuadBike_Blue",50],
			["Exile_Bike_QuadBike_Red",50],
			["Exile_Bike_QuadBike_White",50],
			["Exile_Bike_QuadBike_Nato",50],
			["Exile_Bike_QuadBike_Csat",50],
			["Exile_Bike_QuadBike_Fia",50],
			["Exile_Bike_QuadBike_Guerilla01",50],
			["Exile_Bike_QuadBike_Guerilla02",50],

			///////////////////////////////////////////////////////////////////////////////
			// KARTS
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Kart_BluKing",20],
			["Exile_Car_Kart_RedStone",20],
			["Exile_Car_Kart_Vrana",20],
			["Exile_Car_Kart_Green",20],
			["Exile_Car_Kart_Blue",20],
			["Exile_Car_Kart_Orange",20],
			["Exile_Car_Kart_White",20],
			["Exile_Car_Kart_Yellow",20],
			["Exile_Car_Kart_Black",20],
			
			///////////////////////////////////////////////////////////////////////////////
			// Hatchback
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Hatchback_Beige",100],
			["Exile_Car_Hatchback_Green",100],
			["Exile_Car_Hatchback_Blue",100],
			["Exile_Car_Hatchback_BlueCustom",100],
			["Exile_Car_Hatchback_BeigeCustom",100],
			["Exile_Car_Hatchback_Yellow",100],
			["Exile_Car_Hatchback_Grey",100],
			["Exile_Car_Hatchback_Black",100],
			["Exile_Car_Hatchback_Dark",100],
			["Exile_Car_Hatchback_Rusty1",100],
			["Exile_Car_Hatchback_Rusty2",100],
			["Exile_Car_Hatchback_Rusty3",100],

			///////////////////////////////////////////////////////////////////////////////
			// Ikarus
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Ikarus_Blue",330],
			["Exile_Car_Ikarus_Red",330],
			["Exile_Car_Ikarus_Party",330],
			
			///////////////////////////////////////////////////////////////////////////////
			// SUVXL
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_SUVXL_Black",110],

			///////////////////////////////////////////////////////////////////////////////
			// Lada
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Lada_Green",80],
			["Exile_Car_Lada_Taxi",80],
			["Exile_Car_Lada_Red",80],
			["Exile_Car_Lada_White",80],
			["Exile_Car_Lada_Hipster",80],

			///////////////////////////////////////////////////////////////////////////////
			// Volha
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Volha_Blue",80],
			["Exile_Car_Volha_White",80],
			["Exile_Car_Volha_Black",80],

			///////////////////////////////////////////////////////////////////////////////
			// Hatchback (Sport)
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Hatchback_Sport_Red",100],
			["Exile_Car_Hatchback_Sport_Blue",100],
			["Exile_Car_Hatchback_Sport_Orange",100],
			["Exile_Car_Hatchback_Sport_White",100],
			["Exile_Car_Hatchback_Sport_Beige",100],
			["Exile_Car_Hatchback_Sport_Green",100],
			
			///////////////////////////////////////////////////////////////////////////////
			// SUV
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_SUV_Red",100],
			["Exile_Car_SUV_Black",100],
			["Exile_Car_SUV_Grey",100],
			["Exile_Car_SUV_Orange",100],
			
			///////////////////////////////////////////////////////////////////////////////
			// Van 
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Van_Black",250],
			["Exile_Car_Van_White",250],
			["Exile_Car_Van_Red",250],
			["Exile_Car_Van_Guerilla01",250],
			["Exile_Car_Van_Guerilla02",250],
			["Exile_Car_Van_Guerilla03",250],
			["Exile_Car_Van_Guerilla04",250],
			["Exile_Car_Van_Guerilla05",250],
			["Exile_Car_Van_Guerilla06",250],
			["Exile_Car_Van_Guerilla07",250],
			["Exile_Car_Van_Guerilla08",250],
			
			///////////////////////////////////////////////////////////////////////////////
			// Ural (Open)
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Ural_Open_Blue",330],
			["Exile_Car_Ural_Open_Yellow",330],
			["Exile_Car_Ural_Open_Worker",330],
			["Exile_Car_Ural_Open_Military",330],

			///////////////////////////////////////////////////////////////////////////////
			// Ural (Covered)
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Ural_Covered_Blue",280],
			["Exile_Car_Ural_Covered_Yellow",280],
			["Exile_Car_Ural_Covered_Worker",280],
			["Exile_Car_Ural_Covered_Military",280],
			
			///////////////////////////////////////////////////////////////////////////////
			// HEMMT
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_HEMMT",390],

			///////////////////////////////////////////////////////////////////////////////
			// Hunter
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Hunter",110],

			///////////////////////////////////////////////////////////////////////////////
			// Ifrit
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Ifrit",100],

			///////////////////////////////////////////////////////////////////////////////
			// Offroad
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Offroad_Red",110],
			["Exile_Car_Offroad_Beige",110],
			["Exile_Car_Offroad_White",110],
			["Exile_Car_Offroad_Blue",110],
			["Exile_Car_Offroad_DarkRed",110],
			["Exile_Car_Offroad_BlueCustom",110],
			["Exile_Car_Offroad_Guerilla01",110],
			["Exile_Car_Offroad_Guerilla02",110],
			["Exile_Car_Offroad_Guerilla03",110],
			["Exile_Car_Offroad_Guerilla04",110],
			["Exile_Car_Offroad_Guerilla05",110],
			["Exile_Car_Offroad_Guerilla06",110],
			["Exile_Car_Offroad_Guerilla07",110],
			["Exile_Car_Offroad_Guerilla08",110],
			["Exile_Car_Offroad_Guerilla09",110],
			["Exile_Car_Offroad_Guerilla10",110],
			["Exile_Car_Offroad_Guerilla11",110],
			["Exile_Car_Offroad_Guerilla12",110],
			["Exile_Car_Offroad_Rusty1",110],
			["Exile_Car_Offroad_Rusty2",110],
			["Exile_Car_Offroad_Rusty3",110],

			///////////////////////////////////////////////////////////////////////////////
			// Offroad (Armed)
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Offroad_Armed_Guerilla01",70],
			["Exile_Car_Offroad_Armed_Guerilla02",70],
			["Exile_Car_Offroad_Armed_Guerilla03",70],
			["Exile_Car_Offroad_Armed_Guerilla04",70],
			["Exile_Car_Offroad_Armed_Guerilla05",70],
			["Exile_Car_Offroad_Armed_Guerilla06",70],
			["Exile_Car_Offroad_Armed_Guerilla07",70],
			["Exile_Car_Offroad_Armed_Guerilla08",70],
			["Exile_Car_Offroad_Armed_Guerilla09",70],
			["Exile_Car_Offroad_Armed_Guerilla10",70],
			["Exile_Car_Offroad_Armed_Guerilla11",70],
			["Exile_Car_Offroad_Armed_Guerilla12",70],

			///////////////////////////////////////////////////////////////////////////////
			// Offroad (Repair)
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Offroad_Repair_Civillian",70],
			["Exile_Car_Offroad_Repair_Red",70],
			["Exile_Car_Offroad_Repair_Beige",70],
			["Exile_Car_Offroad_Repair_White",70],
			["Exile_Car_Offroad_Repair_Blue",70],
			["Exile_Car_Offroad_Repair_DarkRed",70],
			["Exile_Car_Offroad_Repair_BlueCustom",70],
			["Exile_Car_Offroad_Repair_Guerilla01",70],
			["Exile_Car_Offroad_Repair_Guerilla02",70],
			["Exile_Car_Offroad_Repair_Guerilla03",70],
			["Exile_Car_Offroad_Repair_Guerilla04",70],
			["Exile_Car_Offroad_Repair_Guerilla05",70],
			["Exile_Car_Offroad_Repair_Guerilla06",70],
			["Exile_Car_Offroad_Repair_Guerilla07",70],
			["Exile_Car_Offroad_Repair_Guerilla08",70],
			["Exile_Car_Offroad_Repair_Guerilla09",70],
			["Exile_Car_Offroad_Repair_Guerilla10",70],
			["Exile_Car_Offroad_Repair_Guerilla11",70],
			["Exile_Car_Offroad_Repair_Guerilla12",70],

			///////////////////////////////////////////////////////////////////////////////
			// Strider
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Strider",100],
			
			///////////////////////////////////////////////////////////////////////////////
			// Tempest
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Tempest",220],
			
			///////////////////////////////////////////////////////////////////////////////
			// Van (Box) 
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Van_Box_Black",230],
			["Exile_Car_Van_Box_White",230],
			["Exile_Car_Van_Box_Red",230],
			["Exile_Car_Van_Box_Guerilla01",230],
			["Exile_Car_Van_Box_Guerilla02",230],
			["Exile_Car_Van_Box_Guerilla03",230],
			["Exile_Car_Van_Box_Guerilla04",230],
			["Exile_Car_Van_Box_Guerilla05",230],
			["Exile_Car_Van_Box_Guerilla06",230],
			["Exile_Car_Van_Box_Guerilla07",230],
			["Exile_Car_Van_Box_Guerilla08",230],

			///////////////////////////////////////////////////////////////////////////////
			// Van (Fuel) 
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Van_Fuel_Black",20],
			["Exile_Car_Van_Fuel_White",20],
			["Exile_Car_Van_Fuel_Red",20],
			["Exile_Car_Van_Fuel_Guerilla01",20],
			["Exile_Car_Van_Fuel_Guerilla02",20],
			["Exile_Car_Van_Fuel_Guerilla03",20],

			///////////////////////////////////////////////////////////////////////////////
			// Zamak
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Car_Zamak",270],
			
			///////////////////////////////////////////////////////////////////////////////
			// Hellcat
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Chopper_Hellcat_Green",110],
			["Exile_Chopper_Hellcat_FIA",110],

			///////////////////////////////////////////////////////////////////////////////
			// Hummingbird
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Chopper_Hummingbird_Green",50],

			///////////////////////////////////////////////////////////////////////////////
			// Hummingbird (Civillian)
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Chopper_Hummingbird_Civillian_Blue",50],
			["Exile_Chopper_Hummingbird_Civillian_Red",50],
			["Exile_Chopper_Hummingbird_Civillian_ION",50],
			["Exile_Chopper_Hummingbird_Civillian_BlueLine",50],
			["Exile_Chopper_Hummingbird_Civillian_Digital",50],
			["Exile_Chopper_Hummingbird_Civillian_Elliptical",50],
			["Exile_Chopper_Hummingbird_Civillian_Furious",50],
			["Exile_Chopper_Hummingbird_Civillian_GrayWatcher",50],
			["Exile_Chopper_Hummingbird_Civillian_Jeans",50],
			["Exile_Chopper_Hummingbird_Civillian_Light",50],
			["Exile_Chopper_Hummingbird_Civillian_Shadow",50],
			["Exile_Chopper_Hummingbird_Civillian_Sheriff",50],
			["Exile_Chopper_Hummingbird_Civillian_Speedy",50],
			["Exile_Chopper_Hummingbird_Civillian_Sunset",50],
			["Exile_Chopper_Hummingbird_Civillian_Vrana",50],
			["Exile_Chopper_Hummingbird_Civillian_Wasp",50],
			["Exile_Chopper_Hummingbird_Civillian_Wave",50],

			///////////////////////////////////////////////////////////////////////////////
			// Huron
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Chopper_Huron_Black",400],
			["Exile_Chopper_Huron_Green",400],

			///////////////////////////////////////////////////////////////////////////////
			// Mohawk
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Chopper_Mohawk_FIA",330],

			///////////////////////////////////////////////////////////////////////////////
			// Orca
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Chopper_Orca_CSAT",210],
			["Exile_Chopper_Orca_Black",210],
			["Exile_Chopper_Orca_BlackCustom",210],

			///////////////////////////////////////////////////////////////////////////////
			// Taru
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Chopper_Taru_Transport_CSAT",30],
			["Exile_Chopper_Taru_Transport_Black",30],
			["Exile_Chopper_Taru_CSAT",150],
			["Exile_Chopper_Taru_Black",150],
			["Exile_Chopper_Taru_Covered_CSAT",220],
			["Exile_Chopper_Taru_Covered_Black",220],
			
			///////////////////////////////////////////////////////////////////////////////
			// MOTOR BOATS
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Boat_MotorBoat_Police",110],
			["Exile_Boat_MotorBoat_Orange",110],
			["Exile_Boat_MotorBoat_White",110],

			///////////////////////////////////////////////////////////////////////////////
			// RUBBER DUCKS
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Boat_RubberDuck_CSAT",80],
			["Exile_Boat_RubberDuck_Digital",80],
			["Exile_Boat_RubberDuck_Orange",80],
			["Exile_Boat_RubberDuck_Blue",80],
			["Exile_Boat_RubberDuck_Black",80],

			///////////////////////////////////////////////////////////////////////////////
			// SDV
			///////////////////////////////////////////////////////////////////////////////
			["Exile_Boat_SDV_CSAT",110],
			["Exile_Boat_SDV_Digital",110],
			["Exile_Boat_SDV_Grey",110],
			
			["Exile_Plane_Cessna",90],
			
			///////////////////////////////////////////////////////////////////////////////
			// RHS Vehicles
			///////////////////////////////////////////////////////////////////////////////
			
			["rhs_tigr_ffv_3camo_vdv",110],
			["rhs_tigr_ffv_vdv",110],
			["rhs_tigr_3camo_vdv",110],
			["rhs_tigr_vdv",110],
			["rhs_gaz66_r142_vmf",240],
			["rhs_gaz66_repair_vmf",240],
			["rhs_gaz66_vmf",240],
			["rhs_gaz66_flat_vdv",240],
			["rhs_gaz66o_vdv",240],
			["rhs_gaz66o_flat_vdv",240],
			["rhs_gaz66_ammo_vmf",110],
			["rhs_gaz66_vv",240],
			["rhs_gaz66_msv",240],
			["rhs_gaz66_flat_vmf",240],
			["rhs_gaz66_flat_vv",240],
			["rhs_gaz66_flat_msv",240],
			["rhs_gaz66o_vmf",240],
			["rhs_gaz66o_vv",240],
			["rhs_gaz66o_msv",240],
			["rhs_gaz66o_flat_vmf",240],
			["rhs_gaz66o_flat_vv",240],
			["rhs_gaz66o_flat_msv",240],
			["rhs_gaz66_r142_vdv",240],
			["rhs_gaz66_r142_msv",240],
			["rhs_gaz66_r142_vv",240],
			["rhs_gaz66_repair_vdv",240],
			["rhs_gaz66_repair_vv",240],
			["rhs_gaz66_repair_msv",240],
			["rhsusf_m1025_w",170],
			["rhsusf_m1025_w_m2",170],
			["rhsusf_m998_w_2dr",170],
			["rhsusf_m998_w_4dr",170],
			["rhsusf_m998_w_s_2dr_fulltop",170],
			["rhsusf_m998_d_s_2dr_fulltop",170],
			["rhsusf_m998_w_s_2dr_halftop",170],
			["rhsusf_m998_d_s_2dr_halftop",170],
			["rhsusf_m998_d_s_4dr_fulltop",170],
			["rhsusf_m998_w_s_4dr_fulltop",170],
			["rhsusf_m998_d_s_4dr_halftop",170],
			["rhsusf_m998_w_s_4dr_halftop",170],
			["rhsusf_M1078A1P2_wd_fmtv_usarmy",280],
			["rhsusf_M1078A1P2_d_fmtv_usarmy",280],
			["rhsusf_M1078A1P2_wd_open_fmtv_usarmy",280],
			["rhsusf_M1078A1P2_d_open_fmtv_usarmy",280],
			["rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy",280],
			["rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy",280],
			["rhsusf_M1078A1P2_B_d_fmtv_usarmy",280],
			["rhsusf_M1078A1P2_B_wd_fmtv_usarmy",280],
			["rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy",280],
			["rhsusf_M1078A1P2_B_d_open_fmtv_usarmy",280],
			["rhsusf_M1078A1P2_B_wd_flatbed_fmtv_usarmy",280],
			["rhsusf_M1078A1P2_B_d_flatbed_fmtv_usarmy",280],
			["rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy",340],
			["rhsusf_M1083A1P2_B_M2_d_Medical_fmtv_usarmy",340],
			["rhsusf_rg33_d",180],
			["rhsusf_rg33_wd",180],
			["rhs_uaz_vmf",100],
			["rhs_uaz_open_vmf",100],
			["RHS_Ural_Open_Civ_01",330],
			["RHS_Ural_Open_Civ_02",330],
			["RHS_Ural_Open_Civ_03",330],
			["RHS_Ural_MSV_01",330],
			["RHS_Ural_VDV_01",330],
			["RHS_Ural_VMF_01",330],
			["RHS_Ural_VV_01",330],
			["RHS_Ural_Flat_MSV_01",330],
			["RHS_Ural_Flat_VDV_01",330],
			["RHS_Ural_Flat_VMF_01",330],
			["RHS_Ural_Flat_VV_01",330],
			["RHS_Ural_Open_MSV_01",330],
			["RHS_Ural_Open_VDV_01",330],
			["RHS_Ural_Open_VMF_01",330],
			["RHS_Ural_Open_VV_01",330],
			["RHS_Ural_Open_Flat_MSV_01",330],
			["RHS_Ural_Open_Flat_VDV_01",330],
			["RHS_Ural_Open_Flat_VMF_01",330],
			["RHS_Ural_Open_Flat_VV_01",330],
			["RHS_Ural_Fuel_MSV_01",330],
			["RHS_Ural_Fuel_VDV_01",330],
			["RHS_Ural_Fuel_VMF_01",330],
			["RHS_Ural_Fuel_VV_01",330],
			["rhs_btr60_vmf",170],
			["rhs_btr60_vdv",170],
			["rhs_btr60_vv",170],
			["rhs_btr60_msv",170],
			["rhsusf_rg33_m2_d",180],
			["rhsusf_rg33_m2_wd",180],
			["rhsusf_rg33_usmc_d",180],
			["rhsusf_rg33_usmc_wd",180],
			["rhsusf_rg33_m2_usmc_d",180],
			["rhsusf_rg33_m2_usmc_wd",180],
			["rhs_typhoon_vdv",360],
			["RHS_BTR70_VDV",230],
			["RHS_BTR80_MSV",230],
			["RHS_BTR80_VV",230],
			["RHS_BTR80A_MSV",230],

			////////////////////////////////////////////////////////////
			// RHS AirCraft
			////////////////////////////////////////////////////////////
			
			["RHS_CH_47F",400],
			["RHS_CH_47F_10",400],
			["rhs_ka60_c",200],
			["rhs_ka60_grey",200],
			["RHS_Ka52_vvsc",50],
			["RHS_Ka52_vvs",50],
			["RHS_Ka52_UPK23_vvs",50],
			["RHS_Ka52_UPK23_vvsc",50],
			["RHS_AH1Z",40],
			["RHS_AH1Z_GS",40],
			["RHS_AH1Z_CS",40],
			["RHS_AH1Z_wd",40],
			["RHS_AH1Z_wd_GS",40],
			["RHS_AH1Z_wd_CS",40],
			["RHS_UH60M",280],
			["rhs_UH60M_MEV2_d",280],
			["RHS_UH60M_MEV2",280],
			["RHS_UH60M_MEV",280],
			["RHS_UH60M_d",280],
			["RHS_UH60M_MEV_d",280],
			["RHS_Mi8mt_vvs",390],
			["RHS_Mi8mt_vvsc",390],
			["rhs_Mi8mt_cargo_vvs",390],
			["RHS_Mi8mt_Cargo_vdv",390],
			["RHS_Mi8amt_civilian",390],
			["RHS_MI8MTV3_vvsc",390],
			["RHS_MI8MTV3_vvs",390],
			["RHS_MI8MTV3_UPK23_vvsc",390],
			["RHS_MI8MTV3_UPK23_vvs",390],
			["RHS_Mi24Vt_vvs",220],
			["RHS_Mi24P_vvs",220],
			["RHS_Mi24P_vvsc",220],
			["RHS_Mi24P_CAS_vvs",220],
			["RHS_Mi24P_CAS_vvsc",220],
			["RHS_Mi24P_CAS_vdv",220],
			["RHS_Mi24P_AT_vvs",220],
			["RHS_Mi24P_AT_vvsc",220],
			["RHS_Mi24P_AT_vdv",220],
			["RHS_Mi24P_vdv",220],
			["RHS_Mi24V_vvs",220],
			["RHS_Mi24V_vvsc",220],
			["RHS_Mi24V_FAB_vvs",220],
			["RHS_Mi24V_FAB_vvsc",220],
			["RHS_Mi24V_FAB_vdv",220],
			["RHS_Mi24V_UPK23_vvs",220],
			["RHS_Mi24V_UPK23_vvsc",220],
			["RHS_Mi24V_UPK23_vdv",220],
			["RHS_Mi24V_AT_vvs",220],
			["RHS_Mi24V_AT_vvsc",220],
			["RHS_Mi24V_AT_vdv",220],
			["RHS_Mi24V_vdv",220],
			["RHS_Mi8mt_vdv",390],
			["RHS_Mi8mt_vv",390],
			["RHS_Mi8mt_Cargo_vvsc",390],
			["RHS_Mi8mt_Cargo_vv",390],
			["RHS_Mi8MTV3_vdv",390],
			["RHS_Mi8MTV3_UPK23_vdv",390],
			["RHS_Mi8MTV3_FAB_vvs",390],
			["RHS_Mi8MTV3_FAB_vvsc",390],
			["RHS_Mi8MTV3_FAB_vdv",390],
			["RHS_Mi8AMT_vvs",390],
			["RHS_Mi8AMT_vvsc",390],
			["RHS_Mi8AMT_vdv",390],
			["RHS_Mi8AMTSh_vvs",390],
			["RHS_Mi8AMTSh_vvsc",390],
			["RHS_Mi8AMTSh_UPK23_vvs",390],
			["RHS_Mi8AMTSh_UPK23_vvsc",390],
			["RHS_Mi8AMTSh_FAB_vvs",390],
			["RHS_Mi8AMTSh_FAB_vvsc",390],
			["RHS_AH64D",60],
			["RHS_AH64D_GS",60],
			["RHS_AH64D_CS",60],
			["RHS_AH64D_wd",60],
			["RHS_AH64D_wd_GS",60],
			["RHS_AH64D_wd_CS",60],
			["RHS_AH64D_AA",60],
			["RHS_AH64D_wd_AA",60],
			["RHS_AH64DGrey",60],
			["rhs_UH1Y_unarmed",130],
			["RHS_UH1Y_UNARMED_d",130],
			["RHS_UH1Y_d",130],
			["RHS_UH1Y_FFAR",130],
			["RHS_UH1Y_FFAR_d",130],
			["RHS_UH1Y",130],
			["RHS_A10",20],
			["RHS_Su25SM_vvs",20],
			["RHS_T50_vvs_051",20],
			["rhsusf_f22",20],
			["RHS_C130J",550],
			
			////////////////////////////////////////////////////////
			// Arma 3 Cars
			////////////////////////////////////////////////////////
			
			["B_G_Offroad_01_F",130],
			["B_G_Offroad_01_repair_F",130],
			["B_G_Quadbike_01_F",60],
			["B_MRAP_01_F",120],
			["B_Quadbike_01_F",60],
			["O_G_Quadbike_01_F",60],
			["O_MRAP_02_F",120],
			["O_Quadbike_01_F",60],
			["I_Quadbike_01_F",60],
			["I_G_Quadbike_01_F",60],
			["I_MRAP_03_F",120],
			
			////////////////////////////////////////////////////////
			// Arma 3 Trucks
			////////////////////////////////////////////////////////
			
			["B_Truck_01_transport_F",440],
			["B_Truck_01_covered_F",440],
			["B_Truck_01_mover_F",440],
			["B_Truck_01_box_F",440],
			["B_Truck_01_Repair_F",440],
			["B_Truck_01_ammo_F",50],
			["B_Truck_01_fuel_F",50],
			["B_Truck_01_medical_F",440],
			["B_G_Van_01_transport_F",160],
			["B_G_Van_01_fuel_F",50],
			["O_G_Offroad_01_repair_F",130],
			["O_G_Offroad_01_F",130],
			["O_Truck_02_covered_F",250],
			["O_Truck_02_transport_F",250],
			["O_Truck_03_transport_F",330],
			["O_Truck_03_covered_F",330],
			["O_Truck_03_repair_F",330],
			["O_Truck_03_ammo_F",330],
			["O_Truck_03_fuel_F",330],
			["O_Truck_03_medical_F", 330],
			["O_Truck_03_device_F",50],
			["O_Truck_02_box_F",220],
			["O_Truck_02_medical_F",220],
			["O_Truck_02_Ammo_F",220],
			["O_Truck_02_fuel_F",50],
			["O_G_Van_01_transport_F",130],
			["O_G_Van_01_fuel_F",50],
			["I_G_Offroad_01_F",130],
			["I_G_Offroad_01_armed_F",100],
			["I_Truck_02_transport_F",220],
			["I_Truck_02_ammo_F",220],
			["I_Truck_02_box_F",220],
			["I_Truck_02_medical_F",220],
			["I_Truck_02_fuel_F",50],
			["I_G_Van_01_transport_F",130],
			["I_G_Van_01_fuel_F",50],
			
			////////////////////////////////////////////////////////
			// Arma 3 armed
			////////////////////////////////////////////////////////
			
			["B_G_Offroad_01_armed_F",100],
			["O_G_Offroad_01_armed_F",100],
			["B_MRAP_01_gmg_F",130],
			["B_MRAP_01_hmg_F",130],
			["O_MRAP_02_gmg_F",130],
			["O_MRAP_02_hmg_F",130],
			["I_MRAP_03_hmg_F",130],
			["I_MRAP_03_gmg_F",130],
			["B_APC_Wheeled_01_cannon_F",220],
			["I_APC_Wheeled_03_cannon_F",220],
			
			////////////////////////////////////////////////////////
			// Arma 3 Tanks
			////////////////////////////////////////////////////////
			
			["B_APC_Tracked_01_rcws_F",110],
			["B_APC_Tracked_01_CRV_F",110],
			["B_APC_Tracked_01_AA_F",110],
			["B_MBT_01_arty_F",110],
			["B_MBT_01_mlrs_F",110],
			["B_MBT_01_TUSK_F",110],
			["O_APC_Tracked_02_cannon_F",110],
			["O_APC_Tracked_02_AA_F",110],
			["O_MBT_02_cannon_F",110],
			["O_MBT_02_arty_F",110],
			["O_APC_Wheeled_02_rcws_F",110],
			["I_APC_tracked_03_cannon_F",110],
			["I_MBT_03_cannon_F",110],
			
			////////////////////////////////////////////////////////
			// Arma 3 Boats
			////////////////////////////////////////////////////////
			
			["B_Boat_Armed_01_minigun_F",110],
			["B_Boat_Transport_01_F",100],
			["B_Lifeboat",100],
			["B_SDV_01_F",110],
			["B_G_Boat_Transport_01_F",100],
			["O_Boat_Armed_01_hmg_F",110],
			["O_Boat_Transport_01_F",100],
			["O_Lifeboat",100],
			["O_SDV_01_F",110],
			["O_G_Boat_Transport_01_F",100],
			["I_Boat_Armed_01_minigun_F",110],
			["I_Boat_Transport_01_F",100],
			["I_SDV_01_F",110],
			["I_G_Boat_Transport_01_F",100],
			["C_Rubberboat",100],
			["C_Boat_Civil_01_F",110],
			["C_Boat_Civil_01_rescue_F",110],
			["C_Boat_Civil_01_police_F",110],
			
			////////////////////////////////////////////////////////
			// Arma 3 Unarmed Choppers
			////////////////////////////////////////////////////////
			
			["B_Heli_Light_01_F",100],
			["B_Heli_Light_01_stripped_F",100],
			["B_Heli_Transport_03_unarmed_F",440],
			["B_Heli_Transport_03_unarmed_green_F",440],
			["O_Heli_Transport_04_F",50],
			["O_Heli_Transport_04_ammo_F",50],
			["O_Heli_Transport_04_bench_F",50],
			["O_Heli_Transport_04_box_F",50],
			["O_Heli_Transport_04_covered_F",50],
			["O_Heli_Transport_04_fuel_F",50],
			["O_Heli_Transport_04_medevac_F",50],
			["O_Heli_Transport_04_repair_F",50],
			["O_Heli_Transport_04_black_F",50],
			["O_Heli_Transport_04_ammo_black_F",50],
			["O_Heli_Transport_04_bench_black_F",50],
			["O_Heli_Transport_04_box_black_F",50],
			["O_Heli_Transport_04_covered_black_F",50],
			["O_Heli_Transport_04_fuel_black_F",50],
			["O_Heli_Transport_04_medevac_black_F",50],
			["O_Heli_Transport_04_repair_black_F",50],
			["I_Heli_light_03_unarmed_F",140],
			
			////////////////////////////////////////////////////////
			// Arma 3 armed Choppers
			////////////////////////////////////////////////////////
			
			["B_Heli_Light_01_armed_F",100],
			["B_Heli_Attack_01_F",40],
			["B_Heli_Transport_01_F",180],
			["B_Heli_Transport_01_camo_F",180],
			["B_Heli_Transport_03_F",440],
			["B_Heli_Transport_03_black_F",440],
			["O_Heli_Light_02_F",140],
			["O_Heli_Light_02_unarmed_F",140],
			["O_Heli_Light_02_v2_F",140],
			["O_Heli_Attack_02_F",110],
			["O_Heli_Attack_02_black_F",110],
			["I_Heli_Transport_02_F",330],
			["I_Heli_light_03_F",130],
			
			////////////////////////////////////////////////////////
			// Arma 3 Planes
			////////////////////////////////////////////////////////
			
			["B_Plane_CAS_01_F",40],
			["O_Plane_CAS_02_F",40],
			["I_Plane_Fighter_03_CAS_F",40],
			["I_Plane_Fighter_03_AA_F",40],
			
			////////////////////////////////////////////////////////
			// HVP Vehicles
			////////////////////////////////////////////////////////
			
			["Mrshounka_yamaha_p_bf", 15],
			["Mrshounka_yamaha_p_g", 15],
			["Mrshounka_yamaha_p_j", 15],
			["Mrshounka_yamaha_p_noir", 15],
			["Mrshounka_yamaha_p_o", 15],
			["Mrshounka_yamaha_p_rose", 15],
			["Mrshounka_yamaha_p_r", 15],
			["Mrshounka_yamaha_p_v", 15],
			["Mrshounka_a3_308_civ_bleufonce", 50],
			["Mrshounka_a3_308_civ_grise", 50],
			["Mrshounka_a3_308_civ_jaune", 50],
			["Mrshounka_a3_308_civ_noir", 50],
			["Mrshounka_a3_308_civ_orange", 50],
			["Mrshounka_a3_308_civ_rose", 50],
			["Mrshounka_a3_308_civ_rouge", 50],
			["Mrshounka_a3_308_civ_violet", 50],
			["shounka_buggy_bleufonce", 50],
			["shounka_buggy_grise", 50],
			["shounka_buggy_jaune", 50],
			["shounka_buggy_noir", 50],
			["shounka_buggy_orange", 50],
			["shounka_buggy_rose", 50],
			["shounka_buggy_rouge", 50],
			["shounka_buggy_violet", 50],
			["Mrshounka_corbillard_c_bleufonce", 110],
			["Mrshounka_corbillard_c_grise", 110],
			["Mrshounka_corbillard_c_jaune", 110],
			["Mrshounka_corbillard_c_noir", 110],
			["Mrshounka_corbillard_c_orange", 110],
			["Mrshounka_corbillard_c_rose", 110],
			["Mrshounka_corbillard_c_rouge", 110],
			["Mrshounka_corbillard_c_violet", 110],
			["Mr_Own_buggy_bleufonce", 50],
			["Mr_Own_buggy_grise", 50],
			["Mr_Own_buggy_jaune", 50],
			["Mr_Own_buggy_noir", 50],
			["Mr_Own_buggy_orange", 50],
			["Mr_Own_buggy_rose", 50],
			["Mr_Own_buggy_rouge", 50],
			["Mr_Own_buggy_violet", 50],
			["shounka_limo_civ_bleufonce", 110],
			["shounka_limo_civ_grise", 110],
			["shounka_limo_civ_jaune", 110],
			["shounka_limo_civ_noir", 110],
			["shounka_limo_civ_orange", 110],
			["shounka_limo_civ_rose", 110],
			["shounka_limo_civ_violet", 110],
			["shounka_f430_spider_bleufonce", 50],
			["shounka_f430_spider_grise", 50],
			["shounka_f430_spider_jaune", 50],
			["shounka_f430_spider_noir", 50],
			["shounka_f430_spider_rose", 50],
			["shounka_f430_spider_rouge", 50],
			["shounka_f430_spider_violet", 50],
			["Mrshounka_lykan_c_bleufonce", 50],
			["Mrshounka_lykan_c_grise", 50],
			["Mrshounka_lykan_c_jaune", 50],
			["Mrshounka_lykan_c_noir", 50],
			["Mrshounka_lykan_c_orange", 50],
			["Mrshounka_lykan_c_rose", 50],
			["Mrshounka_lykan_c_rouge", 50],
			["Mrshounka_lykan_c_violet", 50],
			["Mrshounka_Vandura_civ", 200],
			["Mrshounka_Vandura_civ_bleufonce", 200],
			["Mrshounka_Vandura_civ_grise", 200],
			["Mrshounka_Vandura_civ_jaune", 200],
			["Mrshounka_Vandura_civ_noir", 200],
			["Mrshounka_Vandura_civ_orange", 200],
			["Mrshounka_Vandura_civ_rose", 200],
			["Mrshounka_Vandura_civ_rouge", 200],
			["Mrshounka_Vandura_civ_violet", 200],
			["Mr_Own_hummer_civ_noir", 150],
			["Mr_Own_hummer_civ_bleufonce", 150],
			["Mr_Own_hummer_civ_grise", 150],
			["Mr_Own_hummer_civ_jaune", 150],
			["Mr_Own_hummer_civ_orange", 150],
			["Mr_Own_hummer_civ_rose", 150],
			["Mr_Own_hummer_civ_rouge", 150],
			["Mr_Own_hummer_civ_violet", 150],
			["SIG_Roadrunner", 110],
			["SIG_Hubcaps", 110],
			["SIG_Magnums", 110],
			["SIG_Hcode", 110],
			["shounka_avalanche_bleufonce", 150],
			["shounka_avalanche_grise", 150],
			["shounka_avalanche_jaune", 150],
			["shounka_avalanche_noir", 150],
			["shounka_avalanche_orange", 150],
			["shounka_avalanche_rose", 150],
			["shounka_avalanche_rouge", 150],
			["shounka_avalanche_violet", 150],
			["SIG_Superbee", 110],
			["SIG_SuperbeeY", 110],
			["SIG_SuperbeeB", 110],
			["SIG_SuperbeeL", 110],
			["SIG_SuperbeeM", 110],
			["SIG_SuperbeeG", 110],
			["Mr_Own_dodge15_civ", 110],
			["Mr_Own_dodge15_civ_bleufonce", 110],
			["Mr_Own_dodge15_civ_grise", 110],
			["Mr_Own_dodge15_civ_jaune", 110],
			["Mr_Own_dodge15_civ_noir", 110],
			["Mr_Own_dodge15_civ_orange", 110],
			["Mr_Own_dodge15_civ_rose", 110],
			["Mr_Own_dodge15_civ_rouge", 110],
			["Mr_Own_dodge15_civ_violet", 110],
			["shounka_monsteur_bleufonce", 200],
			["shounka_monsteur_grise", 200],
			["shounka_monsteur_jaune", 200],
			["shounka_monsteur_noir", 200],
			["shounka_monsteur_orange", 200],
			["shounka_monsteur_rose", 200],
			["shounka_monsteur_rouge", 200],
			["shounka_monsteur_violet", 200],
			["shounka_a3_dafxf_euro6_f", 400],
			["shounka_ivceco_bleufonce", 400],
			["shounka_ivceco_grise", 400],
			["shounka_ivceco_jaune", 400],
			["shounka_ivceco_noir", 400],
			["shounka_ivceco_orange", 400],
			["shounka_ivceco_rose", 400],
			["shounka_ivceco_rouge", 400],
			["shounka_ivceco_violet", 400],

			////////////////////////////////////////////////////////////
			// HVP Aircraft
			////////////////////////////////////////////////////////////

			["MV22",330],
			["sab_camel_blu",20],
			["sab_camel_red",20]
	
];

/**
 * List of class names of objects which can be loaded in transport vehicle/cargo.
 * The second element of the nested arrays is the cost capacity (in relation with the capacity of the vehicles).
 * 
 * Liste des noms de classes des objets transportables.
 * Le deuxième élément des sous-tableaux est le coût de capacité (en relation avec la capacité des véhicules).
 */
R3F_LOG_CFG_can_be_transported_cargo = R3F_LOG_CFG_can_be_transported_cargo +
[
	// e.g. : ["MyTransportableObjectClassName1", itsCost], ["MyTransportableObjectClassName2", itsCost]
	// Here Comes the Stuff what you want to load in the Vehicle  example: ["IG_supplyCrate_F", 40]
	
	
			["Exile_Car_Kart_BluKing",110],
			["Exile_Car_Kart_RedStone",110],
			["Exile_Car_Kart_Vrana",110],
			["Exile_Car_Kart_Green",110],
			["Exile_Car_Kart_Blue",110],
			["Exile_Car_Kart_Orange",110],
			["Exile_Car_Kart_White",110],
			["Exile_Car_Kart_Yellow",110],
			["Exile_Car_Kart_Black",110],
			["Land_Cargo20_military_green_F_Kit",350],
			["CargoNet_01_box_F",110],
			["Box_NATO_AmmoVeh_F",110],
			["B_supplyCrate_F",110],
			["Land_CargoBox_V1_F",110],
			["I_CargoNET_01_F",110],
			["Box_NATO_Wps_F",110],
			["C_supplyCrate_F",110],
			["IG_supplyCrate_F",110],
			["Box_IND_AmmoVeh_F",110],
			["B_Slingload_01_Cargo_F",400],
			["B_Slingload_01_Fuel_F",400],
			["B_Slingload_01_Ammo_F",400],
			["B_Slingload_01_Medevac_F",400],
			["B_Slingload_01_Repair_F",400],
			["Land_Pod_Heli_Transport_04_covered_F",400],
			["Land_Pod_Heli_Transport_04_fuel_F",400],
			["Land_Pod_Heli_Transport_04_box_F",400],
			["Land_Pod_Heli_Transport_04_repair_F",400],
			["Land_Pod_Heli_Transport_04_medevac_F",400],
			["Land_Pod_Heli_Transport_04_bench_F",400],
			["Land_Pod_Heli_Transport_04_covered_black_F",400],
			["Land_Pod_Heli_Transport_04_fuel_black_F",400],
			["Land_Pod_Heli_Transport_04_box_black_F",400],
			["Land_Pod_Heli_Transport_04_repair_black_F",400],
			["Land_Pod_Heli_Transport_04_medevac_black_F",400],
			["Land_Pod_Heli_Transport_04_bench_black_F",400],
			["Box_east_Support_F",40],
			["Exile_Bike_OldBike",50],
			["Exile_Bike_MountainBike",50],
			["B_CargoNet_01_ammo_F",110],
			["O_CargoNet_01_ammo_F",110],
			["I_CargoNet_01_ammo_F",110],
			["Box_East_AmmoVeh_F",110],
			["I_supplyCrate_F",110],
			["Box_NATO_AmmoOrd_F",110],
			["Box_East_AmmoOrd_F",110],
			["Box_NATO_Ammo_F", 80],
			["Exile_Container_SupplyBox", 110],
			["O_supplyCrate_F", 50],
			
			///////////////////////////////////////////////////////////////////////////////
			// RHS Vehicles
			///////////////////////////////////////////////////////////////////////////////
			
			["rhs_tigr_ffv_3camo_vdv",300],
			["rhs_tigr_ffv_vdv",300],
			["rhs_tigr_3camo_vdv",300],
			["rhs_tigr_vdv",300],
			["rhs_gaz66_r142_vmf",380],
			["rhs_gaz66_repair_vmf",380],
			["rhs_gaz66_vmf",380],
			["rhs_gaz66_flat_vdv",380],
			["rhs_gaz66o_vdv",380],
			["rhs_gaz66o_flat_vdv",380],
			["rhs_gaz66_ammo_vmf",110],
			["rhs_gaz66_vv",380],
			["rhs_gaz66_msv",380],
			["rhs_gaz66_flat_vmf",380],
			["rhs_gaz66_flat_vv",380],
			["rhs_gaz66_flat_msv",380],
			["rhs_gaz66o_vmf",380],
			["rhs_gaz66o_vv",380],
			["rhs_gaz66o_msv",380],
			["rhs_gaz66o_flat_vmf",380],
			["rhs_gaz66o_flat_vv",380],
			["rhs_gaz66o_flat_msv",380],
			["rhs_gaz66_r142_vdv",380],
			["rhs_gaz66_r142_msv",380],
			["rhs_gaz66_r142_vv",380],
			["rhs_gaz66_repair_vdv",380],
			["rhs_gaz66_repair_vv",380],
			["rhs_gaz66_repair_msv",380],
			["rhsusf_m1025_w",300],
			["rhsusf_m1025_w_m2",300],
			["rhsusf_m998_w_2dr",300],
			["rhsusf_m998_w_4dr",300],
			["rhsusf_m998_w_s_2dr_fulltop",300],
			["rhsusf_m998_d_s_2dr_fulltop",300],
			["rhsusf_m998_w_s_2dr_halftop",300],
			["rhsusf_m998_d_s_2dr_halftop",300],
			["rhsusf_m998_d_s_4dr_fulltop",300],
			["rhsusf_m998_w_s_4dr_fulltop",300],
			["rhsusf_m998_d_s_4dr_halftop",300],
			["rhsusf_m998_w_s_4dr_halftop",300],
			["rhsusf_M1078A1P2_wd_fmtv_usarmy",400],
			["rhsusf_M1078A1P2_d_fmtv_usarmy",400],
			["rhsusf_M1078A1P2_wd_open_fmtv_usarmy",400],
			["rhsusf_M1078A1P2_d_open_fmtv_usarmy",400],
			["rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy",400],
			["rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy",400],
			["rhsusf_M1078A1P2_B_d_fmtv_usarmy",400],
			["rhsusf_M1078A1P2_B_wd_fmtv_usarmy",400],
			["rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy",400],
			["rhsusf_M1078A1P2_B_d_open_fmtv_usarmy",400],
			["rhsusf_M1078A1P2_B_wd_flatbed_fmtv_usarmy",400],
			["rhsusf_M1078A1P2_B_d_flatbed_fmtv_usarmy",400],
			["rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy",500],
			["rhsusf_M1083A1P2_B_M2_d_Medical_fmtv_usarmy",500],
			["rhsusf_rg33_d",280],
			["rhsusf_rg33_wd",280],
			["rhs_uaz_vmf",180],
			["rhs_uaz_open_vmf",180],
			["RHS_Ural_Open_Civ_01",400],
			["RHS_Ural_Open_Civ_02",400],
			["RHS_Ural_Open_Civ_03",400],
			["RHS_Ural_MSV_01",400],
			["RHS_Ural_VDV_01",400],
			["RHS_Ural_VMF_01",400],
			["RHS_Ural_VV_01",400],
			["RHS_Ural_Flat_MSV_01",400],
			["RHS_Ural_Flat_VDV_01",400],
			["RHS_Ural_Flat_VMF_01",400],
			["RHS_Ural_Flat_VV_01",400],
			["RHS_Ural_Open_MSV_01",400],
			["RHS_Ural_Open_VDV_01",400],
			["RHS_Ural_Open_VMF_01",400],
			["RHS_Ural_Open_VV_01",400],
			["RHS_Ural_Open_Flat_MSV_01",400],
			["RHS_Ural_Open_Flat_VDV_01",400],
			["RHS_Ural_Open_Flat_VMF_01",400],
			["RHS_Ural_Open_Flat_VV_01",400],
			["RHS_Ural_Fuel_MSV_01",400],
			["RHS_Ural_Fuel_VDV_01",400],
			["RHS_Ural_Fuel_VMF_01",400],
			["RHS_Ural_Fuel_VV_01",400],
			["rhs_btr60_vmf",550],
			["rhs_btr60_vdv",550],
			["rhs_btr60_vv",550],
			["rhs_btr60_msv",550],
			["rhsusf_rg33_m2_d",330],
			["rhsusf_rg33_m2_wd",330],
			["rhsusf_rg33_usmc_d",330],
			["rhsusf_rg33_usmc_wd",330],
			["rhsusf_rg33_m2_usmc_d",330],
			["rhsusf_rg33_m2_usmc_wd",330],
			["rhs_typhoon_vdv",530],
			["RHS_BTR70_VDV",550],
			["RHS_BTR80_MSV",550],
			["RHS_BTR80_VV",550],
			["RHS_BTR80A_MSV",550],
			
			////////////////////////////////////////////////////////
			// Arma 3 Cars
			////////////////////////////////////////////////////////
			
			["B_G_Offroad_01_F",210],
			["B_G_Offroad_01_repair_F",210],
			["B_G_Quadbike_01_F",110],
			["B_MRAP_01_F",300],
			["B_Quadbike_01_F",110],
			["O_G_Quadbike_01_F",110],
			["O_MRAP_02_F",300],
			["O_Quadbike_01_F",110],
			["I_Quadbike_01_F",110],
			["I_G_Quadbike_01_F",110],
			["I_MRAP_03_F",300],
			
			////////////////////////////////////////////////////////
			// Arma 3 Trucks
			////////////////////////////////////////////////////////
			
			["B_Truck_01_transport_F",550],
			["B_Truck_01_covered_F",550],
			["B_Truck_01_mover_F",550],
			["B_Truck_01_box_F",550],
			["B_Truck_01_Repair_F",550],
			["B_Truck_01_ammo_F",50],
			["B_Truck_01_fuel_F",50],
			["B_Truck_01_medical_F",550],
			["B_G_Van_01_transport_F",200],
			["B_G_Van_01_fuel_F",250],
			["O_G_Offroad_01_repair_F",220],
			["O_G_Offroad_01_F",220],
			["O_Truck_02_covered_F",380],
			["O_Truck_02_transport_F",380],
			["O_Truck_03_transport_F",400],
			["O_Truck_03_covered_F",400],
			["O_Truck_03_repair_F",400],
			["O_Truck_03_ammo_F",400],
			["O_Truck_03_fuel_F",400],
			["O_Truck_03_medical_F", 400],
			["O_Truck_03_device_F",400],
			["O_Truck_02_box_F",380],
			["O_Truck_02_medical_F",380],
			["O_Truck_02_Ammo_F",380],
			["O_Truck_02_fuel_F",380],
			["O_G_Van_01_transport_F",200],
			["O_G_Van_01_fuel_F",220],
			["I_G_Offroad_01_F",200],
			["I_G_Offroad_01_armed_F",200],
			["I_Truck_02_transport_F",220],
			["I_Truck_02_ammo_F",380],
			["I_Truck_02_box_F",380],
			["I_Truck_02_medical_F",380],
			["I_Truck_02_fuel_F",380],
			["I_G_Van_01_transport_F",200],
			["I_G_Van_01_fuel_F",220],
			
			////////////////////////////////////////////////////////
			// Arma 3 armed
			////////////////////////////////////////////////////////
			
			["B_G_Offroad_01_armed_F",200],
			["O_G_Offroad_01_armed_F",200],
			["B_MRAP_01_gmg_F",380],
			["B_MRAP_01_hmg_F",380],
			["O_MRAP_02_gmg_F",380],
			["O_MRAP_02_hmg_F",380],
			["I_MRAP_03_hmg_F",380],
			["I_MRAP_03_gmg_F",380],
			["B_APC_Wheeled_01_cannon_F",500],
			["I_APC_Wheeled_03_cannon_F",500],
			
			////////////////////////////////////////////////////////
			// Arma 3 Tanks
			////////////////////////////////////////////////////////
			
			["B_APC_Tracked_01_rcws_F",550],
			["B_APC_Tracked_01_CRV_F",550],
			["B_APC_Tracked_01_AA_F",550],
			["B_MBT_01_arty_F",550],
			["B_MBT_01_mlrs_F",550],
			["B_MBT_01_TUSK_F",550],
			["O_APC_Tracked_02_cannon_F",550],
			["O_APC_Tracked_02_AA_F",550],
			["O_MBT_02_cannon_F",550],
			["O_MBT_02_arty_F",550],
			["O_APC_Wheeled_02_rcws_F",550],
			["I_APC_tracked_03_cannon_F",550],
			["I_MBT_03_cannon_F",550],
			
			////////////////////////////////////////////////////////
			// Arma 3 Boats
			////////////////////////////////////////////////////////
			
			["B_Boat_Armed_01_minigun_F",250],
			["B_Boat_Transport_01_F",130],
			["B_Lifeboat",130],
			["B_SDV_01_F",110],
			["B_G_Boat_Transport_01_F",130],
			["O_Boat_Armed_01_hmg_F",250],
			["O_Boat_Transport_01_F",130],
			["O_Lifeboat",130],
			["O_SDV_01_F",110],
			["O_G_Boat_Transport_01_F",130],
			["I_Boat_Armed_01_minigun_F",250],
			["I_Boat_Transport_01_F",130],
			["I_SDV_01_F",110],
			["I_G_Boat_Transport_01_F",130],
			["C_Rubberboat",130],
			["C_Boat_Civil_01_F",250],
			["C_Boat_Civil_01_rescue_F",250],
			["C_Boat_Civil_01_police_F",250],
			
			////////////////////////////////////////////////////////
			// HVP Vehicles
			////////////////////////////////////////////////////////
			
			["Mrshounka_yamaha_p_bf", 15],
			["Mrshounka_yamaha_p_g", 15],
			["Mrshounka_yamaha_p_j", 15],
			["Mrshounka_yamaha_p_noir", 15],
			["Mrshounka_yamaha_p_o", 15],
			["Mrshounka_yamaha_p_rose", 15],
			["Mrshounka_yamaha_p_r", 15],
			["Mrshounka_yamaha_p_v", 15],
			["Mrshounka_a3_308_civ_bleufonce", 50],
			["Mrshounka_a3_308_civ_grise", 50],
			["Mrshounka_a3_308_civ_jaune", 50],
			["Mrshounka_a3_308_civ_noir", 50],
			["Mrshounka_a3_308_civ_orange", 50],
			["Mrshounka_a3_308_civ_rose", 50],
			["Mrshounka_a3_308_civ_rouge", 50],
			["Mrshounka_a3_308_civ_violet", 50],
			["shounka_buggy_bleufonce", 50],
			["shounka_buggy_grise", 50],
			["shounka_buggy_jaune", 50],
			["shounka_buggy_noir", 50],
			["shounka_buggy_orange", 50],
			["shounka_buggy_rose", 50],
			["shounka_buggy_rouge", 50],
			["shounka_buggy_violet", 50],
			["Mrshounka_corbillard_c_bleufonce", 110],
			["Mrshounka_corbillard_c_grise", 110],
			["Mrshounka_corbillard_c_jaune", 110],
			["Mrshounka_corbillard_c_noir", 110],
			["Mrshounka_corbillard_c_orange", 110],
			["Mrshounka_corbillard_c_rose", 110],
			["Mrshounka_corbillard_c_rouge", 110],
			["Mrshounka_corbillard_c_violet", 110],
			["Mr_Own_buggy_bleufonce", 50],
			["Mr_Own_buggy_grise", 50],
			["Mr_Own_buggy_jaune", 50],
			["Mr_Own_buggy_noir", 50],
			["Mr_Own_buggy_orange", 50],
			["Mr_Own_buggy_rose", 50],
			["Mr_Own_buggy_rouge", 50],
			["Mr_Own_buggy_violet", 50],
			["shounka_limo_civ_bleufonce", 110],
			["shounka_limo_civ_grise", 110],
			["shounka_limo_civ_jaune", 110],
			["shounka_limo_civ_noir", 110],
			["shounka_limo_civ_orange", 110],
			["shounka_limo_civ_rose", 110],
			["shounka_limo_civ_violet", 110],
			["shounka_f430_spider_bleufonce", 50],
			["shounka_f430_spider_grise", 50],
			["shounka_f430_spider_jaune", 50],
			["shounka_f430_spider_noir", 50],
			["shounka_f430_spider_rose", 50],
			["shounka_f430_spider_rouge", 50],
			["shounka_f430_spider_violet", 50],
			["Mrshounka_lykan_c_bleufonce", 50],
			["Mrshounka_lykan_c_grise", 50],
			["Mrshounka_lykan_c_jaune", 50],
			["Mrshounka_lykan_c_noir", 50],
			["Mrshounka_lykan_c_orange", 50],
			["Mrshounka_lykan_c_rose", 50],
			["Mrshounka_lykan_c_rouge", 50],
			["Mrshounka_lykan_c_violet", 50],
			["Mrshounka_Vandura_civ", 200],
			["Mrshounka_Vandura_civ_bleufonce", 200],
			["Mrshounka_Vandura_civ_grise", 200],
			["Mrshounka_Vandura_civ_jaune", 200],
			["Mrshounka_Vandura_civ_noir", 200],
			["Mrshounka_Vandura_civ_orange", 200],
			["Mrshounka_Vandura_civ_rose", 200],
			["Mrshounka_Vandura_civ_rouge", 200],
			["Mrshounka_Vandura_civ_violet", 200],
			["Mr_Own_hummer_civ_noir", 150],
			["Mr_Own_hummer_civ_bleufonce", 150],
			["Mr_Own_hummer_civ_grise", 150],
			["Mr_Own_hummer_civ_jaune", 150],
			["Mr_Own_hummer_civ_orange", 150],
			["Mr_Own_hummer_civ_rose", 150],
			["Mr_Own_hummer_civ_rouge", 150],
			["Mr_Own_hummer_civ_violet", 150],
			["SIG_Roadrunner", 110],
			["SIG_Hubcaps", 110],
			["SIG_Magnums", 110],
			["SIG_Hcode", 110],
			["shounka_avalanche_bleufonce", 150],
			["shounka_avalanche_grise", 150],
			["shounka_avalanche_jaune", 150],
			["shounka_avalanche_noir", 150],
			["shounka_avalanche_orange", 150],
			["shounka_avalanche_rose", 150],
			["shounka_avalanche_rouge", 150],
			["shounka_avalanche_violet", 150],
			["SIG_Superbee", 110],
			["SIG_SuperbeeY", 110],
			["SIG_SuperbeeB", 110],
			["SIG_SuperbeeL", 110],
			["SIG_SuperbeeM", 110],
			["SIG_SuperbeeG", 110],
			["Mr_Own_dodge15_civ", 110],
			["Mr_Own_dodge15_civ_bleufonce", 110],
			["Mr_Own_dodge15_civ_grise", 110],
			["Mr_Own_dodge15_civ_jaune", 110],
			["Mr_Own_dodge15_civ_noir", 110],
			["Mr_Own_dodge15_civ_orange", 110],
			["Mr_Own_dodge15_civ_rose", 110],
			["Mr_Own_dodge15_civ_rouge", 110],
			["Mr_Own_dodge15_civ_violet", 110],
			["shounka_monsteur_bleufonce", 200],
			["shounka_monsteur_grise", 200],
			["shounka_monsteur_jaune", 200],
			["shounka_monsteur_noir", 200],
			["shounka_monsteur_orange", 200],
			["shounka_monsteur_rose", 200],
			["shounka_monsteur_rouge", 200],
			["shounka_monsteur_violet", 200],
			["shounka_a3_dafxf_euro6_f", 400],
			["shounka_ivceco_bleufonce", 400],
			["shounka_ivceco_grise", 400],
			["shounka_ivceco_jaune", 400],
			["shounka_ivceco_noir", 400],
			["shounka_ivceco_orange", 400],
			["shounka_ivceco_rose", 400],
			["shounka_ivceco_rouge", 400],
			["Exile_Container_Storagecrate", 110],
			["shounka_ivceco_violet", 400]
];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

/**
 * List of class names of objects which can be carried and moved by a player.
 * Liste des noms de classes des objets qui peuvent être portés et déplacés par le joueur.
 */
R3F_LOG_CFG_can_be_moved_by_player = R3F_LOG_CFG_can_be_moved_by_player +
[
	// Here Comes that stuff in what a player can Move 
	// e.g. : "MyMovableObjectClassName1", "MyMovableObjectClassName2"
	"CargoNet_01_box_F",
	"Box_NATO_AmmoVeh_F",
	"B_supplyCrate_F",
	"I_CargoNET_01_F",
	"Box_NATO_Wps_F",
	"C_supplyCrate_F",
	"IG_supplyCrate_F",
	"Box_IND_AmmoVeh_F",
	"B_Slingload_01_Cargo_F",
	"B_Slingload_01_Fuel_F",
	"B_Slingload_01_Ammo_F",
	"B_Slingload_01_Medevac_F",
	"B_Slingload_01_Repair_F",
	"Land_Pod_Heli_Transport_04_covered_F",
	"Land_Pod_Heli_Transport_04_fuel_F",
	"Land_Pod_Heli_Transport_04_box_F",
	"Land_Pod_Heli_Transport_04_repair_F",
	"Land_Pod_Heli_Transport_04_medevac_F",
	"Land_Pod_Heli_Transport_04_bench_F",
	"Land_Pod_Heli_Transport_04_covered_black_F",
	"Land_Pod_Heli_Transport_04_fuel_black_F",
	"Land_Pod_Heli_Transport_04_box_black_F",
	"Land_Pod_Heli_Transport_04_repair_black_F",
	"Land_Pod_Heli_Transport_04_medevac_black_F",
	"Land_Pod_Heli_Transport_04_bench_black_F",
	"Land_Pod_Heli_Transport_04_ammo_F",
	"Box_east_Support_F",
	"Exile_Bike_OldBike",
	"Exile_Bike_MountainBike",
	"Land_CargoBox_V1_F",
	"O_CargoNet_01_ammo_F",
	"B_CargoNet_01_ammo_F",
	"I_CargoNet_01_ammo_F",
	"Box_East_AmmoVeh_F",
	"Box_East_AmmoOrd_F",
	"Box_NATO_AmmoOrd_F",
	"Box_NATO_Ammo_F",
	"Exile_Container_SupplyBox",
	"Exile_Container_Storagecrate",
	"Land_Cargo20_military_green_F_Kit",
	"I_supplyCrate_F"
];
