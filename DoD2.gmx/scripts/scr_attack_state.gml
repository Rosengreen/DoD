/// scr_attack_state

instance_create(x+(6*mydir), y, obj_attack_effect);
    var damage = instance_create(x+(17*mydir),y, obj_damage);
    //damage.sprite_index = (some other sprite) //Use this line for sprite collision
    damage.creator = id;
    damage.damage = obj_player_stats.attack;
    attacked = true;
    alarm[1] = room_speed/3; // 3 is a placeholder for weapon speed
    state = scr_move_state;
