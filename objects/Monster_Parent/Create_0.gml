enum States {
	
	Cult,
	Fight,
	Run,
	Wander,
	Thristy,
	Hungry,
	Breathrough
	
}

enum Foods {
	Grass,
	Meat,
	Both
}

randomize();
Fight_timer = 0;

Cult_Level = 1;

image_speed = 0;
image_index = 0;

Gender = choose("Male","Female");

Str = 1+irandom(3);
Dex = 1+irandom(3);
Con = 1+irandom(3);
Int = 1+irandom(3);
Wis = 1+irandom(3);
Cha = 1+irandom(3);

MaxHp = irandom(10) + Con;
Hp = MaxHp;
Attack = irandom(5) + Str;
Defence = irandom(5) + Con;
Speed = irandom(5) + Dex;
Qi = 0;
DivineSense = 0;
Size = 1;
AttackDelay = irandom_range(30,300);
Food_Type = -1;

Hunger = 100;
HungerRate = irandom_range(1,10);
Thrist = 100;
ThristRate =  irandom_range(1,10);


SelectedId = -1;

circle_fix = (32 / 2 * Size)
State = States.Wander;
alarm_set(0,1);