/// @description Insert description here
// You can write your code in this editor

if(Hunger < 100)
{
	Hunger += other.foodval;
	clamp(Hunger,0,100);
}