#include <td-actions>

CMD:infernus(playerid)
{
	ShowActionForPlayer(playerid, ActionInfernus, "Voce realmente deseja spawnar um infernus neste local?", .action_time = 10000);

	return 1;
}

Action:ActionInfernus(playerid, response)
{
	if (response == ACTION_RESPONSE_YES)
	{
		new Float:x, Float:y, Float:z, Float:angz;

		GetPlayerPos(playerid, x, y, z);
		GetPlayerFacingAngle(playerid, angz);

		new vehicleid = CreateVehicle(411,
			x + 2.5 * floatsin(-angz, degrees),
			y + 2.5 * floatcos(-angz, degrees),
			z + 0.3,
			angz,
			0,
			0,
			-1);

		LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
		SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
	} else {
		SendClientMessage(playerid, -1, "Você não quis spawnar um infernus.");
	}
}
