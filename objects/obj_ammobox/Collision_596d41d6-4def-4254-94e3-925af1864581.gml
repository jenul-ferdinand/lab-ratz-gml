// Only run if the player is holding a gun with ammo amount.
var _holding = other.holding;
if (_holding == undefined) 
or (_holding == obj_ruger) 
or (_holding == obj_f2grenade)
or (_holding == obj_grenade)
or (_holding == obj_molotov)
or (_holding == obj_stickgrenade)
exit;

// Add ammo
_holding.ammo += _holding.mag_max;

// Destroy instance
instance_destroy();