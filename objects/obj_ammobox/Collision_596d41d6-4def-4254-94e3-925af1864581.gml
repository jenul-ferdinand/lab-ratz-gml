var _holding = other.holding;
// Only run if the player is holding a weapon. 
if (_holding == undefined) or (_holding == obj_ruger) exit;

// Add ammo
_holding.ammo += _holding.mag_max;

// Destroy instance
instance_destroy();