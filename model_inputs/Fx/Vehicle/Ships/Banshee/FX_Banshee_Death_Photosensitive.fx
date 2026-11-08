{
	"type": "fx",
	"duration": 2.5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Death_placeholder",
					"children": [
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Low_Photosensitive",
							"source": "Fx/Explosion/FX_Directional_Explosion_Low_Photosensitive.fx",
							"x": 0.69019,
							"y": 0.13308,
							"z": 0.73266,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999996,
							"scaleZ": 0.9999999999999997,
							"rotationX": -146,
							"rotationY": 4.4,
							"rotationZ": -48.8
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Low_Photosensitive",
							"source": "Fx/Explosion/FX_Directional_Explosion_Low_Photosensitive.fx",
							"x": -1.07577,
							"y": -2.24929,
							"z": 0.58956,
							"scaleX": 0.7,
							"scaleY": 0.6999999999999998,
							"scaleZ": 0.6999999999999998,
							"rotationX": -39.2,
							"rotationY": -64.6,
							"rotationZ": -20.3
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Medium_Photosensitive",
							"source": "Fx/Explosion/FX_Directional_Explosion_Medium_Photosensitive.fx",
							"x": 0.63906,
							"y": -0.32505,
							"z": 0.79679,
							"rotationX": 43,
							"rotationY": 8.8,
							"rotationZ": -13.3,
							"time": -0.4
						}
					]
				},
				{
					"type": "model",
					"name": "Banshee",
					"source": "Vehicle/Smuggler/Banshee/Banshee.fbx",
					"editorOnly": true,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Banshee/Anim_Banshee_Death.fbx"
						}
					]
				}
			]
		}
	]
}