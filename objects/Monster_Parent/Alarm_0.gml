
Hunger -= HungerRate;
Thrist -= ThristRate;

if(Hunger >= 10 or Thrist >= 10)
{
	if(Hp < MaxHp)
	{
		Hp += 1 + Cult_Level div 2;
	}
}

if(Hunger <= 0 or Thrist <= 0)
{
	Hp -= 1;
}

image_xscale = Size;
image_yscale = Size;

if(Hunger <= 0)
{
	Hunger = 0;
}

if(Thrist <= 0)
{
	Thrist = 0;
}


alarm_set(0,5 * 30);