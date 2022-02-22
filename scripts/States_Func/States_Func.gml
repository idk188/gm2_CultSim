
#region States

function Cult_State(){
	
	
	Qi += choose(1, Wis, Int) * 0.05

	Near = collision_circle(x+ circle_fix,y+ circle_fix,30*Size,Monster_Parent,false,true);
	
	if(Near > 1)
	{
		State = States.Fight;
	}
	else
	if(Hunger <= 30)
	{
		State = States.Hungry;
	}
	else
	if(Thrist <= 30)
	{
		State = States.Thristy;
	}
	else
	if(Qi >= Cult_Level * 100)
	{
		State = States.Breathrough;
	}
	
};

function Fight_State(){
	Fight_timer ++
	Near = collision_circle(x+ circle_fix,y+ circle_fix,30*Size,Monster_Parent,false,true);
	
	
	if(Near > 1 and distance_to_object(Near) >= 10 * Size and Hp >= (MaxHp * 0.5))
	{
		dir = point_direction(x,y,Near.x,Near.y);
		direction = dir;
		mp_linear_step(Near.x,Near.y,Speed,false)
	}
	else
	if(Near > 1 and distance_to_object(Near) <= 15 * Size and Hp >= (MaxHp * 0.5) and Fight_timer >= AttackDelay)
	{
		Near.Hp -= abs(Attack - Near.Defence)
		Fight_timer = 0;
		instance_create_layer(Near.x,Near.y,"Instances",obj_FireBreath);
	}
	else
	if(Hp <= (MaxHp * 0.5))
	{
		State = States.Run;
	}
	else
	{
		State = States.Wander;
	}

};

function Run_State(){
	Near = collision_circle(x+ circle_fix,y+ circle_fix,50*Size,Monster_Parent,false,true);
	
	Run_timer = 0;
	Run = false;
	if(Run_timer >= 30 * 5)
	{
		Run = false;
		Run_timer = 0;
	}
	
	
	if(Near > 1 and Run == false)
	{
		dir = point_direction(x,y,Near.x,Near.y);
		direction += dir + 180;
		speed = Speed;
		Run = true;
	}
	else
	if(Near > 1 and Run == true)
	{
		Run_timer++
	}
	else
	{
		State = States.Wander;
	}
	
};

function Wander_State(){

	
	Near = collision_circle(x+ circle_fix,y+ circle_fix,30*Size,Monster_Parent,false,true);
	
	
	if(Near > 1)
	{
		State = States.Fight;
	}
	else
	{
		Goalx = x + irandom_range(-20, 20);
		Goaly = y + irandom_range(-20, 20);
		if(point_distance(x,y,Goalx,Goaly) <= 3)
		{
			mp_linear_step(Goalx,Goaly,Speed,false);

		}
		else
		{
			speed = 0;
		}
		
	}
	
	if(Hunger <= 30)
	{
		State = States.Hungry;		
	}
	else
	if(Thrist <= 30)
	{
		State = States.Thristy;
	}
	else
	if(Hunger >= 80 and Thrist >= 80)
	{

		State = States.Cult;
		
	}
	
};


function Thristy_State(){
	Near = instance_nearest(x,y,Water_Parent);
	
	if(Near > 1)
	{
		dir = point_direction(x,y,Near.x,Near.y);
		direction = dir;
		mp_linear_step(Near.x,Near.y,Speed,false);
	}



	
	Enemy_Near = collision_circle(x+ circle_fix,y+ circle_fix,30*Size,Monster_Parent,false,true);
	
	if(Enemy_Near > 1)
	{
		State = States.Fight;
	}
	
	
	if(Thrist >= 90)
	{
		State = States.Wander;
	}


};

function Hungry_State(){
	
	
	
	
	if(Food_Type == Foods.Grass)
	{
		Near = instance_nearest(x,y,Grass_Food_Parent);
		
		if(Near > 1)
		{
			mp_linear_step(Near.x,Near.y,Speed,false);
		}
	}
	else
	{
		State = States.Wander;
	}
	
	
	if(Food_Type == Foods.Meat)
	{
		Near = instance_nearest(x,y,Meat_Food_Parent);
	
		ToKill = instance_nearest(x,y,Monster_Parent);
	
		if(Near > 1)
		{
			mp_linear_step(Near.x,Near.y,Speed,false);
		}
		else
		if(ToKill > 1)
		{
			mp_linear_step(ToKill.x,ToKill.y,Speed,false);
		}
		else
		{
		State = States.Wander;
		}
	}
	
	
	Enemy_Near = collision_circle(x+ circle_fix,y+ circle_fix,30*Size,Monster_Parent,false,true);
	
	if(Enemy_Near > 1)
	{
		dir = point_direction(x,y,Enemy_Near.x,Enemy_Near.y);
		direction = dir;
		State = States.Fight;
	}

	
	if(Hunger >= 90)
	{
		State = States.Wander;
	}
};


function Breathrough_State(){
	
	
	
	if(Qi >= Cult_Level * 100)
	{
		Qi -= Cult_Level * 100;
		Cult_Level += 1;
		LevelUp()
		State = States.Wander;
	}
	
	if(Cult_Level == 5)
	{
		image_index = 1;
		LevelUp2();
	}
	
};

#endregion



#region Levelups

function LevelUp()
{
	Size += 0.2;
	Str += 1;
	Dex += 1;
	Int += 1;
	Con += 1;
	Wis += 1;
	Cha += 1;
	MaxHp += Con;
	Speed += Dex * 0.1;
	Attack += Str;
	Defence += Con;
}

function LevelUp2()
{
	Size += 0.2;
	Str += 3;
	Dex += 3;
	Int += 3;
	Con += 3;
	Wis += 3;
	Cha += 3;
	MaxHp += Con;
	Speed += Dex * 0.1;
	Attack += Str;
	Defence += Con;
}

#endregion

