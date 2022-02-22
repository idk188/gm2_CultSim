
Hunger -= HungerRate;
Thrist -= ThristRate;

if(Hunger >= 10 or Thrist >= 10)
{
	if(Hp < MaxHp)
	{
		Hp += 1 + Cult_Level div 2;
		Hp = clamp(Hp,0,MaxHp);
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




clamp(Hunger,0,100);
clamp(Thrist,0,100);

alarm_set(0,5 * 30);