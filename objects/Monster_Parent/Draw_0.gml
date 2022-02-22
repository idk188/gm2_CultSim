draw_self();

if(SelectedId > 0)
{
	draw_text(x,y-64*Size,"Level :" + string(Cult_Level));
	draw_text(x,y-50*Size,"Hp :" + string(Hp)+ "/"+ string(MaxHp) );
	draw_text(x,y-38*Size,"Hunger :" + string(Hunger));
	draw_text(x,y-22*Size,"Thrist :" + string(Thrist));
	draw_text(x,y+42*Size,"Qi :" + string(Qi));
}

//draw_text(x,y+64,"State: " + string(State));

//draw_circle(x + (32 / 2 * Size),y + (32 / 2 * Size),30*Size,true);

