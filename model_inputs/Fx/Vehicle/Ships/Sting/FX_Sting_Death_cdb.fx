{
	"type": "fx",
	"duration": 2,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 1.4,
			"scaleY": 1.4,
			"scaleZ": 1.4,
			"rotationZ": -90,
			"children": [
				{
					"type": "object",
					"name": "Death",
					"children": [
						{
							"type": "subFX",
							"name": "FX_Explosion_MidAir",
							"source": "Fx/Vehicle/Ships/FX_Explosion_MidAir.fx",
							"x": 0.2471,
							"y": -9.69252,
							"z": 2.1511,
							"scaleX": 0.3,
							"scaleY": 0.3,
							"scaleZ": 0.3,
							"time": 0.405
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Low",
							"source": "Fx/Explosion/FX_Directional_Explosion_Low.fx",
							"x": 0.51325,
							"y": 0.02501,
							"z": -0.0444,
							"rotationX": 13.9,
							"rotationY": -98.2,
							"rotationZ": -95.1,
							"time": -0.5
						}
					]
				},
				{
					"type": "model",
					"name": "Stingg",
					"source": "Vehicle/Harkonnen/Overlord/Sting.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Overlord/Anim_Sting_Death.fbx"
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"enabled": false,
							"props": {
								"amount": 1,
								"color": [
									1,
									0,
									0
								]
							}
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"enabled": false,
					"object": "FXAnimation.FXRoot.Death",
					"target": "FXAnimation.FXRoot.Stingg.root.B_ROOT.B_Sting"
				}
			]
		}
	]
}