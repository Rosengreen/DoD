/// scr_move state
scr_get_input();

// Dodge
if (dodge_key && obj_player_stats.stamina >= DASH_COST)
{
    state = scr_dodge_state;
    alarm[0] = room_speed/6;
    obj_player_stats.stamina -= DASH_COST;
    obj_player_stats.alarm[0] = room_speed*3;
}

// Attacking
if (attack_key and attacked == false)
{
    state = scr_attack_state;
    /*
    instance_create(x+(6*mydir), y, obj_attack_effect);
    var damage = instance_create(x+(17*mydir),y, obj_damage);
    //damage.sprite_index = (some other sprite) //Use this line for sprite collision
    damage.creator = id;
    attacked = true;
    alarm[1] = room_speed/3; // 3 is a placeholder for weapon speed
    */
}

// Get direction
dir = point_direction(0, 0, xaxis, yaxis);

// Get the length
if (xaxis == 0 && yaxis == 0)
{
    len = 0;    
} else {
    len = spd;
    scr_get_face();
}

// get the hspd and vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Move
phy_position_x += hspd;
phy_position_y += vspd;

// Control the sprite
image_speed = .4;
if (len == 0) image_index = 0;

// Horizontal sprites
if (hspd > 0) {
    //sprite_index = spr_player_right;
    image_xscale = 1;
    mydir = 1;   
} else if (hspd < 0) {
    //sprite_index = spr_player_left;
    image_xscale = -1;
    mydir = -1;
}
