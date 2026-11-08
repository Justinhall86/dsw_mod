{
	"type": "fx",
	"duration": 30,
	"cullingRadius": 200,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"scaleX": 4000,
					"scaleY": 4000,
					"scaleZ": 2,
					"color": -14869219,
					"kind": 0,
					"args": [
						0
					]
				},
				{
					"type": "object",
					"name": "UNITS",
					"editorOnly": true,
					"y": 23.01405,
					"children": [
						{
							"type": "model",
							"name": "Reference",
							"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
							"x": -0.5771233333333331,
							"y": -2.1418200000000027,
							"z": 5.551115123125783e-17,
							"scaleX": 2.9999999999999987,
							"scaleY": 2.9999999999999987,
							"scaleZ": 3,
							"rotationZ": 145
						},
						{
							"type": "model",
							"name": "Reference",
							"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
							"x": 1.8302066666666668,
							"y": 1.2962099999999968,
							"z": 5.551115123125783e-17,
							"scaleX": 2.9999999999999987,
							"scaleY": 2.9999999999999987,
							"scaleZ": 3,
							"rotationZ": 145
						},
						{
							"type": "model",
							"name": "Reference",
							"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
							"x": -1.253083333333333,
							"y": 0.8456099999999971,
							"z": 5.551115123125783e-17,
							"scaleX": 2.9999999999999987,
							"scaleY": 2.9999999999999987,
							"scaleZ": 3,
							"rotationZ": 145
						}
					]
				},
				{
					"type": "object",
					"name": "parachute",
					"x": 1.3395660000000005,
					"y": -2.595209999999999,
					"children": [
						{
							"type": "subFX",
							"name": "FX_Parachute",
							"source": "Fx/Abilities/FX_Parachute.fx",
							"x": -7.40567,
							"y": -0.19532
						},
						{
							"type": "subFX",
							"name": "FX_Parachute",
							"source": "Fx/Abilities/FX_Parachute.fx",
							"x": 27.473844,
							"y": 33.60823,
							"scaleX": 1.1,
							"scaleY": 1.1,
							"scaleZ": 1.1,
							"time": 4.03773
						},
						{
							"type": "subFX",
							"name": "FX_Parachute",
							"source": "Fx/Abilities/FX_Parachute.fx",
							"x": 15.11836,
							"y": -35.7485,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"time": 7.51953
						},
						{
							"type": "subFX",
							"name": "FX_Parachute",
							"source": "Fx/Abilities/FX_Parachute.fx",
							"x": -22.1133,
							"y": 13.60441,
							"scaleX": 0.9,
							"scaleY": 0.9,
							"scaleZ": 0.9,
							"time": 26
						}
					]
				}
			]
		}
	]
}