switch(State)
{
	case States.Cult : Cult_State() break;
	case States.Fight : Fight_State() break;
	case States.Run : Run_State() break;
	case States.Wander : Wander_State() break;
	case States.Thristy : Thristy_State() break;
	case States.Hungry : Hungry_State() break;
	case States.Breathrough : Breathrough_State() break;
}



if(Hp <= 0)
{
		
	instance_destroy();
	instance_create_layer(x,y,"Instances",Obj_Meat);
	
}


if(Hp > MaxHp)
{
	Hp = MaxHp;
}

if(Hunger > 100)
{
	Hunger = 100;
}


/*
Food_Near = instance_nearest(x,y,Food_Parent);

if(Food_Near > 1 and distance_to_point(Food_Near.x,Food_Near.y) <= 30)
{
	Hunger += Food_Near.foodval;
	with(Food_Near)
	{
		instance_destroy();
	}
}
*/
