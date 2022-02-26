if(Food_Type == Foods.Grass)
{
	if(Hunger < 100)
	{
		Hunger += 1 ;
		if(other.foodval > 0)
		{
			other.foodval -= 1;
		}
		else
		{
			instance_destroy(other);
		}
	}
}
else
if(Food_Type == Foods.Meat)
{
	if(Hunger < 100)
	{
		Hunger += 1 ;
		if(other.foodval > 0)
		{
			other.foodval -= 1;
		}
		else
		{
			instance_destroy(other);
		}
	}
}
else
{
	if(Hunger < 100)
	{
		Hunger += 1 ;
		if(other.foodval > 0)
		{
			other.foodval -= 1;
		}
		else
		{
			instance_destroy(other);
		}
	}
}