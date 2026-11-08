{
	"type": "fx",
	"markers": [
		{
			"t": 0
		}
	],
	"cullingRadius": 99999,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "event",
					"name": "Dmg",
					"time": 2.855
				},
				{
					"type": "object",
					"name": "group",
					"children": [
						{
							"type": "subFX",
							"name": "FX_Nuke_Warning_Photosensitive",
							"source": "Fx/Nuke/FX_Nuke_Warning_Photosenitive.fx"
						},
						{
							"type": "subFX",
							"name": "FX_Nuke_Missile",
							"source": "Fx/Nuke/FX_Nuke_Missile.fx",
							"time": 1.55
						},
						{
							"type": "subFX",
							"name": "FX_Nuke_MissileArriving",
							"source": "Fx/Nuke/FX_Nuke_MissileArriving.fx",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"time": 2.5
						},
						{
							"type": "subFX",
							"name": "FX_Nuke_Anticipation_2",
							"source": "Fx/Nuke/FX_Nuke_Anticipation_2.fx",
							"enabled": false,
							"x": -2.42915,
							"y": -0.59358,
							"time": 2
						},
						{
							"type": "subFX",
							"name": "FX_Nuke_Stars",
							"source": "Fx/Nuke/FX_Nuke_Stars.fx",
							"enabled": false,
							"y": -1,
							"time": 2.82
						},
						{
							"type": "subFX",
							"name": "FX_Nuke_LongFlash",
							"source": "Fx/Nuke/FX_Nuke_LongFlash.fx",
							"enabled": false,
							"y": -1,
							"time": 2.13,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.2
									}
								}
							]
						},
						{
							"type": "subFX",
							"name": "FX_Nuke_Mushroom",
							"source": "Fx/Nuke/FX_Nuke_Mushroom.fx",
							"time": 4.7
						},
						{
							"type": "subFX",
							"name": "FX_Nuke_DecalGround",
							"source": "Fx/Nuke/FX_Nuke_DecalGround.fx",
							"time": 4.7
						}
					]
				}
			]
		}
	]
}