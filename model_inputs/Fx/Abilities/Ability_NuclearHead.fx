{
	"type": "fx",
	"duration": 60,
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
							"name": "FX_Nuke_MissileArriving",
							"source": "Fx/Nuke/FX_Nuke_MissileArriving.fx",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"time": 0.5
						},
						{
							"type": "subFX",
							"name": "FX_Nuke_Anticipation_2",
							"source": "Fx/Nuke/FX_Nuke_Anticipation_2.fx",
							"x": -2.42915,
							"y": -0.59358
						},
						{
							"type": "subFX",
							"name": "FX_Nuke_Stars",
							"source": "Fx/Nuke/FX_Nuke_Stars.fx",
							"y": -1,
							"time": 0.82
						},
						{
							"type": "subFX",
							"name": "FX_Nuke_LongFlash",
							"source": "Fx/Nuke/FX_Nuke_LongFlash.fx",
							"y": -1,
							"time": 0.13
						},
						{
							"type": "subFX",
							"name": "FX_Nuke_Mushroom",
							"source": "Fx/Nuke/FX_Nuke_Mushroom.fx",
							"time": 2.7
						},
						{
							"type": "subFX",
							"name": "FX_Nuke_DecalGround",
							"source": "Fx/Nuke/FX_Nuke_DecalGround.fx",
							"time": 2.7
						}
					]
				},
				{
					"type": "curve",
					"name": "shake",
					"keyMode": 1,
					"keys": [
						{
							"time": 2.847472924365212,
							"value": 0.03333333333333333,
							"mode": 1,
							"prevHandle": {
								"dv": 3.688081717680229e-17,
								"dt": -0.11044304128169422
							},
							"nextHandle": {
								"dv": -0.023615912555977482,
								"dt": 0.14951926313478925
							}
						},
						{
							"time": 3.0325878906250012,
							"value": 1.0773986004547538,
							"mode": 2
						},
						{
							"time": 3.3315917968750015,
							"value": 0.18442888654274825,
							"mode": 1,
							"prevHandle": {
								"dv": 0.48499313154322493,
								"dt": -0.04999999999999938
							},
							"nextHandle": {
								"dv": 0,
								"dt": 1.2192675662813421
							}
						},
						{
							"time": 10.080880508596096,
							"value": 0,
							"mode": 0,
							"prevHandle": {
								"dv": 0.048542190947443054,
								"dt": -0.5753846942001832
							},
							"nextHandle": {
								"dv": -0.048542190947443054,
								"dt": 0.5753846942001832
							}
						}
					]
				}
			]
		}
	]
}