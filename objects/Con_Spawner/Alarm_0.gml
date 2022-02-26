
if(instance_number(Monster) < 10)
{
	SnakeSpawn = choose(Obj_Snake_Adder,Obj_Black_mamba);
	instance_create_layer(random(room_width),random(room_height),"Instances",SnakeSpawn);
	instance_create_layer(random(room_width),random(room_height),"Instances",Obj_Elephant);
}

if(instance_number(Food_Parent) < 10)
{
	//food = choose(Obj_Meat,Obj_Grass);
	instance_create_layer(random(room_width),random(room_height),"Instances",Obj_Grass);
	instance_create_layer(random(room_width),random(room_height),"Instances",Obj_Grass);
	instance_create_layer(random(room_width),random(room_height),"Instances",Obj_Grass);
	instance_create_layer(random(room_width),random(room_height),"Instances",Obj_Grass);

}

if(instance_number(Water) < 4)
{
	instance_create_layer(random(room_width),random(room_height),"Instances",Obj_Water);
	instance_create_layer(random(room_width),random(room_height),"Instances",Obj_Water);
	instance_create_layer(random(room_width),random(room_height),"Instances",Obj_Water);
	instance_create_layer(random(room_width),random(room_height),"Instances",Obj_Water);
}


alarm_set(0,5 * 30)